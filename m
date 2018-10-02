Content-Type: multipart/mixed; boundary="===============5712494144427283125=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Tue, 02 Oct 2018 16:20:36 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0142675F83@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 6c6befe2ac9f9966b6a2ffb84b2fd0ae1c229b1a.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5712494144427283125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

unfortuantely, the engines are diferent as much as their license and underl=
ying TSSes.
tpm2-tss (which is TCG spec conformant) and IBM's proprietary OpenSource TS=
S.

The tpm2-tss-engine is newer and BSD-license, whilst James's is (L?)GPL.
Thus, we could not just take his and add a second underlying TSS but had to
implement a completely new one to get rid of the license terms.
So we had to come up with our own storage format.
I also cannot look at James's codebase to not become tainted with GPL copyl=
eft.

That's why we chose a different engine name and made sure to label PEM diff=
erently,
so we don't get compatibility messes.

If you'd like to propose a different storage format for tpm2-tss-engine, pl=
ease
provide me with a format. Maybe we can fit it into the first 0.1 release.
(but that would have to happen VERY quickly, i.e. the next 2 weeks).

Cheers,
Andreas
________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of David Woodhouse [dwmw=
2(a)infradead.org]
Sent: Monday, October 01, 2018 22:10
To: tpm2(a)lists.01.org; James Bottomley; Nikos Mavrogiannopoulos
Subject: [tpm2] Conflicting TPM2 engines and storage formats

I'd like to add TPMv2 support to the OpenConnect VPN client. It's had
TPMv1.2 support since 2008, and I'm a bit late to the party with TPMv2.

For the OpenSSL build, it was trivial to support James's engine at
https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl_tpm2_engine.gi=
t/

That was as simple as this:
http://git.infradead.org/users/dwmw2/openconnect.git/commitdiff/7edab6c6c

However, I've now discovered there's another, incompatible TPM2 engine
at https://github.com/tpm2-software/tpm2-tss-engine

Not only does the engine name seem to be different, but the label of
the PEM file ('BEGIN TSS2 KEY BLOB') is different. And possibly the
ASN.1 therein? Neither seem to have a definition outside the source
code, as far as I can tell.

I was actually looking for some code I could re-use to implement the
support in the GnuTLS build, much as I did the TPMv1.2 version=C2=B9 some
time ago. I'd settle for getting some consensus on what a wrapped key
actually looks like on the disk first, though....

--
dwmw2


=C2=B9 http://git.infradead.org/users/dwmw2/openconnect.git/blob/HEAD:/gnut=
ls_tpm.c


--===============5712494144427283125==--

