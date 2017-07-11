Content-Type: multipart/mixed; boundary="===============6230080344166497140=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] Test Script Changes
Date: Tue, 11 Jul 2017 20:58:27 +0200
Message-ID: <03b34667-2347-d0b9-af09-d3392517f75e@redhat.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563EAA3DFB@ORSMSX103.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6230080344166497140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Bill,

On 07/11/2017 06:36 PM, Roberts, William C wrote:
> The changes on: https://github.com/01org/tpm2.0-tools/pull/333
> =

> Is your goal to get the test harness working on actual hardware? If so I =
would like to place a ticket for this on next so it gets captured that the =
next release off of master
> should have hardware test support.
>

For that particular change, my goal was to run the test so I could work on
extending the tpm2_unseal tool to support sealing data using a PCR policy.

And I wasn't able to run it since I didn't find a way on my Lenovo Thinkpad
X1 Carbon to clear the password for the platform hierarchy of the Intel PTT
firmware-base TPM2.0 "chip" that I'm using for testing.

So I found https://github.com/01org/tpm2.0-tools/issues/255 that also had
the same issue and solved the same way I did (using endorsement hierarchy).
 =

> Let me know if I (or if you want to you can) should create such a ticket?
>

I think is valuable to be able to run on hardware, yes. Although I wonder
how safe it is. The TPM2.0-TSS project README says that its test suite is
only intended to be with a simulator since it could wear out the TPM NV:

https://github.com/01org/TPM2.0-TSS/blob/master/README.md#test-suite
 =

> Thank you for your changes as well. Good stuff.
>

You are welcome, and thanks a lot for all your feedback and review!
 =

> Thanks,
> Bill
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============6230080344166497140==--

