Content-Type: multipart/mixed; boundary="===============3380518479515317570=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] ROCA and firmware version
Date: Fri, 12 Apr 2019 16:32:35 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D2B590@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20190412074316.vzb2zh6vr2zyk2dj@runtux.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3380518479515317570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ralf Schlatt=
erbeck
> Sent: Friday, April 12, 2019 12:43 AM
> To: tpm2(a)lists.01.org
> Subject: Re: [tpm2] ROCA and firmware version
> =

> On Thu, Apr 11, 2019 at 06:03:44PM +0000, Roberts, William C wrote:
> > > From: tpm2 On Behalf Of Ralf Schlatterbeck
> > >
> > > It has the SLB 9670VQ2.0 or SLB 9670VQ1.2 chips with SPI supported
> > > by the tpm_tis_spi kernel module.
> > >
> > > These modules have/had the ROCA vulnerability
> > > https://en.wikipedia.org/wiki/ROCA_vulnerability
> > >
> > > I'd like to check if mine are affected. Is there
> > > - a way to find out the firmware version of the module (preferrably
> > >   using tpm2_tools)
> >
> > tools/tpm2_getcap -c properties-fixed
> =

> Cool, thanks. I had tried exactly this command with the debian buster ver=
sion of
> tpm2-tools which didn't show that info. Then I had to upgrade because deb=
ian
> doesn't ship the Openssl engine. And didn't retry. So since there are so =
many
> tpm2_ commands I wasn't sure :-)

Debian is very out of date, and we have an open issue in the tools to try a=
nd
Work with downstream to correct this.
https://github.com/tpm2-software/tpm2-tools/issues/1067

> =

> My module has a firmware from 2016 and is vulnerable.
> =

> > > - a possibility to upgrade the firmware (provided I can extract one f=
rom
> > >   the various upgrades for windows) using tpm2_tools? Or any other wa=
y?
> >
> > I have no idea on this part. I don't think the spec covers this and
> > upgrade is Manufacture dependent, but don't take my word for it.
> =

> Yes, I thinks this one will be difficult. I check if I can get some info =
from Infineon.
> =

> Ralf
> --
> Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
> Open Source Consulting                  www:   http://www.runtux.com
> Reichergasse 131, A-3411 Weidling       email: office(a)runtux.com
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============3380518479515317570==--

