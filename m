Content-Type: multipart/mixed; boundary="===============5157855954175301647=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2-abrmd can't connect to IBM's tpm_server
Date: Thu, 01 Mar 2018 00:53:22 +0100
Message-ID: <b0d1a928-f6af-9e4a-98e3-2b12094a34a3@redhat.com>
In-Reply-To: 4dbc7c4b20d5477c9b0df40ea74d5e1d@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5157855954175301647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Peter,

On 02/27/2018 07:51 PM, Scheie, Peter M wrote:
> I'm trying to get tpm2-abrmd to connect to the IBM tpm_server simulator, =
as described in https://github.com/tpm2-software/tpm2-tools/wiki/Getting-St=
arted,  but it fails saying
> =


That document is pretty outdated, I've filled an issue to take care of it:

https://github.com/tpm2-software/tpm2-tools/issues/915

> Failed to initialize device TCTI context: 0xa000a
> =


Yes, my guess is that this is related to the fact that the tpm2-abrmd defau=
lt
TCTI is the device one, so if you don't have a TPM device or are running wi=
th
an user without access to the TPM character device, then will fail with that
error code.

> I've tried versions 1119 and 974 of tpm_server, but got the same result. =
 For tpm2-abrmd, I'm using version 1.2.0 from the tarball under 'Releases'.=
  Netstat shows tpm_server is listening on ports 2322 and 2321, so I suspec=
t something is wrong on the tpm2-abrmd end.
>
> Suggestions?
>

Can you share the command you are using to start the tpm2-abrmd? You need to
pass the --tcti socket option, i.e:

sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti socket

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============5157855954175301647==--

