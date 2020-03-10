Content-Type: multipart/mixed; boundary="===============1877508663140249694=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] Issue with tpm2_policycountertimer
Date: Tue, 10 Mar 2020 13:29:47 -0600
Message-ID: <96D222CC-AD85-423A-8906-0C5FE67CEC42@rowan.moul.ca>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1877508663140249694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I=E2=80=99m having an issue with tpm2_policycountertimer when using a real =
policy session, however it works with a trial session.

The commands that I used:

tpm2_startauthsession --policy-session -S policy-session.ctx

tpm2_policycountertimer -S policy-session.ctx --eq resets=3D43

43 is the current reset_count from tpm2-readclock

I get the following error:
Esys_PolicyCounterTimer_Finish() Received TPM Error
Esys_PolicyCounterTimer() Esys Finish ErrorCode (0x00000126)
policy failure in math operation or an invalid authPolicy value

I get the same error wether I am using abrmd, the kernel RM, or /dev/tpm0 d=
irectly.

Versions:
tpm2-tools 4.1.1
tpm2-tss 2.3.2
tpm2-abrmd 2.3.1

I am using an Intel PTT fTPM that isn=E2=80=99t compliant with the latest v=
ersions of the 2.0 spec. Not sure if that tips anyone off to known issues.

Thank you,

Rowan
--===============1877508663140249694==--

