Content-Type: multipart/mixed; boundary="===============8908111086971840300=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] [Qemu-devel] Choosing PCR banks for swtpm's TPM 2
Date: Mon, 25 Jun 2018 12:08:34 -0400
Message-ID: <759e2eab-bc8a-a841-5016-4308c3a680bb@linux.vnet.ibm.com>
In-Reply-To: 20180625155933.GK18580@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8908111086971840300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2018 11:59 AM, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Jun 25, 2018 at 11:56:24AM -0400, Stefan Berger wrote:
>> On 06/25/2018 11:25 AM, Daniel P. Berrang=C3=A9 wrote:
>>> On Mon, Jun 25, 2018 at 11:05:55AM -0400, Stefan Berger wrote:
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
>>> Anything that has a risk of needing to change between versions would ne=
ed
>>> to be tied into the machine type in some way.
>> You mean a machine type like q35? I am not sure how it would be tied into
>> QEMU since the swtpm command line options are chosen more or less
>> independently of the ones from QEMU.
> Yes, each QEMU release introduces a new versioned machine type eg
>    q35-2.10,  q35-2.11, q35-2.12, q35-3.0
>
> If anything in QEMU changes which impacts live migraiton/save/restore/etc
> then we tie it to the versioned machine type. so q35-3.0 would get the
> new default value, and all previous machine types keep the old default
> value.
>
> For this to be possible with externally launched swtpm though, would
> require some way for QEMU to talk to swtpm to tell it what default
> to use for this. I don't know enough about swtpm to have an idea how
> practical this is or not.

The set of PCR banks a future TPM 2 would be 'manufactured with' would =

be determined by parameters to swtpm_setup. That's when the TPM2 is =

'manufactured' and the certificates are created and written into its =

NVRAM locations. QEMU is not talking to the TPM 2 at this point. So it =

would be parameters passed from libvirt to swtpm_setup that determine =

the set of PCR banks. swtpm itself would get those supplied via command =

line options when invoked by swtpm_setup. If one was to skip over the =

swtpm_setup step, then why not use the swtpm command line options that =

need to be there for swtpm_setup support. Though I think few people will =

use it like that. I would not extend the protocol for this purpose.

 =C2=A0=C2=A0 Stefan

>
> Regards,
> Daniel



--===============8908111086971840300==--

