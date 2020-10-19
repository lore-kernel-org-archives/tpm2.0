Content-Type: multipart/mixed; boundary="===============8149669679803010276=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Question: standardized development environment for TPM2
 testing, regressions, etc.
Date: Mon, 19 Oct 2020 14:38:11 +0000
Message-ID: <SN6PR11MB3437885D999C060D9D5E665AB81E0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20201016222948.2619.86448@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8149669679803010276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We have a bunch of docker images that we use for our testing, but they don'=
t use the
In-kernel RM like a QEMU virtualized TPM can do or any kernel provided inte=
rfaces like
sysfs.

Some projects use the SWTPM simulator, others still use the IBM TPM simulat=
or.

It would be nice to add a test to the CI that used the in-kernel RM and sys=
fs interfaces to add some
more test coverage against externally provided pieces.

> -----Original Message-----
> From: matthew(a)giassa.net <matthew(a)giassa.net>
> Sent: Friday, October 16, 2020 5:30 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Question: standardized development environment for TP=
M2
> testing, regressions, etc.
> =

> I guess I should be more specific: I'm writing some test utilities that d=
irectly
> communicate with the TPM2 module, and some other OS-supplied pieces (i.e.
> sysfs), so this would be relevant for "end-to-end" testing s/w apps that =
operate
> similarly. It isn't meant to be any sort of replacement for the existing =
test suite
> and/or unit tests.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8149669679803010276==--

