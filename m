Content-Type: multipart/mixed; boundary="===============1462823336769299918=="
MIME-Version: 1.0
From: kent.thompson at intel.com
Subject: [tpm2] Question: How should I provide "OwnerAuth" on Windows?
Date: Mon, 29 Jun 2020 18:03:16 +0000
Message-ID: <20200629180316.2663.60038@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1462823336769299918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've searched through the project's issues but didn't find anything on this=
 topic.

Our team is porting the Linux implementation of the 'tpm-provider' (applica=
tion interface (wraps tpm2-tss for use with golang) to Windows. On Linux we=
 take ownership of the tpm and specify the owner auth password, which is th=
en used for the tpm2-tss function calls (ex. https://github.com/intel-secl/=
tpm-provider/blob/64cd53d6fd91b50eb011e1e43d6b0966fbeb473a/nvram.c#L67).

My understanding is that taking ownership is not needed on Windows and I've=
 retrieved the "ownerauth" form the Get-Tpm cmdlet. Base64 decoding that va=
lue and passing the 20 bytes for owner auth returns 0x9a2 (TPM_RC_BAD_AUTH).

What ownerath value should I pass to tpm2-tss?

Duplicated at https://github.com/tpm2-software/tpm2-tss/issues/1767
--===============1462823336769299918==--

