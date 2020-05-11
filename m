Content-Type: multipart/mixed; boundary="===============4478120051671274312=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Use PCR10 of sha256 PCR bank
Date: Mon, 11 May 2020 19:30:00 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDCC72@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EDC5DB@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4478120051671274312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> > -----Original Message-----
> > From: nicolasoliver03(a)gmail.com [mailto:nicolasoliver03(a)gmail.com]
> > Sent: Friday, May 8, 2020 10:55 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Re: Use PCR10 of sha256 PCR bank
> >
> > As today, IMA is harcoded to make the boot_aggregate entry in SHA1
> >
> > https://github.com/torvalds/linux/blob/ac438771ccb4479528594c7e19f2c39
> > cf181
> > 4a86/security/integrity/ima/ima_init.c#L59
> >
> > So the ima_hash=3Dsha256 option is activated after the boot_aggregate.
> > It is the same for me in Fedora 31. It would be nice if somebody
> > contributed to the kernel and fixes this, or at least harcode it to
> > sha256 :)
> >
> > What I can see from you initial message is that you get all the digest
> > from the measured boot process (PCR 0 to 7) in both SHA1 and SHA256
> > PCRs, which means that your BIOS to TPM interaction is working fine.
> > In Fedora, you would see additional measurements in the PCR 8 and 9
> > corresponding to the digests of the components that grub2 reads (config,
> kernel and kernel config, and initiramfs).
> >
> > But when IMA is measuring stuff, you get only PCR SHA1 digests. I
> > think this is related to the 4.4 kernel version. The oldest kernel I
> > used to validate IMA was a 4.17, and I am currently using 5.6. I
> > believe there is no option to control which PCR banks IMA uses, it
> > should measure in all the available PCR 10s by default. Is upgrading
> > to Ubuntu 18.04 or 20.04 possible for you? Also, Ubuntu 16.04 is EOL
> > since April 2019, so you have other good reasons to upgrade :)
> =

> They likely limit it because hashing things for N digests is pretty slow.=
 However,
> the Code could be taught that if it's extending to a tpm2 chip to use sha=
256 and
> sha1 for The older < 1.2 chips.
> =

> I through together, an untested kernel patch here, that should at least c=
over that
> one Case you pointed out earlier, but their might be others, I don't know=
. If there
> are others It might be worth a different approach where IMA just asks wha=
t the
> best algorithm is and associates all tpm events with that algorithm, rath=
er than
> having to do it at a bunch of spots in the code.
> Not 100% sure how IMA is internally constructed.
> =

> Here is a link to that patch if you wanna give it a go
> https://github.com/tpm2-software/tpm2-tools/issues/2009#issuecomment-
> 625961138
> =


FYI there is a patchlist on IMA already doing what we want, see:
https://lore.kernel.org/linux-integrity/20200325104712.25694-1-roberto.sass=
u(a)huawei.com/

Bill
--===============4478120051671274312==--

