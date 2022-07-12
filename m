Content-Type: multipart/mixed; boundary="===============1605038111618202033=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How to initialize a used TPM2 module and thoughts on clevis
Date: Tue, 12 Jul 2022 21:32:37 +0000
Message-ID: <516bccd242e8136f284d4f29f3b7cc5ae6fcc1e2.camel@intel.com>
In-Reply-To: 15f391d49af801d95d0ccbaf108c0e1d14eca850.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1605038111618202033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-07-12 at 21:19 +0000, Roberts, William C wrote:
> On Mon, 2022-07-11 at 06:23 +0000, tpm2(a)bitzap.e4ward.com wrote:
> > Hello -
> > =

> > New to TPM2 here. I'm adding a *used* TPM2 module to a mobo that
> > has
> > a header. What are best practices to initialize the TPM2 module? =

> > Should I clear it first, possibly via the BIOS?
> =

> Yes
> =

> >  Should I set an owner password?
> =

> and YES. This is required to keep someone from wiping all the keys in
> the owner hierarchy which would include your disk encryption keys.
> You also want to set the lockoutauth as well.
> =

> > So far I found `echo 5 > /sys/class/tpm/tpm0/ppi/request` which is
> > probably a good idea to do as I don't know where the module comes
> > from and whether anyone has messed with it before.
> > =

> > I'd appreciate any pointers in the right direction and the correct
> > commands to start with a clean TPM2. Running Ubuntu 20.04 and I
> > installed tpm2-tools.
> =

> I think I'd clear it using the BIOS and use
> tpm2_changeauth -C o <newownerpass>
> tpm2_changeauth -C l <newlockoutpass>

Oh don't forget about the endorsement hiearchy:
tpm2_changeauth -c e <newendorsepass>

Also I accidentally put uppercase -C options for tpm2_changeauth when
it is lowercase -c, sorry :-p


> =

> You'd probably also want to create the "Storage Root Key" or SRK
> which
> is a key at certain fixed address without a password so you can put
> subordinate keys under:
> =

> # Specify -G ecc for an ecc key over RSA, but it really doesn't
> matter.
> tpm2_createprimary -c primary.ctx =

> tpm2_evictcontrol -c primary.ctx 0x81000001
> =

> to initialize the TPM.
> =

> The address 0x81000001 comes from a guidance document on how to
> provision the TPM:
>   - =

> https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-Provisi=
oning-Guidance-Published-v1r1.pdf
> =

> =

> > Also, is `clevis encrypt tpm2` a good wrapper if I just want to a
> > simple way to encrypt/decrypt a file on disk that holds other
> > credentials?
> =

> Yeah clevis works great for those purposes. However, I don't know how
> clevis manages it's keys so you may need to do something else, but
> as far as I know its a simple way to use TPM2.
> =

> =

> > Thank you!
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============1605038111618202033==--

