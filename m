Content-Type: multipart/mixed; boundary="===============0079674657832877235=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] ERROR: Failed to initialize tcti context: 0x1
Date: Fri, 22 Sep 2017 14:24:11 +0200
Message-ID: <bd7af717-c400-801d-65f6-2e9de76dbc15@redhat.com>
In-Reply-To: f24e6843-2862-ea63-5a48-3c398a07f662@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0079674657832877235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/22/2017 11:26 AM, Javier Martinez Canillas wrote:
> On 09/22/2017 02:25 AM, Stuart Yoder wrote:
> =

> The only thing that I can think of is that your tpm2-tools were not built=
 with
> TCTI abrmd support. This may happen if you built tpm2-tools before tpm2-a=
brmd,
> since tpm2-tools' configure script check for the TCTI abrmd header and li=
bs.
> =

> Can you please check if configure said: "checking for TCTI_TABRMD... yes"=
 and
> if your tools binaries are dynamically linked against the TCTI tabrmd lib=
rary?
> =

> $ ldd $(which tpm2_pcrlist) | grep libtcti-tabrmd
>         libtcti-tabrmd.so.0 =3D> /lib64/libtcti-tabrmd.so.0 (0x00007f3adf=
9a8000)
> =


Also, make sure you make clean before since there are some ifdefery magic to
choose the default TCTI used.

You can force using a specific TCTI with the common options or environment
variables, i.e:

$ tpm2_pcrlist -L sha1:7 -T abrmd

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============0079674657832877235==--

