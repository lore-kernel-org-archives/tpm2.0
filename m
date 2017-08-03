Content-Type: multipart/mixed; boundary="===============7309160816777288691=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Thu, 03 Aug 2017 15:20:48 +0200
Message-ID: <588778cc-08f7-83eb-5bca-600a1c650b7b@redhat.com>
In-Reply-To: 1FEB6BE5D027454BAEDB8EA7F2D809DED80C27E6@UKDC1CSUEXMV01.CSU.LOCAL
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7309160816777288691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Sebastien,

Thanks a lot for your feedack.

On 08/03/2017 12:33 PM, Raveau, Sebastien wrote:
> Hello Javier, Robert, everyone,
> =

> I very much appreciate the effort but I believe there are problems with t=
his particular approach:
> =

>>>> Do you think what I described is the correct approach? Specially I
>>>> would like to know your opinion about storing not only the pub but
>>>> also the priv key in the LUKS volume header (since both are needed
>>>> for unsealing)
> =

> I would not store anything in the LUKS header because it needs to be meas=
ured and tightly coupled with the mounting process to ensure that you are n=
ot being tricked. For example if I copy your exact /boot onto another disk,=
 copy your LUKS header into a tiny partition just for your initrd to retrie=
ve the sealed keys, and add my own root partition unencrypted but with the =
same UUID as that of your crypt_root then I am likely to end up with a full=
y functional system of my own where your keys are unsealed.

Yes, approach I mentioned does not attempt to protect from an evil maid att=
ack.
Since if someone is able to get physical access to your computer, she can c=
hange
the initramfs which isn't measured so unlocking the LUKS volume becomes tri=
vial.

AFAICT this is an issue regardless of how the data is protected by the TPM =
(e.g:
using a sealed data object or storing it in an NV area), at some point the =
key
has to be decrypted and stored at least in RAM for unlocking the LUKS volum=
e.

So I don't see how storing in an NV area will make a difference for the att=
ack
you are mentioning (sorry if I'm missing something).

The suggestion here [0] is to have a small initramfs whose sole task is to =
get
a secret from the TPM and then store the secret in the Linux kernel, so lat=
ter
another initramfs is only able to unlock a volume but no to get the secret.

Another option is to have an encrypted boot partition, and make the bootloa=
der
unlock the boot partition using the TPM. That way an attacker won't be able=
 to
tamper with the system since the boot-loader is already measured and the LU=
KS
master key will be sealed to this PCR state.

> =

> It is also crucial to remove access to unsealed data or unlocked NVRAM in=
dices as soon as they are not needed anymore. For example if your initrd ta=
kes issue with my trick above, I imagine it would drop to a root shell whic=
h would still give me access to your unsealed keys unless you =


I absolutely agree, that's why I added support for tpm2_create to get the d=
ata
to be sealed from the standard input and for tpm2_unseal to write the unsea=
led
data to the standard output. That way the secret never is stored in a media:

https://github.com/01org/tpm2-tools/commit/686951ed0b300871d979ad6b2f3e8252=
7ed86106
https://github.com/01org/tpm2-tools/commit/8aa7f644386d611b0f83060e1a70d970=
96ba4967

remove access asap. This is very easily achieved with a NVRAM index by defi=
ning it with the READ_STCLEAR flag and a size 0 read right after the normal=
 read, but you could achieve the same result by further extending (with wha=
tever measurement just to invalidate it) one of the PCRs the =


Correct, the same can be achieved in both cases.

data is sealed/locked with; of course in both cases you also have to make s=
ure to wipe asap all copies of unlocked/unsealed data that you might have m=
ade.
> =

> Personally I would recommend using NVRAM indices as opposed to sealed dat=
a, for three reasons:
> 1/ No need to write to the encrypted storage medium, so that for example =
you can have TPM(s) unlock a live CD like https://lists.debian.org/debian-l=
ive/2007/02/msg00090.html

That's certainly an advantage, although it's not a use case I'm interested =
in.

> 2/ Chicken & egg problem if you store sealed data files into the places t=
hat need to be measured, e.g. my own original approach was to store inside =
the initrd but I needed to measure that. Granted, nowadays I could add the =
sealed data as an initrd overlay and you could measure only =


I think that measuring the initramfs is tricky since any random package can=
 update
the initramfs and so relying on the initramfs being measured could be fragi=
le IMHO.

chosen parts of the LUKS header but meh, it feels like leaving the door aja=
r for vulnerabilities.
> 3/ I can't seem to find a reason justifying the unnecessary risk added by=
 introducing a key pair between the TPM's Hardware Security Module function=
 and LUKS's key derivation function; why not have the TPM decrypt the LUKS =
master key for you, or simply hold in NVRAM a (fully random) passphrase for=
 one of the LUKS key slots? Both usable only when the right conditions are =
met of course.
>

Sorry, I'm not sure I followed the last paragraph. I think we are mixing tw=
o things
here: a) what to protect using the TPM and b) how to protect it (sealing vs=
 NV area).

So in summary, the only advantage I see in using NV areas over sealing data=
 is (1).
But I think that it also has disadvantages, because it's true that most TPM=
 have a
lot of NV memory just to store many keys, but still the areas have to be ma=
naged and
also I think that one of the improvements of TPM2 over TPM1.2 is that the s=
ecret can
be easily stored outside of the TPM without making this less secure.

[0]: https://mjg59.dreamwidth.org/48897.html

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============7309160816777288691==--

