Content-Type: multipart/mixed; boundary="===============5702319259222879678=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] How to generate the statically linked executable
Date: Thu, 26 Sep 2019 09:44:33 -0700
Message-ID: <6901331d-e7cf-6922-381d-787a7fd83358@intel.com>
In-Reply-To: CAAG8Em3Y1OajU5gDiYZSn6vnVs=WLPCHX0naNyeuEj7LSqpPOw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5702319259222879678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/25/19 6:40 PM, ZhengYu Tsai wrote:
> /usr/local/lib/libtss2-esys.a(src_tss2_esys_libtss2_esys_la-tctildr-dl.o)=
: In function `handle_from_name':
> /home/derek/workdir/tpm2-tss/src/tss2-tcti/tctildr-dl.c:84: warning: Usin=
g 'dlopen' in statically linked applications requires at runtime the shared=
 libraries from the glibc version used for linking
> /usr/bin/ld: attempted static link of dynamic object `/usr/lib/i386-linux=
-gnu/libcurl-gnutls.so'
> collect2: error: ld returned 1 exit status
> Makefile:2170: recipe for target 'tools/tpm2_getekcertificate' failed
> make: *** [tools/tpm2_getekcertificate] Error 1
> =

> I also found the tpm2-tss configure=C2=A0*--enable-shared=3Dno,*
> This option is necessary, it will affect the compilation tpm2-tools.

Right, you also need to use --enable_nodl configure option when you build t=
ss.

-- =

Tadeusz

--===============5702319259222879678==--

