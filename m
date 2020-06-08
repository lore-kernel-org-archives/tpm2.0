Content-Type: multipart/mixed; boundary="===============1008333220631749209=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: Sharing TPM 2.0 between containers with access policy
Date: Mon, 08 Jun 2020 15:38:09 +0000
Message-ID: <20200608153809.2851.94079@ml01.vlan13.01.org>
In-Reply-To: 18096ca7-42ac-fd5f-faa4-118adcf11140@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1008333220631749209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Could you use tpm2_clearcontrol for 1)? =


https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_clearcontr=
ol.1.md

tpm2_clearcontrol(1) - Allows user with knowledge of either lockout auth an=
d or platform hierarchy auth to set disableClear which prevents the lockout=
 authorization's capability to execute tpm2_clear. Only user with authoriza=
tion knowledge of the platform hierarchy can clear the disableClear. By def=
ault it attempts to clear the disableClear bit.
--===============1008333220631749209==--

