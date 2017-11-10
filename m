Content-Type: multipart/mixed; boundary="===============4568687888892387443=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Fri, 10 Nov 2017 10:27:33 -0500
Message-ID: <e8b1c8c5-6ec1-5a91-7eb9-2ece61d1c8f7@linux.vnet.ibm.com>
In-Reply-To: 1510318413.22094.49.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4568687888892387443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/10/2017 07:53 AM, Patrick Ohly wrote:
> On Fri, 2017-11-10 at 07:04 -0500, Stefan Berger wrote:
>> On 11/10/2017 04:07 AM, Patrick Ohly wrote:
>>> Stefan, I know you said that you still want to continue rebasing
>>> your
>>> tpm2 branches because they aren't ready for use. Do you have an
>>> estimate when the code might become released officially?
>> QEMU will create version 2.11 in mid December. I would like to have
>> an
>> official version for 2.12, so that would probably be March 2018. I
>> hope
>> we can have some more people testing it or looking at the code until
>> then... I want to be able to support TPM migration in QEMU once it
>> opens
>> up for new code in mid December. And migration needs testers.
>>
>> The proportion between lines of code and eyes looking at it isn't
>> quite
>> right when it comes to TPM and especially swtpm and libtpms.
> Perhaps it would help to advertise some versions of the tpm2-preview
> code as "ready for testing", for example by tagging them?

I'll do that next week, after some changes/fixes, and post here and on =

the QEMU devel mailing list.


--===============4568687888892387443==--

