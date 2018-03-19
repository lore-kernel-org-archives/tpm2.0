Content-Type: multipart/mixed; boundary="===============8793028200071220832=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] Problem with Infineon Iridium SLB 9670 TPM2.0
Date: Mon, 19 Mar 2018 08:31:04 -0700
Message-ID: <20180319153104.GG8769@intel.com>
In-Reply-To: 741c056e-69bd-1998-3cd8-dd834b9e18c3@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8793028200071220832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2018 at 11:49:45AM +0100, Javier Martinez Canillas wrote:
> On 03/19/2018 06:07 AM, Philip Tricca wrote:
> > Hey there madprops,
> > =

> > On Sun, Mar 18, 2018 at 02:04:15PM +0100, madprops(a)gmx.net wrote:
> >> <html><head>
> >> <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-=
8"></head><body><div style=3D"font-family: Verdana;font-size: 12.0px;"><div>
> >> <div class=3D"signature">
> >> <div class=3D"signature">
> >> <div>I'm trying to get an &quot;Infineon Iridium SLB 9670 TPM 2.0 SPI =
Board&quot; run on my Raspberry Pi 3. I have downloaded, compiled and insta=
lled the latest versions of tpm2-abrmd, tpm2-tss and tpm2-tools. I started =
tpm2-abrmd as root, hoping that I can then interact with the Infineon TPM u=
sing tpm2-tools. &quot;tpm2_pcrlist&quot; and all other tpm2_* commands, ho=
wever, return error &quot;ERROR: Failed to initialize tcti context: 0x1&quo=
t;.</div>
> >>
> > =

> > Can you please provide some more info about your configuration?
> > Specifically:
> > - the version of the TSS2 libraries you're using
> > - the version of the tabrmd you're using
> > - the configuration options you're passing to each
> > =

> > A log file from the tabrmd with logging dialed all the way up would be
> > helpful. Since tabrmd uses glib and it's logging infrastructure you dial
> > up the debug output all the way by setting `G_MESSAGES_DEBUG=3Dall` in =
the
> > daemon's environment.
> > =

> >> <div>&nbsp;</div>
> >>
> >> <div>Any ideas? Thanks!</div>
> > =

> > The most common issue we've seen people run into when installing from
> > source is that the default value for the `prefix` and some other
> > installation directories aren't what most expect.
> > =

> > Still, if you're running the daemon as root you shouldn't have any
> > issues w/r to permissions on the /dev/tpm0 device node so I wonder if
> > this node even exists on your platform. You may want to check to see if
> > `/dev/tpm0` is even present on your system. You're on an ARM platform
> > which means the kernel will only be aware of the TPM2 device you've
> > added if you configure the device tree properly.
> > =

> > Regards,
> > Philip
> > =

> =

> We should probably add a FAQ to the tpm2-{tss,abrmd,tools} projects, since
> the same questions are being repeated over and over in the mailing list.

No doubt. The first bit about providing additional data in bug reports /
questions should probably land in the CONTRIBUTING.md files. A FAQ on
the right wikis would be a good thing as well.

With the churn in the TSS2 libs dying down I'll be refocusing on the
tabrmd so I'll probably start there. If you've got the cycles and the
motivation feel free to jump on the wiki and start adding content.

Philip

--===============8793028200071220832==--

