Content-Type: multipart/mixed; boundary="===============3732438083205958862=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] [Qemu-devel] Choosing PCR banks for swtpm's TPM 2
Date: Mon, 25 Jun 2018 12:15:28 -0400
Message-ID: <1b6a568c-f7d7-8b71-d36b-11395680ce1a@linux.vnet.ibm.com>
In-Reply-To: 20180625161044.GL18580@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3732438083205958862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2018 12:10 PM, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Jun 25, 2018 at 12:08:34PM -0400, Stefan Berger wrote:
>> On 06/25/2018 11:59 AM, Daniel P. Berrang=C3=A9 wrote:
>>> On Mon, Jun 25, 2018 at 11:56:24AM -0400, Stefan Berger wrote:
>>>> On 06/25/2018 11:25 AM, Daniel P. Berrang=C3=A9 wrote:
>>>>> On Mon, Jun 25, 2018 at 11:05:55AM -0400, Stefan Berger wrote:
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
>>>>> Anything that has a risk of needing to change between versions would =
need
>>>>> to be tied into the machine type in some way.
>>>> You mean a machine type like q35? I am not sure how it would be tied i=
nto
>>>> QEMU since the swtpm command line options are chosen more or less
>>>> independently of the ones from QEMU.
>>> Yes, each QEMU release introduces a new versioned machine type eg
>>>     q35-2.10,  q35-2.11, q35-2.12, q35-3.0
>>>
>>> If anything in QEMU changes which impacts live migraiton/save/restore/e=
tc
>>> then we tie it to the versioned machine type. so q35-3.0 would get the
>>> new default value, and all previous machine types keep the old default
>>> value.
>>>
>>> For this to be possible with externally launched swtpm though, would
>>> require some way for QEMU to talk to swtpm to tell it what default
>>> to use for this. I don't know enough about swtpm to have an idea how
>>> practical this is or not.
>> The set of PCR banks a future TPM 2 would be 'manufactured with' would be
>> determined by parameters to swtpm_setup. That's when the TPM2 is
>> 'manufactured' and the certificates are created and written into its NVR=
AM
>> locations. QEMU is not talking to the TPM 2 at this point. So it would be
>> parameters passed from libvirt to swtpm_setup that determine the set of =
PCR
>> banks. swtpm itself would get those supplied via command line options wh=
en
>> invoked by swtpm_setup. If one was to skip over the swtpm_setup step, th=
en
>> why not use the swtpm command line options that need to be there for
>> swtpm_setup support. Though I think few people will use it like that. I
>> would not extend the protocol for this purpose.
> Ah so in that case, we would merely require ability to record the desired
> PCR setup in the XML, and libvirt would then pass the right args to
> swtpm_setup when required.

Yes, the user would choose PCR banks or libvirt probes swtpm_setup =

version/command line options and selects a reasonable set for the hash =

algorithms recommended at that time.

 =C2=A0=C2=A0 Stefan

>
> Regards,
> Daniel



--===============3732438083205958862==--

