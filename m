Content-Type: multipart/mixed; boundary="===============2810102518750605452=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 20, Issue 16
Date: Thu, 21 Feb 2019 20:18:25 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FF83EFCBCB@fmsmsx104.amr.corp.intel.com>
In-Reply-To: mailman.17.1550779201.15811.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2810102518750605452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Persistent handles start with hex 81xxxxxx
________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of tpm2-request(a)lists.=
01.org [tpm2-request(a)lists.01.org]
Sent: Thursday, February 21, 2019 1:00 PM
To: tpm2(a)lists.01.org
Subject: tpm2 Digest, Vol 20, Issue 16

Send tpm2 mailing list submissions to
        tpm2(a)lists.01.org

To subscribe or unsubscribe via the World Wide Web, visit
        https://lists.01.org/mailman/listinfo/tpm2
or, via email, send a message with subject or body 'help' to
        tpm2-request(a)lists.01.org

You can reach the person managing the list at
        tpm2-owner(a)lists.01.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of tpm2 digest..."


Today's Topics:

   1. Roadblock using TPM2 for mounting filesystems (martin doc)
   2. Re: facilitating BIOS update with seamless PCR policy change
      (Petko Manolov)


----------------------------------------------------------------------

Message: 1
Date: Thu, 21 Feb 2019 01:18:10 +0000
From: martin doc <db1280(a)hotmail.com>
To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
Subject: [tpm2] Roadblock using TPM2 for mounting filesystems
Message-ID:
        <SL2P216MB0266A71D9099EBA6243311BCC27E0(a)SL2P216MB0266.KORP216.PRO=
D.OUTLOOK.COM>

Content-Type: text/plain; charset=3D"iso-8859-1"

I'm trying to get TPM2 working with encrypted filesystems on CentOS 7.

I started out using this page as a guide:
https://threat.tevora.com/secure-boot-tpm-2/

but some of the CLI has changed. The commands I've used are:


# dmesg | grep tpm_tis
[    1.919443] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1B, rev-id 16)
# tpm2_createpolicy -P -L sha1:0,2,3,7 -F pcrs.bin -f policy.digest

# tpm2_createprimary -H e -g sha1 -G rsa -C primary.context

ObjectAttribute: 0x00030072
CreatePrimary Succeed ! Handle: 0x800000ff


# dd if=3D/dev/urandom of=3D/tmp/secret.bin bs=3D32 count=3D1
# tpm2_create -g sha256 -G keyedhash -u obj.pub -r obj.priv -c primary.cont=
ext -L policy.digest -A "noda|adminwithpolicy|fixedparent|fixedtpm" -I /tmp=
/secret.bin

Load object into the TPM

# tpm2_load -c primary.context -u obj.pub -r obj.priv -C load.context
Load succ.
LoadedHandle: 0x80000100

But the final step fails:

# tpm2_evictcontrol -A o -c load.context -S 0x80000100
persistentHandle: 0x80000100
ERROR: EvictControl failed, error code: 0x1c4
# tpm2_rc_decode 0x1c4
error layer
hex: 0x0
identifier: TSS2_TPM_ERROR_LEVEL
description: Error produced by the TPM
format 1 error code
hex: 0x04
identifier: TPM_RC_VALUE
description: value is out of range or is not correct for the context
parameter
hex: 0x100
identifier: TPM_RC_1
description: (null)


The error description is a clue that the "-S #" is not right.
It also doens't work if I use the handle value for the primary.
Is there another step in here that I'm missing?



--===============2810102518750605452==--

