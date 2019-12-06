Content-Type: multipart/mixed; boundary="===============4521392058219176428=="
MIME-Version: 1.0
From: Gabriel Chabot <gabriel.chabot at qarnot-computing.com>
Subject: [tpm2] [TPM2-TOOLS] tpm2_hash I/O error
Date: Fri, 06 Dec 2019 10:47:33 +0100
Message-ID: <6bd6c69c-42b5-7b77-4cde-34d096ed29b6@qarnot-computing.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4521392058219176428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Greetings,

I am currently using TPM2 for remote attestation.
At some point, I want to send a message and the signature of this =

message to the remote.
However, when I try to hash the message (which is greater than 1024 =

bytes) with tpm2_hash, I get the following error:

ERROR:tcti:src/util/io.c:106:write_all() failed to write to fd 4: I/O error
ERROR:tcti:src/tss2-tcti/tcti-device.c:121:tcti_device_transmit() wrong =

number of bytes written. Expected 1053, wrote 0.
ERROR:esys:src/tss2-esys/api/Esys_SequenceUpdate.c:197:Esys_SequenceUpdate_=
Async() =

Finish (Execute Async) ErrorCode (0x000a000a)
ERROR:esys:src/tss2-esys/api/Esys_SequenceUpdate.c:74:Esys_SequenceUpdate() =

Error in async function ErrorCode (0x000a000a)
ERROR: Esys_SequenceUpdate(0xA000A) - tcti:IO failure
ERROR: Unable to run tpm2_hash

Afterwards, I cannot use my TPM until I reboot.

I investigated the issue a bit, and this issue also happens when I try =

to hash input from stdin.
So it seems that I have an issue with this part of tpm2_hash.c:

tool_rc rc =3D tpm2_hash_sequence_start(ectx, &null_auth, halg, =

&sequence_handle);
     if (rc !=3D tool_rc_success) {
         return rc;
     }

     /* If we know the file size, we decrement the amount read and terminate
      * the loop when 1 block is left, else we go till feof.
      */
     done =3D false;
     while (!done) {
         /*  if we're using infilep, read the file. Otherwise, directly
          copy into our local buffer. */
         buffer.size =3D BUFFER_SIZE(typeof(buffer), buffer);
         if (!!infilep) {
             bytes_read =3D fread(buffer.buffer, 1, buffer.size, infilep);
             if (ferror(infilep)) {
                 LOG_ERR("Error reading from input file");
                 return tool_rc_general_error;
             } else {
                 buffer.size =3D bytes_read;
             }
         } else {
             memcpy(buffer.buffer, inbuffer, buffer.size);
             inbuffer =3D inbuffer + buffer.size;
         }

         rc =3D tpm2_sequence_update(ectx, sequence_handle, &buffer);
         if (rc !=3D tool_rc_success) {
             return rc;
         }

         if (use_left) {
             left -=3D buffer.size;
             if (left <=3D TPM2_MAX_DIGEST_BUFFER) {
                 done =3D true;
                 continue;
             }
         } else if (!!infilep && feof(infilep)) {
             done =3D true;
         }
     } /* end file read/hash update loop */

(I will take a deeper look later).

I am using tpm-tools 4.1 with an AMD fTPM on alpine linux 3.10.
Here is how I can reproduce the issue on my machine:

$ i=3D0; while [ $i -lt 1024 ]; do echo 0 >> /tmp/testfile; i=3D$((i+1)); d=
one;
$ tpm2_hash -g sha256 -o /tmp/testfile.digest testfile;

OR

$ tpm2_hash -g sha256 -o /tmp/testfile.digest
   <input something><End of File>

I did try to hash my message with sha256sum instead of the TPM. However, =

since I am using an AK, I cannot sign an object that was not generated =

by the TPM (or maybe I am not doing something correctly, but the AK =

should be restricted).

My current workaroud to this problem is to hash my message with =

sha256sum, then to hash this hash with tpm2_hash.

Any ideas of what could cause this?

Regards,

-- =

Gabriel
--===============4521392058219176428==--

