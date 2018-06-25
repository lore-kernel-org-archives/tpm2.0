Content-Type: multipart/mixed; boundary="===============0572541064093455123=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] [Qemu-devel] Choosing PCR banks for swtpm's TPM 2
Date: Mon, 25 Jun 2018 11:22:18 -0400
Message-ID: <ad36fd83-8de6-1e9e-db51-1ceaf0f0269a@linux.vnet.ibm.com>
In-Reply-To: 20180625151803.GA2393@work-vm
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0572541064093455123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2018 11:18 AM, Dr. David Alan Gilbert wrote:
> * Stefan Berger (stefanb(a)linux.vnet.ibm.com) wrote:
>> Hi!
>>
>>  =C2=A0I am sending this email to solicit input on the choice of the PCR=
 banks to
>> enable for swtpm's TPM 2. I have currently enabled 4 PCR banks for
>> SHA{1,256,384,512}. The downside of this is that running the TPM 2 with =
so
>> many PCR banks has a performance impact when the Linux integrity measure=
ment
>> architecture is used and has to extend measurements into all PCR banks,
>> which Linux does already.
>>
>> TPM 2 has the PCR_Allocate() command for a user to select the PCR banks =
to
>> use. This command allows to make some PCR banks invisible. The change ha=
s to
>> be done through the firmware and has the downside that the TPM2 does not
>> support TPM2_Shutdown(SU_STATE) after this command was used. This preven=
ts
>> suspend/resume from working properly. So, it seems that one shouldn't ha=
ve
>> to use this command, which in turn means the number of PCR banks should =
be
>> small.
>>
>> Another complication with the swtpm is the upgrade path. Suspended VMs w=
ill
>> expect that the PCR banks that were available before the suspend will be
>> available after the resume and a possible swtpm upgrade. This in turn me=
ans
>> that the PCR banks should be chosen now and we'll have to stick with the=
m.
>>
>> That said, my suggestion would be to enable only PCR banks for SHA256 for
>> 'now' and SHA512 for the future. Having two PCR banks should enable dece=
nt
>> performance. If someone wants to have better performance he will have to=
 go
>> through the firmware to select the PCR banks at the expense of loosing
>> suspend/resume support.
>>
>> The change of PCR banks for the current 4 PCR banks will break the state=
 of
>> all swtpms.
>>
>> If you have suggestions, please let me know.
> Is this something that has to be set at compile time or could it be
> something chosen at run time (as options to the swtpm command line?)
It is a compile-time option...

 =C2=A0=C2=A0 Stefan

>
> Dave
>> Regards,
>>
>>  =C2=A0=C2=A0 Stefan
>>
>>
>>
> --
> Dr. David Alan Gilbert / dgilbert(a)redhat.com / Manchester, UK
>


--===============0572541064093455123==--

