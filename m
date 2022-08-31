Content-Type: multipart/mixed; boundary="===============7939451598234452328=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: System design question
Date: Wed, 31 Aug 2022 19:21:34 +0000
Message-ID: <SN6PR11MB34377A12E7880536240A23B9B8789@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 2843585.e9J7NaK4W3@polaris
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7939451598234452328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Felix Rubio Dalmau <felix(a)kngnt.org>
> Sent: Sunday, August 28, 2022 4:39 AM
> To: tpm2(a)lists.01.org
> Cc: Roberts, William C <william.c.roberts(a)intel.com>
> Subject: Re: [tpm2] Re: System design question
> =

> Hey William,
> =

> Thank you for your answer, I have just been playing with the tpm2_tools in
> latest Debian 11.4, trying to follow your reasoning, but there is somethi=
ng I
> am missing:
> =

> As secureboot does not check the initramfs, my approach is to make the fu=
ll
> disk encryption key depend on PCR registers 0,1,7 and 9 (for what I have
> read, from kernel 5.13 on, the measurements of initramfs go to PCR 9), or=
 a
> rescue password. This approach implies having a script in place so that t=
he
> first time a new kernel + initramfs boot I will get those measurements
> somewhere and then I can rebuild the policies with the correct contents
> (that is, until I find a way to precalculate the value of PCR 9 out of the
> initramfs file itself...
> assuming is possible).
> =

> In your email you say "[...]
> > So really all that needs to occur is the code/script needs to be in
> > place that does the normal PCR flow or rescue flow. The create call
> > can be hardcoded to the known hash, that isn't changing and can be
> > included in the filesystem when generated.
> [...]" but I do not see how would that be achieved: my current normal PCR
> flow goes like this:
> =

> tpm2_startauthsession -Q -S session.ctx --policy-session tpm2_policypcr -=
Q -
> S session.ctx -l sha256:0,1,7,9 tpm2_policypassword -Q -S session.ctx
> tpm2_policyor -Q -S session.ctx sha256:rescue.policy,regular.policy
> SECRET=3D`tpm2_unseal -Q -c 0x81010001 -p
> "session:session.ctx+$REGULAR_PASS"`
> tpm2_flushcontext -Q session.ctx
> tpm2_pcrextend -Q
> 0:sha256=3D00000000000000000000000000000000000000000000000...

So you do this to prevent unseal later right?
Theirs discussion on systemd to standardize this, amongst a lot of other th=
ings
you may find interesting
https://github.com/systemd/systemd/issues/22637

> =

> I think I understand, from user answer, that I should be able to replace
>         tpm2_policyor -Q -S session.ctx sha256:rescue.policy,regular.poli=
cy
> by
>         tpm2_policyor -Q -S session.ctx <output of precalculated digest>
> =

> But still, this does not fix the issue: the moment I hardcode this value =
in my
> initramfs, its measurement on PCR 9 will change. =


Ahh yeah, including PCR 9 causes a chicken and egg problem where the egg
Is initramfs. I don't see a way to break this dependency except by =

just need to calculate the value by running all those commands. :-(

Sorry my suggestion didn't work, it didn't occur to me at the time (facepal=
m).

> The only way out I see is to
> avoid storing this information on the initramfs itself, and this is when =
the
> nvram came into the picture. Given that nvram is scarce, maybe I can get
> away by storing on it the digest of the policyor, and adding it somehow t=
o the
> session after reading it?
> =


Policyor depends on the hashes of policy A and B... I don't see that breaki=
ng
The dependency offhand. I have other ideas, but they have issues as well.
I think the simplest thing is just run the commands.

> Regards, and thank you very much for giving this issue a thought!
> =

> Felix
>=20

--===============7939451598234452328==--

