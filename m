Content-Type: multipart/mixed; boundary="===============7484984193006009890=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Use PCR10 of sha256 PCR bank
Date: Fri, 08 May 2020 18:59:29 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDC5DB@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200508155440.2843.22202@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7484984193006009890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: nicolasoliver03(a)gmail.com [mailto:nicolasoliver03(a)gmail.com]
> Sent: Friday, May 8, 2020 10:55 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Use PCR10 of sha256 PCR bank
> =

> As today, IMA is harcoded to make the boot_aggregate entry in SHA1
> =

> https://github.com/torvalds/linux/blob/ac438771ccb4479528594c7e19f2c39cf1=
81
> 4a86/security/integrity/ima/ima_init.c#L59
> =

> So the ima_hash=3Dsha256 option is activated after the boot_aggregate. It=
 is the
> same for me in Fedora 31. It would be nice if somebody contributed to the=
 kernel
> and fixes this, or at least harcode it to sha256 :)
> =

> What I can see from you initial message is that you get all the digest fr=
om the
> measured boot process (PCR 0 to 7) in both SHA1 and SHA256 PCRs, which me=
ans
> that your BIOS to TPM interaction is working fine. In Fedora, you would s=
ee
> additional measurements in the PCR 8 and 9 corresponding to the digests o=
f the
> components that grub2 reads (config, kernel and kernel config, and initir=
amfs).
> =

> But when IMA is measuring stuff, you get only PCR SHA1 digests. I think t=
his is
> related to the 4.4 kernel version. The oldest kernel I used to validate I=
MA was a
> 4.17, and I am currently using 5.6. I believe there is no option to contr=
ol which PCR
> banks IMA uses, it should measure in all the available PCR 10s by default=
. Is
> upgrading to Ubuntu 18.04 or 20.04 possible for you? Also, Ubuntu 16.04 i=
s EOL
> since April 2019, so you have other good reasons to upgrade :)

They likely limit it because hashing things for N digests is pretty slow. H=
owever, the
Code could be taught that if it's extending to a tpm2 chip to use sha256 an=
d sha1 for
The older < 1.2 chips. =


I through together, an untested kernel patch here, that should at least cov=
er that one
Case you pointed out earlier, but their might be others, I don't know. If t=
here are others
It might be worth a different approach where IMA just asks what the best al=
gorithm is and
associates all tpm events with that algorithm, rather than having to do it =
at a bunch of spots
in the code.
Not 100% sure how IMA is internally constructed.

Here is a link to that patch if you wanna give it a go
https://github.com/tpm2-software/tpm2-tools/issues/2009#issuecomment-625961=
138

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============7484984193006009890==--

