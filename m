Content-Type: multipart/mixed; boundary="===============4684224224061181832=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Dropping Openssl < 1.1 support
Date: Fri, 03 Jan 2020 09:37:44 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163C421FC@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E6327F@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4684224224061181832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Also, Debian Jessie comes with OpenSSL 1.0.x until 2020-06 and Ubuntu 16.04=
 until 2021-06.
End of Life for Ubuntu 16.04 is 2024, but I think End of Support would be e=
arly eanough.

As much as I like kicking OSSL < 1.1, IMHO Ubuntu 16.04 is the big obstacle=
, since it's used Quite a lot.

my 2 cents,
Andreas

________________________________________
From: Roberts, William C [william.c.roberts(a)intel.com]
Sent: Thursday, January 02, 2020 18:39
To: tpm2(a)lists.01.org
Subject: [tpm2] Dropping Openssl < 1.1 support

Now that the new year is upon us, we should consider dropping OSSL < 1.1 su=
pport since it's no longer supported. I'm proposing on everyone's mainline,=
 we drop
That support and the next major feature bump release contains this change. =
Any objections?

Bill
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============4684224224061181832==--

