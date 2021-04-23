Content-Type: multipart/mixed; boundary="===============8301325716935168827=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: How to use tpm2 tool to unload an external key
Date: Fri, 23 Apr 2021 08:00:20 +0000
Message-ID: <AM8P194MB1675FD3B89F235D920106D6BA6459@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: 20210422181309.2814.98834@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8301325716935168827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You are probably going through a resource manager and that removes transien=
t handles when a program (such as tpm2_loadexternal) exits.
That also makes sense and is the default way of doing things.
For subseuent usage of the loaded key you will be using eckey.ctx anyways.

________________________________________
Von: Chenxi Z <cxzhang1981(a)hotmail.com>
Gesendet: Donnerstag, 22. April 2021 20:13
An: tpm2(a)lists.01.org
Betreff: [tpm2] Re: How to use tpm2 tool to unload an external key

Thank you, Andreas,

Would you know what command is used to list all objects currently loaded in=
to the TPM?
"tpm2_getcap handles-transient" doesn't work.

Steps:
openssl ecparam -genkey -name prime256v1 -noout -out ec256-key-pair.pem
tpm2_loadexternal -C n -G ecc -r ec256-key-pair.pem -c eckey.ctx
tpm2_getcap handles-transient ----> return nonthing.
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8301325716935168827==--

