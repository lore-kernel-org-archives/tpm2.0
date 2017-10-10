Content-Type: multipart/mixed; boundary="===============0217223106670699177=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.us>
Subject: Re: [tpm2] no files in test/tpmclient/good
Date: Tue, 10 Oct 2017 10:34:06 -0700
Message-ID: <1507656846.22198.6.camel@twobit.us>
In-Reply-To: CAK5YYfg3MdTmh-58zdpCRp1rJnB7oM4eMFocnMAuH3K+BR8xRA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0217223106670699177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, 2017-10-10 at 16:37 +0200, Jan Schimmack wrote:
> after the compilation of the tpm2.0-tss on linux, I had to do an
> additional
> =

> make test/tpmclient/tpmclient.int

This is expected behavior. The build system will only build test cases:
1) when you attempt to run the test harness (make check)
2) you explicitly build the test case (make path/to/test/exec)

> Then I started the tpmclient with
> =

> ./test/tpmclient/tpmclient.int
> =

> and most of the testcases passed. Anyways, i would like to know, how
> to produce output on =

> =

> test\tpmclient\good

I don't understand what your question is. The directory you reference
was full of "known good" output from test runs. However they were
generated years ago and were no longer accurate / being maintaned.

Can you clarify your question?

Thanks,
Philip

--===============0217223106670699177==--

