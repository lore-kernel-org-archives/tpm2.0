Content-Type: multipart/mixed; boundary="===============3316665079897633818=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Possible TPM uses in fprintd/libfprint
Date: Wed, 27 May 2020 14:47:42 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EF4D39@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 1a6d8509d88d2ebd7ece0ed0a111c61c3c1cfcca.camel@sipsolutions.net
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3316665079897633818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Benjamin Berg [mailto:benjamin(a)sipsolutions.net]
> Sent: Wednesday, May 27, 2020 9:24 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Possible TPM uses in fprintd/libfprint
> =

> Hi,
> =

> I was wondering if someone has ideas about integrating the TPM with Finge=
rprint
> readers.
> =

> Recently I started looking into supporting Secure Device Connection Proto=
col
> (SDCP, [1]) in libfprint. The general idea is to verify that the Fingerpr=
int reader can
> be trusted, but I initially also imagined that further use-cases like uns=
ealing data
> in a TPM may be possible (e.g. to retrieve disk encryption keys).
> =

> However, looking into it more, my current conclusion is that there is lit=
tle to no
> advantage to use the TPM. At least not unless one also has a trusted (use=
rspace)

In theory you would have a measured boot environment. This way you can atte=
st the
host is in a good state. You could further isolate by have a segregated use=
rspace
components through things like Trustlets or SGX Enclaves. The general parad=
igm of
security is to take sensitive operations and move them out of band to a sma=
ller
execution environment, this paradigm can be extended infinitely, but the re=
strictions
here lie in the realm of how much work do you want to do, which is determin=
ing by
what you're trying to protect.

> program which is capable of signing TPM authorizations. One could easily =
offload
> the required parts into a small helper, but that may require ensuring it =
runs in a
> trusted execution environment.
> Microsoft seems to run relevant parts as trustlets that are walled off fr=
om the
> rest of the system. That seems sensible to me, but it also means requirin=
g all the
> infrastructure for execution and signing and I doubt that is feasible cur=
rently.

You're still sharing hardware, which means that a potentially bad host, cou=
ld
be undermining the hardware and VM protections. Granted you have higher
level of assurances, it's not a guarantee.

> =

> =

> Right now I'll probably go the way of not using the TPM at all. But I am =
really not
> an expert for this. So should someone see scenarios where a TPM is actual=
ly
> helpful in this context, then I would like to hear about them.

You could do a measured boot scenario that included measuring the state of
the fingerprint reader (I'm assuming SCDO would give you something like tha=
t).
Something has to cause the measurement to get extended into a PCR so you can
Get a quote and check later that it's all OK. If it's all OK, you can then =
release a secret
From the TPM. You can couple keys/objects to this measured state.

There is stuff on this in the Practical Guide to TPM2.0
and is available os a ODF download:
https://link.springer.com/content/pdf/10.1007%2F978-1-4302-6584-9.pdf


> =

> Benjamin
> =

> PS: A quick summary of how SDCP works:
>  * Device has a private ECC key that signs the firmware and ephemeral
>    keys during boot (and is inaccessible afterwards)
>  * A certificate proofs that this key was provisioned in factory
>  * Device builds a shared secret with the host (s)
>  * Device sends id, HMAC_SHA256(s, "identify" || nonce || id)
>    when the finger "id" was presented.
>  * The HMAC proofs knowledge of the shared secret and authorizes the
>    print.
> =

> [1] https://github.com/microsoft/SecureDeviceConnectionProtocol/wiki/Secu=
re-
> Device-Connection-Protocol

--===============3316665079897633818==--

