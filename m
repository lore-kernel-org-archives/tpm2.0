Content-Type: multipart/mixed; boundary="===============2449337233794773368=="
MIME-Version: 1.0
From: Duncan.Palmer at data61.csiro.au
Subject: Re: [tpm2] tpm2_nvwrite hanging on 3.X
Date: Thu, 08 Feb 2018 11:46:16 +0000
Message-ID: <1518090376915.11789@data61.csiro.au>
In-Reply-To: 1518071561427.40356@data61.csiro.au
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2449337233794773368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I get the same behaviour on master., tho it builds without issues.

Duncan Palmer
Senior Software Engineer | Autonomous Systems
Data61 | CSIRO
E duncan.palmer(a)csiro.au
Queensland Centre for Advanced Technologies (QCAT),
1 Technology Court, Pullenvale QLD, 4069
www.data61.csiro.au

CSIRO=E2=80=99s Digital Productivity business unit and NICTA have joined fo=
rces to create digital powerhouse Data61

________________________________________
From: tpm2 <tpm2-bounces(a)lists.01.org> on behalf of Duncan.Palmer(a)data6=
1.csiro.au <Duncan.Palmer(a)data61.csiro.au>
Sent: 08 February 2018 16:32
To: tpm2(a)lists.01.org
Subject: [ExternalEmail] [tpm2] tpm2_nvwrite hanging on 3.X

Hi,

I've come back to something I stopped work on early last November. I was wo=
rking with the tpm2_tools master branch at the time, and have moved to 3.X =
to get support for PCR based authorisation with tpm2_nvread/write. With 3.X=
, tpm2_nvwrite is hanging when trying to write to the tpm device file. Usin=
g the code from last year (sorry, I no longer have a record of what revisio=
n this was), it was working fine (see log snippet below).

I'm using the 1.x branch of tpm2-tss, and I configure tpm2-tools with '--wi=
th-tcti-device --without-tcti-socket'. I've also had to modify Makefile.am =
to get this combination to build;


--LIBMARSHAL_CFLAGS =3D \
--    -DALG_ECMQV=3D1
++#LIBMARSHAL_CFLAGS =3D \
++#    -DALG_ECMQV=3D1


Can anyone comment on this? Should I raise a bug on your tracker?


Regards,
Duncan


tpm2_nvwrite logs from my testing last year;

root(a)tpm:/home/foo/install/bin# ./tpm2_nvdefine -x 0x1500016 -a 0x4000000=
1 -s 32 -t 0x2000A
root(a)tpm:/home/foo/install/bin# ./tpm2_nvlist
1 NV indexes defined.

  0. NV Index: 0x1500016
  {
    Hash algorithm(nameAlg):11
     attributes: ownerwrite|policywrite|ownerread(0xA000200)
     The size of the data area(dataSize):32
     Authorization Policy for R/W/D:
  }

root(a)tpm:/home/foo/install/bin# echo 'foo' > nv.dat
root(a)tpm:/home/foo/install/bin# ./tpm2_nvwrite -x 0x1500016 -a 0x40000001=
 nv.dat
66 6f 6f 0a

root(a)tpm:/home/foo/install/bin# ./tpm2_nvread -x 0x1500016 -a 0x40000001
000000: 66 6f 6f 0a 00 00 00 00 00 00 00 00 00 00 00 00  foo.............
000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................




 Duncan Palmer
 Senior Software Engineer | Autonomous Systems
 Data61 | CSIRO
_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

--===============2449337233794773368==--

