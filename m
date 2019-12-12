Content-Type: multipart/mixed; boundary="===============2540790244810404174=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.org>
Subject: [tpm2] Re: [tpm2][tpm2-abrmd]tpm2-abrmd.service may run before udev
 rule.
Date: Thu, 12 Dec 2019 11:09:15 -0800
Message-ID: <9de29687-a740-1354-d6fb-c2eeabe0b3ba@twobit.org>
In-Reply-To: CAOCvsSkFdrsnJsjKKAsmu0nJZKqaZ5+RnNNj85eVeXRU2fwgNQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2540790244810404174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Steve. I don't have much time these days to work on this stuff so
no worries about the delay. I'll get this in and turn the crank on a
bugfix release.

Thanks,
Philip

On 12/12/19 10:52 AM, Steven Clark wrote:
> Here's a version with a sign-off.  By the time I hit a lull I had to
> resynthesize the repository used to build the patch.  At least I get
> some process practice with something innocuous this way.
> =

> From 4b95f1d7988a2f4d4d5e1f7b19602a8f0b1c66a4 Mon Sep 17 00:00:00 2001
> From: Steven Clark <davolfman(a)gmail.com>
> Date: Wed, 27 Nov 2019 21:10:00 +0000
> Subject: [PATCH 1/1] Hold Resource Manager until tpm is accessible
> =

> In testing in an unusual boot scenario it was discovered that
> tpm2-abrmd.service was starting before udev had changed ownership
> of the TPM device from root to TSS.  This patch changes the
> Systemd unit file to force a udev settle before starting the
> resource manager service.
> =

> Signed-off-by: Steven Clark <davolfman(a)gmail.com>
> ---
>  dist/tpm2-abrmd.service.in | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/dist/tpm2-abrmd.service.in b/dist/tpm2-abrmd.service.in
> index 00aa031..4300cb3 100644
> --- a/dist/tpm2-abrmd.service.in
> +++ b/dist/tpm2-abrmd.service.in
> @@ -1,5 +1,7 @@
>  [Unit]
>  Description=3DTPM2 Access Broker and Resource Management Daemon
> +After=3Dsystemd-udev-settle.service
> +Requires=3Dsystemd-udev-settle.service
> =

>  [Service]
>  Type=3Ddbus
>=20

--===============2540790244810404174==--

