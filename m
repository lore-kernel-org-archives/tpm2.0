Content-Type: multipart/mixed; boundary="===============8365759059752774866=="
MIME-Version: 1.0
From: Zhu, Bing <bing.zhu at intel.com>
Subject: [tpm2] Re: Possible TPM uses in fprintd/libfprint
Date: Mon, 01 Jun 2020 02:03:08 +0000
Message-ID: <SN6PR11MB33441E64964A0456A6705AF0848A0@SN6PR11MB3344.namprd11.prod.outlook.com>
In-Reply-To: d3262eef85315dafe56f01493c72824df10e2c36.camel@sipsolutions.net
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8365759059752774866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Benjamin Berg <benjamin(a)sipsolutions.net>
> Sent: Friday, May 29, 2020 17:27 PM
> To: Zhu, Bing <bing.zhu(a)intel.com>; Roberts, William C
> <william.c.roberts(a)intel.com>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: Possible TPM uses in fprintd/libfprint
> =

> Hi,
> =

> On Thu, 2020-05-28 at 01:10 +0000, Zhu, Bing wrote:
> > Given that you already have a SDCP-capable sensor (like fingerprint),
> > and you also have a trusted execution environment (TEE), then SDCP
> > should work perfectly for you. on MSFT windows, virtualization-based
> > security (VBS) provides a TEE to allow you to do that.  In other OSs,
> > you can use Intel SGX-based solution to securely talk with your sensor
> > based on SDCP security protocols.
> =

> Yeah. I don't think I need to secure the channel though. This is about be=
ing
> able to fully trust the process that it has correctly verified the Finger=
print
> readers authenticity, that it is not itself a vector for a MitM attack or=
 can
> simply be bypassed somehow.
> =

> The idea mentioned earlier to include the SDCP enabled device in the boot
> measurements would not require any further safety precautions. It would be
> perfectly viable to verify and include the devices public-key (and firmwa=
re hash)
> in the measurements.
> =

> > Now, may I have a question -  what problems would you like to solve if
> > you need to add TPM?
> =

> I don't really think that adding a TPM will solve an issues in itself.
> If I "just" authenticate a user on an already running system, then the en=
tire
> authentication stack is trusted anyway. SDPC does add a bit more security=
 as it
> allows to verify the integrity of the reader. But I don't think that a TP=
M would
> make a major difference in this scenario.
> =

> My primary example of a new use-case would be to enable per-user disk
> encryption and password less (or multi-factor) login together with the
> Fingerprint reader.
> In such a scenario the Fingerprint reader does not just authenticate the =
user.
> Instead it also enables unsealing secrets for the user after the finger w=
as
> presented (e.g. a disk encryption key). Protecting these secrets seems li=
ke a
> much harder problem than only authenticating the user.

In my opinion, biometrics authentications are typically treated as "Seconda=
ry authentication" methods, while the password/pin are "primacy authenticat=
ion"... then if you look at all the current designs in all the mobile devic=
es, you will see that even if you have password and fingerprint methods to =
login your system, but after reboot the device, in the first login attempt,=
 the system always asks for password to unlock your system, not a fingerpri=
nt.. also whenever you change fingerprint enrollment, you must have to prov=
ide your password. And not vice visa. =


So, as an industry standard security practice, biometrics authentication ty=
pically is ~not~ used for ~first~ login attempt after device reboot. In you=
r case scenarios, disk decryption,  typically it is always happening during=
 the ~first~ login attempt. So password should be used instead, to comply w=
ith industry secure practice.

> Benjamin
> =

> > > -----Original Message-----
> > > From: Roberts, William C <william.c.roberts(a)intel.com>
> > > Sent: Wednesday, May 27, 2020 22:48 PM
> > > To: Benjamin Berg <benjamin(a)sipsolutions.net>; tpm2(a)lists.01.org
> > > Subject: [tpm2] Re: Possible TPM uses in fprintd/libfprint
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Benjamin Berg [mailto:benjamin(a)sipsolutions.net]
> > > > Sent: Wednesday, May 27, 2020 9:24 AM
> > > > To: tpm2(a)lists.01.org
> > > > Subject: [tpm2] Possible TPM uses in fprintd/libfprint
> > > >
> > > > Hi,
> > > >
> > > > I was wondering if someone has ideas about integrating the TPM
> > > > with Fingerprint readers.
> > > >
> > > > Recently I started looking into supporting Secure Device
> > > > Connection Protocol (SDCP, [1]) in libfprint. The general idea is
> > > > to verify that the Fingerprint reader can be trusted, but I
> > > > initially also imagined that further use-cases like unsealing data
> > > > in a TPM may be possible (e.g. to
> > > retrieve disk encryption keys).
> > > > However, looking into it more, my current conclusion is that there
> > > > is little to no advantage to use the TPM. At least not unless one
> > > > also has a trusted (userspace)
> > >
> > > In theory you would have a measured boot environment. This way you
> > > can attest the host is in a good state. You could further isolate by
> > > have a segregated userspace components through things like Trustlets
> > > or SGX Enclaves. The general paradigm of security is to take
> > > sensitive operations and move them out of band to a smaller
> > > execution environment, this paradigm can be extended infinitely, but
> > > the restrictions here lie in the realm of how much work do you want
> > > to do, which is determining by what you're trying to protect.
> > >
> > > > program which is capable of signing TPM authorizations. One could
> > > > easily offload the required parts into a small helper, but that
> > > > may require ensuring it runs in a trusted execution environment.
> > > > Microsoft seems to run relevant parts as trustlets that are walled
> > > > off from the rest of the system. That seems sensible to me, but it
> > > > also means requiring all the infrastructure for execution and
> > > > signing and I doubt that is
> > > feasible currently.
> > >
> > > You're still sharing hardware, which means that a potentially bad
> > > host, could be undermining the hardware and VM protections. Granted
> > > you have higher level of assurances, it's not a guarantee.
> > >
> > > >
> > > > Right now I'll probably go the way of not using the TPM at all.
> > > > But I
> > > > am really not an expert for this. So should someone see scenarios
> > > > where a TPM is actually helpful in this context, then I would like
> > > > to hear about
> > > them.
> > >
> > > You could do a measured boot scenario that included measuring the
> > > state of the fingerprint reader (I'm assuming SCDO would give you
> > > something like that).
> > > Something has to cause the measurement to get extended into a PCR so
> > > you can Get a quote and check later that it's all OK. If it's all
> > > OK, you can then release a secret From the TPM. You can couple
> > > keys/objects to this measured state.
> > >
> > > There is stuff on this in the Practical Guide to TPM2.0 and is
> > > available os a ODF
> > > download:
> > > https://link.springer.com/content/pdf/10.1007%2F978-1-4302-6584-9.pd
> > > f
> > >
> > >
> > > > Benjamin
> > > >
> > > > PS: A quick summary of how SDCP works:
> > > >  * Device has a private ECC key that signs the firmware and
> > > > ephemeral
> > > >    keys during boot (and is inaccessible afterwards)
> > > >  * A certificate proofs that this key was provisioned in factory
> > > >  * Device builds a shared secret with the host (s)
> > > >  * Device sends id, HMAC_SHA256(s, "identify" || nonce || id)
> > > >    when the finger "id" was presented.
> > > >  * The HMAC proofs knowledge of the shared secret and authorizes
> > > > the
> > > >    print.
> > > >
> > > > [1]
> > > > https://github.com/microsoft/SecureDeviceConnectionProtocol/wiki/S
> > > > ecur
> > > > e-
> > > > Device-Connection-Protocol
> > > _______________________________________________
> > > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email
> > > to tpm2- leave(a)lists.01.org
> > > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8365759059752774866==--

