Content-Type: multipart/mixed; boundary="===============8353188551586063157=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] TPM2 TSS Python Bindings: Update, Request for Naming Ideas,
 Further Abstraction?
Date: Wed, 10 Jul 2019 08:05:46 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163AE4592@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 20190709225950.GJ11622@johnsa1-desk.jf.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8353188551586063157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The ESYS spec was written intentionally with bindings OO-languages in mind.
That's why we follow the naming convention of GObject for function names
to begin with. Unfortunately, we had to carry around the context everywhere=
 as
well, but that can be removed.
Thus, I'd vode for "more abstract" with classes.

Regarding tcti: I think it should be sufficient to provide bindings for the=
 tctildr
library. I even wanted to go as far as to included it with names optional p=
arameters
directly into the Esys_Initialize call.

Great to see the work be picked up !

________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Andersen, John [john.=
s.andersen(a)intel.com]
Sent: Wednesday, July 10, 2019 00:59
To: tpm2(a)lists.01.org
Subject: [tpm2] TPM2 TSS Python Bindings: Update, Request for Naming Ideas,=
 Further Abstraction?

TPM2 TSS Python Bindings: Update, Request for Naming Ideas, Further Abstrac=
tion?
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Update
------

We've switched over to using swig (a move that it sounds like @AndreasFuchs=
SIT
and @tstruk had discussed, and @tstruk implemented). We've successfully pac=
kaged
it into a setuptools package which we can upload to PyPi (Pythons package
management system).

TODO's are still the same as they were, packaging was hard. It sounds like =
we'll
be releasing this as a separate repo (tpm2-software/tpm2-pyesys or somethin=
g,
I'd like to get ideas and votes on names (below).

We've re-used the CI setup from the tools repo, aka the docker setup. My pl=
an
now is to start re-writing some of the integration tests that are present i=
n the
TSS repo using the Python bindings.

Since we're releasing this as a separate repo the name has to get cleared b=
y our
legal dept. and we have to go through some other internal processes. So code
might not be in the open for a bit. But I'll keep you all up to date as thi=
ngs
progress.

TODOs
~~~~~
- Add Support for TCTIs (via a libtss2-tcti or libpytpm2tss, depending on
  what comes first)
- Add documentation
- Add more integration and/or unit testing
- Code review

Naming
------

Options so far (please add suggestions if you have any):
- tpm2-pyesys
- pytss_esys
- pytpm2tss

Further Abstraction?
--------------------

We need to decide if we want to provide a straight wrapper or abstract into=
 a
more pythonic interface (similar to what @AndreasFuchsSIT did with his clas=
ses
in PR 1248: https://github.com/tpm2-software/tpm2-tss/blob/1af543f2cc1ba44a=
f66a6279eca5473864e7bfc9/bindings/python/pytpm2tss/__init__.py#L65-L81).

So, should the API be a 1:1 mapping to the ESYS API in TSS or should we pro=
vide
a layer of abstraction above that. We could of course do this after the ini=
tial
release of the Python bindings, but we need to decide if we want to, and th=
en
when we want to time wise. As that will obviously take more time to impleme=
nt,
validate, and agree upon.

Thanks,
John
_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

--===============8353188551586063157==--

