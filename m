Content-Type: multipart/mixed; boundary="===============1365248911433042710=="
MIME-Version: 1.0
From: Raveau, Sebastien <sebastien.raveau at baesystems.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Wed, 16 Aug 2017 17:25:23 +0000
Message-ID: <1FEB6BE5D027454BAEDB8EA7F2D809DED80CFC15@UKDC1CSUEXMV01.CSU.LOCAL>
In-Reply-To: 588778cc-08f7-83eb-5bca-600a1c650b7b@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1365248911433042710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Thanks for your reply and apologies for the delay in mine.



On 2017/08/03 14:21 PM, Javier Martinez Canillas wrote:
> Yes, approach I mentioned does not attempt to protect from an evil maid
> attack. Since if someone is able to get physical access to your computer,=
 she
> can change the initramfs which isn't measured so unlocking the LUKS volume
> becomes trivial.

Perhaps I am the one missing something, apologies if I am, but isn't protec=
ting
against evil maid attack the whole point of disk encryption? :-)



> AFAICT this is an issue regardless of how the data is protected by the TPM
> (e.g: using a sealed data object or storing it in an NV area), at some po=
int
> the key has to be decrypted and stored at least in RAM for unlocking the =
LUKS
> volume. So I don't see how storing in an NV area will make a difference f=
or
> the attack you are mentioning (sorry if I'm missing something).

An issue regardless indeed; I was not suggesting that defending against such
attacks can only be done with NV areas, just that there are more risks in d=
oing
so with sealed data; apologies for the confusion.

Not recommending you do this but just in case it helps somehow in the futur=
e:
technically the key does not have to be stored in RAM, you could have disk
encryption/decryption done entirely in TPM, just very slowly. There are high
performance alternatives with the key held in CPU (see "TRESOR Runs Encrypt=
ion
Securely Outside RAM" [1] for example) or GPU but both of those introduce o=
ther
challenges like reliability vs suspend/resume, and can hardly be locked dow=
n as
much as a proper Hardware Security Module... Not to mention the (in)securit=
y of
the transport between TPM and CPU/GPU: the LPC/I2C/PCIe/etc bus to either m=
ight
be sniffed and the trip to the latter most likely includes a RAM stopover. =
Not
that I would put this kind of attack and other considerations that require
decapping, lasers, etc in the same category as the common Insider Threat al=
one
with your machine just for a couple of minutes; just saying that it would b=
e a
lot of work for too little gain security-wise (GPU crypto is still interest=
ing
throughput-wise).



> The suggestion here [0] is to have a small initramfs whose sole task is to
> get a secret from the TPM and then store the secret in the Linux kernel, =
so
> latter another initramfs is only able to unlock a volume but no to get the
> secret.

Isn't this moot if an attacker has access to the decrypted files? I mean, i=
f I
can modify the initramfs to get local and/or remote shell, I do not care ab=
out
the LUKS key anymore :-)



> Another option is to have an encrypted boot partition, and make the
> bootloader unlock the boot partition using the TPM. That way an attacker
> won't be able to tamper with the system since the boot-loader is already
> measured and the LUKS master key will be sealed to this PCR state.

That might work but it is tackling the exact same problem with the exact sa=
me
solution, just at a different stage of the boot process: not only would it
require duplicating LUKS (or GPG to keep the boot partition unencrypted not=
ably
if it doubles as an EFI partition, but that would then also require modifyi=
ng
kernel/initramfs upgrade tools as well) into the boot loader, there would be
even more mistakes you would have to avoid making; for example you would ha=
ve
to worry not only about the initramfs dropping to a shell (due to adding th=
ings
like "single" to an unmeasured command line, to errors triggered on purpose=
 or
simply to bugs such as [2] not that long ago), you would also have to worry
about the freedom your own unmodified boot loader might leave attackers (e.=
g.
you might have forgotten to measure menu.lst/grub.cfg, or you measure it but
a time-of-check vs time-of-use race condition allows the attacker to replac=
e it
as in [3], or attackers can do too much from the boot loader shell, or you =
have
disabled that but bugs still lead to a rescue shell as in [4], etc).



> I added support for tpm2_create to get the data to be sealed from the
> standard input and for tpm2_unseal to write the unsealed data to the stan=
dard
> output. That way the secret never is stored in a media

Nice, thanks!

I would just add "memset(outData.t.buffer, 0, outData.t.size);"... I see
cryptsetup calls crypt_safe_free() on passwords and keys to zero out memory
copies once they are not needed anymore, but then again I am not sure what
happens in the pipe. Your secret might end up stored in pipefs "media" ;-D

It's probably nothing but I'll investigate, always good to know :-)



> That's certainly an advantage, although it's not a use case I'm intereste=
d in

Fair enough :-)



> I think that measuring the initramfs is tricky since any random package c=
an
> update the initramfs and so relying on the initramfs being measured could=
 be
> fragile IMHO.

I have to admit that I have a /boot and /actualboot just in case I am not
familiar enough with all the intrinsics of the various distros I use: the
former keeps software upgrades happy but resides in the encrypted / and onc=
e I
have checked that nothing went wrong I apply the changes to the latter...

I have yet to find a initramfs-modifying package that did not trigger my
initramfs-tools hook though; wouldn't it work just as well on Red Hat?

Maybe I am missing something, but it seems to me that not measuring the
initramfs defeats the whole purpose of using the TPM: is the threat profile
limited to someone stealing the disks without stealing the computers as wel=
l,
nor ever coming back once they realise the disks are encrypted? :-)



[0] https://mjg59.dreamwidth.org/48897.html
[1] https://en.wikipedia.org/wiki/TRESOR
[2] http://hmarco.org/bugs/CVE-2016-4484/CVE-2016-4484_cryptsetup_initrd_sh=
ell.html
[3] https://www.usenix.org/conference/woot12/workshop-program/presentation/=
mulliner
[4] http://hmarco.org/bugs/CVE-2015-8370-Grub2-authentication-bypass.html

--
Best regards,
Sebastien
Please consider the environment before printing this email. This message sh=
ould be regarded as confidential. If you have received this email in error =
please notify the sender and destroy it immediately. Statements of intent s=
hall only become binding when confirmed in hard copy by an authorised signa=
tory. The contents of this email may relate to dealings with other companie=
s under the control of BAE Systems PLC, details of which can be found at ht=
tp://www.baesystems.com/Businesses/index.htm.

--===============1365248911433042710==--

