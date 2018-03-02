Content-Type: multipart/mixed; boundary="===============7300459964316978333=="
MIME-Version: 1.0
From: Scheie, Peter M <Petre.Scheie at gd-ms.com>
Subject: Re: [tpm2] tpm2-abrmd can't connect to IBM's tpm_server
Date: Fri, 02 Mar 2018 15:15:31 +0000
Message-ID: <cbe3c2ac684a47e794b0f89444e35cab@AZDC-MMB02.GD-MS.US>
In-Reply-To: b0d1a928-f6af-9e4a-98e3-2b12094a34a3@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7300459964316978333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Javier,
Thanks for the suggestion about specifying the tcti socket.  I'm getting a =
little further now.  When I run

	sudo -u tss ./tpm2-abrmd --tcti socket

it responds

** (tpm2-abrmd:13481): CRITICAL **: Failed to acquire DBus name com.intel.t=
ss2.Tabrmd. UID 59 must be allowed to "own" this name. Check DBus config.

This is because when I installed tpm2-abrmd (i.e., make install), it instal=
led everything under /usr/local/ including putting the dbus rule into /usr/=
local/etc/dbus-1/system.d/tpm2-abrmd.conf, rather than into /etc/dbus-1/sys=
tem.d/tpm2-abrmd.conf.  What is the appropriate way to change this?  Re-ins=
tall tpm2-abrmd?  If so, how do I tell make or configure to install everyth=
ing relative to root (/)?  For other unrelated reasons, I also installed tp=
m2-abrmd to /tmp/tpm2-abrmd using the DESTDIR argument for make; but this i=
nstalls everything into /tmp/tpm2-abrmd/usr/local (which was fine for that =
purpose) which isn't what I need.

Peter

-----Original Message-----
From: Javier Martinez Canillas [mailto:javierm(a)redhat.com] =

Sent: Wednesday, February 28, 2018 5:53 PM
To: Scheie, Peter M; tpm2(a)lists.01.org
Subject: Re: [tpm2] tpm2-abrmd can't connect to IBM's tpm_server

Hello Peter,

On 02/27/2018 07:51 PM, Scheie, Peter M wrote:
> I'm trying to get tpm2-abrmd to connect to the IBM tpm_server =

> simulator, as described in =

> https://github.com/tpm2-software/tpm2-tools/wiki/Getting-Started,  but =

> it fails saying
> =


That document is pretty outdated, I've filled an issue to take care of it:

https://github.com/tpm2-software/tpm2-tools/issues/915

> Failed to initialize device TCTI context: 0xa000a
> =


Yes, my guess is that this is related to the fact that the tpm2-abrmd defau=
lt TCTI is the device one, so if you don't have a TPM device or are running=
 with an user without access to the TPM character device, then will fail wi=
th that error code.

> I've tried versions 1119 and 974 of tpm_server, but got the same result. =
 For tpm2-abrmd, I'm using version 1.2.0 from the tarball under 'Releases'.=
  Netstat shows tpm_server is listening on ports 2322 and 2321, so I suspec=
t something is wrong on the tpm2-abrmd end.
>
> Suggestions?
>

Can you share the command you are using to start the tpm2-abrmd? You need t=
o pass the --tcti socket option, i.e:

sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti socket

Best regards,
--
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement Red Hat

--===============7300459964316978333==--

