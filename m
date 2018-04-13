Content-Type: multipart/mixed; boundary="===============1490564216604718852=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpmtest
Date: Fri, 13 Apr 2018 17:01:04 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FF20B9E@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 201942FCAB84C34C9D845866BDB9256806D9498D@PGSMSX101.gar.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1490564216604718852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Al Munyandy,
> MunessparanX
> Sent: Thursday, April 12, 2018 12:25 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpmtest
> =

> Hi,
> =

> =

> =

> I'm installed tpm2-tools-3.0.2 and looking for tpmtest file to run selfte=
st. But I
> couldn't find it. I would like to know if this function been removed or r=
eplaced
> with other method. Please advise me.

It's under test/system and is called test.sh

cd test/system
./test.sh

It assumes that:
1. You have tpm2-abrmd running
2. abrmd is connected to a software simulator

> =

> =

> =

> Thanks!
> =

> Regards,
> =

> Munes


--===============1490564216604718852==--

