Content-Type: multipart/mixed; boundary="===============8687545798356382204=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Has the take_ownership tool been deprecated in the last
 release of tpm2-tools?
Date: Wed, 29 Apr 2020 21:06:35 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED8A72@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200429205841.2763.64051@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8687545798356382204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The take ownership tool was a combination of tpm2_changeauth and tpm2_clear=
, so you can use those tools
To do it.

The old tools -c would call tpm2_clear using the lockout hierarchy, which i=
s the default for the tool tpm2_clear.
Tpm2_changeauth, you can just pick what hierarchy and the old and new passw=
ords respectively.

Bill


> -----Original Message-----
> From: eduardolfalcao(a)gmail.com [mailto:eduardolfalcao(a)gmail.com]
> Sent: Wednesday, April 29, 2020 3:59 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Has the take_ownership tool been deprecated in the last r=
elease
> of tpm2-tools?
> =

> I know it may be a silly question, but where is the take_ownership utility
> (https://github.com/tpm2-software/tpm2-tools/tree/master/tools)?
> In previous versions of tpm2-tool, the first step to use the TPM was taki=
ng
> ownership.
> Has this process changed? Do I still need to take ownership?
> =

> Best regards.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8687545798356382204==--

