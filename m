Content-Type: multipart/mixed; boundary="===============6954967589376391125=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Help - how to store a certificate in the NV under the
 platform hierarchy?
Date: Thu, 17 Feb 2022 09:56:55 +0000
Message-ID: <AS8P194MB16695DD6F13FF9E755239817A6369@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: 20220217095246.2855.6509@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6954967589376391125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If you use a TPM simulator (e.g. swtpm) you can interact with it, as it has=
 an empty PH password on start.

________________________________________
Von: arlotito(a)microsoft.com <arlotito(a)microsoft.com>
Gesendet: Donnerstag, 17. Februar 2022 10:52
An: tpm2(a)lists.01.org
Betreff: [tpm2] Re: Help - how to store a certificate in the NV under the p=
latform hierarchy?

Got it, thanks!

Is there a way/tool to simulate what the OEM would do from the BIOS context=
 to eventually store that certificate in the PH? (I'm building a PoC, and I=
 need a TPM provisioned with that certificate in the PH)
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6954967589376391125==--

