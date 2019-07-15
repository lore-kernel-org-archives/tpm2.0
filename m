Content-Type: multipart/mixed; boundary="===============8488592508107625007=="
MIME-Version: 1.0
From: Alexander Steffen <Alexander.Steffen at infineon.com>
Subject: Re: [tpm2] TPM2 TSS Python Bindings: Update, Request for Naming Ideas,
 Further Abstraction?
Date: Mon, 15 Jul 2019 18:30:27 +0200
Message-ID: <eb65161c-1002-51cf-4900-9a7e4dde23b9@infineon.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0163AE4592@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8488592508107625007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10.07.2019 10:05, Fuchs, Andreas wrote:
> The ESYS spec was written intentionally with bindings OO-languages in min=
d.
> That's why we follow the naming convention of GObject for function names
> to begin with. Unfortunately, we had to carry around the context everywhe=
re as
> well, but that can be removed.
> Thus, I'd vode for "more abstract" with classes.

Yes, please. As a Python developer, you usually do not want to deal with =

all the complexity of a C API, when you are used to much nicer interfaces :)

Alexander

--===============8488592508107625007==--

