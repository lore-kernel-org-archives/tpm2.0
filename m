Content-Type: multipart/mixed; boundary="===============1769203033151879148=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.org>
Subject: Re: [tpm2] Windows Visual Studio 2017: Trying to use
 Tss2_TctiLdr_Initialize
Date: Wed, 11 Sep 2019 10:35:27 +0100
Message-ID: <7dfc0541-e186-3a32-4421-3a1315a0b95b@twobit.org>
In-Reply-To: 49E6E769-7641-476A-A13F-736B9567868B@vmware.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1769203033151879148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Timothy,

On 9/11/19 2:27 AM, Timothy Le wrote:
> Hi,
> =

> =C2=A0
> =

> I am trying to use the tpm2-tss library on Windows Visual Studio 2017
> with the Universal Windows Platform Development.
> =

> I have been able to build the solution successfully, and I am now
> creating a C++ projec within the solution. I am trying to use the
> function =E2=80=9CTss2_TctiLdr_Initialize=E2=80=9D. I have added the addi=
tional include
> folder in Project > Properties > C/C++ > General, the required
> Additional Library Directory in Project > Properties > Linker > General,
> and the path to tss2-tctildr.lib file in Project > Properties > Linker >
> Input.
> =

> =C2=A0
> =

> However, when building, I receive the following error:
> =

> =C2=A0
> =

> Severity
> =

> 	=

> =

> Code
> =

> 	=

> =

> Description
> =

> 	=

> =

> Project
> =

> 	=

> =

> File
> =

> 	=

> =

> Line
> =

> 	=

> =

> Suppression State
> =

> Error
> =

> 	=

> =

> LNK2019
> =

> 	=

> =

> unresolved external symbol "unsigned int __cdecl
> Tss2_TctiLdr_Initialize(char const *,struct
> TSS2_TCTI_OPAQUE_CONTEXT_BLOB * *)"
> (?Tss2_TctiLdr_Initialize@@YAIPEBDPEAPEAUTSS2_TCTI_OPAQUE_CONTEXT_BLOB@@@=
Z)
> referenced in function main
> =

> 	=

> =

> fs_store
> =

> 	=

> =

> C:\Users\Administrator\Desktop\tpm2-tss\fs_store\Source.obj
> =

> 	=

> =

> 1
> =

> 	=

> =

> =C2=A0
> =

> I have followed the same corresponding steps to build Esys_Initialize
> without any build errors, so this issue is occurring only with the
> TctiLdr functions.

The Esys_Initialize function calls Tss2_TctiLdr_Initialize so if this
works in your experiments then the tss2-tctildr library is exporting the
symbol properly. The next most likely culprit is unfortunately the
configuration for the project that's trying to link to this function
directly. I realize that you've stated that their configuration is
identical above but everything from your message is pointing in this
direction.

If you post a link to your code I'm happy to take a look.

Philip

--===============1769203033151879148==--

