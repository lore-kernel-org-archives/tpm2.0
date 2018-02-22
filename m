Content-Type: multipart/mixed; boundary="===============7192437344039208810=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
Date: Thu, 22 Feb 2018 09:48:45 +0100
Message-ID: <b8c21126-da70-cf9c-ee01-ac0271418602@redhat.com>
In-Reply-To: 207C810BE4BA2440832668E0F208BFD3AF4D6A@ORSMSX108.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7192437344039208810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Dan,

On 02/20/2018 08:40 PM, Anderson, Daniel wrote:
> I have been getting the same error and cannot start the tpm2-service:
> =

> $ sudo systemctl start tpm2-abrmd.service
> Job for tpm2-abrmd.service failed because the control process exited with=
 error code. See "systemctl status tpm2-abrmd.service" and "journalctl -xe"=
 for details.
> =

> $ systemctl status tpm2-abrmd.service
> tpm2-abrmd.service: Main process exited, code=3Dexited, status=3D1/FA
> Failed to start TPM2 Access Broker and Resource Management Daemon
> Unit entered failed state.
> Failed with result 'exit-code'.
> =

> # Start manually:
> $ /usr/local/sbin/tpm2-abrmd&
> ** (tpm2-abrmd:1596): WARNING **: failed to initialize device TCTI contex=
t: 0xa000a
> ** (tpm2-abrmd:1596): CRITICAL **: TCTI Initializaiton: 0xa000a
> =

> $ tpm2_rc_decode 0xa000a
> tcti:IO failure
> =


What versions of the tpm2-tss, tools and abrmd are you using? I'll try to
reproduce the issue. But yes, the problem seems to be that it's defaulting
to the device TCTI instead of the socket TCTI. And since you don't have a
/dev/tpm? (or your user doesn't have access to it), the tpm2-abrmd dies.

> So it seems that this is a known bug:
> https://github.com/tpm2-software/tpm2-abrmd/issues/321
> https://github.com/tpm2-software/tpm2-abrmd/pull/330
>
> Is there a workaround?  The discussion is too cryptic for me. For example=
,  I can't find a tpm2_listpcrs command in  tpm2-tools (or -abrmd or -tss).=
 I am running on Ubuntu Linux with a simulator.
>

PR #300 has been merged already so if you think that's related, it may be
worth to give a try to master. I still didn't have time to catch up on all
the TCTI dynamic loading changes so I can't say if #330 is related to this
issue or not.

> Dan

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============7192437344039208810==--

