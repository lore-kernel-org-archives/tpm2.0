Content-Type: multipart/mixed; boundary="===============0146963607159556163=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Ensure the link between an unrestricted signing key and a
 TPM
Date: Mon, 28 Dec 2020 17:00:51 +0000
Message-ID: <SN6PR11MB34370566B0996D2133455F4EB8D90@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: D4yzi2HNWDWJ_7gCUWtAr6noTPvOuJFL_IP7FMrmSX7rJC1QTm-MhXjsvEzXIy6Y9JBFpTkF_MBK2Uu_yTkESAuD7f1KWhWdKkVaj9z4JBY=@protonmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0146963607159556163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Couldn't you just use certify?

https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_certify.1.=
md


> -----Original Message-----
> From: Auriga7 <Auriga7(a)protonmail.com>
> Sent: Wednesday, December 23, 2020 10:06 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Ensure the link between an unrestricted signing key a=
nd a
> TPM
> =

> I think I've figured out how to do it. Here an example :
> =

> =

> tpm2_createek -c ek.handle -G rsa -u ek.pub
> =

> =

> tpm2_startauthsession --policy-session -S session.ctx
> =

> tpm2_policysecret -S session.ctx -c e
> =

> tpm2_create -C ek.handle -c ak.ctx -u ak.pub -r ak.priv -P session:sessio=
n.ctx
> =

> tpm2_readpublic -c ak.ctx -o ak.pem -n ak.name -f pem
> =

> tpm2_flushcontext session.ctx
> =

> =

> file_size=3D`stat --printf=3D"%s" ak.name`
> =

> loaded_key_name=3D`cat ak.name | xxd -p -c $file_size`
> =

> echo "secret" > secret.data
> =

> tpm2_makecredential -e ek.pub -s secret.data -n $loaded_key_name -o cred.=
out
> =

> =

> tpm2_startauthsession --policy-session -S session.ctx
> =

> tpm2_policysecret -S session.ctx -c e
> =

> tpm2_activatecredential -c ak.ctx -C ek.handle -i cred.out -o decrypt_sec=
ret.data
> -P "session:session.ctx"
> =

> tpm2_flushcontext session.ctx
> =

> =

> =

> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original =
Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
> =

> Le mardi 22 d=C3=A9cembre 2020 15:37, Auriga7 <Auriga7(a)protonmail.com
> <mailto:Auriga7(a)protonmail.com> > a =C3=A9crit :
> =

> =

> =

> 	Hi,
> =

> =

> 	I would like to know how i can certiffy that a non restricted signing key
> belongs to a real TPM in the same way that an AIK key can guarantee it is=
 from a
> TPM using EK and the EK certificate of the TPM. I've tried using the
> makecredential and activatecredential commands of tpm2-tools on a non
> restricted signing key created with the create command. However those
> commands seems to only work for an AIK key created using createak command.
> How can I create a non restricted signing key and then ensure that this k=
ey is
> linked to real TPM using the tpm2-tools.
> =

> =

> 	Thank you.
> =

> =



--===============0146963607159556163==--

