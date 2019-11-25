Content-Type: multipart/mixed; boundary="===============5152919832036473274=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Is there a way to get the name for an NV index in
 tpm2_tools?
Date: Mon, 25 Nov 2019 23:02:19 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E47F20@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAOCvsSnNPp+urWGiHT94d8tMT3nV7CB=1r1rhy7-noV82gU9Hw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5152919832036473274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Steven Clark [mailto:davolfman(a)gmail.com]
> Sent: Monday, November 25, 2019 10:56 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Is there a way to get the name for an NV index in
> tpm2_tools?
> =

> 4.0.0 and 4.1.0rc1 when I've chosen to install it for testing.  So no -c =
option in

That went away in 4.0 and is now just an argument to tpm2_getcap. So just r=
emove -c and it should work.

> getcap anymore.  Besides, I'm looking for the name of an NV index not a k=
ey or
> sealed "keyed hash", so there's no context blob.

Ahh ok, nv index. Currently not output, but that=E2=80=99s an easy fix.


--===============5152919832036473274==--

