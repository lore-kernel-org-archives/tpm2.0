Content-Type: multipart/mixed; boundary="===============4759813979551192876=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: =?utf-8?q?=5Btpm2=5D_Re=3A_How_can_I_use_a_persisted_object_without_it?=
 =?utf-8?q?=E2=80=99s_primary_key=3F?=
Date: Thu, 06 May 2021 14:08:32 +0000
Message-ID: <AM8P194MB1675E21B4968771D2EF63C40A6589@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: 19483178-A981-4AC4-B392-B709E07384AE@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4759813979551192876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is no TPM functionality to export keys that were previously made pers=
istent.
You need to store the private key blob from the create / createloaded comma=
nd.

The primary key serves the bootstraping of the key encryption chains. But f=
or persistent keys it serves not purpose after they were made persistent.

________________________________________
Von: Rowan Moul <lists(a)rowan.moul.ca>
Gesendet: Donnerstag, 6. Mai 2021 15:00
An: Fuchs, Andreas
Cc: tpm2(a)lists.01.org
Betreff: Re: [tpm2] How can I use a persisted object without it=E2=80=99s p=
rimary key?

That makes sense.

What if I want to extract the key from the tpm later? Assuming I did not re=
tain the private portion of the signing key when I created it (perhaps I us=
ed the createLoaded command and it never left the tpm). I was looking throu=
gh all the tools and I did not see one that would let me export the private=
 part of the key even if I re-loaded the primary key (which I assume would =
he required so that it could be used to encrypt the private area before it =
leaves the tpm).
Also, if I wanted to move the signing key to another tpm (or even an altern=
ative key management solution) is there a way to export the key in the clea=
r?

It seems to me that if I don=E2=80=99t need this key to ever leave the tpm =
then the primary key has no purpose beyond being required in the initial cr=
eation command. I=E2=80=99m sure this is not entirely the case though.

Thank you,

Rowan

> On May 6, 2021, at 02:06, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.=
de> wrote:
>
> =EF=BB=BFPersistent keys inside the TPM are not encrypted with their pare=
nt anymore.
> Only with a TPM-internal flash-encryption that you do not have to care ab=
out.
>
> ________________________________________
> Von: Rowan Moul <lists(a)rowan.moul.ca>
> Gesendet: Donnerstag, 6. Mai 2021 07:17
> An: tpm2(a)lists.01.org
> Betreff: [tpm2] How can I use a persisted object without it=E2=80=99s pri=
mary key?
>
> Hello,
> I=E2=80=99m just trying to get a better sense of how the TPM storage hier=
archy works.
>
> Say I create a primary key under the owner hierarchy, and then I create a=
 signing key under that. I persist the signing key with tpm2_evictcontrol b=
ut I do NOT persist the primary key.
> How am I able to use the signing key on subsequent boots without the prim=
ary key existing in the TPM memory? Isn=E2=80=99t it needed to decrypt the =
signing key? Or is the persisted signing key not encrypted by the primary k=
ey when it resides inside the TPM hardware?
>
> Thanks,
>
> Rowan
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


--===============4759813979551192876==--

