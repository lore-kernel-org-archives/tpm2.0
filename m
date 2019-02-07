Content-Type: multipart/mixed; boundary="===============3968985450310197898=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] tpm2-tools AK authorization question
Date: Thu, 07 Feb 2019 14:52:45 +0000
Message-ID: <58e84c50-8cd1-6756-02ae-a19d2cd7875b@linux.intel.com>
In-Reply-To: 3c447329edc3414092b36c75f12c1c36@ll.mit.edu
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3968985450310197898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Charlie,

On 05/02/2019 23:35, Munson, Charles - 0553 - MITLL wrote:
> Hello,
> =

> I=E2=80=99m not sure if this is user error or an issue with one of the to=
ols.   =

> I am trying to do a createek -> createak -> makecredential -> =

> activatecredential workflow with the new ESAPI tools in master =

> (following the advice when used with a resource manager here: =

> https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_createak=
.1.md).  =

> This seems to work well when there is no AK authorization set (when =

> performing createak), though fails with an =E2=80=9Cauthorization HMAC ch=
eck =

> failed=E2=80=9C error when setting an AK_AUTH.
> =

> So for instance (following the documentation):
> =

> tpm2_createek -c 0x81010001 -G rsa -p ek.pub
> =

> tpm2_createak -C 0x81010001 -k 0x81010002 -p ak.pub -n ak.name*-P "akpw"*
> =

> tpm2_makecredential -e ek.pub -s file_input_data.txt -n <ak.name here> =

> -o outcred.out
> =

> tpm2_activatecredential -c 0x81010002 -C 0x81010001 -f outcred.out -o =

> verify.out*-P "akpw"*
> =

> WARNING:esys:src/tss2-esys/api/Esys_ActivateCredential.c:342:Esys_Activat=
eCredential_Finish() =

> Received TPM Error
> =

> ERROR:esys:src/tss2-esys/api/Esys_ActivateCredential.c:127:Esys_ActivateC=
redential() =

> Esys Finish ErrorCode (0x0000098e)
> =

> ERROR: Esys_ActivateCredential(0x98E) - tpm:session(1):the authorization =

> HMAC check failed and DA counter incremented
> =

> ERROR: Unable to run tpm2_activatecredential
> =

> Note that by not using an AK_AUTH (removing all of the =C2=A0-P "akpw" co=
de) =

> that this works, and this example used to work pre-ESAPI.=C2=A0 Is this n=
o =

> longer supported? =C2=A0Everything seems to work fine still with tpm2_quo=
te.

This is a bug introduced when I ported tpm2_activatecredential to use =

the ESAPI. I took a look and can't immediately see what the fix is, but =

I'm still trying to wrap my head around TPM sessions. I am working on a =

fix for this in tandem with some other session related changes in the tools.

Thanks,
Joshua

--===============3968985450310197898==--

