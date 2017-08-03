Content-Type: multipart/mixed; boundary="===============0706451769813333321=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Thu, 03 Aug 2017 21:12:35 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAA9851@ORSMSX103.amr.corp.intel.com>
In-Reply-To: 588778cc-08f7-83eb-5bca-600a1c650b7b@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0706451769813333321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
> Sent: Thursday, August 3, 2017 6:21 AM
> To: Raveau, Sebastien <sebastien.raveau(a)baesystems.com>; Roberts, Willi=
am C
> <william.c.roberts(a)intel.com>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
> =

> Hello Sebastien,
> =

> Thanks a lot for your feedack.
> =

> On 08/03/2017 12:33 PM, Raveau, Sebastien wrote:
> > Hello Javier, Robert, everyone,
> >
> > I very much appreciate the effort but I believe there are problems with=
 this
> particular approach:
> >
> >>>> Do you think what I described is the correct approach? Specially I
> >>>> would like to know your opinion about storing not only the pub but
> >>>> also the priv key in the LUKS volume header (since both are needed
> >>>> for unsealing)
> >
> > I would not store anything in the LUKS header because it needs to be me=
asured
> and tightly coupled with the mounting process to ensure that you are not =
being
> tricked. For example if I copy your exact /boot onto another disk, copy y=
our LUKS
> header into a tiny partition just for your initrd to retrieve the sealed =
keys, and
> add my own root partition unencrypted but with the same UUID as that of y=
our
> crypt_root then I am likely to end up with a fully functional system of m=
y own
> where your keys are unsealed.

The keys themselves I would imagine are being loaded into the TPM on boot s=
ince they are
Not persistent, those keys shouldn't be able to be unwrapped by a separate =
TPM.

> =

> Yes, approach I mentioned does not attempt to protect from an evil maid a=
ttack.
> Since if someone is able to get physical access to your computer, she can=
 change
> the initramfs which isn't measured so unlocking the LUKS volume becomes t=
rivial.
> =

> AFAICT this is an issue regardless of how the data is protected by the TP=
M (e.g:
> using a sealed data object or storing it in an NV area), at some point th=
e key has
> to be decrypted and stored at least in RAM for unlocking the LUKS volume.
> =

> So I don't see how storing in an NV area will make a difference for the a=
ttack you
> are mentioning (sorry if I'm missing something).
> =

> The suggestion here [0] is to have a small initramfs whose sole task is t=
o get a
> secret from the TPM and then store the secret in the Linux kernel, so lat=
ter
> another initramfs is only able to unlock a volume but no to get the secre=
t.
> =

> Another option is to have an encrypted boot partition, and make the bootl=
oader
> unlock the boot partition using the TPM. That way an attacker won't be ab=
le to
> tamper with the system since the boot-loader is already measured and the =
LUKS
> master key will be sealed to this PCR state.
> =

> >
> > It is also crucial to remove access to unsealed data or unlocked NVRAM
> > indices as soon as they are not needed anymore. For example if your
> > initrd takes issue with my trick above, I imagine it would drop to a
> > root shell which would still give me access to your unsealed keys
> > unless you
> =

> I absolutely agree, that's why I added support for tpm2_create to get the=
 data to
> be sealed from the standard input and for tpm2_unseal to write the unseal=
ed
> data to the standard output. That way the secret never is stored in a med=
ia:
> =

> https://github.com/01org/tpm2-
> tools/commit/686951ed0b300871d979ad6b2f3e82527ed86106
> https://github.com/01org/tpm2-
> tools/commit/8aa7f644386d611b0f83060e1a70d97096ba4967
> =

> remove access asap. This is very easily achieved with a NVRAM index by de=
fining
> it with the READ_STCLEAR flag and a size 0 read right after the normal re=
ad, but
> you could achieve the same result by further extending (with whatever
> measurement just to invalidate it) one of the PCRs the
> =

> Correct, the same can be achieved in both cases.
> =

> data is sealed/locked with; of course in both cases you also have to make=
 sure to
> wipe asap all copies of unlocked/unsealed data that you might have made.
> >
> > Personally I would recommend using NVRAM indices as opposed to sealed
> data, for three reasons:
> > 1/ No need to write to the encrypted storage medium, so that for
> > example you can have TPM(s) unlock a live CD like
> > https://lists.debian.org/debian-live/2007/02/msg00090.html
> =

> That's certainly an advantage, although it's not a use case I'm intereste=
d in.
> =

> > 2/ Chicken & egg problem if you store sealed data files into the
> > places that need to be measured, e.g. my own original approach was to
> > store inside the initrd but I needed to measure that. Granted,
> > nowadays I could add the sealed data as an initrd overlay and you
> > could measure only
> =

> I think that measuring the initramfs is tricky since any random package c=
an update
> the initramfs and so relying on the initramfs being measured could be fra=
gile
> IMHO.
> =

> chosen parts of the LUKS header but meh, it feels like leaving the door a=
jar for
> vulnerabilities.
> > 3/ I can't seem to find a reason justifying the unnecessary risk added =
by
> introducing a key pair between the TPM's Hardware Security Module function
> and LUKS's key derivation function; why not have the TPM decrypt the LUKS
> master key for you, or simply hold in NVRAM a (fully random) passphrase f=
or one
> of the LUKS key slots? Both usable only when the right conditions are met=
 of
> course.
> >
> =

> Sorry, I'm not sure I followed the last paragraph. I think we are mixing =
two things
> here: a) what to protect using the TPM and b) how to protect it (sealing =
vs NV
> area).
> =

> So in summary, the only advantage I see in using NV areas over sealing da=
ta is (1).
> But I think that it also has disadvantages, because it's true that most T=
PM have a
> lot of NV memory just to store many keys, but still the areas have to be =
managed
> and also I think that one of the improvements of TPM2 over TPM1.2 is that=
 the
> secret can be easily stored outside of the TPM without making this less s=
ecure.
> =

> [0]: https://mjg59.dreamwidth.org/48897.html
> =

> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement Red Hat

--===============0706451769813333321==--

