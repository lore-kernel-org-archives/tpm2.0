Content-Type: multipart/mixed; boundary="===============7291515857684944794=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How CreateCsr using openssl API flow works ,
 when is passes via tpm2-tss-engine
Date: Fri, 08 May 2020 19:24:17 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDC621@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANGCWd2g1aL2KD7YAcC6OyqoSQ=KtLFfT5P-NQqNsqx8F2_chw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7291515857684944794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ahh yeah that bug... Glad you guys figured it out

> -----Original Message-----
> From: Muthukumar S [mailto:muthu.smk(a)gmail.com]
> Sent: Friday, May 8, 2020 2:18 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] How CreateCsr using openssl API flow works , when is =
passes
> via tpm2-tss-engine
> =

> Hi Robets,
> =

> After applying the below patch its working fine https://github.com/tpm2-
> software/tpm2-abrmd/commit/d3f699d828616280c1245ced1ab6a43baca6e63f
> =

> It was unfortunate that we are working in older version of tpm2-abrmd.. H=
ope
> the latest build will already have this fix. Once again thanks for your s=
upport.
> =

> BR,
> Muthukumar
> =

> On Fri, May 8, 2020 at 11:44 PM Muthukumar S <muthu.smk(a)gmail.com
> <mailto:muthu.smk(a)gmail.com> > wrote:
> =

> =

> 	Hi Roberts,
> 	Yes , I have loaded the engine.
> =

> 	I have doubt that the issue might be due to abrmd resource management
> ? on reinitialize TCTI device (ref: shared below links)
> 	Scenario : I am doing two operation in single application tpm2tss-rsa-
> genkey   and then creatingCsr() . Here tpm2tss-rsa-genkey is working fine=
 , then
> am covering the genkey to EVP_PKEY
> 	and giving it to createcsr. Even inside createcsr app getting crash  when
> the sign API is get called.
> =

> 	Look in to how to reinitialize TCTI device
> =

> =

> 	https://github.com/tpm2-software/tpm2-tss/issues/1395
> =

> 	https://github.com/tpm2-software/tpm2-tss/issues/1499
> =

> 	"Device or resource busy" usually means that some other process has it
> open.
> 	try lsof | grep tpm to catch the sneaky program.
> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> 	On Fri, May 8, 2020, 9:45 PM Roberts, William C
> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>  wr=
ote:
> =

> =

> =

> =

> 		> -----Original Message-----
> 		> From: muthu.smk(a)gmail.com
> <mailto:muthu.smk(a)gmail.com>  [mailto:muthu.smk(a)gmail.com
> <mailto:muthu.smk(a)gmail.com> ]
> 		> Sent: Friday, May 8, 2020 3:01 AM
> 		> To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 		> Subject: [tpm2] How CreateCsr using openssl API flow works ,
> when is passes via
> 		> tpm2-tss-engine
> 		>
> 		> I have below openssl command with tpmengine which
> generate csr using the
> 		> private key generated using tpm2tss-genkey.
> 		>
> 		> /* Generating private using below tpm2tss-genkey API*/
> tpm2tss-genkey -a rsa -
> 		> s 2048 tpm2tss_rsa_genkey_2048
> 		> /* using below openssl API creating a csr with input key (private
> key generated
> 		> by tpm2tss)  , via engine tpm2tss */ openssl req -new -engine
> tpm2tss -keyform
> 		> engine -out openssl_created_mod_rsa_key.csr -key
> tpm2tss_rsa_genkey_2048
> =

> 		Did you load the engine so the API hits the tss engine versus
> normal openssl?
> 		IIRC the last time I saw your code snippets you never loaded the
> engine.
> 		>
> 		> While creating the similar application what the above tpm2-
> genkey creation and
> 		> openssl does using tpm2/tpm2-tss api , am getting my app crash
> in below signing
> 		> API . I tried checking the tpm2-tss-engine code which works for
> openssl to
> 		> perform tpm2 tss task . But i could not able to get any clue
> regarding where this
> 		> "sign" is happening .  Since this "sign" is part of csr generation ,
> am not sure how
> 		> come the command line above openssl api works . Can any one
> give me some
> 		> inputs on this .
> 		>
> 		> X509_REQ_sign ()
> 		>
> 		> Thanks
> 		> _______________________________________________
> 		> tpm2 mailing list -- tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 		> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> <mailto:tpm2-leave(a)lists.01.org>
> 		> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =



--===============7291515857684944794==--

