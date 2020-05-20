Content-Type: multipart/mixed; boundary="===============7264248490245120561=="
MIME-Version: 1.0
From: =?utf-8?q?Eduardo_Falc=C3=A3o_=3Ceduardolfalcao_at_gmail=2Ecom=3E?=
Subject: [tpm2] Stablishing trust on to TPM simulator
Date: Wed, 20 May 2020 14:08:47 +0000
Message-ID: <20200520140847.2843.90531@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7264248490245120561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello, everyone :)

I am creating a demo where I attest the state of a machine (VM) using a sim=
ulated TPM. I think I've done properly the core operations of my demonstrat=
ion, but I'm still wondering how would I stablish trust with TPM in this si=
mulated scenario.

I think that in a real setup, with a real TPM, there may be a service that =
validates the TPM Ek certificate. Is there something similar I could do in =
simulation mode, or I would have to mock this action (in simulation environ=
ment)?

Also, in case I have a real TPM, how would I use this service (for instance=
, with a TPM from Intel)? Where would I check the parameters of this API?


-------- =

More info on my setup:
The TPM I am using is simulated. Thus, my setup involves installing the SWT=
PM (https://github.com/stefanberger/swtpm.git and https://github.com/stefan=
berger/libtpms.git), QEMU (https://github.com/qemu/qemu), and EDK2 (https:/=
/github.com/tianocore/edk2.git).
When configuring my simulator, I run it with --createek, --create-ek-cert, =
and --create-platform-cert flag, as follows: =


sudo swtpm_setup --tpmstate ${VTPM_DIR_PATH} --createek --create-ek-cert --=
create-platform-cert --allow-signing --tpm2

Through Qemu, I am able to start a VM with TPM2 features, and then I instal=
l TSS (https://github.com/tpm2-software/tpm2-tss), ABRMD (https://github.co=
m/tpm2-software/tpm2-abrmd), and TPM2_TOOLS (https://github.com/tpm2-softwa=
re/tpm2-tools). This setup allows me to try out TPM in simulation mode.

Steps of attestation:
1. (VM to be attested) getting the public portion of my endorsement key
2. (VM to be attested) creating an attestation key (AK)
3. (VM to be attested) quoting given PCRs with freshly created AK (outputin=
g the quote, pcrs, and signature)
4. (Attestator VM) run python program that checks quote signatue, and check=
s if value of PCR digest from quote matches an expected value =


Missing step:
1. (Attestator VM) check if vendor root certificates validate the EK certif=
icate
-------- =


Best regards
--===============7264248490245120561==--

