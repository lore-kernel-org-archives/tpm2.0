Content-Type: multipart/mixed; boundary="===============0864895746520166866=="
MIME-Version: 1.0
From: andrew.featherstone at gmail.com
Subject: [tpm2] tpm2_certify signature verification
Date: Sat, 07 Mar 2020 13:12:29 +0000
Message-ID: <20200307131229.2908.93567@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0864895746520166866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi there,

I'm trying to use the output of tpm2_certify to construt the Subject Key At=
testation Evidence Extension (SKAE Extension)[1] for a X.509 Certificate Re=
quest. I've followed the example at https://github.com/tpm2-software/tpm2-t=
ools/blob/master/man/tpm2_certify.1.md , but I'm struggling to work out how=
 to use the tpm2-tools to check the signature over the attestation structur=
e. Looking at https://github.com/tpm2-software/tpm2-tools/blob/master/man/t=
pm2_verifysignature.1.md I expected to perform something like the following=
 (unfortunately I'm not able to retrieve the complete command history right=
 now):

tpm2_create -G rsa -u rsa.pub -r rsa.priv -C primary.ctx
tpm2_load -C primary.ctx -u rsa.pub -r rsa.priv -c rsa.ctx
tpm2_certify -c rsa.ctx -C certify.ctx -g sha256 -o attest.out -s sig.out
tpm2_verifysignature -c rsa.ctx -g sha256 -m attest.out -s sig.out
WARNING:esys:../tpm2-tss-2.3.2/src/tss2-esys/api/Esys_VerifySignature.c:302=
:Esys_VerifySignature_Finish() Received TPM Error
ERROR:esys:../tpm2-tss-2.3.2/src/tss2-esys/api/Esys_VerifySignature.c:103:E=
sys_VerifySignature() Esys Finish ErrorCode (0x000002db)
ERROR: Esys_VerifySignature(0x2DB) - tpm:parameter(2):the signature is not =
valid
ERROR: Verify signature failed!
ERROR: Unable to run tpm2_verifysignature

Is anyone able to post a complete example to show how the output of tpm2_ce=
rtify is verified, based on the attestation key used?

[1] https://trustedcomputinggroup.org/wp-content/uploads/IWG_SKAE_Extension=
_1-00.pdf
--===============0864895746520166866==--

