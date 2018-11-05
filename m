Content-Type: multipart/mixed; boundary="===============8997299180427805995=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] what the different between 0x1d5 and 0x3d5
Date: Mon, 05 Nov 2018 15:05:27 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C79556@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CA+tBKVhSh75EO1jwhgVXjPffCEitQ5PX6HCWYrU6feYosPeCdg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8997299180427805995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The difference is in which parameter structure is the wrong size, look at t=
he outputs
and note the difference in the parameter output. 1 vs 3.  =


> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Terry An
> Sent: Wednesday, October 31, 2018 2:15 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] what the different between 0x1d5 and 0x3d5
> =

> [root(a)localhost tpm2-init]# tpm2_rc_decode  0x1d5 tpm:parameter(1):stru=
cture
> is the wrong size [root(a)localhost tpm2-init]# tpm2_rc_decode  0x3d5
> tpm:parameter(3):structure is the wrong size
> =

> I'm so confusing where my code is wrong.

--===============8997299180427805995==--

