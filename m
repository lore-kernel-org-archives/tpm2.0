Content-Type: multipart/mixed; boundary="===============1093492442485129274=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: Need Help to parse AK public key
Date: Wed, 19 Feb 2020 23:38:06 +0100
Message-ID: <ec23bdf1-5cb8-2851-1891-1345b66d784e@uvensys.de>
In-Reply-To: 20200219223242.2820.81088@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1093492442485129274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

you can specify a format via the -f switch.

Use -f pem

tpm2_createak -C 0x81010001 -c ak.ctx -u ak.pub -r ak.priv -n ak.name -P
dummypwd -p dummypwd -f pem

regards,
Steffen Schwebel

On 2/19/20 11:32 PM, chenxiz(a)fb.com wrote:
> Hi,
>
> I created a 2048 RSA AK by using the command below :
> tpm2_createak -C 0x81010001 -c ak.ctx -u ak.pub -r ak.priv -n ak.name -P=
=C2=A0dummypwd -p dummypwd
>
> ak.pub file size =3D 282 bytes.
> $stat --printf=3D"%s" ak.pub
> 282
>
> I would like to parse the RSA public key, i.e., e and n, Can anyone help =
me elaborate the ak.pub format or is there any tool I can use to parse it?
>
> TPM2 tools version (all are the latest):
> tpm2-tools-4.1.1
> tpm2-abrmd-2.3.1
> tpm2-tss-2.3.2
>
>
> Thanks,
> Chenxi
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--=20

--===============1093492442485129274==--

