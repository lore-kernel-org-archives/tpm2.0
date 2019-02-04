Content-Type: multipart/mixed; boundary="===============4672429741213441325=="
MIME-Version: 1.0
From: Andersen, John <john.s.andersen at intel.com>
Subject: Re: [tpm2] tpm2-abrmd in a container
Date: Mon, 04 Feb 2019 10:08:09 -0800
Message-ID: <20190204180809.GA17746@johnsa1-desk.jf.intel.com>
In-Reply-To: CAKrSGQS_pe=U-staHmcyoRYgYofSTexkxSC=sYem=K1r=P9Wcg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4672429741213441325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2019 at 04:57:12PM +0000, Luke Hinds wrote:
>    On Mon, Feb 4, 2019 at 4:12 PM Roberts, William C
>    <[1]william.c.roberts(a)intel.com> wrote:
> =

>      I run it in our CI system which is using a docker container, not
>      sure if that helps
>      But you can look at our scripts for it.
> =

>    Do you mean the following travis-ci file:
>    [2]https://github.com/tpm2-software/tpm2-abrmd/blob/master/.travis.yml#
>    L2
>    I noticed this, but I think its a VM (unless I am mistaken):
>    [3]https://docs.travis-ci.com/user/reference/overview/#virtualization-e
>    nvironments
>    Any pointers to files that reference your container use, would be
>    helpful.
>    Cheers,
>    Luke
> =

>      > -----Original Message-----
>      > From: tpm2 [mailto:[4]tpm2-bounces(a)lists.01.org] On Behalf Of Lu=
ke
>      Hinds
>      > Sent: Monday, February 4, 2019 7:47 AM
>      > To: [5]tpm2(a)lists.01.org
>      > Subject: [tpm2] tpm2-abrmd in a container
>      >
>      > Hello,
>      >
>      > I have been working on trying to get tpm2-abrmd running in a
>      container, but its
>      > proving problematic as there is a requirement on system-d and
>      dbus. This in turn
>      > requires running the container as privileged and mounting the
>      hosts cgroup (and
>      > adding cap sys-admin).
>      >
>      > My reason for using a container, is for CI / functional testing of
>      a project that will
>      > use abrmd and having a lightweight means to test against the
>      resource manager
>      > running in a container.
>      >
>      > I am still early in looking at ways to achieve this, so I wanted
>      to ask if any others
>      > have snippets of previous attempts (successful or not) they could
>      share?
>      >
>      > Thanks,
>      >
>      > Luke
> =

>    --
>    Luke Hinds | NFV Partner Engineering | CTO Office | Red Hat
>    e: [6]lhinds(a)redhat.com | irc: lhinds @freenode | t: +44 12 52 36 24=
83
> =

> References
> =

>    1. mailto:william.c.roberts(a)intel.com
>    2. https://github.com/tpm2-software/tpm2-abrmd/blob/master/.travis.yml=
#L2
>    3. https://docs.travis-ci.com/user/reference/overview/#virtualization-=
environments
>    4. mailto:tpm2-bounces(a)lists.01.org
>    5. mailto:tpm2(a)lists.01.org
>    6. mailto:lhinds(a)redhat.com

Some dbus stuff happened in the tools repo recently. Not sure if this would=
 be
of help.
https://github.com/tpm2-software/tpm2-tools/commit/9a6430ef293bc1a506224431=
af9370c7748f39b4

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2


--===============4672429741213441325==--

