Content-Type: multipart/mixed; boundary="===============4295382682812123070=="
MIME-Version: 1.0
From: =?utf-8?q?Florent_Daigni=C3=A8re_=3Cnextgens_at_freenetproject=2Eorg=3E?=
Subject: [tpm2] Re: Made an ZFS root pool auto-unlock,
 please give review of method
Date: Sun, 19 Jan 2020 09:48:10 +0000
Message-ID: <0102016fbd33ded3-ecf8ecb2-1b9a-492d-9bc6-1b88cad9e601-000000@eu-west-1.amazonses.com>
In-Reply-To: CA++-fmvrrqtoogiJOxGTN=eDfbn4XJ7Q=Sn2XXYmQT4K5S2BFA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4295382682812123070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Garett,

As a long-term lurker, I would like to bring a different perspective to
this... I personally think that the industry is doing it wrong [1] and
that you shouldn't try to emulate what Bitlocker does but go back to the
basics. Why are you encrypting and what are you protecting against?

I am a firm believer that TPMs are useful, but I do believe that this
isn't the way they should be used. Most are FIPS_140 level 2 devices
(ie: no attempt at physical security whatsoever) and therefore unfit to
be used alone to store FDE passphrases (I am curious about the use-case
if loosing a laptop isn't part of the threat model!). TPMs aren't
smartcards and shouldn't be used as one.

Have you considered using them to strengthen the key derivation function
used to generate the encryption keys instead [2]? You could store a
symmetrical encryption key within the TPM and use it for your HKDF. This
approach would enable you to control access to the key using
policies/PCRs just like you are doing now, get input from userland for
those that do want a PIN/passphrase (use a well-known secret for those
that want auto-unlock), potentially rate-limit attempts, and use the
HMAC output as part of the process.

Here is part of what I'm currently doing on my laptop:
zfs_raw_key =3D ARGON2id(nonce2, tpm2_hmac( ARGON2id(nonce1, passphrase)))

The TPM holds a keyedhash that's protected by a policy (mine only
unlocks if secureboot is enabled, the platform hasn't obviously changed
AND the post-unlock PCRs are still unset).

This defeats the parallelization/distribution of an offline passphrase
bruteforcing attack as the attacker will be bound by the speed of the
TPM, regardless of the amount of resources available to him (unless he
retrieves the key from the TPM ofc...). Nothing prevents you from using
multiple iterations of the TPM-baked round nor layering it in
conjunction with other things (I've been toying with introducing a few
rounds of SGX-baked HMAC too! That's more "smartcard-like" / FIPS_140
level 3).

This is clearly above and beyond what your specific use-case is (auto-
unlock)... but I confess having problems wrapping my head around how you
can deliver on that using exclusively a TPM while keeping a sane threat
model. IMHO you're just using the wrong technology and forgetting rule
number one of security.

Regarding the implementation itself, assuming you only care about Linux,
have you considered using keyctl ?

Regards,
  Florent

[1] https://44con.com/44con/44con-2019/44con-hootenanny/
Sorry, the video isn't available just yet
[2]
https://florent.daigniere.com/posts/2019/04/doing-key-stretching-right/
And yes, I should probably make time to write part two.


On Thu, 2020-01-16 at 18:03 -0500, Garrett Fields wrote:
> I've played around with this for quite some time and wanted to get
> some more eyes on this code.  I've created a draft PR with "ZFS on
> Linux", asking for a discussion of methodology.  Likely, the people on
> this list can speak to the utilization of TPM2-tools and help with the
> security aspects more than the filesystems focused developers there.
> =

> Please have a look and submit comments here or the PR itself.
> https://github.com/zfsonlinux/zfs/pull/9852
> =

> Many thanks,
> Garrett Fields
> =

> On Mon, Dec 9, 2019 at 11:15 PM Garrett Fields <ghfields(a)gmail.com>
> wrote:
> > Back in the end of July, I wrote a message on this discussion list
> > titled "PCR Policy enforcement when using nvram".  In that, I asked
> > for a way to have both a PCR check AND a password lock an nvram
> > range (not an OR).  I really appreciated everyone's help, especially
> > William Roberts, who gave some sample code of using a session to
> > accomplish this goal.
> > =

> > Now that Ubuntu has updated its repositories for the upcoming 20.04
> > LTS release and included TPM-tools v4.x, I figured it was time to
> > take another look.
> > =

> > My goal is to provide a method to auto-unlock a ZFS encrypted root
> > filesystem.  Currently, ZFS allows for unlocking via a prompt or
> > file containing a raw, hex, or passphrase values.  The mechanisms
> > are already inplace to prompt on startup.
> > =

> > So far I have just done a proof of concept.  It probably loads of
> > bad code and tons of polish needed:  =

> > https://github.com/ghfields/zfs/compare/master...ghfields:tpm2-autounlo=
ck
> > =

> > I forked the zfs project, expanded the its initramfs hooks to
> > include the required tpm2-tools binaries, and added another stanza
> > to init script's decrypting section.  I also created a pair of
> > scripts that configures the system and tests readback.
> > =

> > The nvram index and the PCRs used are stored/read from the zfs
> > filesystem properties.  I used the  filesytem's GUID as the required
> > password as another check to verify the NVRAM range was intended for
> > that filesystem.   I also intend to issue an nvreadlock to prevent
> > snooping once the key is used.
> > =

> > I'd be interested in a critique of the method overall  I expect
> > there ways to make this more secure.  With enough effort, one could
> > issue a break=3Dpremount on the kernel line and manually extract the
> > password from the TPM.  Any way to tighten that up?
> > =

> > I'm a total novice at TPM in general, but am completely open to
> > advise and guidance.
> > =

> > Thanks,
> > Garrett Fields
> > =

> > =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============4295382682812123070==--

