Content-Type: multipart/mixed; boundary="===============1199000144983147133=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Approaching 100 hours of troubleshooting
Date: Mon, 25 Nov 2019 16:51:49 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E47E1F@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CALtZhhPfpQ4Cc_ZVGeuAXO9sWakWjBMWz2qya6ZxK8utM8YJEw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1199000144983147133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Frederick Gotham [mailto:cauldwell.thomas(a)gmail.com]
> Sent: Saturday, November 23, 2019 12:07 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Approaching 100 hours of troubleshooting
> =

> Hi
> =

> I'm trying to get the TPM2 working in embedded Linux, and I've been
> troubleshooting for nearly two weeks now.
> =

> I thought it would be a good idea to get the latest releases of the follo=
wing
> packages:
> =

>     tpm2-tss
>     tpm2-tools
>     tpm2-tss-engine
> =

> And also the latest commit of: tpm2-pkcs11
> =

> All I have succeeded in doing so far is getting random numbers from the T=
PM2
> chip. I haven't be able to store (or retrieve) keys, nor have I been able=
 to encrypt
> or decrypt data.
> =

> The first problem I'm having is that the command line options for the too=
ls (and
> also scripts) have been changed several times. Every time I try to follow=
 an
> example I find on the web, I get "unrecognised option -C".

4.0+ will be stable interface moving forward. However, =

our man pages should be the up-to-date examples. For encrypting and decrypt=
ing
a simple example can be found in the manpage:

https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_encryptdec=
rypt.1.md

> =

> In order to try follow examples I find online, I have repeatedly upgraded=
 and
> downgraded my versions of the packages, sometimes even mixing old tools w=
ith
> new tools (sometimes even rewinding to an historical commit in Github bet=
ween
> official releases).

Yeah don't do that. Stay on tpm2-tools >=3D 4.0. 3.X is pretty much EOL. Se=
e the dependency matrix
Link below for recommended versions.

> =

> Can someone please suggest what are the best stable versions of these pac=
kages
> for working with embedded Linux?

tpm2-tools: 4.0
tpm2-tss: >=3D 2.3.1
tpm2-abrmd : >=3D 2.2.0

https://github.com/tpm2-software/tpm2-tools/wiki/Dependency-Matrix



> =

> Another thing:
> When my device boots up, I can go into the BIOS where I see a lot of opti=
ons for
> Trusted Platform. I'm not exactly sure what these options actually do. Can
> someone advise me which settings in particular to watch out for? I see on=
e about
> fTPM but I'm not sure what it does.

--===============1199000144983147133==--

