Content-Type: multipart/mixed; boundary="===============6807051314977616111=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-tools Busybox style executable
Date: Tue, 09 Jun 2020 15:16:26 +0000
Message-ID: <SN6PR11MB343780B0210507AB0721D0E1B8820@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6807051314977616111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

We have a PR that makes the tpm2-tools project busybox style.... tools can =
be run in 1 of 2 ways:
1. Commandlet style with tpm2 as the executable: tpm2 getrandom
2. Symlink style, where a symlink tpm2_getrandom  is created to tpm2 execut=
able and argv[0] is interrogated for what to do.

The symlink install should preserver backwards compatibility. If you were r=
unning them from a build directory, just do something like
make install, or if you don't want them system wide make install DESTDIR=3D=
$HOME/bin; your choice of directory. Then just
make sure it's on PATH.

Benefits to this:
Drop one exe onto a device, and your good. Another huge win is space saving=
s. Since we only have to link
The static library once, you don't get N copies of that in every tool, and =
we don't need to make that a shared
object to pick up that win.

Downsides
CURL is now a requirement for the overall busybox executable. Before it was=
 only for a handful of tools, I think tpm2_createek offhand.
Another one is we use the constructor paradigm in the tools so we can get e=
xecution before main() and register the commandlets.
This could always be hardcoded into a list if needed, but this compiler fea=
ture is widely adopted. We we're using weak symbols in the
past with no issues, so I don't see this being an issue as well. Also, you =
get all the tools, If we need a only build a subset of tools, a
configure switch  can be added in.

You can find the PR here:
https://github.com/tpm2-software/tpm2-tools/pull/2077/files#submit-review

Please leave your feedback.

Thanks,
Bill

--===============6807051314977616111==--

