Content-Type: multipart/mixed; boundary="===============1046892380512917079=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] using existing key with tpm2-tss-engine
Date: Wed, 13 Mar 2019 13:41:05 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D0CA6B@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 7fd64c56-bcc5-4e64-8a76-c0fbab20d766@email.android.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1046892380512917079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I guess I could just use openssl-to-pkcs11 engine and load up my pkcs11 mod=
ule...

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2(a)infradead.org]
> Sent: Thursday, March 7, 2019 10:57 AM
> To: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
> Cc: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] using existing key with tpm2-tss-engine
> =

> The other workaround is to import with James Bottomley's
> openssl_tpm2_engine and then use it with tpm2-tss-engine.
> =

> --
> dwmw2
> =

> On 7 Mar 2019 18:31, "Fuchs, Andreas" <andreas.fuchs(a)sit.fraunhofer.de>
> wrote:
> =

> =

> 	Yes, X509 certificate creation works.
> =

> 	"Importing an existing key" however is in the backlog:
> 	https://github.com/tpm2-software/tpm2-tss-engine/issues/39
> =

> 	Workaround for the moment could be to temporarily evictControl the
> key to persistent.
> =

> 	Otherwise sorry to keep you waiting for the moment.
> 	________________________________________
> 	From: Roberts, William C [william.c.roberts(a)intel.com]
> 	Sent: Thursday, March 07, 2019 19:26
> 	To: tpm2(a)lists.01.org
> 	Cc: Fuchs, Andreas
> 	Subject: using existing key with tpm2-tss-engine
> =

> 	Is there a way to use an existing key with the engine? Ie existing key to
> pem file?
> =

> 	I am not seeing a mechanism for this.
> =

> 	My use case:
> 	I need to solve issue:
> 	https://github.com/tpm2-software/tpm2-pkcs11/issues/16
> =

> 	So I can store the X509 certificate for a key in the attributes.
> =

> 	Looks like cert creation is tested a bit in:
> 	test/sserver.sh
> =

> =

> 	Bill
> 	_______________________________________________
> 	tpm2 mailing list
> 	tpm2(a)lists.01.org
> 	https://lists.01.org/mailman/listinfo/tpm2
> =

> =



--===============1046892380512917079==--

