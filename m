Content-Type: multipart/mixed; boundary="===============2160854392580909793=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: some questions about Identity
Date: Wed, 15 Jan 2020 17:17:13 +0000
Message-ID: <20200115171713.2574.28120@ml01.vlan13.01.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E66B9F@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2160854392580909793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

About tpm2_getekcertificate, I executed it agains https://ekop.intel.com/ek=
cert (hope it is the correct one):

tpm2_createek -G rsa -u ek.pub -c key.ctx
tpm2_getekcertificate -X -o ECcert.bin -u ek.pub https://ekop.intel.com/ekc=
ert

Output:

WARN: TLS communication with the said TPM manufacturer server setup with SS=
L_NO_VERIFY!
ERROR: Cannot proceed. For further information please refer to: https://www=
.intel.com/content/www/us/en/security-center/advisory/intel-sa-00086.html. =
Recovery tools are located here:https://github.com/intel/INTEL-SA-00086-Lin=
ux-Recovery-Tools
ERROR: Unable to run tpm2_getekcertificate

Is that expected?
--===============2160854392580909793==--

