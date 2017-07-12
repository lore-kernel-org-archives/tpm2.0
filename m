Content-Type: multipart/mixed; boundary="===============0205185151187598248=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Test Script Changes
Date: Wed, 12 Jul 2017 05:30:07 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAA42D7@ORSMSX103.amr.corp.intel.com>
In-Reply-To: 03b34667-2347-d0b9-af09-d3392517f75e@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0205185151187598248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
> Sent: Tuesday, July 11, 2017 11:58 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: Test Script Changes
> =

> Hello Bill,
> =

> On 07/11/2017 06:36 PM, Roberts, William C wrote:
> > The changes on: https://github.com/01org/tpm2.0-tools/pull/333
> >
> > Is your goal to get the test harness working on actual hardware? If so
> > I would like to place a ticket for this on next so it gets captured tha=
t the next
> release off of master should have hardware test support.
> >
> =

> For that particular change, my goal was to run the test so I could work on
> extending the tpm2_unseal tool to support sealing data using a PCR policy.
> =

> And I wasn't able to run it since I didn't find a way on my Lenovo Thinkp=
ad
> X1 Carbon to clear the password for the platform hierarchy of the Intel P=
TT
> firmware-base TPM2.0 "chip" that I'm using for testing.
> =

> So I found https://github.com/01org/tpm2.0-tools/issues/255 that also had=
 the
> same issue and solved the same way I did (using endorsement hierarchy).
> =

> > Let me know if I (or if you want to you can) should create such a ticke=
t?
> >
> =

> I think is valuable to be able to run on hardware, yes. Although I wonder=
 how
> safe it is. The TPM2.0-TSS project README says that its test suite is onl=
y intended
> to be with a simulator since it could wear out the TPM NV:
> =

> https://github.com/01org/TPM2.0-TSS/blob/master/README.md#test-suite

Yeah it's not the best idea on an actual system. Especially considering the=
 nv write wear.

> =

> > Thank you for your changes as well. Good stuff.
> >
> =

> You are welcome, and thanks a lot for all your feedback and review!
> =

> > Thanks,
> > Bill
> >
> =

> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement Red Hat

--===============0205185151187598248==--

