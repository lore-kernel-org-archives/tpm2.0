Content-Type: multipart/mixed; boundary="===============1613775511800687209=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: =?utf-8?q?=5Btpm2=5D_Re=3A_How_can_I_use_a_persisted_object_without_it?=
 =?utf-8?q?=E2=80=99s_primary_key=3F?=
Date: Thu, 06 May 2021 08:28:50 -0600
Message-ID: <942BBF86-32FE-4F94-9DE9-AD7DD1653695@rowan.moul.ca>
In-Reply-To: AM8P194MB1675E21B4968771D2EF63C40A6589@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1613775511800687209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That is good to know. Thanks for the help!

Rowan

> On May 6, 2021, at 08:08, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.=
de> wrote:
> =

> =EF=BB=BFThere is no TPM functionality to export keys that were previousl=
y made persistent.
> You need to store the private key blob from the create / createloaded com=
mand.
> =

> The primary key serves the bootstraping of the key encryption chains. But=
 for persistent keys it serves not purpose after they were made persistent.
> =

> ________________________________________
> Von: Rowan Moul <lists(a)rowan.moul.ca>
> Gesendet: Donnerstag, 6. Mai 2021 15:00
> An: Fuchs, Andreas
> Cc: tpm2(a)lists.01.org
> Betreff: Re: [tpm2] How can I use a persisted object without it=E2=80=99s=
 primary key?
> =

> That makes sense.
> =

> What if I want to extract the key from the tpm later? Assuming I did not =
retain the private portion of the signing key when I created it (perhaps I =
used the createLoaded command and it never left the tpm). I was looking thr=
ough all the tools and I did not see one that would let me export the priva=
te part of the key even if I re-loaded the primary key (which I assume woul=
d he required so that it could be used to encrypt the private area before i=
t leaves the tpm).
> Also, if I wanted to move the signing key to another tpm (or even an alte=
rnative key management solution) is there a way to export the key in the cl=
ear?
> =

> It seems to me that if I don=E2=80=99t need this key to ever leave the tp=
m then the primary key has no purpose beyond being required in the initial =
creation command. I=E2=80=99m sure this is not entirely the case though.
> =

> Thank you,
> =

> Rowan
> =

>> On May 6, 2021, at 02:06, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer=
.de> wrote:
>> =

>> =EF=BB=BFPersistent keys inside the TPM are not encrypted with their par=
ent anymore.
>> Only with a TPM-internal flash-encryption that you do not have to care a=
bout.
>> =

>> ________________________________________
>> Von: Rowan Moul <lists(a)rowan.moul.ca>
>> Gesendet: Donnerstag, 6. Mai 2021 07:17
>> An: tpm2(a)lists.01.org
>> Betreff: [tpm2] How can I use a persisted object without it=E2=80=99s pr=
imary key?
>> =

>> Hello,
>> I=E2=80=99m just trying to get a better sense of how the TPM storage hie=
rarchy works.
>> =

>> Say I create a primary key under the owner hierarchy, and then I create =
a signing key under that. I persist the signing key with tpm2_evictcontrol =
but I do NOT persist the primary key.
>> How am I able to use the signing key on subsequent boots without the pri=
mary key existing in the TPM memory? Isn=E2=80=99t it needed to decrypt the=
 signing key? Or is the persisted signing key not encrypted by the primary =
key when it resides inside the TPM hardware?
>> =

>> Thanks,
>> =

>> Rowan
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============1613775511800687209==--

