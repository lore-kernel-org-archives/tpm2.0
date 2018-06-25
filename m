Content-Type: multipart/mixed; boundary="===============6978227524710879688=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] [Qemu-devel] Choosing PCR banks for swtpm's TPM 2
Date: Mon, 25 Jun 2018 12:23:17 -0400
Message-ID: <8e7b0363-28ec-b2fa-19bf-c1820c8a75c7@linux.vnet.ibm.com>
In-Reply-To: 20180625161147.GH2390@work-vm
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6978227524710879688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2018 12:11 PM, Dr. David Alan Gilbert wrote:
> * Stefan Berger (stefanb(a)linux.vnet.ibm.com) wrote:
>> On 06/25/2018 11:29 AM, Dr. David Alan Gilbert wrote:
>>> * Stefan Berger (stefanb(a)linux.vnet.ibm.com) wrote:
>>>> On 06/25/2018 11:18 AM, Dr. David Alan Gilbert wrote:
>>>>> * Stefan Berger (stefanb(a)linux.vnet.ibm.com) wrote:
>>>>>> Hi!
>>>>>>
>>>>>>    =C2=A0I am sending this email to solicit input on the choice of t=
he PCR banks to
>>>>>> enable for swtpm's TPM 2. I have currently enabled 4 PCR banks for
>>>>>> SHA{1,256,384,512}. The downside of this is that running the TPM 2 w=
ith so
>>>>>> many PCR banks has a performance impact when the Linux integrity mea=
surement
>>>>>> architecture is used and has to extend measurements into all PCR ban=
ks,
>>>>>> which Linux does already.
>>>>>>
>>>>>> TPM 2 has the PCR_Allocate() command for a user to select the PCR ba=
nks to
>>>>>> use. This command allows to make some PCR banks invisible. The chang=
e has to
>>>>>> be done through the firmware and has the downside that the TPM2 does=
 not
>>>>>> support TPM2_Shutdown(SU_STATE) after this command was used. This pr=
events
>>>>>> suspend/resume from working properly. So, it seems that one shouldn'=
t have
>>>>>> to use this command, which in turn means the number of PCR banks sho=
uld be
>>>>>> small.
>>>>>>
>>>>>> Another complication with the swtpm is the upgrade path. Suspended V=
Ms will
>>>>>> expect that the PCR banks that were available before the suspend wil=
l be
>>>>>> available after the resume and a possible swtpm upgrade. This in tur=
n means
>>>>>> that the PCR banks should be chosen now and we'll have to stick with=
 them.
>>>>>>
>>>>>> That said, my suggestion would be to enable only PCR banks for SHA25=
6 for
>>>>>> 'now' and SHA512 for the future. Having two PCR banks should enable =
decent
>>>>>> performance. If someone wants to have better performance he will hav=
e to go
>>>>>> through the firmware to select the PCR banks at the expense of loosi=
ng
>>>>>> suspend/resume support.
>>>>>>
>>>>>> The change of PCR banks for the current 4 PCR banks will break the s=
tate of
>>>>>> all swtpms.
>>>>>>
>>>>>> If you have suggestions, please let me know.
>>>>> Is this something that has to be set at compile time or could it be
>>>>> something chosen at run time (as options to the swtpm command line?)
>>>> It is a compile-time option...
>>> Hmm, that's a shame - I was hoping you'd be able to switch them at
>>> runtime (or at least hide them?) then you can solve the upgrade problem
>>> by running the new swtpm with a flag telling it to hide the new banks.
>>> I hope the ondisk formats for suspend/resume/migration are descriptive
>>> enough to be able to spot an error if you try and load one configured
>>> differently.4
>> The disk format does detect it and refuses to take the state if either t=
here
>> are too many PCR banks or not enough.
> What happens if there are the right number just the wrong type?

The state would be rejected since they are incompatible.

>
>> For the initial version of swtpm we would need to define a default set of
>> PCR banks since the TPM 2 code uses compile time options to build in that
>> set of PCR banks.
> You talk of PCR_Allocate() above as a spec-defined command to hide PCRs
> but with the downside of breaking TPM2_Shutdown - could you implement
> something from the commandline without that downside (I don't know how
> PCR banks work).

Like I said, during swtpm_setup TPM 2 manufacturing the set of PCR banks =

would be chosen and that set would be used by that TPM 2 from then on. =

Though this flexibility is not supported by the code today.


>
>> A future version of swtpm could expose command line options for selecting
>> the PCR banks an instance of swtpm is to run with. libtpms would be comp=
iled
>> with support for all of them and only the chosen subset would be active
>> starting with the initial creation of a particular instance of swtpm.
> Right, that would solve the upgrade half of the problem.

For now I think an initial set of banks to go with would be appropriate.

 =C2=A0=C2=A0 Stefan


--===============6978227524710879688==--

