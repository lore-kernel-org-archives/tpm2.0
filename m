Content-Type: multipart/mixed; boundary="===============2186160280830590911=="
MIME-Version: 1.0
From: Erik <who+01tpm at cnackers.org>
Subject: [tpm2] Re: import key in tss format into tpm2-pytss
Date: Tue, 20 Sep 2022 15:33:41 +0200
Message-ID: <05d6d75a806af66d5985514811980bc3981d0836.camel@cnackers.org>
In-Reply-To: FR0P281MB170650BDEAB61B6128173A5BD14C9@FR0P281MB1706.DEUP281.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2186160280830590911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

You can use the unmarshal method for TPM2B_PUBLIC, so something like this (=
untested) might work:
from tpm2_pytss.types import TPM2B_PUBLIC                                  =
                                            =

                                                                           =
                                                                           =
                                                                           =
      =

with open("tpm.pub", "rb") as f:                                           =
                                            =

    data =3D f.read()                                                      =
                                              =

    pub, _ =3D TPM2B_PUBLIC.unmarshal(data)                                =
                                              =

                                                                           =
                                                                           =
                                                                           =
      =

print(pub.publicArea.type) =


/Erik

On Tue, 2022-09-20 at 13:20 +0000, Gadacz, Henry wrote:
> Hello everyone,
> =C2=A0
> I have exported a public key with the tpm2-tools using tpm2_readpublic in=
 the default tss format (I guess it is a
> TPM2B_PUBLIC structure).
> =C2=A0
> How can I load it into an TPM2B_PUBLIC or TPMT_PUBLIC object in tpm2-pyts=
s, so I can load it with the
> ESAPI.load_external() function? I have seen the .from_pem() method, but I=
 don=E2=80=99t want to use pem format, because it
> does not include the key attributes and other information.
> =C2=A0
> Best Regards,
> Henry
> =C2=A0
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


--===============2186160280830590911==--

