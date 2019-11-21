Content-Type: multipart/mixed; boundary="===============1226131224320118627=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Is there a way to get the name for an NV index in
 tpm2_tools?
Date: Thu, 21 Nov 2019 21:57:16 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E460A9@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAOCvsS=BPcOft=GGgtd-goFXEjh-y8s0DTeeCyeRC1_WnTHJBQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1226131224320118627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tpm2_nvreadpublic should do what you want

> -----Original Message-----
> From: Steven Clark [mailto:davolfman(a)gmail.com]
> Sent: Thursday, November 21, 2019 12:48 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Is there a way to get the name for an NV index in tpm2_to=
ols?
> =

> I can't seem to find a way to to get the name for an NV index using any o=
f the
> tpm2_tools, at least in 4.x .  Does one of these commands let me see it t=
he way
> tpm2_readpublic does for persistent objects and context blobs?  Or is the=
re a
> way to get a name out of the initial write to the handle like tpm2_load?
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============1226131224320118627==--

