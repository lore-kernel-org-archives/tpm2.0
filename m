Content-Type: multipart/mixed; boundary="===============0157987273591486875=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: [TPM2-TOOLS] tpm2_hash I/O error
Date: Fri, 13 Dec 2019 14:11:27 -0800
Message-ID: <19576812-ba03-2881-7642-0715b8ce9a78@intel.com>
In-Reply-To: 6bd6c69c-42b5-7b77-4cde-34d096ed29b6@qarnot-computing.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0157987273591486875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/6/19 1:47 AM, Gabriel Chabot wrote:
> I am currently using TPM2 for remote attestation.
> At some point, I want to send a message and the signature of this
> message to the remote.
> However, when I try to hash the message (which is greater than 1024
> bytes) with tpm2_hash, I get the following error:
> =

> ERROR:tcti:src/util/io.c:106:write_all() failed to write to fd 4: I/O err=
or
> ERROR:tcti:src/tss2-tcti/tcti-device.c:121:tcti_device_transmit() wrong
> number of bytes written. Expected 1053, wrote 0.
> ERROR:esys:src/tss2-esys/api/Esys_SequenceUpdate.c:197:Esys_SequenceUpdat=
e_Async()
> Finish (Execute Async) ErrorCode (0x000a000a)
> ERROR:esys:src/tss2-esys/api/Esys_SequenceUpdate.c:74:Esys_SequenceUpdate=
()
> Error in async function ErrorCode (0x000a000a)
> ERROR: Esys_SequenceUpdate(0xA000A) - tcti:IO failure
> ERROR: Unable to run tpm2_hash

This looks like a driver or tpm device issue.
Do you see and TPM related problems in the system logs?
Could you make sure that the device support sha256.

Thanks,
-- =

Tadeusz
--===============0157987273591486875==--

