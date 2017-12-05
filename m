Content-Type: multipart/mixed; boundary="===============8925786280468154434=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] Failed to stat tpm2-abrmd
Date: Tue, 05 Dec 2017 14:30:13 +0100
Message-ID: <c8590ee7-a05b-7723-35e0-1c4f24ccd83a@redhat.com>
In-Reply-To: CAHa3UP78hzne_AXvBCe+hnXRx6rWS8Ln9zqUkKHdziJWKfZ6LA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8925786280468154434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Arvind,

On 12/04/2017 10:28 PM, Arvind Kumar wrote:
> Hi There,
> =

> I'm trying to bringup tpm2-abrmd.service and it fails to start. Any help =
is
> appreciated !
> =

> *A. journalctl -xe:*
> =

> =

> -- Unit tpm2-abrmd.service has begun starting up.
> =

> Dec 04 21:16:41 localhost tpm2-abrmd[1859]: *Failed to acquire DBus name
> com.intel.tss2.Tabrmd. UID 1002 must be allowed to "own" this name. *
>

As the message says, the tpm2-abrmd daemon failed to acquire the tpm2-abrmd=
 well
known name. You are missing the D-Bus configuration snippet to allow this.

Please take a look to this issue for more infomation:

https://github.com/intel/tpm2-tools/issues/527
 =

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============8925786280468154434==--

