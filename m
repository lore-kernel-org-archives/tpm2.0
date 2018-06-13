Content-Type: multipart/mixed; boundary="===============2581946180911579499=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] Policy check fails writing to NVRAM > 512B
Date: Wed, 13 Jun 2018 10:47:03 -0700
Message-ID: <ae4b17df-1873-3729-a633-766bad737cce@intel.com>
In-Reply-To: CA+HVzV2uSCXgS2sTBEV+r+z2YGTSV3QF85afgA=X1uc=v8i7Yw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2581946180911579499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/11/2018 11:20 PM, Gabriela Limonta M=C3=A1rquez wrote:
> Hi,
> =

> I have updated the tpm2 software stack to use
> =

> tpm2-tss @ 2.0.0_rc3
> tpm2-abrmd @ 2.0.0_rc0
> tpm2-tools @ 3.1.0-rc0
> =

> I am trying to write a file to NVRAM and seal it using a simple policy
> =E2=80=8B (sha256:0)=E2=80=8B
> .
> =

> I can create the policy and define the NVRAM. However, when I try writing=
 to it it fails with a policy check error:
> =

> $ tpm2_nvrelease -x 0x1800005 -a 0x40000001
> =

> $ tpm2_pcrlist -L sha256:0 -o pcr.value
> sha256 :
> =C2=A0 0 =C2=A0: d8a76f44656e5b7ed75ddc6c19071d8594e99edb67c54c0f5f562a8b=
daa26bbf
> =

> $ tpm2_createpolicy -P -L sha256:0 -F pcr.value -f policy
> =

> $ tpm2_nvdefine -x 0x1800005 -a 0x40000001 -s 700 -L policy -t "policyrea=
d|policywrite"
> =

> $ tpm2_nvwrite -x =C2=A00x1800005 -a 0x1800005 -L sha256:0 -F pcr.value t=
a_config.cfg -V
> INFO on line: "125" in file: "tools/tpm2_nvwrite.c": The data(size=3D512)=
 to be written:
> INFO on line: "141" in file: "tools/tpm2_nvwrite.c": Success to write NV =
area at index 0x1800005 (25165829) offset 0x0.
> INFO on line: "125" in file: "tools/tpm2_nvwrite.c": The data(size=3D131)=
 to be written:
> ERROR on line: "136" in file: "tools/tpm2_nvwrite.c": Failed to write NV =
area at index 0x1800005 (25165829) offset 0x200. Error:0x99d
> ERROR on line: "168" in file: "tools/tpm2_tool.c": Unable to run tpm2_nvw=
rite
> =

> $ tpm2_rc_decode 0x99d
> error layer
> =C2=A0 hex: 0x0
> =C2=A0 identifier: TSS2_TPM_RC_LAYER
> =C2=A0 description: Error produced by the TPM
> format 1 error code
> =C2=A0 hex: 0x1d
> =C2=A0 identifier: TPM2_RC_POLICY_FAIL
> =C2=A0 description: a policy check failed
> session
> =C2=A0 hex: 0x100
> =C2=A0 identifier: TPM2_RC_1
> =C2=A0 description: =C2=A0(null)
> =

> From the verbose output I can see that the first 512 bytes are successful=
ly written, and it only fails the policy check for the remaining 131 bytes.
> =E2=80=8BI don't think this is a policy =E2=80=8Bfailure, since the polic=
y check succeeds for the first 512 bytes and the policy is defined with PCR=
0 of the sha256 bank which is not changing.
> =

> =

> =E2=80=8BMy guess is that it was related to the size of the file I was tr=
ying to write to NVRAM, so=E2=80=8B
> =C2=A0I tried writing a smaller file (< 512) and that succee
> =E2=80=8Bds=E2=80=8B
> .
> =

> $ tpm2_nvwrite -x =C2=A00x1800005 -a 0x1800005 -L sha256:0 -F pcr.value t=
a2_config.cfg -V
> INFO on line: "125" in file: "tools/tpm2_nvwrite.c": The data(size=3D273)=
 to be written:
> INFO on line: "141" in file: "tools/tpm2_nvwrite.c": Success to write NV =
area at index 0x1800005 (25165829) offset 0x0.
> 54504d5f454b5f4b45595f48414e444c45203d202230783831303130303032220a54504d5=
f414b5f4b45595f48414e444c45203d202230783831303130303033220a54504d5f48415348=
5f414c474f524954484d203d2022736861323536220a4d53475f46494c45203d20222f746d7=
02f71756f74652e6d7367220a5349474e41545552455f46494c45203d20222f746d702f7175=
6f74652e736967220a51554f54455f46494c45203d20222f746d702f71756f74652e71756f7=
4220a51554f54455f4a534f4e5f46494c45203d20222f746d702f71756f74652e6a736f6e22=
0a454b5f46494c45203d20222f746d702f656b2e707562220a414b5f46494c45203d20222f7=
46d702f616b2e707562220a% =C2=A0
> =

> I only have this problem when using policies. If I define NVRAM without a=
ny policies I can write the file successfully even if the size is larger th=
an 512.
> =

> Does anyone have any idea what might be going on?
> =

> Thanks in advance!
> =

> Best regards,
> Gabriela Limonta

Hi Gabriela,
My first guess is that the TCTI performs two partial writes internally and =
after the first partial write the policy digest
gets updated. Could you please enable TCTI debug info and try to write the =
big buffer again.
The debug info can be turned on by:
export TSS2_LOG=3D"all+ERROR,tcti+TRACE"

Thanks,
-- =

Tadeusz

--===============2581946180911579499==--

