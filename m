Content-Type: multipart/mixed; boundary="===============0690209622093205225=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: IMA determinism
Date: Thu, 16 Jul 2020 19:13:17 +0000
Message-ID: <20200716191317.2739.73714@ml01.vlan13.01.org>
In-Reply-To: 20200714152253.31655.48457@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0690209622093205225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Eduardo!

In one scenario, where you are the owner of the device is trusted, and the =
key provisioning process is done in a trusted environment, the binding is d=
one by the user creating the key. So, you create the keys effectively in th=
e TPM, and provide the public parts to the attestation server. Then the ser=
ver uses something like TPM_MakeCredential to encrypt the nonce that will b=
e used in the attestation process, and guarantees that only the TPM enrolle=
d in the provisioning process can decrypt the nonce and sign the attestatio=
n request. I would say the binding of EK and AK is done by a trusted party =
(the user, in this case)

If we go to a second scenario, where you are the owner of the attestation s=
erver, but other person (which may be untrusted) is the owner of the device=
, then you have to rely on certificates provided by the TPM manufacturer. L=
ooking at https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/message/=
BIJRJGFCTFMQICMUWSVTYHFCH2OEEID6/, it more or less have a process to make t=
his happen based on the EK Certificate. This is great if every TPM followed=
 the https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-Prov=
isioning-Guidance-Published-v1r1.pdf document for provisioning of keys. So,=
 having the Endorsement Key Certificate in the target TPM, you could enforc=
e the association of the AK to the EK in that specific TPM, trusting the TP=
M Manufacturer. =


But, not every device I saw have the EKCert provisioned :(. I saw this happ=
ening in devices with Platform Trust Technology for example. Using the http=
s://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_getekcertifica=
te.1.md tool yields this error https://github.com/tpm2-software/tpm2-tools/=
blob/master/tools/tpm2_getekcertificate.c#L358. This scenario may be more c=
hallenging.

Summary:

1. If the parts generating and providing the keys are trusted,  and the env=
ironment where this key is shared is trusted, maybe you can trust that the =
EK and AK belongs to the same TPM.
2. You could use the EK Cert with the process described before. I don't hav=
e sample code for this, so if somebody has it, please share!
3. For TPMs that do not have an EK Cert, apparently you are out of luck if =
(1) is not possible

Please somebody correct me if I am wrong!
--===============0690209622093205225==--

