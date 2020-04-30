Content-Type: multipart/mixed; boundary="===============7538501148140615970=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Are there any help documents/sites on writing an ESAPI
 program.
Date: Thu, 30 Apr 2020 15:43:53 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED8BC7@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAOCvsSkU7cMsp9OmRHt0kA0aGZA9zu0nDtkgrG_JGE=soW457g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7538501148140615970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The tools themselves are real world examples.

You shouldn't go digging into the ESYS_CONTEXT or TCTI_CONTEXT but the stru=
cture parameters
And returns to ESYS calls you can. Its set up where you can't go structure =
digging and compile with
the include directory includes (https://github.com/tpm2-software/tpm2-tss/t=
ree/master/include/tss2).
If you add includes from the project that exist elsewhere you're doing it w=
rong.

Now for the ZGen code, we actually want to add it to tools. Its actually on=
 the short list of commands
To add, see bug: https://github.com/tpm2-software/tpm2-tools/issues/877

The reason we didn't add it yet, is we didn't know exactly how it works and=
 to test it. Imran and I
Actually have a meeting with someone way more knowledgeable on ECC to help =
us along. We would
Love, even just sample code to help us out, or if you created the tool even=
 better. Anything you can
Share back is a win.


Now for taking the training wheels off, Esys_Initialize(), you can leave of=
f the tcti and abi pointers by passing
NULL. That should just get you a context with the TPM and away you go. Here=
 is a very simple program to start
With:
https://gist.github.com/williamcroberts/66a7dab3adfb973fbae3219954535009

You can alter that by changing the template and making an EC key to play wi=
th, or have it pass in blobs from
tpm2_create tool. Tpm2_create tool has the output options -u and -r that yo=
u can pass along, and load those up by:
1. Desterilizing with libmu (offhand I think the calls will be Tss2_MU_TPM2=
B_PRIVATE_Unmarshal and Tss2_MU_TPM2B_PUBLIC_Unmarshal)
2. Calling Esys_Load() and getting the ESYS_TR handle to pass to the zgen r=
outine



> -----Original Message-----
> From: Steven Clark [mailto:davolfman(a)gmail.com]
> Sent: Wednesday, April 29, 2020 7:51 PM
> To: tpm2 <tpm2(a)lists.01.org>
> Subject: [tpm2] Are there any help documents/sites on writing an ESAPI
> program.
> =

> I need to perform a command that doesn't have a tools executable yet
> (TPM2_ECDH_ZGen) and on a persistent object handle that won't be compatib=
le
> with the on-disk key-databases of FAPI or PKCS#11.  So that means I need =
to
> write my own code in C, and that code needs to use the ESAPI.
> =

> I've had a lot of lead time to see this coming so I've done a few little =
experiments.
> They have not improved my confidence in my understanding of the API.  For
> example I'm still not sure which structures I'm supposed to access direct=
ly and
> which ones are supposed to be manipulated using functions.
> =

> The Specs are either long and theoretical or dry and terse.  And both the=
 tests for
> TSS and the source files for Tools make use of internal abstraction layer=
s.  I'm
> having trouble getting a whole-process picture.  Are there any resources =
out
> there to help me get my sea-legs on ESAPI code?

--===============7538501148140615970==--

