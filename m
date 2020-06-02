Content-Type: multipart/mixed; boundary="===============3853733821713415476=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: How we authorize the EK hierarchy to create AIK?
Date: Tue, 02 Jun 2020 22:05:35 +0000
Message-ID: <20200602220535.2851.81976@ml01.vlan13.01.org>
In-Reply-To: 20200602193946.2851.96020@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3853733821713415476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That script never failed to me with Platform Trust Technology :) =


Does you TPM Endorsement Hierarchy requires a password? If so, is that some=
thing you should satisfy with https://github.com/tpm2-software/tpm2-tools/b=
lob/master/man/tpm2_policypassword.1.md?

The script posted is more or less inspired in this document https://trusted=
computinggroup.org/wp-content/uploads/Credential_Profile_EK_V2.0_R14_publis=
hed.pdf, which say that the authPolicy for the Endorsement key is TPM2_Poli=
cySecret(TPM_RH_ENDORSEMENT)
--===============3853733821713415476==--

