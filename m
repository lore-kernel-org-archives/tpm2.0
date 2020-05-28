Content-Type: multipart/mixed; boundary="===============7004293629550536764=="
MIME-Version: 1.0
From: Zhu, Bing <bing.zhu at intel.com>
Subject: [tpm2] Re: Possible TPM uses in fprintd/libfprint
Date: Thu, 28 May 2020 01:10:26 +0000
Message-ID: <SN6PR11MB33440FCC67C70BB4869C798A848E0@SN6PR11MB3344.namprd11.prod.outlook.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EF4D39@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7004293629550536764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Benjamin, I'm pretty interested in this ...

Given that you already have a SDCP-capable sensor (like fingerprint), and y=
ou also have a trusted execution environment (TEE), then SDCP should work p=
erfectly for you. on MSFT windows, virtualization-based security (VBS) prov=
ides a TEE to allow you to do that.  In other OSs, you can use Intel SGX-ba=
sed solution to securely talk with your sensor based on SDCP security proto=
cols. =


Now, may I have a question -  what problems would you like to solve if you =
need to add TPM?

Bing

> -----Original Message-----
> From: Roberts, William C <william.c.roberts(a)intel.com>
> Sent: Wednesday, May 27, 2020 22:48 PM
> To: Benjamin Berg <benjamin(a)sipsolutions.net>; tpm2(a)lists.01.org
> Subject: [tpm2] Re: Possible TPM uses in fprintd/libfprint
> =

> =

> =

> > -----Original Message-----
> > From: Benjamin Berg [mailto:benjamin(a)sipsolutions.net]
> > Sent: Wednesday, May 27, 2020 9:24 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Possible TPM uses in fprintd/libfprint
> >
> > Hi,
> >
> > I was wondering if someone has ideas about integrating the TPM with
> > Fingerprint readers.
> >
> > Recently I started looking into supporting Secure Device Connection
> > Protocol (SDCP, [1]) in libfprint. The general idea is to verify that
> > the Fingerprint reader can be trusted, but I initially also imagined
> > that further use-cases like unsealing data in a TPM may be possible (e.=
g. to
> retrieve disk encryption keys).
> >
> > However, looking into it more, my current conclusion is that there is
> > little to no advantage to use the TPM. At least not unless one also
> > has a trusted (userspace)
> =

> In theory you would have a measured boot environment. This way you can at=
test
> the host is in a good state. You could further isolate by have a segregat=
ed userspace
> components through things like Trustlets or SGX Enclaves. The general par=
adigm of
> security is to take sensitive operations and move them out of band to a s=
maller
> execution environment, this paradigm can be extended infinitely, but the
> restrictions here lie in the realm of how much work do you want to do, wh=
ich is
> determining by what you're trying to protect.
> =

> > program which is capable of signing TPM authorizations. One could
> > easily offload the required parts into a small helper, but that may
> > require ensuring it runs in a trusted execution environment.
> > Microsoft seems to run relevant parts as trustlets that are walled off
> > from the rest of the system. That seems sensible to me, but it also
> > means requiring all the infrastructure for execution and signing and I =
doubt that is
> feasible currently.
> =

> You're still sharing hardware, which means that a potentially bad host, c=
ould be
> undermining the hardware and VM protections. Granted you have higher leve=
l of
> assurances, it's not a guarantee.
> =

> >
> >
> > Right now I'll probably go the way of not using the TPM at all. But I
> > am really not an expert for this. So should someone see scenarios
> > where a TPM is actually helpful in this context, then I would like to h=
ear about
> them.
> =

> You could do a measured boot scenario that included measuring the state o=
f the
> fingerprint reader (I'm assuming SCDO would give you something like that).
> Something has to cause the measurement to get extended into a PCR so you =
can Get
> a quote and check later that it's all OK. If it's all OK, you can then re=
lease a secret
> From the TPM. You can couple keys/objects to this measured state.
> =

> There is stuff on this in the Practical Guide to TPM2.0 and is available =
os a ODF
> download:
> https://link.springer.com/content/pdf/10.1007%2F978-1-4302-6584-9.pdf
> =

> =

> >
> > Benjamin
> >
> > PS: A quick summary of how SDCP works:
> >  * Device has a private ECC key that signs the firmware and ephemeral
> >    keys during boot (and is inaccessible afterwards)
> >  * A certificate proofs that this key was provisioned in factory
> >  * Device builds a shared secret with the host (s)
> >  * Device sends id, HMAC_SHA256(s, "identify" || nonce || id)
> >    when the finger "id" was presented.
> >  * The HMAC proofs knowledge of the shared secret and authorizes the
> >    print.
> >
> > [1]
> > https://github.com/microsoft/SecureDeviceConnectionProtocol/wiki/Secur
> > e-
> > Device-Connection-Protocol
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-
> leave(a)lists.01.org %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============7004293629550536764==--

