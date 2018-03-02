Content-Type: multipart/mixed; boundary="===============5087308983704216310=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2-abrmd can't connect to IBM's tpm_server
Date: Fri, 02 Mar 2018 16:24:38 +0100
Message-ID: <f7866b58-72c0-eaa5-9814-1a76fa826eb5@redhat.com>
In-Reply-To: cbe3c2ac684a47e794b0f89444e35cab@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5087308983704216310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/02/2018 04:15 PM, Scheie, Peter M wrote:
> Hello Javier,
> Thanks for the suggestion about specifying the tcti socket.  I'm getting =
a little further now.  When I run
> =

> 	sudo -u tss ./tpm2-abrmd --tcti socket
> =

> it responds
> =

> ** (tpm2-abrmd:13481): CRITICAL **: Failed to acquire DBus name com.intel=
.tss2.Tabrmd. UID 59 must be allowed to "own" this name. Check DBus config.
> =

> This is because when I installed tpm2-abrmd (i.e., make install), it inst=
alled everything under /usr/local/ including putting the dbus rule into /us=
r/local/etc/dbus-1/system.d/tpm2-abrmd.conf, rather than into /etc/dbus-1/s=
ystem.d/tpm2-abrmd.conf.  What is the appropriate way to change this?  Re-i=
nstall tpm2-abrmd?  If so, how do I tell make or configure to install every=
thing relative to root (/)?  For other unrelated reasons, I also installed =
tpm2-abrmd to /tmp/tpm2-abrmd using the DESTDIR argument for make; but this=
 installs everything into /tmp/tpm2-abrmd/usr/local (which was fine for tha=
t purpose) which isn't what I need.
> =

> Peter
> =


You need to choose those at configure time, i.e:

$ ./configure --with-dbuspolicydir=3D/etc/dbus-1/system.d --with-udevrulesd=
ir=3D/usr/lib/udev/rules.d --with-systemdsystemunitdir=3D/usr/lib/systemd/s=
ystem --libdir=3D/usr/lib64 --prefix=3D/usr

About what the correct thing to do, I would first cleanup with make uninsta=
ll
and then make install in the correct location after re-running configure ag=
ain.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============5087308983704216310==--

