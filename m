Content-Type: multipart/mixed; boundary="===============3170071854516121431=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] bootstrap error on CentOS7
Date: Tue, 23 Oct 2018 08:23:27 -0700
Message-ID: <20181023152327.c7nyzqb5d7rwa5gh@jake>
In-Reply-To: CA+tBKVh3O7FRpY8_96YDSOKsFzQoegTMvh0ckWVHCd9+ypw-fw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3170071854516121431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Terry An,

On Tue, Oct 23, 2018 at 03:51:08PM +0800, Terry An wrote:
> I have cloned the latest code of kms-tools from github, and I need to test
> the command 'tpm2-import'
> but the master branch doesn't have "configure" command, and "bootstrap"
> return error
> =

> [root(a)localhost tpm2-tools]# ./bootstrap
> Generating file lists: src_vars.mk
> libtoolize: putting auxiliary files in `.'.
> libtoolize: linking file `./ltmain.sh'
> libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
> libtoolize: linking file `m4/libtool.m4'
> libtoolize: linking file `m4/ltoptions.m4'
> libtoolize: linking file `m4/ltsugar.m4'
> libtoolize: linking file `m4/ltversion.m4'
> libtoolize: linking file `m4/lt~obsolete.m4'
> configure.ac:65: error: possibly undefined macro: AC_MSG_ERROR
>       If this token and others are legitimate, please use m4_pattern_allo=
w.
>       See the Autoconf documentation.
> autoreconf: /usr/bin/autoconf failed with exit status: 1
> [root(a)localhost tpm2-tools]# rpm -q libtool pkgconfig autoconf automake=
 m4
> libtool-2.4.2-22.el7_3.x86_64
> pkgconfig-0.27.1-4.el7.x86_64
> autoconf-2.69-11.el7.noarch
> automake-1.13.4-3.el7.noarch
> m4-1.4.16-10.el7.x86_64

This question has been asked and answered several times in our public
bug tracker:

https://github.com/tpm2-software/tpm2-tss/issues/55
https://github.com/tpm2-software/tpm2-tss/issues/185
https://github.com/tpm2-software/tpm2-tss/issues/227
https://github.com/tpm2-software/tpm2-tss/issues/259
https://github.com/tpm2-software/tpm2-tss/issues/1110

If the solutions from these threads doesn't work for you please provide
additional detail.

Philip

--===============3170071854516121431==--

