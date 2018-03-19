Content-Type: multipart/mixed; boundary="===============8433442568699358327=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] Problem with Infineon Iridium SLB 9670 TPM2.0
Date: Sun, 18 Mar 2018 22:07:37 -0700
Message-ID: <20180319050737.GE8769@intel.com>
In-Reply-To: trinity-6e000144-63dc-4e2f-b8d1-cd689dbbc4a3-1521378255578@3c-app-gmx-bs78
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8433442568699358327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey there madprops,

On Sun, Mar 18, 2018 at 02:04:15PM +0100, madprops(a)gmx.net wrote:
> <html><head>
> <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">=
</head><body><div style=3D"font-family: Verdana;font-size: 12.0px;"><div>
> <div class=3D"signature">
> <div class=3D"signature">
> <div>I'm trying to get an &quot;Infineon Iridium SLB 9670 TPM 2.0 SPI Boa=
rd&quot; run on my Raspberry Pi 3. I have downloaded, compiled and installe=
d the latest versions of tpm2-abrmd, tpm2-tss and tpm2-tools. I started tpm=
2-abrmd as root, hoping that I can then interact with the Infineon TPM usin=
g tpm2-tools. &quot;tpm2_pcrlist&quot; and all other tpm2_* commands, howev=
er, return error &quot;ERROR: Failed to initialize tcti context: 0x1&quot;.=
</div>
> =


Can you please provide some more info about your configuration?
Specifically:
- the version of the TSS2 libraries you're using
- the version of the tabrmd you're using
- the configuration options you're passing to each

A log file from the tabrmd with logging dialed all the way up would be
helpful. Since tabrmd uses glib and it's logging infrastructure you dial
up the debug output all the way by setting `G_MESSAGES_DEBUG=3Dall` in the
daemon's environment.

> <div>&nbsp;</div>
> =

> <div>Any ideas? Thanks!</div>

The most common issue we've seen people run into when installing from
source is that the default value for the `prefix` and some other
installation directories aren't what most expect.

Still, if you're running the daemon as root you shouldn't have any
issues w/r to permissions on the /dev/tpm0 device node so I wonder if
this node even exists on your platform. You may want to check to see if
`/dev/tpm0` is even present on your system. You're on an ARM platform
which means the kernel will only be aware of the TPM2 device you've
added if you configure the device tree properly.

Regards,
Philip

> <div>pi(a)raspberrypi:~/TPM/tpm2-abrmd $ uname -a<br>
> Linux raspberrypi 4.4.50-v7&#43; #1 SMP Wed Mar 14 14:01:00 PDT 2018 armv=
7l GNU/Linux (&lt;=3D=3D includes patch provided by Infineon)</div>
> =

> <div>&nbsp;</div>
> =

> <div>pi(a)raspberrypi:~/TPM/tpm2-abrmd $ dmesg | grep tpm<br>
> [&nbsp;&nbsp;&nbsp; 3.700384] tpm_spi_tis spi0.1: 2.0 TPM (device-id 0xB6=
BC, rev-id 16)</div>
> =

> <div>&nbsp;</div>
> =

> <div>pi(a)raspberrypi:/etc $ cat /etc/os-release<br>
> PRETTY_NAME=3D&quot;Raspbian GNU/Linux 9 (stretch)&quot;<br>
> NAME=3D&quot;Raspbian GNU/Linux&quot;<br>
> VERSION_ID=3D&quot;9&quot;<br>
> VERSION=3D&quot;9 (stretch)&quot;<br>
> ID=3Draspbian<br>
> ID_LIKE=3Ddebian<br>
> HOME_URL=3D&quot;http://www.raspbian.org/&quot;<br>
> SUPPORT_URL=3D&quot;http://www.raspbian.org/RaspbianForums&quot;<br>
> BUG_REPORT_URL=3D&quot;http://www.raspbian.org/RaspbianBugs&quot;</div>
> </div>
> </div>
> </div></div></body></html>

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2


--===============8433442568699358327==--

