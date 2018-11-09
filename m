Content-Type: multipart/mixed; boundary="===============0799731096908506325=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-tools who uses transient handles in workflows?
Date: Fri, 09 Nov 2018 15:40:39 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C8AE73@ORSMSX106.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0799731096908506325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We're working on porting the tpm2-tools to use ESAPI so can we provide bett=
er session support and drive down session
related bugs.

With that said, ESAPI doesn't support using transient object handles. Inter=
nally the library keeps track of ESYS_TR handles,
Which are handles on steroids (meta data). Because there is no way to extra=
ct the transient object handle, as ESAPI considers
That an implementation detail that shouldn't be exposed to regular users, w=
e can (in order of sanity with 1 being most sane):

1. Require save/load context
2. Try and change ESAPI to expose this
   a. uses a serialized in memory ESYS_TR and find the handle via offset (s=
ic)
3. serialize ESYS handles to disk
4. serialize ESYS handles and base64 output to stdout

I'm leaning towards 1, it would require additional TPM commands, but it wor=
ks in RM and non-RM environments which
I think means fielding less questions about where did my object go on exit =
when it said it was handle XXX.  However,
That breaks a possible workflow, and we want to get 4.0 release right, so w=
e can stop with backwards incompatible
changes.

Thoughts, opinions?

Bill

--===============0799731096908506325==--

