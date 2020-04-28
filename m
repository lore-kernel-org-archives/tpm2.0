Content-Type: multipart/mixed; boundary="===============6774548129456348379=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: PCR pre-calculation
Date: Tue, 28 Apr 2020 14:45:07 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED8577@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0171B40D85@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6774548129456348379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yeah theirs no mac, it's just a straight hash of existing + new, which is e=
xactly what
Andrea's example is.

> -----Original Message-----
> From: Fuchs, Andreas [mailto:andreas.fuchs(a)sit.fraunhofer.de]
> Sent: Tuesday, April 28, 2020 7:31 AM
> To: Michael Walz <m.walz(a)digitalendoscopy.de>; tpm2(a)lists.01.org
> Subject: [tpm2] Re: PCR pre-calculation
> =

> I've used this function in the past:
> =

> pcr_extend() {
>   ( echo -n "$1" | xxd -r -p
>     echo -n "$2" | xxd -r -p
>   ) | sha1sum | cut -d " " -f 1
> }
> =

> PCRVALUE=3D"0000000000000000000000000000000000000000"
> PCRVALUE=3D"$(pcr_extend "$PCRVALUE"
> "86454b08919afa1c912af74dc704b87bc08afe99")"
> =

> Cheers,
> Andreas
> ________________________________________
> From: Michael Walz [m.walz(a)digitalendoscopy.de]
> Sent: Tuesday, April 28, 2020 12:58
> To: tpm2(a)lists.01.org
> Subject: [tpm2] PCR pre-calculation
> =

> Hi there,
> I do not know if this is the right place for this question, so please poi=
nt me in the
> right direction when I am wrong here.
> We are trying to use the TPM2.0 in embedded devices. My job is to write a
> verification suite to test if our scripts and tools are working correctly=
. One point
> here is that I want to check if the resulting PCRs are as expected.
> Microsoft provides a "TPM PCR Calculator" for this purpose. I would need
> something similar for linux command line and I googled a lot, but I did n=
ot find
> something useful. I tried openssl and commands like
> =

> echo -n '86454b08919afa1c912af74dc704b87bc08afe99' | xxd -r -p | openssl =
dgst -
> sha1 -mac hmac -macopt hexkey:0000000000000000000000000000000000000000
> =

> I tested several options and variations, but the results never match the =
PCR
> register I get with tpm2_pcrextend.
> Is there some way to get a pre-calculation for the PCRs?
> =

> Thanks in advance!!
> Michael
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6774548129456348379==--

