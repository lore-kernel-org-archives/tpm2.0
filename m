Content-Type: multipart/mixed; boundary="===============6191732508396891621=="
MIME-Version: 1.0
From: Stuart Yoder <stuart.yoder at arm.com>
Subject: [tpm2] ERROR: Failed to initialize tcti context: 0x1
Date: Thu, 21 Sep 2017 16:48:58 -0500
Message-ID: <a34d069a-1e5d-c72d-a931-4767645353b9@arm.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6191732508396891621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm trying to build/test tpm2-tools and am running into an issue.  This is =
on
an Ubuntu 16.04 machine and I know the tpm is alive and functioning
because the distro tpm2-tools package worked.  That's an older codebase, so=
 I
wanted to build everything from source.

So I've successfully built:  tpm2-tss, tpm2-tools, tpm2-abrmd.

I followed the build/install instructions here:
https://github.com/01org/tpm2-abrmd/issues/92
...which seem to follow what is recommended in INSTALL.md.

I start tpm2-abrmd like this:
sudo -u tss tpm2-abrmd --tcti=3Ddevice &

..and it runs, but when running a command like
tpm2_pcrlist I get this error:

   ERROR: Failed to initialize tcti context: 0x1

Also, I built abrmb with these options:
--enable-unit --with-simulatorbin=3D/usr/local/bin/tpm_server

...and ran make check.  The unit tests pass, but the
integration tests fail.

Anything obvious I am missing?

Thanks,
Stuart

--===============6191732508396891621==--

