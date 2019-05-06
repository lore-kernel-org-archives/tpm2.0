Content-Type: multipart/mixed; boundary="===============0269610439964990254=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] Creating TPM2 primary key failed!
Date: Mon, 06 May 2019 13:28:13 +0200
Message-ID: <6834d9ec-af39-4275-71e1-eb1304c50027@redhat.com>
In-Reply-To: CACX8e9N=smj_=UDfyLC5roMb=Zw8SfBMhYHqcNGA-wYnuwLGbg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0269610439964990254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Shiv,

On 5/6/19 12:56 PM, Shiv Dev wrote:
> Hi Javier,
> =

> Thanks for the response.
> =

> The tpm2_takeownership command output is shown below
> --
> [ubuntu(a)localhost ~]$ tpm2_takeownership -c
> ERROR: Clearing Failed! TPM error code: 0x921
> ERROR: Unable to run tpm2_takeownership
> --
> The error seems to be lockout now.
> #define TPM2_RC_LOCKOUT            ((TPM2_RC) (TPM2_RC_WARN + 0x021))
> /* authorizations for objects subject to DA protection are not allowed
> at this time because the TPM is in DA lockout mode */
> =

> I tried to clear the dictionary lockout..
> --
> [ubuntu(a)localhost luks]$ tpm2_dictionarylockout -c
> ERROR: 0x921 Error clearing dictionary lockout.
> ERROR: Unable to run tpm2_dictionarylockout
> --

Yes, I think you need to reset your TPM from the firmware setup.

> Regards,
> Shiv
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============0269610439964990254==--

