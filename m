Content-Type: multipart/mixed; boundary="===============7976143091921221185=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Using ESAPI to verify encrypted session key
Date: Thu, 07 Feb 2019 18:02:31 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CDF47A@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7976143091921221185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

What is the best and simplest way to ensure that the key I started an encry=
pted session with is the key I expect?

Do I need to issue a challenge and response? How would I know if an attacke=
r swapped out the key between the challenge/response
and the startauthsession?

I currently use a primary object at known handle, but perhaps after convert=
ing to an ESYS_TR I can call Esys_TR_GetName() and verify
the name is what I expect?

Bill

--===============7976143091921221185==--

