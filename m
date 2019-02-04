Content-Type: multipart/mixed; boundary="===============7718660289394937384=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2-abrmd in a container
Date: Mon, 04 Feb 2019 16:11:32 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CDE780@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAKrSGQQj4SSifdM78ELkw0LtoZbE1MEJ888EC0Ld_xK7D9gdjw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7718660289394937384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I run it in our CI system which is using a docker container, not sure if th=
at helps
But you can look at our scripts for it.

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Luke Hinds
> Sent: Monday, February 4, 2019 7:47 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2-abrmd in a container
> =

> Hello,
> =

> I have been working on trying to get tpm2-abrmd running in a container, b=
ut its
> proving problematic as there is a requirement on system-d and dbus. This =
in turn
> requires running the container as privileged and mounting the hosts cgrou=
p (and
> adding cap sys-admin).
> =

> My reason for using a container, is for CI / functional testing of a proj=
ect that will
> use abrmd and having a lightweight means to test against the resource man=
ager
> running in a container.
> =

> I am still early in looking at ways to achieve this, so I wanted to ask i=
f any others
> have snippets of previous attempts (successful or not) they could share?
> =

> Thanks,
> =

> Luke

--===============7718660289394937384==--

