Content-Type: multipart/mixed; boundary="===============8797919144130784681=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: abrmd crashing - how to debug? - dbus logs?
Date: Tue, 16 Mar 2021 11:46:43 -0700
Message-ID: <e486a1d0-92bd-1625-1d63-0cb87cbad021@intel.com>
In-Reply-To: OF919BF68A.8F376E7D-ON0025869A.0055CAA8-8525869A.00563DE3@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8797919144130784681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/16/21 8:41 AM, Kenneth Goldman wrote:
> This fixes the startup problem, where abrmd expected one handle and
> receives two.
> =

> It does not fix the crash.
> =

> On a loop of pcrread, it fails after 695, 324, 951, and 26 passes. This
> looks random to me, not some hard limit.

Thanks Ken,
So what I've found so far is that some the functions we are using to
interact with dbus, like
g_dbus_method_invocation_return_value_with_unix_fd_list() [1], which use
the AF_LOCAL aka Unix type sockets, behave differently on WSL compering
to a native Linux system. After some investigation I found out that WSL
has its own problems with the Unix sockets [2] and socketpair()
implementation [3], which we rely on.
To fix that would require some redesigning of the underlined dbus
back-end and validation time, which we can't afford at the moment.
All the validation for for tpm2-abrmd was done on Linux and FreeBSD and
these are the systems we support and recommend.
I would consider running tpm2-abrmd on WSL as experimental.

[1]
https://developer.gnome.org/gio/stable/GDBusMethodInvocation.html#g-dbus-me=
thod-invocation-return-value-with-unix-fd-list
[2] https://github.com/microsoft/WSL/issues/4240
[3] https://github.com/microsoft/WSL/issues/3100

Thanks,
-- =

Tadeusz
--===============8797919144130784681==--

