Content-Type: multipart/mixed; boundary="===============5761909243025004244=="
MIME-Version: 1.0
From: Tricca, Philip B <philip.b.tricca at intel.com>
Subject: Re: [tpm2] Chasing Down a Session Problem
Date: Mon, 06 May 2019 15:16:26 +0000
Message-ID: <DB638850A6A2434A93ECADDA0BC838909CE50B7F@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649D305FF@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5761909243025004244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm willing to bet the cause is your #1 from the list below. Will take a lo=
ok today.

-----Original Message-----
From: Roberts, William C =

Sent: 3 May, 2019 18:34
To: Tricca, Philip B <philip.b.tricca(a)intel.com>; andreas.fuchs(a)sit.fra=
unhofer.de; Desai, Imran <imran.desai(a)intel.com>; tpm2(a)lists.01.org
Subject: Chasing Down a Session Problem

So I am dealing with a problem using sessions between tools, and the reason=
 master is working looks like a bug in the tools.
This is what I am trying to do, with tools + esapi + abrmd and it's not wor=
king out.

tpm2_startauthsession --policy-session -S session.ctx tpm2_policypassword -=
S session.ctx -o policy.dat #invoke a policy password event tpm2_encryptdec=
rypt  -c key.ctx -i enc.txt -o dec.txt -D -p session:session.ctx+testpswd <=
-- fails on ContextSave with the abrmd saying no object loaded

This string:
session:session.ctx+testpswd

turns into tools calling context load on the session.ctx and then using the=
 testpswd in the auth area for the session data. I verified that getting th=
e attributes from ESAPI does indeed have the continue session flag set.
The exact error is:
Eys_ContextSave(0x910) - tpm:warn(2.0): the 1st handle in the handle area r=
eferences a transient object or session that is not loaded

On master, this works because of a bug Josh introduced where if there's a p=
assword, just use the password session for encryptdecrypt command, when I t=
hink it should have been using the restored session handle.

I'm trying to understand why the object is no longer loaded when I call con=
textsave:
1. abrmd issue?
2. continuesession esapi issue?
3. my understanding of how continue session works, is the session dead afte=
r the call to encryptdecrypt?

Attached you'll find the abrmd logs.

You can find my branch here: https://github.com/williamcroberts/tpm2.0-tool=
s/tree/session-as-password-arg

You can replicate it with:
make -j4 check TESTS=3D'test/integration/tests/tcti/abrmd/policypassword.sh'

Bill

--===============5761909243025004244==--

