Content-Type: multipart/mixed; boundary="===============8320832747315199082=="
MIME-Version: 1.0
From: Ralf Schlatterbeck <rsc at runtux.com>
Subject: Re: [tpm2] ROCA and firmware version
Date: Fri, 12 Apr 2019 09:43:16 +0200
Message-ID: <20190412074316.vzb2zh6vr2zyk2dj@runtux.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649D2B22A@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8320832747315199082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 06:03:44PM +0000, Roberts, William C wrote:
> > From: tpm2 On Behalf Of Ralf Schlatterbeck
> > =

> > It has the SLB 9670VQ2.0 or SLB 9670VQ1.2 chips with SPI supported by t=
he
> > tpm_tis_spi kernel module.
> > =

> > These modules have/had the ROCA vulnerability
> > https://en.wikipedia.org/wiki/ROCA_vulnerability
> > =

> > I'd like to check if mine are affected. Is there
> > - a way to find out the firmware version of the module (preferrably
> >   using tpm2_tools)
> =

> tools/tpm2_getcap -c properties-fixed

Cool, thanks. I had tried exactly this command with the debian buster
version of tpm2-tools which didn't show that info. Then I had to upgrade
because debian doesn't ship the Openssl engine. And didn't retry. So
since there are so many tpm2_ commands I wasn't sure :-)

My module has a firmware from 2016 and is vulnerable.

> > - a possibility to upgrade the firmware (provided I can extract one from
> >   the various upgrades for windows) using tpm2_tools? Or any other way?
> =

> I have no idea on this part. I don't think the spec covers this and upgra=
de is
> Manufacture dependent, but don't take my word for it.

Yes, I thinks this one will be difficult. I check if I can get some info
from Infineon.

Ralf
-- =

Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
Open Source Consulting                  www:   http://www.runtux.com
Reichergasse 131, A-3411 Weidling       email: office(a)runtux.com

--===============8320832747315199082==--

