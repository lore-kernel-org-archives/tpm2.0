Content-Type: multipart/mixed; boundary="===============8813876096971650918=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: Re: [tpm2] Simple (hopefully) git rebase question
Date: Thu, 01 Mar 2018 00:45:17 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3AF7302@ORSMSX108.amr.corp.intel.com>
In-Reply-To: c54481f3-2d28-8153-7fbb-7a4a566672bc@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8813876096971650918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry for the confusion, I don't have both "pick squash".  I replaced "pick=
" with "squash".
I think your email client is text only and it did not show that I deleted s=
quash.
I will send a screenshot to reduce confusion.

But here's the real problem---I cannot just rebase my commits.  I can only =
rebase the last comment and previous N commits.  I chose 7 commits:

$ git rebase -I HEAD~7

Is required because I have my commits mixed up with other commits (due to m=
erges with the upstream/master).   So the question I am asking:

How to I do a rebase when other comits are mixed up with mine.  For example:

rebase commit 1 of mine
rebase commit 1 from someone else
rebase commit 2 of mine
rebase commit 2 from someone else
rebase commit 3 from someone else
rebase commit 4 from someone else
rebase commit 3 of mine

Now I just want commits 1 2 3 of mine, but they are mixed up with other com=
mits from other people, so I must specify the last 7 commits.

The strange thing is "git rebase" doesn't show me just the last 7, but more=
 than 7 (about 20 or 30 commits).

Dan

-----Original Message-----
From: Javier Martinez Canillas [mailto:javierm(a)redhat.com] =

Sent: Wednesday, February 28, 2018 4:17 PM
To: Anderson, Daniel <daniel.anderson(a)intel.com>; tpm2(a)lists.01.org
Subject: Re: [tpm2] Simple (hopefully) git rebase question

Hello Dan,

On 02/28/2018 10:03 PM, Anderson, Daniel wrote:
> I am having trouble with git rebase.  It seems to be much more complex th=
an it needs to be.  All I need to do is to merge commits=E2=80=94no conflic=
ts, no undo.
> =

> So I edited the rebase file below and changed the last =E2=80=9Cpick=E2=
=80=9D to =E2=80=9Csquash=E2=80=9D and moved the previous =E2=80=9Cpick=E2=
=80=9D down two lines (because I think the commits I am rebasing must be to=
gether).  Here is the session with the file after editing (changes in bold,=
 deleted lines underlined bold).
> =


I'm using a plain text email client so hard to tell which ones are in bold =
:)

> Any hints?
> =

> Dan
> =

> =

> =

> $ git rebase --abort
> =

> $ git rebase -i HEAD~10
> =

> pick 1c68b3d tabrmd: Set default tcti & conf string in option structure i=
nitialization.
> =

> pick 98a3dd1 TctiDynamic: Fix bad default TCTI library string.
> =

> pick 6f8e54d ci: Install libgcrypt development package.
> =

> pick 52de684 tabrmd: Combine --tcti and --tcti-conf string.
> =

> pick 377792a tcti-util: Allow shortened TCTI library names to align with =
the tools.
> =

> pick 5c4be78 D-Bus: install a service file to allow on-demand systemd =

> unit activation
> =

> pick 84e9e9a tcti: fix build error due wrong TCTI transmit functions =

> signatures
> =

> pick fb9bc17 Update our TCTI implementation to align with upstream change=
s.
> =

> pick 1317cbe D-Bus: install a service file to allow on-demand systemd =

> unit activation
> =


All these commits are already in the master branch. You should just rebase =
your commits. Although it doens't hurt, I don't see why not just rebasing y=
ours.

> pick 70c9fac INSTALL.md: Document Configure Flags Better [Moved down 2 =

> lines]
> =

> pick 5c6ec7f tcti: fix build error due wrong TCTI transmit functions =

> signatures
>

This one is strange... it looks like my commit:

  84e9e9a tcti: fix build error due wrong TCTI transmit functions signatures

But with a different SHA-1... how did it ended there?

> pick 3dbc9f2 Update our TCTI implementation to align with upstream change=
s.
>

And this seems to be Philip's

  fb9bc17 Update our TCTI implementation to align with upstream changes.

Again with a different SHA-1. =


> pick 70c9fac INSTALL.md: Document Configure Flags Better
>

And this is a duplication of your commit 70c9fac listed above, but again wi=
th a different SHA-1.

> pick squash 23515f7 INSTALL.md: Document Configure Flags Better
>

And this. I can't see the commit content, I just say this because the subje=
ct lines "INSTALL.md: Document Configure Flags Better" are the same.

BTW, you didn't replace pick for squash but have both "pick squash" there.

> # Rebase 1743dca..8e6b37c onto 1743dca (13 command(s))
> =

> =

> =

> =

> =

> Rebasing (6/13)Rebasing (7/13)Rebasing (8/13)Rebasing (9/13)The previous =
cherry-pick is now empty, possibly due to conflict resolution.
> =

> If you wish to commit it anyway, use:
> =

> =

> =

>     git commit --allow-empty
> =

> =

> =

> Otherwise, please use 'git reset'
> =

> interactive rebase in progress; onto 1743dca
> =

> Last commands done (9 commands done):
> =

>    pick fb9bc17 Update our TCTI implementation to align with upstream cha=
nges.
> =

>    pick 1317cbe D-Bus: install a service file to allow on-demand =

> systemd unit activation
> =

> Next commands to do (4 remaining commands):
> =

>    pick 5c6ec7f tcti: fix build error due wrong TCTI transmit =

> functions signatures
>

So the empty cherry-pick is because as mentioned, this commit already exist=
s in the branch. I don't know why it ended there but I guess it may have so=
mething to do with a merge you did before.

It would be good if you can start from a fresh checkout and share the exact=
 list of commands you executed to see how you ended in that state.

Best regards,
--
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement Red Hat

--===============8813876096971650918==--

