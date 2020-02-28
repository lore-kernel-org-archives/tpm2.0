Content-Type: multipart/mixed; boundary="===============9132115704235496587=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How can I get EK certificate?
Date: Fri, 28 Feb 2020 14:53:53 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E96F42@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200227194752.2640.34995@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9132115704235496587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Chenxi Z [mailto:cxzhang1981(a)hotmail.com]
> Sent: Thursday, February 27, 2020 1:48 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: How can I get EK certificate?
> =

> Got the answer. I'm able to get it from NV.

Yep, for pretty much all platforms that's true. Some older intel fTPM's sto=
re the
EK certificate off to a webserver.

The tool:
tpm2_getekcertificate

IIUC, should just go and do the right thing.

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============9132115704235496587==--

