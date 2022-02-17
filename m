Content-Type: multipart/mixed; boundary="===============0594821766156586505=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Help - how to store a certificate in the NV under the
 platform hierarchy?
Date: Thu, 17 Feb 2022 10:29:03 +0000
Message-ID: <AS8P194MB1669E8D2E9D32D5DBC0268A3A6369@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: 20220217102102.2855.23112@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0594821766156586505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ok, I guess you are using swtpm_bios, right ?

In that case the BIOS behavior is simulated, including setting the PH passw=
ord.

You want to pass -u to swtpm_bios to keep PH open:
https://github.com/stefanberger/swtpm/blob/master/man/man8/swtpm_bios.pod

________________________________________
Von: arlotito(a)microsoft.com <arlotito(a)microsoft.com>
Gesendet: Donnerstag, 17. Februar 2022 11:21
An: tpm2(a)lists.01.org
Betreff: [tpm2] Re: Help - how to store a certificate in the NV under the p=
latform hierarchy?

hmm, interesting...

I tried the same command on a RPI4 with a physical TPM (Infineon SLB9670)..=
. and it worked.

tpm2_nvdefine 0x01C90000 -C p -s 898 -a "ppread|ppwrite|platformcreate"

and this is what I get:
nv-index: 0x1c90000

Maybe, as you commented, it could be a specific issue of the ibm swtpm (v16=
61).

I'll keep on working on both (swtpm and rpi4/slb9670)

Thanks!
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============0594821766156586505==--

