Content-Type: multipart/mixed; boundary="===============7824488667455162079=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2-tss-engine key compatibility with tpm2-pkcs11
Date: Wed, 17 Oct 2018 15:51:46 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C5F392@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 40635db71b83a19181c24366517c84ddd59d7a90.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7824488667455162079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2(a)infradead.org]
> Sent: Tuesday, October 16, 2018 3:19 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg; Fuchs,
> Andreas <andreas.fuchs(a)sit.fraunhofer.de>
> Subject: Re: [tpm2] tpm2-tss-engine key compatibility with tpm2-pkcs11
> =

> On Tue, 2018-10-16 at 21:22 +0000, Roberts, William C wrote:
> > Use case:
> > Create a certificate or CSR with tpm2-tss-engine for adding a
> > certificate to the PKCS11 engine.
> =

> I don't quite understand this. If you have the key in the PKCS#11 token
> and you want to generate a CSR, why wouldn't you just use that with the
> OpenSSL PKCS#11 engine? e.g.
> =

> $ openssl req -engine pkcs11 -keyform engine -key 'pkcs11:token=3Dlabel;i=
d=3D%01'

Oh duh, I forgot about that engine.

+ Jay who was working on stuff.

FYI for others.
The engine is in P11 now:
https://github.com/OpenSC/libp11

The engine is in this Ubuntu package:
apt-file search libpkcs11.so
libengine-pkcs11-openssl: /usr/lib/ssl/engines/libpkcs11.so

> =

> Or with GnuTLS instead perhaps, since it has built-in PKCS#11 support
> and you don't have to muck around with those horrid OpenSSL engines at
> all :)
> =

> $ certtool --generate-request --load-privkey 'pkcs11:token=3Dlabel;id=3D%=
01'
> =

> =

> But hey, it would be great for these things to be interoperable, and
> for it to be possible to export a key from your PKCS#11 provider to the
> PEM format so that it can be used with the engine =E2=80=94 or perhaps mo=
re
> usefully, import a PEM key created with the engine into the PKCS#11
> token. Don't let me dissuade you from doing that!
> =

> For reading/writing the PEM files you can look at tpm2tss_data_write()
> and tpm2tss_data_read() in tpm2-tss-engine-common.c:
> https://github.com/tpm2-software/tpm2-tss-engine/blob/master/src/tpm2-tss-
> engine-common.c
> =

> =



--===============7824488667455162079==--

