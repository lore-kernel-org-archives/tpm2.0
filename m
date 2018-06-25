Content-Type: multipart/mixed; boundary="===============8705742596854839397=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] Choosing PCR banks for swtpm's TPM 2
Date: Mon, 25 Jun 2018 15:44:32 -0400
Message-ID: <01ecb9fd-dae2-269f-ba34-94530ed6ec7d@linux.vnet.ibm.com>
In-Reply-To: aa9ce054-f58c-097d-aee3-8fae769d0840@linux.vnet.ibm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8705742596854839397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2018 11:05 AM, Stefan Berger wrote:
> Hi!
>
> =C2=A0I am sending this email to solicit input on the choice of the PCR =

> banks to enable for swtpm's TPM 2. I have currently enabled 4 PCR =

> banks for SHA{1,256,384,512}. The downside of this is that running the =

> TPM 2 with so many PCR banks has a performance impact when the Linux =

> integrity measurement architecture is used and has to extend =

> measurements into all PCR banks, which Linux does already.
>
> TPM 2 has the PCR_Allocate() command for a user to select the PCR =

> banks to use. This command allows to make some PCR banks invisible. =

> The change has to be done through the firmware and has the downside =

> that the TPM2 does not support TPM2_Shutdown(SU_STATE) after this =

> command was used. This prevents suspend/resume from working properly. =

> So, it seems that one shouldn't have to use this command, which in =

> turn means the number of PCR banks should be small.

Actually that was my interpretation of the specs and from what it looks =

like I was wrong assuming that once PCR_Allocate() was used that =

TPM2_Shutdown(SU_STATE) cannot be used anymore at all. The text is a bit =

ambiguous about it. This command can be sent, but the machine needs to =

be rebooted and with that the TPM 2 reset.

The next issue is that the IBM TSS2 is hard coded for 3 PCR banks and a =

few commands are breaking because of that. Now the solution would be to:

- compile-time disable the SHA512 bank; this will break existing state =

but for as long as it's in preview, I hope this is ok; we cannot easily =

enable SHA512 then in the future.

- swtpm_setup gets a --pcr-banks <PCR banks> option that =

PCR_Allocate()'s the active PCR banks for the swtpm. The default will be =

SHA 1 and SHA 256, which disables the SHA 384 PCR bank; Users can choose =

their banks if they run this command directly. SHA1 and SHA256 seems to =

be a reasonable set of active PCR banks for now.

 =C2=A0=C2=A0 Stefan



>
> Another complication with the swtpm is the upgrade path. Suspended VMs =

> will expect that the PCR banks that were available before the suspend =

> will be available after the resume and a possible swtpm upgrade. This =

> in turn means that the PCR banks should be chosen now and we'll have =

> to stick with them.
>
> That said, my suggestion would be to enable only PCR banks for SHA256 =

> for 'now' and SHA512 for the future. Having two PCR banks should =

> enable decent performance. If someone wants to have better performance =

> he will have to go through the firmware to select the PCR banks at the =

> expense of loosing suspend/resume support.
>
> The change of PCR banks for the current 4 PCR banks will break the =

> state of all swtpms.
>
> If you have suggestions, please let me know.
>
> Regards,
>
> =C2=A0=C2=A0 Stefan
>
>


--===============8705742596854839397==--

