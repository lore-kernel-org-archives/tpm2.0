Content-Type: multipart/mixed; boundary="===============0131845788537783884=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Verifying signature with "-d" instead of "-g -m"
Date: Mon, 09 Dec 2019 13:02:35 +0000
Message-ID: <CALtZhhMR8O-c6dVZPvtcdh=+KhTb=9TcXFixqFi=acSK1KyDHQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0131845788537783884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Up until now, I've been able to verify signatures with a one-liner as follo=
ws:

    tpm2_verifysignature -g sha256 -f rsassa -c 0x81000000 -m
./rootfs.tar -s ./signature_file

This failed to work today though on a file that's over 300 MB. I need
it to work on files up to about 500 MB.

So it looks like I'll have to create a hash file first, and then use
the "-d" option when verifying, as follows:

    # This first line creates a sum file in raw binary format
    sha256sum rootfs.tar | cut -c -64 | sed
's/\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs -n1 printf > digesthash.sum

    tpm2_verifysignature -c 0x81000000 -d digesthash.sum -s signature_file

Here is the error I get when I try to do this:

    ERROR: Esys_VerifySignature(0x2D2) - tpm:parameter(2):unsupported
or incompatible scheme

This is strange because it works fine when I verify with options "-m
-g". Also, I have checked to make sure that the output from
"tpm2_hash" is the same as the format I use above. I don't know why
it's rejecting it saying it's unsupported.
--===============0131845788537783884==--

