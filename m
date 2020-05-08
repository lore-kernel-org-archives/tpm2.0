Content-Type: multipart/mixed; boundary="===============7175654700539786692=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How CreateCsr using openssl API flow works ,
 when is passes via tpm2-tss-engine
Date: Fri, 08 May 2020 16:15:15 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDC509@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200508080056.2843.63913@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7175654700539786692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: muthu.smk(a)gmail.com [mailto:muthu.smk(a)gmail.com]
> Sent: Friday, May 8, 2020 3:01 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] How CreateCsr using openssl API flow works , when is pass=
es via
> tpm2-tss-engine
> =

> I have below openssl command with tpmengine which generate csr using the
> private key generated using tpm2tss-genkey.
> =

> /* Generating private using below tpm2tss-genkey API*/ tpm2tss-genkey -a =
rsa -
> s 2048 tpm2tss_rsa_genkey_2048
> /* using below openssl API creating a csr with input key (private key gen=
erated
> by tpm2tss)  , via engine tpm2tss */ openssl req -new -engine tpm2tss -ke=
yform
> engine -out openssl_created_mod_rsa_key.csr -key  tpm2tss_rsa_genkey_2048

Did you load the engine so the API hits the tss engine versus normal openss=
l?
IIRC the last time I saw your code snippets you never loaded the engine.
> =

> While creating the similar application what the above tpm2-genkey creatio=
n and
> openssl does using tpm2/tpm2-tss api , am getting my app crash in below s=
igning
> API . I tried checking the tpm2-tss-engine code which works for openssl to
> perform tpm2 tss task . But i could not able to get any clue regarding wh=
ere this
> "sign" is happening .  Since this "sign" is part of csr generation , am n=
ot sure how
> come the command line above openssl api works . Can any one give me some
> inputs on this .
> =

> X509_REQ_sign ()
> =

> Thanks
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============7175654700539786692==--

