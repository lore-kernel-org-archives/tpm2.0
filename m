Content-Type: multipart/mixed; boundary="===============5597176741819735909=="
MIME-Version: 1.0
From: Patrick Ohly <patrick.ohly at intel.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Thu, 09 Nov 2017 21:43:32 +0100
Message-ID: <1510260212.22094.43.camel@intel.com>
In-Reply-To: b598f17c-038b-07d7-eae9-b60b9be71e5b@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5597176741819735909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-11-09 at 15:12 +0100, Javier Martinez Canillas wrote:
> Hello Patrick,
> =

> On 11/09/2017 01:53 PM, Patrick Ohly wrote:
> > I tried also without tpm2_nvreadlock and without
> > tpm2_takeownership,
> > but neither of that made a difference.
> > =

> =

> Are you sure that the TPM2 state is maintained between VM reboots?

It should be.

> I mean, did
> you try for example making a transient object (i.e: a key) persistent
> using the
> TPM2_EvictControl command and then check if is still listed after a
> VM reboot?
> =

> I wonder if the problem is only with the objects written with
> tpm2_nvwrite or
> anything that ends being persisted in the NVRAM.
> =

> For example, you can try something like the following commands:
> =

> $ tpm2_createprimary -A o -g 0x4 -G 0x25 -C primary.context=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> nameAlg =3D 0x0004=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
> type =3D 0x0025=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> contextFile =3D primary.context=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =

> CreatePrimary Succeed ! Handle: 0x80ffffff
> =

> $ tpm2_evictcontrol -A o -c primary.context -S 0x81000000=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> persistentHandle: 0x8100000
> =

> And then after a reboot:
> =

> $ tpm2_listpersistent=C2=A0
> 1 persistent objects defined.
> =

> =C2=A0 0. Persistent handle: 0x81000000
> =C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Type: 0x25
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Hash algorithm(nameAlg): =
0x4
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Attributes: 0x30072
> =C2=A0 }

That works if I keep swtpm running across the reboot. But as with
tpm2_nvdefine (see my other mail to Stefan), the persistent object is
gone after restarting swtpm.

> > Conceptually this is similar to the commands used with TPM 1.2. The
> > simplifying assumption is that only a single OS is getting
> > installed to
> > virgin hardware and then Secure Boot ensures that no other code
> > ever
> > gets access to the active TPM. Therefore a fixed index and no real
> > access protection for the slot are okay. A read-lock is set to
> > ensure
> > that the key is protected from potentially malicious applications
> > which
> > =C2=A0might have access to /dev/tpm0. Does that sound alright?
> > =

> =

> That sounds reasonable. There are other attack vectors like someone
> replacing your initramfs (that's not signed in a Secure Boot) and
> reading the LUKS pass before the tpm2_nvreadlock.

True. In refkit, the UEFI firmware directly loads a signed UEFI
combined app which contains initramfs, kernel and boot parameters, so
there shouldn't be a way for an attacker to intercept booting before
the initramfs runs.

-- =

Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



--===============5597176741819735909==--

