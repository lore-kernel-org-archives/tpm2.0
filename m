Content-Type: multipart/mixed; boundary="===============5955753457908146914=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
Date: Wed, 14 Feb 2018 09:02:56 +0100
Message-ID: <33ea4bba-a270-5b81-29a5-162f484360e0@redhat.com>
In-Reply-To: DBXPR03MB5756CC564E5F9D1BDF95D5FF6F50@DBXPR03MB575.eurprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5955753457908146914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/14/2018 08:42 AM, Moneeb Azhar wrote:
> I am  using the ibm simulator and it starts up fine. However:
> =

> $ ls -l /dev/tpm0
> ls: cannot access '/dev/tpm0': No such file or directory
> =

> =

> Is /dev/tpm0 required while using the simulator?
>

If you are using the simulator, then you need to use the socket TCTI instead
of the device TCTI.

I can't say what's the exact command to do it because there were some chang=
es
in master recently and I still didn't have time to catch up.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

> ________________________________
> From: Tricca, Philip B <philip.b.tricca(a)intel.com>
> Sent: Wednesday, February 14, 2018 3:11 AM
> To: Moneeb Azhar
> Cc: tpm2(a)lists.01.org
> Subject: RE: TCTI initialization fails with error 0xc000b
> =

> =

> You=E2=80=99re making progress. This time the daemon loaded the TCTI prop=
erly but the TCTI initialization function failed. For the device TCTI this =
is 99% an issue with permissions on /dev/tpm0. Check to see which user can =
access this device (root?) and then run the daemon as that user. Ideally th=
is will be an unprivileged user and most distros use one called =E2=80=98ts=
s=E2=80=99: https://github.com/tpm2-software/tpm2-abrmd/blob/master/INSTALL=
.md#system-user--group
> =

> [https://avatars2.githubusercontent.com/u/34488697?s=3D400&v=3D4]<https:/=
/github.com/tpm2-software/tpm2-abrmd/blob/master/INSTALL.md#system-user--gr=
oup>
> =

> tpm2-abrmd/INSTALL.md at master - github.com<https://github.com/tpm2-soft=
ware/tpm2-abrmd/blob/master/INSTALL.md#system-user--group>
> github.com
> This is a quick set of instructions to build, install and run the tpm2-ab=
rmd. Dependencies. To build and install the tpm2-abrmd software the followi=
ng dependencies ...
> =

> =

> =

> =

> Philip
> =

> =

> =

> From: Moneeb Azhar [mailto:moneeb777(a)hotmail.com]
> Sent: 13 February, 2018 12:45
> To: Tricca, Philip B <philip.b.tricca(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: TCTI initialization fails with error 0xc000b
> =

> =

> =

> The workaround leads to a similar error:
> =

> =

> =

> ubuntu:~/Desktop/ibmtpm974/src$ tpm2-abrmd --tcti=3Dlibtcti-device.so
> ** (tpm2-abrmd:4065): WARNING **: failed to initialize device TCTI contex=
t: 0xa000a
> ** (tpm2-abrmd:4065): CRITICAL **: TCTI initialization failed: 0xa000a
> =

> This is similar to issue #92 but I am already following the steps suggest=
ed in the comments there.
> =

> =

> =

> =

> =

> ________________________________
> =

> From: Tricca, Philip B <philip.b.tricca(a)intel.com<mailto:philip.b.tricc=
a(a)intel.com>>
> Sent: Tuesday, February 13, 2018 11:38 PM
> To: Moneeb Azhar
> Cc: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> Subject: RE: TCTI initialization fails with error 0xc000b
> =

> =

> =

> I triaged this last night. It=E2=80=99s a bug in the logic that selects t=
he default TCTI. I=E2=80=99ve got an issue in the tracker for it here: http=
s://github.com/tpm2-software/tpm2-abrmd/issues/327. You can work around it =
by explicitly selecting the device TCTI with the following option: `--tcti=
=3Dlibtcti-device.so`. I=E2=80=99ll be fixing this up today and likely chan=
ging the way we specify the TCTI to align with the tools `--tcti` option.
> =

> [https://avatars0.githubusercontent.com/u/1550813?s=3D400&v=3D4]<https://=
github.com/tpm2-software/tpm2-abrmd/issues/327>
> =

> =

> sane default TCTI =C2=B7 Issue #327 =C2=B7 tpm2-software/tpm2-abrmd<https=
://github.com/tpm2-software/tpm2-abrmd/issues/327>
> =

> github.com
> =

> It looks like, when provided with no --tcti option we're not picking a sa=
ne default value for the TCTI library. If the option is omitted we should d=
efault to the device TCTI.
> =

> =

> =

> =

> Best,
> =

> Philip
> =

> =

> =

> From: Moneeb Azhar [mailto:moneeb777(a)hotmail.com]
> Sent: 13 February, 2018 04:50
> To: Tricca, Philip B <philip.b.tricca(a)intel.com<mailto:philip.b.tricca(=
a)intel.com>>
> Cc: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> Subject: Re: TCTI initialization fails with error 0xc000b
> =

> =

> =

> Hey,
> =

> =

> =

> So from what I have gathered, tabrmd is designed to connect directly to t=
he simulator without the need to pass any options by using --tcti. I tried =
doing this and get the exact same error:
> =

> =

> =

> ubuntu:~/Desktop/ibmtpm974/src$ sudo tpm2-abrmd  --allow-root
> ** (tpm2-abrmd:105445): WARNING **: Failed to get reference to symbol: tp=
m2-abrmd: undefined symbol: Tss2_Tcti_Info
> ** (tpm2-abrmd:105445): CRITICAL **: TCTI initialization failed: 0xc000b
> =

> I  must be doing something wrong but I don't know what. Are there any log=
 files I can go through  which could tell me what is happening?
> =

> Regards,
> Moneeb
> =

> =

> =

> =

> =

> ________________________________
> =

> From: Tricca, Philip B <philip.b.tricca(a)intel.com<mailto:philip.b.tricc=
a(a)intel.com>>
> Sent: Monday, February 12, 2018 9:04 PM
> To: Moneeb Azhar
> Cc: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> Subject: RE: TCTI initialization fails with error 0xc000b
> =

> =

> =

> Apologies in advance for top posting. I=E2=80=99m stuck on a windows syst=
em while traveling.
> =

> =

> =

> It seems as though your issue is related to a recent change to the way we=
=E2=80=99re initializing the TCTI modules. This caused a few changes to the=
 relevant command line options like `--tcti`. If you=E2=80=99re connecting =
the tabrmd up to the TPM device and not the simulator as is described in th=
e wiki page you link, then you=E2=80=99ll either need to either leave the `=
--tcti` option out (the device TCTI should be the default) or use the new f=
orm of the `--tcti` option which is documented in our man pages. The source=
 for the man page and the relevant option can be found here: https://github=
.com/tpm2-software/tpm2-abrmd/blob/master/man/tpm2-abrmd.8.in#L21. Since we=
=E2=80=99re now loading the TCTI shared object using dlopen the string pass=
ed via the `--tcti` option is passed directly to dlopen so the same lookup =
rules apply. `--tcti=3Dlibtcti-device.so` should work for you assuming your=
 LD_CONFIG_PATH is set up right.
> =

> =

> =

> Just a heads up though: https://github.com/tpm2-software/tpm2-abrmd/issue=
s/321 is tracking our work to align the `--tcti` option across the tabrmd a=
nd the tools. The tabrmd is very probably going to adopt the same conventio=
n that Bill implemented for the tools before the next release.
> =

> =

> =

> Hope this helps,
> =

> Philip
> =

> =

> =

> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Moneeb Azhar
> Sent: 12 February, 2018 05:43
> To: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> Subject: [tpm2] TCTI initialization fails with error 0xc000b
> =

> =

> =

> Hi,
> =

> I am trying to setup a TPM development environment on ubuntu16.04 by foll=
owing the installation wiki here: https://github.com/tpm2-software/tpm2-too=
ls/wiki/Getting-Started#installing
> =

> Everything installs correctly but I get the following error:
> =

> $ sudo -u tss tpm2-abrmd --tcti=3Ddevice
> ** (tpm2-abrmd:104197): WARNING **: failed to dlopen file device: device:=
 cannot open shared object file: No such file or directory
> ** (tpm2-abrmd:104197): CRITICAL **: TCTI initialization failed: 0xc000b
> =

> systemctl  show me the following:
> $ sudo systemctl status tpm2-abrmd.service
> =E2=97=8F tpm2-abrmd.service - TPM2 Access Broker and Resource Management=
 Daemon
>    Loaded: loaded (/lib/systemd/system/tpm2-abrmd.service; enabled; vendo=
r preset: enabl
>    Active: inactive (dead)
> =

> How would I go about figuring out what is wrong? I am new to this so any =
help would be highly appreciated.
> =

> Regards,
> Moneeb
> =

> =

> =

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
> =




--===============5955753457908146914==--

