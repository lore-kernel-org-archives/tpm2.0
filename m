Content-Type: multipart/mixed; boundary="===============7997505297078850316=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] Test Script Changes
Date: Wed, 12 Jul 2017 02:09:27 +0200
Message-ID: <c48282ef-4110-96dc-cab4-0c5f419a2983@redhat.com>
In-Reply-To: 9252b5ce-eadd-dac4-3862-5210a8a59601@twobit.us
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7997505297078850316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Philip and Bill,

On 07/11/2017 09:35 PM, Philip Tricca wrote:
> Hi Javier,
> =

> Adding some context:
> =

> On 07/11/2017 11:58 AM, Javier Martinez Canillas wrote:
>> On 07/11/2017 06:36 PM, Roberts, William C wrote:
>>> The changes on: https://github.com/01org/tpm2.0-tools/pull/333
>>>
>>> Is your goal to get the test harness working on actual hardware? If so =
I would like to place a ticket for this on next so it gets captured that th=
e next release off of master
>>> should have hardware test support.
>>>
>>
>> For that particular change, my goal was to run the test so I could work =
on
>> extending the tpm2_unseal tool to support sealing data using a PCR polic=
y.
>>
>> And I wasn't able to run it since I didn't find a way on my Lenovo Think=
pad
>> X1 Carbon to clear the password for the platform hierarchy of the Intel =
PTT
>> firmware-base TPM2.0 "chip" that I'm using for testing.
>>
>> So I found https://github.com/01org/tpm2.0-tools/issues/255 that also had
>> the same issue and solved the same way I did (using endorsement hierarch=
y).
>>  =

>>> Let me know if I (or if you want to you can) should create such a ticke=
t?
>>>

I gave a try on my machine, most tests pass besides test_algs_tpm2_quote.sh
and test_tpm2_createpolicy.sh. AFAICT they fail because the tests hardcode
values that are only expected in the TPM simulator used in the travis CI en=
v.

I filled an issue for this: https://github.com/01org/tpm2.0-tools/issues/33=
5.

>>
>> I think is valuable to be able to run on hardware, yes. Although I wonder
>> how safe it is. The TPM2.0-TSS project README says that its test suite is
>> only intended to be with a simulator since it could wear out the TPM NV:
>>
>> https://github.com/01org/TPM2.0-TSS/blob/master/README.md#test-suite
> =

> The test harness (aka tpmclient) that came with the TSS code is / was a
> monolith (8k LoC C program) without any easy / convenient way to
> separate classes (NV, auth, encryption, signing) of tests. The code was
> mostly separated along functional lines internally but there was / is
> lots of global data and cross-functional dependencies that made
> decomposing it very time consuming.
> =

> Additionally there are some classes of tests rolled into this monolith
> that likely won't work on a "real" TPM: dictionary attack lockout and
> reset code, uses of the platform hierarchy etc.
> =

> Given all of this I figured a warning about possible side effects like
> NV wear out was a good idea. Eventually the TSS test code will be
> decomposed into the test harness in automake which will make classifying
> the appropriateness of individual tests for execution against the
> simulator or a real TPM much easier. But even still the code will have
> been written to test the TSS code, not the TPM itself.
> =

> The tools project on the other hand was written to execute against a
> real TPM. I think this makes the tools test scripts a much better

Thanks a lot for the explanation. It's very clear to me now.

> candidate for execution against a real TPM . As you're seeing this will
> require some work to ensure that it's possible to tell the build system
> which set of tests to enable (through an `--option` passed to the
> configure script?), as well as some work to classify tests (simulator
> only vs real TPM).

Agreed.

> =

> Regards,
> Philip
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============7997505297078850316==--

