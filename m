Content-Type: multipart/mixed; boundary="===============7576543620670806850=="
MIME-Version: 1.0
From: Timothy Le <leti at vmware.com>
Subject: Re: [tpm2] Windows Visual Studio 2017: Trying to use
 Tss2_TctiLdr_Initialize
Date: Fri, 13 Sep 2019 17:41:40 +0000
Message-ID: <D76AD609-1AD2-4785-8164-679AA0D18A8A@vmware.com>
In-Reply-To: 7dfc0541-e186-3a32-4421-3a1315a0b95b@twobit.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7576543620670806850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Philip,

Thank you for your reply. Based on your response, I was able to just use th=
e Esys_Initialize function to call Tss2_TctiLdr_Initialize.

Timothy

=EF=BB=BFOn 9/11/19, 2:35 AM, "Philip Tricca" <flihp(a)twobit.org> wrote:

    Hi Timothy,
    =

    On 9/11/19 2:27 AM, Timothy Le wrote:
    > Hi,
    > =

    >  =

    > =

    > I am trying to use the tpm2-tss library on Windows Visual Studio 2017
    > with the Universal Windows Platform Development.
    > =

    > I have been able to build the solution successfully, and I am now
    > creating a C++ projec within the solution. I am trying to use the
    > function =E2=80=9CTss2_TctiLdr_Initialize=E2=80=9D. I have added the =
additional include
    > folder in Project > Properties > C/C++ > General, the required
    > Additional Library Directory in Project > Properties > Linker > Gener=
al,
    > and the path to tss2-tctildr.lib file in Project > Properties > Linke=
r >
    > Input.
    > =

    >  =

    > =

    > However, when building, I receive the following error:
    > =

    >  =

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
    > (?Tss2_TctiLdr_Initialize@@YAIPEBDPEAPEAUTSS2_TCTI_OPAQUE_CONTEXT_BLO=
B@@@Z)
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

    >  =

    > =

    > I have followed the same corresponding steps to build Esys_Initialize
    > without any build errors, so this issue is occurring only with the
    > TctiLdr functions.
    =

    The Esys_Initialize function calls Tss2_TctiLdr_Initialize so if this
    works in your experiments then the tss2-tctildr library is exporting the
    symbol properly. The next most likely culprit is unfortunately the
    configuration for the project that's trying to link to this function
    directly. I realize that you've stated that their configuration is
    identical above but everything from your message is pointing in this
    direction.
    =

    If you post a link to your code I'm happy to take a look.
    =

    Philip
    =



--===============7576543620670806850==--

