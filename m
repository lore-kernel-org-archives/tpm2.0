Content-Type: multipart/mixed; boundary="===============1690384059548176930=="
MIME-Version: 1.0
From: Martin Townsend <mtownsend1973 at gmail.com>
Subject: [tpm2] Initial Identity
Date: Wed, 04 Mar 2020 16:52:23 +0000
Message-ID: <CABatt_xVek_wJNDaWops43SevgdBzzd_Kj9nJmSUor63VkQBdw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1690384059548176930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I've been reading up on Initial identity and specifically the sections
in the "TCG Guidance for Securing Network Equipment Using TCG
Technology" document and am currently working through the provisioning
.  Originally I thought tpm2_createak should be used to create the key
pair that is referred to as the Initial Attestation key (IAK).  But I
think this tool creates an Attestation Identity Key (AIK) and is
something that is done after provisioning and used by applications. Is
this the case?

The document goes on to say that the keys should be primary keys so
should I create these keys with tpm2_createprimary?  This would create
the keys from the Endorsement Primary Seed so if I make the IAK a
restricted signing key and the IDevID an unrestricted signing key then
they would both be different as this is part of the Template used to
generate the key from the seed.  I could then use the IDevID with
software such as OpenSSL. Does anyone know if this sounds plausible?

Also does anyone have any idea how I would certify these keys, for the
IDevID as it's unrestricted I take it I could sign a CSR with this key
but I'm not sure how to certify the IAK with TPM2.0.

Many Thanks,
Martin.
--===============1690384059548176930==--

