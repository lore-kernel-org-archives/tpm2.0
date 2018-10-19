Content-Type: multipart/mixed; boundary="===============0231380681274393036=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] There is no '-I' option for tpm2_rsaencrypt which I found
 it in the doc.
Date: Fri, 19 Oct 2018 10:26:59 +0100
Message-ID: <ab7fcef99b2ee1c77d8b0d0a7a3da2fcaa43bf44.camel@linux.intel.com>
In-Reply-To: CA+tBKViQvj4SfavhkL6z=GQnkWkcB7SNEgNzWSQFsZcvkLgUeQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0231380681274393036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Which version of the tools are you using and where are you reading that
in the documentation?

In 3.0 (released 2017-12-08) the -l option to tpm2_rsaencrypt was
removed. The tool now expects an argument of the filename to encrypt or
instead otherwise defaults to stdin.

We probably have to fix the docs for the version you're using.

Thanks,
Joshua

On Fri, 2018-10-19 at 16:36 +0800, Terry An wrote:
> [root(a)localhost Test]# tpm2_rsaencrypt -I data.in -c obj.ctx  -o
> data.encrypted =

> tpm2_rsaencrypt: invalid option -- 'I'
> [root(a)localhost Test]#
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2


--===============0231380681274393036==--

