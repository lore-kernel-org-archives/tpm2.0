Content-Type: multipart/mixed; boundary="===============2210883070553753503=="
MIME-Version: 1.0
From: Felix Rubio Dalmau <felix at kngnt.org>
Subject: [tpm2] Re: System design question
Date: Sun, 28 Aug 2022 11:38:54 +0200
Message-ID: <2843585.e9J7NaK4W3@polaris>
In-Reply-To: 1565210bf6090620e74aa012aa8e840de0aff6c1.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2210883070553753503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey William,

Thank you for your answer, I have just been playing with the tpm2_tools in =

latest Debian 11.4, trying to follow your reasoning, but there is something=
 I =

am missing:

As secureboot does not check the initramfs, my approach is to make the full =

disk encryption key depend on PCR registers 0,1,7 and 9 (for what I have re=
ad, =

from kernel 5.13 on, the measurements of initramfs go to PCR 9), or a rescu=
e =

password. This approach implies having a script in place so that the first =
time =

a new kernel + initramfs boot I will get those measurements somewhere and t=
hen =

I can rebuild the policies with the correct contents (that is, until I find=
 a =

way to precalculate the value of PCR 9 out of the initramfs file itself... =

assuming is possible).

In your email you say "[...]
> So really all that needs to occur is the code/script needs to be in
> place that does the normal PCR flow or rescue flow. The create call
> can be hardcoded to the known hash, that isn't changing and can be
> included in the filesystem when generated.
[...]" but I do not see how would that be achieved: my current normal PCR f=
low =

goes like this:

tpm2_startauthsession -Q -S session.ctx --policy-session
tpm2_policypcr -Q -S session.ctx -l sha256:0,1,7,9
tpm2_policypassword -Q -S session.ctx
tpm2_policyor -Q -S session.ctx sha256:rescue.policy,regular.policy
SECRET=3D`tpm2_unseal -Q -c 0x81010001 -p "session:session.ctx+$REGULAR_PAS=
S"`
tpm2_flushcontext -Q session.ctx
tpm2_pcrextend -Q 0:sha256=3D0000000000000000000000000000000000000000000000=
0...

I think I understand, from user answer, that I should be able to replace
        tpm2_policyor -Q -S session.ctx sha256:rescue.policy,regular.policy
by
        tpm2_policyor -Q -S session.ctx <output of precalculated digest>

But still, this does not fix the issue: the moment I hardcode this value in=
 my =

initramfs, its measurement on PCR 9 will change. The only way out I see is =
to =

avoid storing this information on the initramfs itself, and this is when th=
e =

nvram came into the picture. Given that nvram is scarce, maybe I can get aw=
ay =

by storing on it the digest of the policyor, and adding it somehow to the =

session after reading it?

Regards, and thank you very much for giving this issue a thought!

Felix


--===============2210883070553753503==--

