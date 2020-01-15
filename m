Content-Type: multipart/mixed; boundary="===============5165868555406116252=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: Device Identity Attestation with tpm2-tools
Date: Wed, 15 Jan 2020 16:13:50 +0000
Message-ID: <20200115161350.2574.54954@ml01.vlan13.01.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E66B7A@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5165868555406116252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for that info,

For reference to others, TPM2_ChangeEPS and TPM2_ChangePPS can be found in =
https://www.trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-3=
-Commands-01.38.pdf, page 280.

I noticed that the https://github.com/tpm2-software/tpm2-tools/blob/master/=
man/tpm2_changeeps.1.md man page is a copy of https://github.com/tpm2-softw=
are/tpm2-tools/blob/master/man/tpm2_changepps.1.md. I created an issue for =
that https://github.com/tpm2-software/tpm2-tools/issues/1887

An example for that 1% of the times is present here https://github.com/inte=
l/INTEL-SA-00086-Linux-Recovery-Tools, where you have to regenerate the End=
orsement Platform Seed after patching the Intel ME/TXE

Good to know that the endorsement key are not 100% immutable
--===============5165868555406116252==--

