Content-Type: multipart/mixed; boundary="===============5680710535789860700=="
MIME-Version: 1.0
From: =?utf-8?q?Eduardo_Falc=C3=A3o_=3Ceduardolfalcao_at_gmail=2Ecom=3E?=
Subject: [tpm2] Re: How we authorize the EK hierarchy to create AIK?
Date: Tue, 02 Jun 2020 19:39:46 +0000
Message-ID: <20200602193946.2851.96020@ml01.vlan13.01.org>
In-Reply-To: 20200526165647.2859.93394@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5680710535789860700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Nicolas.

When I run "tpm2_policysecret -S session.ctx -c ${TPM2_RH_ENDORSEMENT}" I h=
ave the following error:

ubuntu(a)ubuntu:~/atesttor$ tpm2_policysecret -S session.ctx -c ${TPM2_RH_E=
NDORSEMENT}
WARNING:esys:src/tss2-esys/api/Esys_PolicySecret.c:343:Esys_PolicySecret_Fi=
nish() Received TPM Error =

ERROR:esys:src/tss2-esys/api/Esys_PolicySecret.c:115:Esys_PolicySecret() Es=
ys Finish ErrorCode (0x000009a2) =

ERROR: Esys_PolicySecret(0x9A2) - tpm:session(1):authorization failure with=
out DA implications
ERROR: Could not build policysecret
ERROR: Unable to run tpm2_policysecret

I thought it was something related to passing the password of the hierarchy=
, but the command doesn't recognize -p option.
Do you have a clue of what it may be happening?

Best regards
--===============5680710535789860700==--

