Content-Type: multipart/mixed; boundary="===============5815995287613945479=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: RSA encryption - tpm2_getpubak
Date: Fri, 29 Nov 2019 14:50:36 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E4883F@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CALtZhhO9YKA9aivBrZAdHeZSwot8HQa-knVT4C1a1+jxAeHusw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5815995287613945479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Frederick Gotham [mailto:cauldwell.thomas(a)gmail.com]
> Sent: Friday, November 29, 2019 7:12 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] RSA encryption - tpm2_getpubak
> =

> I'm using the latest version of 'tmp2-tools' and I'm trying to follow an =
example I
> found online of doing RSA encryption/decryption inside the TPM2 chip.
> =

> The example uses "tpm2_getpubek" and "tpm2_getpubak".
> =

> As these tools no longer exist, what has replaced them?

tpm2_createek
tpm2_createak


> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============5815995287613945479==--

