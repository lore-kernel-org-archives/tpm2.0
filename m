Content-Type: multipart/mixed; boundary="===============8053350498573270331=="
MIME-Version: 1.0
From: Alexander Steffen <Alexander.Steffen at infineon.com>
Subject: Re: [tpm2] TPM2 TSS Python Bindings: Update, Request for Naming Ideas,
 Further Abstraction?
Date: Mon, 15 Jul 2019 18:28:30 +0200
Message-ID: <85f9fde9-da0b-4869-c336-4f9d44a59772@infineon.com>
In-Reply-To: 20190709225950.GJ11622@johnsa1-desk.jf.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8053350498573270331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10.07.2019 00:59, Andersen, John wrote:
> Update
> ------
> =

> We've switched over to using swig (a move that it sounds like @AndreasFuc=
hsSIT
> and @tstruk had discussed, and @tstruk implemented).

Was there a specific reason to choose SWIG over any of the other ways to =

plug C libraries into Python? Nowdays, I'd say the gold standard for =

that is CFFI (https://cffi.readthedocs.io/), not only because it is easy =

to use for Python/C developers, but also because it avoids the CPython C =

API (https://docs.python.org/3/extending/extending.html), thus giving =

better compatibility and excellent performance on alternative =

interpreters, such as PyPy.

> Naming
> ------
> =

> Options so far (please add suggestions if you have any):
> - tpm2-pyesys
> - pytss_esys
> - pytpm2tss

Out of these options, I'd choose pytpm2tss. Or perhaps the even more =

generic pytpm2. As a developer, I don't care whether my library =

internally uses the SAPI, ESAPI or FAPI. I simply want it to "do stuff =

with the TPM", which is just what the name reflects. Also, this allows =

to write nice code like "import pytpm2; pytpm2.do_stuff()". (You cannot =

do that with tpm2-pyesys because of the "-". pytss_esys would work, but =

is longer and consists almost entirely of acronyms that nobody not =

intimately familiar with the TPM ecosystem knows.)

Alexander

--===============8053350498573270331==--

