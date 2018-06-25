Content-Type: multipart/mixed; boundary="===============1021808553261803316=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] [Qemu-devel] Choosing PCR banks for swtpm's TPM 2
Date: Mon, 25 Jun 2018 11:54:17 -0400
Message-ID: <0bddd044-c9bf-37b9-814b-8eeaf13c9f64@linux.vnet.ibm.com>
In-Reply-To: 20180625152916.GG2390@work-vm
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1021808553261803316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2018 11:29 AM, Dr. David Alan Gilbert wrote:
> * Stefan Berger (stefanb(a)linux.vnet.ibm.com) wrote:
>> On 06/25/2018 11:18 AM, Dr. David Alan Gilbert wrote:
>>> * Stefan Berger (stefanb(a)linux.vnet.ibm.com) wrote:
>>>> Hi!
>>>>
>>>>   =C2=A0I am sending this email to solicit input on the choice of the =
PCR banks to
>>>> enable for swtpm's TPM 2. I have currently enabled 4 PCR banks for
>>>> SHA{1,256,384,512}. The downside of this is that running the TPM 2 wit=
h so
>>>> many PCR banks has a performance impact when the Linux integrity measu=
rement
>>>> architecture is used and has to extend measurements into all PCR banks,
>>>> which Linux does already.
>>>>
>>>> TPM 2 has the PCR_Allocate() command for a user to select the PCR bank=
s to
>>>> use. This command allows to make some PCR banks invisible. The change =
has to
>>>> be done through the firmware and has the downside that the TPM2 does n=
ot
>>>> support TPM2_Shutdown(SU_STATE) after this command was used. This prev=
ents
>>>> suspend/resume from working properly. So, it seems that one shouldn't =
have
>>>> to use this command, which in turn means the number of PCR banks shoul=
d be
>>>> small.
>>>>
>>>> Another complication with the swtpm is the upgrade path. Suspended VMs=
 will
>>>> expect that the PCR banks that were available before the suspend will =
be
>>>> available after the resume and a possible swtpm upgrade. This in turn =
means
>>>> that the PCR banks should be chosen now and we'll have to stick with t=
hem.
>>>>
>>>> That said, my suggestion would be to enable only PCR banks for SHA256 =
for
>>>> 'now' and SHA512 for the future. Having two PCR banks should enable de=
cent
>>>> performance. If someone wants to have better performance he will have =
to go
>>>> through the firmware to select the PCR banks at the expense of loosing
>>>> suspend/resume support.
>>>>
>>>> The change of PCR banks for the current 4 PCR banks will break the sta=
te of
>>>> all swtpms.
>>>>
>>>> If you have suggestions, please let me know.
>>> Is this something that has to be set at compile time or could it be
>>> something chosen at run time (as options to the swtpm command line?)
>> It is a compile-time option...
> Hmm, that's a shame - I was hoping you'd be able to switch them at
> runtime (or at least hide them?) then you can solve the upgrade problem
> by running the new swtpm with a flag telling it to hide the new banks.
> I hope the ondisk formats for suspend/resume/migration are descriptive
> enough to be able to spot an error if you try and load one configured
> differently.4

The disk format does detect it and refuses to take the state if either =

there are too many PCR banks or not enough.

For the initial version of swtpm we would need to define a default set =

of PCR banks since the TPM 2 code uses compile time options to build in =

that set of PCR banks.

A future version of swtpm could expose command line options for =

selecting the PCR banks an instance of swtpm is to run with. libtpms =

would be compiled with support for all of them and only the chosen =

subset would be active starting with the initial creation of a =

particular instance of swtpm.

 =C2=A0=C2=A0=C2=A0 Stefan

>
> Dave
>
>>  =C2=A0=C2=A0 Stefan
>>
>>> Dave
>>>> Regards,
>>>>
>>>>   =C2=A0=C2=A0 Stefan
>>>>
>>>>
>>>>
>>> --
>>> Dr. David Alan Gilbert / dgilbert(a)redhat.com / Manchester, UK
>>>
> --
> Dr. David Alan Gilbert / dgilbert(a)redhat.com / Manchester, UK
>


--===============1021808553261803316==--

