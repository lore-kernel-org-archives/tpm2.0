Content-Type: multipart/mixed; boundary="===============4456380988088027629=="
MIME-Version: 1.0
From: Shiv Dev <shivfsdev at gmail.com>
Subject: Re: [tpm2] Creating TPM2 primary key failed!
Date: Mon, 06 May 2019 22:07:17 +0530
Message-ID: <CACX8e9PdYX4G2c7Wwbe_K4aoOc1dbwyki5L6B+fXEmqr2k7sVw@mail.gmail.com>
In-Reply-To: 6834d9ec-af39-4275-71e1-eb1304c50027@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4456380988088027629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Resetting the tpm solved the problem. As the Intel BIOS for the
compute stick does not have this option, had to load Windows 10 and
use the tpm.msc application.

Thanks for the help !

Regards,
Shiv


On Mon, May 6, 2019 at 4:58 PM Javier Martinez Canillas
<javierm(a)redhat.com> wrote:
>
> Hello Shiv,
>
> On 5/6/19 12:56 PM, Shiv Dev wrote:
> > Hi Javier,
> >
> > Thanks for the response.
> >
> > The tpm2_takeownership command output is shown below
> > --
> > [ubuntu(a)localhost ~]$ tpm2_takeownership -c
> > ERROR: Clearing Failed! TPM error code: 0x921
> > ERROR: Unable to run tpm2_takeownership
> > --
> > The error seems to be lockout now.
> > #define TPM2_RC_LOCKOUT            ((TPM2_RC) (TPM2_RC_WARN + 0x021))
> > /* authorizations for objects subject to DA protection are not allowed
> > at this time because the TPM is in DA lockout mode */
> >
> > I tried to clear the dictionary lockout..
> > --
> > [ubuntu(a)localhost luks]$ tpm2_dictionarylockout -c
> > ERROR: 0x921 Error clearing dictionary lockout.
> > ERROR: Unable to run tpm2_dictionarylockout
> > --
>
> Yes, I think you need to reset your TPM from the firmware setup.
>
> > Regards,
> > Shiv
> >
>
> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement
> Red Hat

--===============4456380988088027629==--

