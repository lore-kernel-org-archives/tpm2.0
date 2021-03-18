Content-Type: multipart/mixed; boundary="===============4050876581098360524=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: abrmd crashing - how to debug? - dbus logs?
Date: Thu, 18 Mar 2021 09:47:56 -0700
Message-ID: <e3e37052-36a4-0946-a8d8-bfc0ad6e6706@gmail.com>
In-Reply-To: e486a1d0-92bd-1625-1d63-0cb87cbad021@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4050876581098360524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/16/21 11:46 AM, Tadeusz Struk wrote:
> After some investigation I found out that WSL
> has its own problems with the Unix sockets [2] and socketpair()
> implementation [3], which we rely on.
> To fix that would require some redesigning of the underlined dbus
> back-end and validation time, which we can't afford at the moment.
> All the validation for for tpm2-abrmd was done on Linux and FreeBSD and
> these are the systems we support and recommend.
> I would consider running tpm2-abrmd on WSL as experimental.
> =

> [1]
> https://developer.gnome.org/gio/stable/GDBusMethodInvocation.html#g-dbus-=
method-invocation-return-value-with-unix-fd-list
> [2] https://github.com/microsoft/WSL/issues/4240
> [3] https://github.com/microsoft/WSL/issues/3100
> =


FWIW I was running the same tests on native Linux with many processes
talking to tabrmd on the session bus for hours. It looks pretty stable.
With the same thing running on WSL the dbus daemon crashes after 5-10
minutes and with it I'm crashing my whole mate-session.
--===============4050876581098360524==--

