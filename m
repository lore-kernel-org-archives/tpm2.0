Content-Type: multipart/mixed; boundary="===============1999673663306764091=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] TPM2TSS engine for OpenSSL
Date: Tue, 28 Aug 2018 15:45:31 +0100
Message-ID: <e74000a3d7ce0e7c8a81a338ab756eb3c46b6870.camel@linux.intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D010EB433EC@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1999673663306764091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Wed, 2018-06-13 at 10:16 +0000, Fuchs, Andreas wrote:
> Hi all,
> =

> I just wanted to announce that we pushed a new crypto engine for
> OpenSSL using the tpm2-tss software stack.
> It is licensed under the BSD 3-clause license.
> It currently includes RSA sign, RSA decrypt and ECDSA with TPM
> generated keys.
> It uses ESAPI/ESYS (so it's a good usage example) and thus relies on
> the 2.0 series of tpm2-tss.
> I'd like to see some testing and bug reports if you don't mind.

What version of openssl was this developed for/tested against?

On Fedora 28:
$ openssl version
OpenSSL 1.1.0h-fips  27 Mar 2018
$ OPENSSL_ENGINES=3D/usr/local/lib/openssl/engines/ openssl engine -t -c
tpm2tss
140349824665408:error:25066067:DSO support routines:dlfcn_load:could
not load the shared
library:crypto/dso/dso_dlfcn.c:113:filename(/usr/local/lib/openssl/engi
nes/tpm2tss.so): /usr/local/lib/openssl/engines/tpm2tss.so: cannot open
shared object file: No such file or directory
140349824665408:error:25070067:DSO support routines:DSO_load:could not
load the shared library:crypto/dso/dso_lib.c:161:
140349824665408:error:260B6084:engine routines:dynamic_load:dso not
found:crypto/engine/eng_dyn.c:414:
140349824665408:error:2606A074:engine routines:ENGINE_by_id:no such
engine:crypto/engine/eng_list.c:341:id=3Dtpm2tss

I see similar on Ubuntu 18.04.1 LTS:
$ openssl version
OpenSSL 1.1.0g 2 Nov 2017

but on Ubuntu 16.04.5 LTS the engine loads as expected:
$ openssl version
OpenSSL 1.0.2g 1 Mar 2016
$ OPENSSL_ENGINES=3D/usr/local/lib/openssl/engines openssl engine -t
-c tpm2tss
(tpm2tss) TPM2-TSS engine for OpenSSL
 [RSA, RAND]
     [ available ]

Along with fixing the engine to work with newer OpenSSL (it looks like
1.1.1 is in Beta) I think we might want/need to get a lot stricter with
the version specifier in the PKG_CHECK_MODULES call.

Thanks,
Joshua


--===============1999673663306764091==--

