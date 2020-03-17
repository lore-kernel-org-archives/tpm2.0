Content-Type: multipart/mixed; boundary="===============4635148025700789381=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Tue, 17 Mar 2020 13:06:12 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EACABB@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAP3jAwTDkp+V7yLYipszy562ETNsnvTfXsDw35Lvi2C-9xeuSA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4635148025700789381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Rahul Hardikar [mailto:rahulhardikar(a)gmail.com]
> Sent: Monday, March 16, 2020 5:43 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] ESys_ActivateCredential
> =

> One last attempt...wondering if AK needs to be loaded in this case Thread=
 1 in
> client .. creates EK and AK and sends to server Server creates credential
> externally sends secret and credential blob Thread 2 in client - Calls
> ActivateCredential (it has access to the global ESYS_CONTEXT structures,
> ak_handles and ek_handles that thread 1 created)
> =

> Question: Are AK keys still present in the TPM? Will the ESAPI structures=
 still work
> even after few seconds or are they flushed?
> I'm trying to understand why if I run all these methods in a single threa=
d, it works!

They should work, all of this would work if done properly. The ESYS/TCTI co=
ntexts are
not thread safe IIUC, so you can't share without locking or ensuring mutual=
 exclusion.

If you're using a RM, it should just be seeing a connection from a process,=
 it has no
Idea if you have multiple threads, and thus doesn't care. Nothing will get =
flushed from
The TPM unless your application or an RM does it. So all the handles, etc s=
hould remain
valid until one of those events occur.

> =

> Thanks
> Rahul
> =

> On Fri, Mar 13, 2020 at 10:22 AM Rahul Hardikar <rahulhardikar(a)gmail.com
> <mailto:rahulhardikar(a)gmail.com> > wrote:
> =

> =

> 	Any idea folks?
> =

> 	On Thu, Mar 12, 2020 at 5:52 PM Rahul Hardikar
> <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > wrote:
> =

> =

> 		I noticed the same changes when its run as a single process, the
> remote attestation method works, the moment i move the make external
> credential part to the server I hit this issue.
> 		Wondering what could go wrong? Do the AK keys get flushed
> out?
> 		On the client side, I have the EKCERT and EK and AK keys loaded
> in the tpm2, I save the handle of EK and AK for future use when I receive=
 the
> credential blob and secret, so basically i fork out a thread to send the =
data (and
> create EK/AK) and then fork another thread to handle the receive part, but
> EK/AK handles are global and saved and no other process touches the TPM!
> =

> 		Why would I get 0x2c4 in Esys_ActivateCredential ()  but works
> perfectly fine when everything is run as one thread?
> =

> 		Thanks,
> 		Rahul
> =

> 		On Tue, Mar 10, 2020 at 4:22 PM Rahul Hardikar
> <rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> > wrote:
> =

> =

> 			Thanks Bill.
> 			Wondering why this would fail. The external make
> credential API,  I have taken from tss2 GitHub only why would secret fail=
? When I
> ran all of this locally it worked, the moment I moved the make external c=
redential
> to the server Im hitting this?
> 			Can it be because of OpenSSL 1.1.0 required in tss2 and
> 1.0.2 version running on my server?
> 			Thanks
> 			Rahul
> =

> 			On Tue, Mar 10, 2020 at 3:36 PM Roberts, William C
> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com> > w=
rote:
> =

> =

> 				The error codes encode a bunch of values, so you
> won't see that value via a straight grep.
> =

> 				But you can use tpm2_rc_decode from the tpm2-
> tools project, like so:
> 				$ tpm2_rc_decode 0x2c4
> 				tpm:parameter(2):value is out of range or is not
> correct for the contex
> =

> 				See the tools project:
> 				https://github.com/tpm2-software/tpm2-tools
> =

> 				Note that the commands specification will show
> you what parameter 2 is:
> 				https://trustedcomputinggroup.org/wp-
> content/uploads/TPM-Rev-2.0-Part-3-Commands-01.38.pdf
> =

> 				Everything after the triple line starts the
> parameters starting at index 1.
> 				So in this case the secret parameter is wrong.
> =

> 				Note that since TSS version 2.3.0 a software
> library was also added
> 				for converting these return codes to more human
> understandable strings,
> 				The header file is here:
> 				https://github.com/tpm2-software/tpm2-
> tss/blob/master/include/tss2/tss2_rc.h
> =

> 				and then you just link against lib tss2-rc, just in
> case you needed this built into
> 				your program.
> =

> 				Bill
> =

> 				> -----Original Message-----
> 				> From: Rahul Hardikar
> [mailto:rahulhardikar(a)gmail.com <mailto:rahulhardikar(a)gmail.com> ]
> 				> Sent: Tuesday, March 10, 2020 5:02 PM
> 				> To: tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 				> Subject: [tpm2] ESys_ActivateCredential
> 				>
> 				>
> 				> Hi All,
> 				> What does it mean when
> Esys_ActivateCredential returns 0x2c4? I don't see this
> 				> error defined anywhere.
> 				>
> 				> Thanks,
> 				> Rahul
> =



--===============4635148025700789381==--

