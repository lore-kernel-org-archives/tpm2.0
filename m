Content-Type: multipart/mixed; boundary="===============0296821798016593039=="
MIME-Version: 1.0
From: Andersen, John <john.s.andersen at intel.com>
Subject: [tpm2] TPM2 TSS Python Bindings: Update, Request for Naming Ideas,
 Further Abstraction?
Date: Tue, 09 Jul 2019 15:59:50 -0700
Message-ID: <20190709225950.GJ11622@johnsa1-desk.jf.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0296821798016593039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

--===============0296821798016593039==--

