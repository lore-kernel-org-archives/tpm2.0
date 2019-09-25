Content-Type: multipart/mixed; boundary="===============7999827948739871707=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] How to generate the statically linked executable
Date: Wed, 25 Sep 2019 13:55:52 -0700
Message-ID: <7a67cb43-69cb-785c-259c-7d908a0d773e@intel.com>
In-Reply-To: CAAG8Em0RUDcgh+dqexdrFY2KHJo95OQOpEnVj7anSSVrVTePRQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7999827948739871707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/24/19 1:50 AM, ZhengYu Tsai wrote:

> /usr/bin/ld: attempted static link of dynamic object `/usr/lib/i386-linux=
-gnu/libcurl-gnutls.so'
> collect2: error: ld returned 1 exit status
> Makefile:2170: recipe for target 'tools/tpm2_getekcertificate' failed
> make: *** [tools/tpm2_getekcertificate] Error 1
> =

>   *
> =

>     Steps to Reproduce
>     // install tpm2-tss
>     ./configure "CFLAGS=3D--static" --enable-shared=3Dno
>     make
>     sudo make install
>     // Install tpm2-tools
>     ./configure "CFLAGS=3D--static" --enable-shared=3Dno --disable-harden=
ing

Don't you need to set LDFLAGS instead of CFLAGS:

./configure "LDFLAGS=3D--static" --disable-shared

Thanks,
-- =

Tadeusz

--===============7999827948739871707==--

