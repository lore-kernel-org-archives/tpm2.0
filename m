Content-Type: multipart/mixed; boundary="===============4326488022221350213=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: IMA determinism
Date: Thu, 16 Jul 2020 19:35:22 +0000
Message-ID: <SN6PR11MB3437F19461CDDFB0149F0554B87F0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20200716191317.2739.73714@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4326488022221350213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: nicolasoliver03(a)gmail.com <nicolasoliver03(a)gmail.com>
> Sent: Thursday, July 16, 2020 2:13 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: IMA determinism
> =

> Hi Eduardo!
> =

> In one scenario, where you are the owner of the device is trusted, and th=
e key
> provisioning process is done in a trusted environment, the binding is don=
e by the
> user creating the key. So, you create the keys effectively in the TPM, an=
d provide
> the public parts to the attestation server. Then the server uses somethin=
g like
> TPM_MakeCredential to encrypt the nonce that will be used in the attestat=
ion
> process, and guarantees that only the TPM enrolled in the provisioning pr=
ocess
> can decrypt the nonce and sign the attestation request. I would say the b=
inding
> of EK and AK is done by a trusted party (the user, in this case)
> =

> If we go to a second scenario, where you are the owner of the attestation=
 server,
> but other person (which may be untrusted) is the owner of the device, the=
n you
> have to rely on certificates provided by the TPM manufacturer. Looking at
> https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/message/BIJRJGFC=
TFMQIC
> MUWSVTYHFCH2OEEID6/, it more or less have a process to make this happen
> based on the EK Certificate. This is great if every TPM followed the
> https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-
> Provisioning-Guidance-Published-v1r1.pdf document for provisioning of key=
s. So,
> having the Endorsement Key Certificate in the target TPM, you could enfor=
ce the
> association of the AK to the EK in that specific TPM, trusting the TPM
> Manufacturer.
> =

> But, not every device I saw have the EKCert provisioned :(. I saw this ha=
ppening
> in devices with Platform Trust Technology for example. Using the
> https://github.com/tpm2-software/tpm2-
> tools/blob/master/man/tpm2_getekcertificate.1.md tool yields this error
> https://github.com/tpm2-software/tpm2-
> tools/blob/master/tools/tpm2_getekcertificate.c#L358. This scenario may be
> more challenging.
> =

> Summary:
> =

> 1. If the parts generating and providing the keys are trusted,  and the
> environment where this key is shared is trusted, maybe you can trust that=
 the EK
> and AK belongs to the same TPM.
> 2. You could use the EK Cert with the process described before. I don't h=
ave
> sample code for this, so if somebody has it, please share!

Imran has a full writeup on this:
https://tpm2-software.github.io/2020/06/12/Remote-Attestation-With-tpm2-too=
ls.html

If you don't need the privacy portion the service provider and privacy CA c=
an be the same.

You could also probably use TPM2_Certify to verify the AIK is loaded in tha=
t TPM using the
EK if you wanted to avoid the credential secret portion. Imran, correct me =
if I am wrong here.

> 3. For TPMs that do not have an EK Cert, apparently you are out of luck i=
f (1) is not
> possible

The PTT case you mention above, if you go through the recovery process you =
should have
A valid EK.

> =

> Please somebody correct me if I am wrong!
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============4326488022221350213==--

