Content-Type: multipart/mixed; boundary="===============2294329921236890766=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Thu, 17 Aug 2017 12:24:36 +0200
Message-ID: <2e77a669-30d3-51bc-8b58-f6b1613a6b5d@redhat.com>
In-Reply-To: 1FEB6BE5D027454BAEDB8EA7F2D809DED80CFC15@UKDC1CSUEXMV01.CSU.LOCAL
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2294329921236890766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Sebastien,

On 08/16/2017 07:25 PM, Raveau, Sebastien wrote:
> Hi Javier,
> =

> Thanks for your reply and apologies for the delay in mine.
> =


No worries, email is async anyways. I really appreciate your feedback.

> =

> =

> On 2017/08/03 14:21 PM, Javier Martinez Canillas wrote:
>> Yes, approach I mentioned does not attempt to protect from an evil maid
>> attack. Since if someone is able to get physical access to your computer=
, she
>> can change the initramfs which isn't measured so unlocking the LUKS volu=
me
>> becomes trivial.
> =

> Perhaps I am the one missing something, apologies if I am, but isn't prot=
ecting
> against evil maid attack the whole point of disk encryption? :-)
> =


I think it really depends on your threat model. A colleague usually says th=
at
security is not binary but instead a sliding scale of risk management.

IOW, the fact that only having the /root volume encrypted doesn't defend for
the evil maid attack doesn't mean that is not useful for other use cases, e=
.g:

1) A server that can be booted without typing a pass-phrase to unlock a LUKS
   volume but if the hard disk is stolen, can't be mounted on another machi=
ne.

2) A Virtual Machine image that if stolen can't be mounted in another machi=
ne. =


> =

> =

>> AFAICT this is an issue regardless of how the data is protected by the T=
PM
>> (e.g: using a sealed data object or storing it in an NV area), at some p=
oint
>> the key has to be decrypted and stored at least in RAM for unlocking the=
 LUKS
>> volume. So I don't see how storing in an NV area will make a difference =
for
>> the attack you are mentioning (sorry if I'm missing something).
> =

> An issue regardless indeed; I was not suggesting that defending against s=
uch
> attacks can only be done with NV areas, just that there are more risks in=
 doing
> so with sealed data; apologies for the confusion.
>

That's where I disagree. I don't see why storing in a NV area will make it =
more
secure that sealing the data. If you trick the system to unseal the data, t=
hen
you can also trick it to read from the NV area.
 =

> Not recommending you do this but just in case it helps somehow in the fut=
ure:
> technically the key does not have to be stored in RAM, you could have disk
> encryption/decryption done entirely in TPM, just very slowly. There are h=
igh
> performance alternatives with the key held in CPU (see "TRESOR Runs Encry=
ption
> Securely Outside RAM" [1] for example) or GPU but both of those introduce=
 other

Thanks for the pointer.

> challenges like reliability vs suspend/resume, and can hardly be locked d=
own as
> much as a proper Hardware Security Module... Not to mention the (in)secur=
ity of
> the transport between TPM and CPU/GPU: the LPC/I2C/PCIe/etc bus to either=
 might
> be sniffed and the trip to the latter most likely includes a RAM stopover=
. Not
> that I would put this kind of attack and other considerations that require
> decapping, lasers, etc in the same category as the common Insider Threat =
alone
> with your machine just for a couple of minutes; just saying that it would=
 be a
> lot of work for too little gain security-wise (GPU crypto is still intere=
sting
> throughput-wise).
> =


Yeah, that's what I meant by a scaling risk management. If someone is the k=
ind of
target for this type of attack (or something like differential power analys=
is to
extract data from the TPM) then they shouldn't rely only on the TPM, but in=
stead
use many factors for authentication.

> =

> =

>> The suggestion here [0] is to have a small initramfs whose sole task is =
to
>> get a secret from the TPM and then store the secret in the Linux kernel,=
 so
>> latter another initramfs is only able to unlock a volume but no to get t=
he
>> secret.
> =

> Isn't this moot if an attacker has access to the decrypted files? I mean,=
 if I
> can modify the initramfs to get local and/or remote shell, I do not care =
about
> the LUKS key anymore :-)
> =


Yes, but I think there's a difference between having access to the files of=
 the
decrypted volume and having access to a boot partition that isn't encrypted=
 in
the first place. That blog post was talking about the latter.

> =

> =

>> Another option is to have an encrypted boot partition, and make the
>> bootloader unlock the boot partition using the TPM. That way an attacker
>> won't be able to tamper with the system since the boot-loader is already
>> measured and the LUKS master key will be sealed to this PCR state.
> =

> That might work but it is tackling the exact same problem with the exact =
same
> solution, just at a different stage of the boot process: not only would it

I think I missed some information in my first email. The idea is to seal th=
e LUKS
master key against PCR7 which is used to measure the UEFI Secure Boot polic=
y and
keys on shim. That avoid unsealing the LUKS master key if Secure Boot was d=
isabled
or the used keys were replaced.

So the difference is that the boot-loader will be signed while the initramf=
s isn't.

> require duplicating LUKS (or GPG to keep the boot partition unencrypted n=
otably
> if it doubles as an EFI partition, but that would then also require modif=
ying
> kernel/initramfs upgrade tools as well) into the boot loader, there would=
 be
> even more mistakes you would have to avoid making; for example you would =
have
> to worry not only about the initramfs dropping to a shell (due to adding =
things
> like "single" to an unmeasured command line, to errors triggered on purpo=
se or
> simply to bugs such as [2] not that long ago), you would also have to wor=
ry
> about the freedom your own unmodified boot loader might leave attackers (=
e.g.
> you might have forgotten to measure menu.lst/grub.cfg, or you measure it =
but
> a time-of-check vs time-of-use race condition allows the attacker to repl=
ace it
> as in [3], or attackers can do too much from the boot loader shell, or yo=
u have
> disabled that but bugs still lead to a rescue shell as in [4], etc).
> =


Agreed, that's why sealing against PCR7 and using the TPM with Secure Boot =
is the
least error prone approach and what we are exploring now.

> =

> =

>> I added support for tpm2_create to get the data to be sealed from the
>> standard input and for tpm2_unseal to write the unsealed data to the sta=
ndard
>> output. That way the secret never is stored in a media
> =

> Nice, thanks!
> =

> I would just add "memset(outData.t.buffer, 0, outData.t.size);"... I see
> cryptsetup calls crypt_safe_free() on passwords and keys to zero out memo=
ry
> copies once they are not needed anymore, but then again I am not sure what
> happens in the pipe. Your secret might end up stored in pipefs "media" ;-D
> =

> It's probably nothing but I'll investigate, always good to know :-)
> =


Interesting, thanks a lot for bringing this up. I'll take a look to it as w=
ell.

> =

> =

>> That's certainly an advantage, although it's not a use case I'm interest=
ed in
> =

> Fair enough :-)
> =

> =

> =

>> I think that measuring the initramfs is tricky since any random package =
can
>> update the initramfs and so relying on the initramfs being measured coul=
d be
>> fragile IMHO.
> =

> I have to admit that I have a /boot and /actualboot just in case I am not
> familiar enough with all the intrinsics of the various distros I use: the
> former keeps software upgrades happy but resides in the encrypted / and o=
nce I
> have checked that nothing went wrong I apply the changes to the latter...
> =

> I have yet to find a initramfs-modifying package that did not trigger my
> initramfs-tools hook though; wouldn't it work just as well on Red Hat?
>

Yes, it would but we decided that it's fragile since you need to re-seal
everything, and instead will explore to encrypt /boot as mentioned.
 =

> Maybe I am missing something, but it seems to me that not measuring the
> initramfs defeats the whole purpose of using the TPM: is the threat profi=
le

Indeed, it's an important attack vector. I hope my explanation about sealing
against PCR7 and encrypting /boot and only be able to decrypt using a signed
bootloader better explains why we could protect against this without the ne=
ed
to measure the initramfs.

> limited to someone stealing the disks without stealing the computers as w=
ell,
> nor ever coming back once they realise the disks are encrypted? :-)
>

We preferred to do it in small steps, so this initial solution as you menti=
oned
has limited use cases (although even for those people are interested and it=
 is
better than nothing). And even for full disk encryption (including /boot), =
you
need the ability for user-space to unlock the LUKS volume so this will be p=
art
of the final solution.

Again, thanks a lot for your comments and feedback.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============2294329921236890766==--

