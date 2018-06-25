Content-Type: multipart/mixed; boundary="===============8136628059790980374=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] [Qemu-devel] Choosing PCR banks for swtpm's TPM 2
Date: Mon, 25 Jun 2018 11:56:24 -0400
Message-ID: <6adb28e6-85eb-38dc-ad24-99a5daa0f972@linux.vnet.ibm.com>
In-Reply-To: 20180625152513.GI18580@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8136628059790980374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2018 11:25 AM, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Jun 25, 2018 at 11:05:55AM -0400, Stefan Berger wrote:
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
> Anything that has a risk of needing to change between versions would need
> to be tied into the machine type in some way.

You mean a machine type like q35? I am not sure how it would be tied =

into QEMU since the swtpm command line options are chosen more or less =

independently of the ones from QEMU.

 =C2=A0=C2=A0=C2=A0 Stefan


--===============8136628059790980374==--

