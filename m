Content-Type: multipart/mixed; boundary="===============3469104543083685602=="
MIME-Version: 1.0
From: william.c.roberts at intel.com
Subject: [tpm2] Re: Stablishing trust on to TPM simulator
Date: Wed, 20 May 2020 18:41:31 +0000
Message-ID: <20200520184131.2843.35549@ml01.vlan13.01.org>
In-Reply-To: 20200520140847.2843.90531@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3469104543083685602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> =

> Missing step:
> 1. (Attestator VM) check if vendor root certificates validate the EK cert=
ificate
> -------- =


So as Imran points out keylime.dev has a system that does all of this. To v=
erify a certificate on the server, it would be some form of
openssl verify command. I don't recall if tpm2_createek will output stable =
keys between ibmtpm server invocations where the NVChip
file is removed, so be wary of that. NVChip is where the ibmtpm simulator s=
tores its persistent data, like the endorsement hiearchy
seed. If that seed is randomized, removing that will get you a new key. The=
 NVChip file is always in the CWD of the ibmtpm process.
For an actual TPM, it depends, TL;DR is that recent versions of tpm2_getekc=
ertificate will fetch it for you (offhand I cannot recall the
version, but its at least 4.0 for ecc keys).  Certificates are stored in NV=
 Indexes defined by the TCG, and some Intel platforms have it
available via a web URL. The simulator does none of these steps, so you wou=
ld have to mock it by creating your own EK Cert and storing
it to the tpm NV index. You can then use openssl verify command to make sur=
e that its a good certificate.
--===============3469104543083685602==--

