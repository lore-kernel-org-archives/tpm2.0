Content-Type: multipart/mixed; boundary="===============6528922653412895659=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Generate keypair using OpenSSL, then load into TPM2
Date: Fri, 06 Dec 2019 14:28:18 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E4CCEF@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CALtZhhPmk-VeBn48kgLp70uydQLSep8dkKSs4_CCzW_Arm5eyw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6528922653412895659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Frederick Gotham [mailto:cauldwell.thomas(a)gmail.com]
> Sent: Friday, December 6, 2019 4:47 AM
> To: tpm2 <tpm2(a)lists.01.org>
> Subject: [tpm2] Generate keypair using OpenSSL, then load into TPM2
> =

> I generate an RSA keypair as follows:
> =

>     openssl genrsa -out private.pem 2048
> =

> Next I want to load this keypair into the TPM2 and make it persistent.
> In future I will use it to verify signatures.
> =

> Looking through the manual for TPM2 tools, I notice three tools in partic=
ular,
> "load", "loadexternal", "import". At first glance it looks like the one I=
 need here is
> "import". So here's what I do:
> =

>     tpm2_createprimary --hierarchy=3Do --hash-algorithm=3Dsha256 --key-
> algorithm=3Drsa --key-context=3Dprimary.ctx
> =

>     tpm2_flushcontext --transient-object
> =

>     tpm2_import -C primary.ctx -G rsa -i private.pem -u key.pub -r key.pr=
iv

Import essentially creates blobs that can be loaded into the tpm (key.pub a=
nd key.priv)
These can be loaded via tpm2_load

tpm2_load -C primary.ctx -u key.pub -r key.priv -c key.ctx


> =

> It works fine up until here. Next I want make it persistent. . . .Oh wait=
 I can't. I
> don't have a context file to feed into "tpm2_evictcontrol". So where do I=
 go from
> here?
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6528922653412895659==--

