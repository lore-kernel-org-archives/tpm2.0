Content-Type: multipart/mixed; boundary="===============0979390822536838306=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Are there any help documents/sites on writing an ESAPI
 program.
Date: Fri, 01 May 2020 16:01:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED8EBA@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAOCvsS=82HEeXFYbYVqDnSP52F0iTM5O3Hs8zoXzqFA6=vBL3g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0979390822536838306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Steven Clark [mailto:davolfman(a)gmail.com]
> Sent: Thursday, April 30, 2020 8:37 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2 <tpm2(a)lists.01.org>
> Subject: Re: [tpm2] Are there any help documents/sites on writing an ESAPI
> program.
> =

> I'm remembering more about the last time I tried to write this code.  I g=
ot far
> enough to set up an ESYS_CONTEXT and use the TCTI defaulting behavior to =
use
> whatever the system was configured for.  Between the Doxygen pages and the
> ESAPI spec I managed to do that much.  I think the next part I ran into w=
as that
> the ESAPI seemed to imply that ESYS_TRs were also opaque so I wasn't sure=
 if I
> needed to use a function to get a handle that was already persisted.  I'll
> remember more questions as I look over my old code and get back into that
> mindset.  The problem of converting from OpenSSL to TSS key format should=
 be
> only an annoyance now that I've taught myself to read DER in a hex editor=
 for
> something else.
> =

> Now that I've read Robert's code, and done a little more research to go w=
ith it
> I've got ideas.  The tool is probably going to need a -u option which sho=
uld
> probably have the ability to load a PEM public key (which I think is PKCS=
#8 but all I
> see on that says it's for private keys) in addition to the TSS structure =
like
> tpm2_loadexternal.  If the loadexternal behavior really is RSA only then =
it'll be a
> pain because ECC keys can come in a compressed form that takes math to

ECC support is present, tpm2_loadexternal calls tpm2_openssl_load_public() =
and will
Load a TPM2B_PUBLIC structure with the details.

> decode.  The tool should ideally have a -o option that's optional with pi=
pe
> detection to switch to binary like tpm2_getrandom, because the expected
> output format is a 32-byte integer with no formatting.

Is it? How do you know that (im curious)? Their's code to go from TPM2 data=
 structures
To openssl EC_POINT. I was trying to figure out what to do with it then. Op=
enssl has
The app ecparams that shows some PEM output of BEGIN EC PARAMS in scissor l=
ines.
I wasn't sure if we should go that route.

> =

> Creating an example input point isn't apparently as easy as just punching=
 in an
> arbitrary number pair because the valid points for every curve only have =
one
> degree of freedom plus a bit: there are only two valid y coordinates for =
every x.
> That's why they can be compressed.  Also 0 might be a special identity, o=
r maybe
> that's just for scalar multiplication.

Yeah this is where I get fuzzy and don't really know how to make this all w=
ork.

> =

> On Thu, Apr 30, 2020 at 11:29 AM Steven Clark <davolfman(a)gmail.com
> <mailto:davolfman(a)gmail.com> > wrote:
> =

> =

> 	If you're getting your Private and Public from the same keypair for an
> ECDH Zgen that's almost certainly why it's breaking.  As far as I know th=
e inpoint
> should be the public key of the other side of the conversation, and the x
> coordinate of the output point should be the shared secret.  At least if =
the
> command does what I think it does.
> 	As I understand it if you want to double check your results you can deri=
ve
> the same shared secret from the other side of the channel, using their pr=
ivate
> key and the TPM key's public.  For example using openssl it would be:
> 	openssl pkeyutl -derive -inkey software.priv.pem -peerkey tpm.pub.pem
> -out shared.secret
> 	The shared secrets derived on both sides of the channel are the same but
> only public keys are exchanged and verified.  Hence why it's Elliptic Cur=
ve Diffie-
> Hellman.
> =

> 	The other ECDH commands are for less trivial cases involving more
> ephemeral keypairs and the like.
> =

> 	On Thu, Apr 30, 2020 at 9:27 AM Roberts, William C
> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com> > w=
rote:
> =

> =

> 		I took a few minutes and created a skeleton tool that calls ecdg
> zgen:
> 		https://github.com/williamcroberts/tpm2.0-tools/tree/zgen
> =

> 		If you build that branch you will see the tool tpm2_ecdhzgen. You
> can
> 		Call that command abd it will run, but has some errors, you need
> to
> 		Figure out what to do with in point and out point parameters.
> =

> 		    // Test setup
> 		    tpm2_createprimary -c primary.ctx
> 		    tpm2_create -C primary.ctx -G ecc256 -u ec.pub -r ec.priv
> 		    tpm2_load -C primary.ctx -u ec.pub -r ec.priv -c ec.ctx
> =

> 		    // Command fails...but runs!
> 		    tpm2_ecdhzgen -c ec.ctx
> 		    ERROR: Esys_RSA_Decrypt(0x1E7) - tpm:parameter(1):point is
> not on the required curve
> =

> =

> 		> -----Original Message-----
> 		> From: Roberts, William C
> 		> Sent: Thursday, April 30, 2020 10:59 AM
> 		> To: 'Steven Clark' <davolfman(a)gmail.com
> <mailto:davolfman(a)gmail.com> >; 'tpm2' <tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org> >
> 		> Subject: RE: [tpm2] Are there any help documents/sites on
> writing an ESAPI
> 		> program.
> 		>
> 		> The Esys integration tests are also super helpful:
> 		> https://github.com/tpm2-software/tpm2-
> 		> tss/blob/master/test/integration/esys-ecdh-zgen.int.c
> 		>
> 		>
> 		> > -----Original Message-----
> 		> > From: Roberts, William C
> 		> > Sent: Thursday, April 30, 2020 10:44 AM
> 		> > To: 'Steven Clark' <davolfman(a)gmail.com
> <mailto:davolfman(a)gmail.com> >; tpm2 <tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org> >
> 		> > Subject: RE: [tpm2] Are there any help documents/sites on
> writing an
> 		> > ESAPI program.
> 		> >
> 		> > The tools themselves are real world examples.
> 		> >
> 		> > You shouldn't go digging into the ESYS_CONTEXT or
> TCTI_CONTEXT but the
> 		> > structure parameters And returns to ESYS calls you can. Its set
> up
> 		> > where you can't go structure digging and compile with the
> include
> 		> > directory includes (https://github.com/tpm2-software/tpm2-
> 		> tss/tree/master/include/tss2).
> 		> > If you add includes from the project that exist elsewhere
> you're doing it wrong.
> 		> >
> 		> > Now for the ZGen code, we actually want to add it to tools. Its
> 		> > actually on the short list of commands To add, see bug:
> 		> > https://github.com/tpm2-
> 		> > software/tpm2-tools/issues/877
> 		> >
> 		> > The reason we didn't add it yet, is we didn't know exactly how
> it
> 		> > works and to test it. Imran and I Actually have a meeting with
> someone
> 		> > way more knowledgeable on ECC to help us along. We would
> Love, even
> 		> > just sample code to help us out, or if you created the tool
> even
> 		> > better. Anything you can Share back is a win.
> 		> >
> 		> >
> 		> > Now for taking the training wheels off, Esys_Initialize(), you
> can
> 		> > leave off the tcti and abi pointers by passing NULL. That
> should just
> 		> > get you a context with the TPM and away you go. Here is a
> very simple
> 		> > program to start
> 		> > With:
> 		> >
> https://gist.github.com/williamcroberts/66a7dab3adfb973fbae32199545350
> 		> > 09
> 		> >
> 		> > You can alter that by changing the template and making an EC
> key to
> 		> > play with, or have it pass in blobs from tpm2_create tool.
> Tpm2_create
> 		> > tool has the output options -u and -r that you can pass along,
> and load those up
> 		> by:
> 		> > 1. Desterilizing with libmu (offhand I think the calls will be
> 		> > Tss2_MU_TPM2B_PRIVATE_Unmarshal and
> 		> > Tss2_MU_TPM2B_PUBLIC_Unmarshal) 2. Calling Esys_Load()
> and getting the
> 		> > ESYS_TR handle to pass to the zgen routine
> 		> >
> 		> >
> 		> >
> 		> > > -----Original Message-----
> 		> > > From: Steven Clark [mailto:davolfman(a)gmail.com
> <mailto:davolfman(a)gmail.com> ]
> 		> > > Sent: Wednesday, April 29, 2020 7:51 PM
> 		> > > To: tpm2 <tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 		> > > Subject: [tpm2] Are there any help documents/sites on
> writing an
> 		> > > ESAPI program.
> 		> > >
> 		> > > I need to perform a command that doesn't have a tools
> executable yet
> 		> > > (TPM2_ECDH_ZGen) and on a persistent object handle that
> won't be
> 		> > > compatible with the on-disk key-databases of FAPI or
> PKCS#11.  So
> 		> > > that means I need to write my own code in C, and that code
> needs to use the
> 		> ESAPI.
> 		> > >
> 		> > > I've had a lot of lead time to see this coming so I've done a
> few
> 		> > > little
> 		> > experiments.
> 		> > > They have not improved my confidence in my
> understanding of the API.
> 		> > > For example I'm still not sure which structures I'm supposed
> to
> 		> > > access directly and which ones are supposed to be
> manipulated using
> 		> functions.
> 		> > >
> 		> > > The Specs are either long and theoretical or dry and terse.
> And
> 		> > > both the tests for TSS and the source files for Tools make
> use of
> 		> > > internal abstraction layers.  I'm having trouble getting a
> 		> > > whole-process picture.  Are there any resources out there
> to help me
> 		> > > get my sea-legs on ESAPI
> 		> > code?
> =



--===============0979390822536838306==--

