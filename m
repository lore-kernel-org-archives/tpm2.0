Content-Type: multipart/mixed; boundary="===============9202118384706625741=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] TPM2TSS engine for OpenSSL
Date: Tue, 28 Aug 2018 16:30:09 +0100
Message-ID: <830ea19fdb26bb76cc12f8ff585baafb1dffb9fb.camel@linux.intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D014263A805@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9202118384706625741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-08-28 at 14:58 +0000, Fuchs, Andreas wrote:
> Hi Joshua,
> =

> the engine is tested against openssl 1.0.2 and 1.1.0 using travis ci,
> see =

> https://github.com/tpm2-software/tpm2-tss-engine/blob/master/.travis.yml
> =

> The fedora-info looks strange, since is says "No such file or
> directory".
> Could you check that  /usr/local/lib/openssl/engines/tpm2tss.so
> actually exists ?

It doesn't, I do have libtpm2tss.so (same on my Ubuntu 16.04.5 VM
though).
However, if I link the libtpm2tss.so -> tpm2tss.so the engine is picked
up:
$ sudo ln -s /usr/local/lib/openssl/engines/libtpm2tss.so
/usr/local/lib/openssl/engines/tpm2tss.so
$ OPENSSL_ENGINES=3D/usr/local/lib/openssl/engines openssl engine -t -c
tpm2tss
(tpm2tss) TPM2-TSS engine for OpenSSL
 [RSA, RAND]
     [ available ]

or indeed if I use libtpm2tss as the engine name:

$ OPENSSL_ENGINES=3D/usr/local/lib/openssl/engines openssl engine -t -c
libtpm2tss
(libtpm2tss) TPM2-TSS engine for OpenSSL
Loaded: (tpm2tss) TPM2-TSS engine for OpenSSL
 [RSA, RAND]
     [ available ]

Thanks,

Joshua


--===============9202118384706625741==--

