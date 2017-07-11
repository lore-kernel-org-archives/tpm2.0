Content-Type: multipart/mixed; boundary="===============4789073993247668256=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.us>
Subject: Re: [tpm2] Test Script Changes
Date: Tue, 11 Jul 2017 12:35:31 -0700
Message-ID: <9252b5ce-eadd-dac4-3862-5210a8a59601@twobit.us>
In-Reply-To: 03b34667-2347-d0b9-af09-d3392517f75e@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4789073993247668256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Adding some context:

On 07/11/2017 11:58 AM, Javier Martinez Canillas wrote:
> On 07/11/2017 06:36 PM, Roberts, William C wrote:
>> The changes on: https://github.com/01org/tpm2.0-tools/pull/333
>>
>> Is your goal to get the test harness working on actual hardware? If so I=
 would like to place a ticket for this on next so it gets captured that the=
 next release off of master
>> should have hardware test support.
>>
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

> So I found https://github.com/01org/tpm2.0-tools/issues/255 that also had
> the same issue and solved the same way I did (using endorsement hierarchy=
).
>  =

>> Let me know if I (or if you want to you can) should create such a ticket?
>>
> =

> I think is valuable to be able to run on hardware, yes. Although I wonder
> how safe it is. The TPM2.0-TSS project README says that its test suite is
> only intended to be with a simulator since it could wear out the TPM NV:
> =

> https://github.com/01org/TPM2.0-TSS/blob/master/README.md#test-suite

The test harness (aka tpmclient) that came with the TSS code is / was a
monolith (8k LoC C program) without any easy / convenient way to
separate classes (NV, auth, encryption, signing) of tests. The code was
mostly separated along functional lines internally but there was / is
lots of global data and cross-functional dependencies that made
decomposing it very time consuming.

Additionally there are some classes of tests rolled into this monolith
that likely won't work on a "real" TPM: dictionary attack lockout and
reset code, uses of the platform hierarchy etc.

Given all of this I figured a warning about possible side effects like
NV wear out was a good idea. Eventually the TSS test code will be
decomposed into the test harness in automake which will make classifying
the appropriateness of individual tests for execution against the
simulator or a real TPM much easier. But even still the code will have
been written to test the TSS code, not the TPM itself.

The tools project on the other hand was written to execute against a
real TPM. I think this makes the tools test scripts a much better
candidate for execution against a real TPM . As you're seeing this will
require some work to ensure that it's possible to tell the build system
which set of tests to enable (through an `--option` passed to the
configure script?), as well as some work to classify tests (simulator
only vs real TPM).

Regards,
Philip

--===============4789073993247668256==--

