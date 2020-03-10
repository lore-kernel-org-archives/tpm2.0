Content-Type: multipart/mixed; boundary="===============0437485320085702245=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Tue, 10 Mar 2020 22:36:14 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E99573@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAP3jAwRj7s6wut+CsO8kSoN+OsxF9Lys8wdfL6fRr29n0fe2yA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0437485320085702245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The error codes encode a bunch of values, so you won't see that value via a=
 straight grep.

But you can use tpm2_rc_decode from the tpm2-tools project, like so:
$ tpm2_rc_decode 0x2c4
tpm:parameter(2):value is out of range or is not correct for the contex

See the tools project:
https://github.com/tpm2-software/tpm2-tools

Note that the commands specification will show you what parameter 2 is:
https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-3-Com=
mands-01.38.pdf

Everything after the triple line starts the parameters starting at index 1.
So in this case the secret parameter is wrong.

Note that since TSS version 2.3.0 a software library was also added
for converting these return codes to more human understandable strings,
The header file is here:
https://github.com/tpm2-software/tpm2-tss/blob/master/include/tss2/tss2_rc.h

and then you just link against lib tss2-rc, just in case you needed this bu=
ilt into
your program.

Bill

> -----Original Message-----
> From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> Sent: Tuesday, March 10, 2020 5:02 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] ESys_ActivateCredential
> =

> =

> Hi All,
> What does it mean when Esys_ActivateCredential returns 0x2c4? I don't see=
 this
> error defined anywhere.
> =

> Thanks,
> Rahul

--===============0437485320085702245==--

