Content-Type: multipart/mixed; boundary="===============7361471890757584391=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] Failed to stat tpm2-abrmd
Date: Tue, 05 Dec 2017 14:41:26 +0100
Message-ID: <d33a1881-8a41-6fea-b6fc-7db70e6be4ef@redhat.com>
In-Reply-To: c8590ee7-a05b-7723-35e0-1c4f24ccd83a@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7361471890757584391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/05/2017 02:30 PM, Javier Martinez Canillas wrote:
> Hello Arvind,
> =

> On 12/04/2017 10:28 PM, Arvind Kumar wrote:
>> Hi There,
>>
>> I'm trying to bringup tpm2-abrmd.service and it fails to start. Any help=
 is
>> appreciated !
>>
>> *A. journalctl -xe:*
>>
>>
>> -- Unit tpm2-abrmd.service has begun starting up.
>>
>> Dec 04 21:16:41 localhost tpm2-abrmd[1859]: *Failed to acquire DBus name
>> com.intel.tss2.Tabrmd. UID 1002 must be allowed to "own" this name. *
>>
> =

> As the message says, the tpm2-abrmd daemon failed to acquire the tpm2-abr=
md well
> known name. You are missing the D-Bus configuration snippet to allow this.
> =

> Please take a look to this issue for more infomation:
> =

> https://github.com/intel/tpm2-tools/issues/527
>

I see that you are using Debian, I'm not sure what path its D-Bus daemon us=
es to
get the config snippets, but for example in Fedora it uses /etc/dbus-1/syst=
em.d.

So to build from source and make sure that's installed in the correct locat=
ion,
you need to pass --with-dbuspolicydir=3D/etc/dbus-1/system.d as configure o=
ption.

If you installed from a package, then I think that's wrong and you have to =
file
a bug for Debian.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============7361471890757584391==--

