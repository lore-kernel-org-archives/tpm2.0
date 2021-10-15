Content-Type: multipart/mixed; boundary="===============0303130541066380752=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: CMP error: cannot duplicate context:2306 tpm:warn(2.0):
 out of memory for object contexts
Date: Fri, 15 Oct 2021 14:00:37 +0000
Message-ID: <SN6PR11MB3437B0B7AE34907E36C1FEABB8B99@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20211014184847.7BEC86AB@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0303130541066380752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Petr Gotthard <petr.gotthard(a)centrum.cz>
> Sent: Thursday, October 14, 2021 11:49 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] Re: CMP error: cannot duplicate context:2306 tpm:warn=
(2.0):
> out of memory for object contexts
> =

> Hi Bill,
> =

> >> Example 1: OpenSSL often duplicates hash sequences: To hash sequences
> A,B,C1 and then A,B,C2 they first hash A,B, then duplicate/fork the hash
> sequence and then complete the hash first for C1 and then for C2. This is=
 a great
> performance optimization, but when too many dup (forks) are made, the TPM
> runs out of objects.
> =

> > Why are we doing hashing with the TPM? If we're in an OpenSSL provider =
cant
> we just use software provided hashing routines? I see hashing is configur=
able,
> but I would imagine off be default is what you want. Do we use validation=
 tickets
> or anything like that or just the resulting digest? If all we use are the=
 digests, I
> would make TPM not hash and make that option a nop.
> =

> Signing by a restricted signing key requires validation tickets, so the h=
ash must be
> done by the TPM. The OpenSSL has a combined operation "EVP_DigestSign",
> which enables the tpm2 provider to hash, obtain the validation ticket and=
 then
> immediately sign the hash using this ticket. This is beautiful, but it ne=
eds the TPM
> hashing.
> =


Oh cool I didn't know it supported restricted keys.

> =

> >> Example 2: The CMP key update needs 4 objects to operate (old client k=
ey,
> new client key, server key and hash sequence), but the kernel RM
> (tpm_space.context_tbl) allows only 3 objects. (If I am right.)
> =

>  > It does seem that way, but TPM commands only ever need 3 objects alive=
 at
> once, so that's likely why that was chosen.
> =

> Yeah, I thought this is so.
> =

> > Does CMP key really need all 4 of those things in the TPM at once, beca=
use
> currently today that's not actually happening as abrmd is just swapping t=
hem in
> and out.
> =

> Currently, the tpm2 provider does not do any internal resource management=
. If
> someone loads a public / private key, the provider creates a TPM object f=
or this.
> This key may be used for some later TPM operation or even not used at all=
, for
> example when a pubkey is being validated against a privkey. Unfortunately=
, the
> provider cannot know in advance if and how the key being loaded will be u=
sed.
> (The user is free not to use the TPM provider for loading a pubkey, but i=
f it does a
> TPM object is created.)
> =

> Typical OpenSSL based implementations are not optimized to reduce the num=
ber
> of concurrently loaded keys. The code often pre-loads all keys and then u=
ses the
> keys in various operations. Even though a single operation never needs mo=
re
> than 3 objects, the code may prepare more than 3 objects because it is go=
ing to
> invoke more than one operation later.
> =

> > Also, doesn't CMP use public objects (x509 certs) for some of it?
> =

> Yes, it does. X.509 certs also include pubkeys and CMP sometimes wants to
> extract a pubkey from a certificate to match it against a privkey it has.=
 This also
> consumes two objects (one for the pubkey and one for the privkey) althoug=
h no
> TPM operation can be invoked. (But it might be and we don't know, as said
> above.)
> =

> > Are public key operations implemented in software? In tpm2-pkcs11 we
> implement them in software and hash in software and I have yet to have
> someone hit a limit but perhaps they are all using abrmd but I thought so=
me were
> using in-kernel RM.
> =

> Yes. Some public key operations are implemented. Applications can use onl=
y one
> RSA/ECC key management-- if a TPM based RSA (or ECC) key management is
> loaded in OpenSSL, it will be used for both sign and validate operations-=
- a typical
> OpenSSL application cannot say "do privkey in the TPM and pubkey in the d=
efault
> provider"; it can choose only one for both (or create two contexts, but n=
obody
> does that). This is OK because TPM can do public key operations too, but =
it needs
> more resources if the app pre-loads everything as said above.
> =

> =

> I can see 3 possible solutions how to solve the resource problem:
> 1) Optimize the code for resource consumption. But then the OpenSSL
> applications must be TPM aware, which is what I wanted to avoid.
> 2) Implement some more intelligent resource (less greedy) usage in the tp=
m2
> provider itself. But this feels like re-implementing the RM elsewhere.

If you tune your application to consume less resources or change your usage=
 patterns,
That's not an RM, if the code starts contextsave/contextload on error and i=
ssuing virtual
Handles, yeah that=E2=80=99s an RM. So I don't see these being the same.

> 3) Rely on the RM (abrmd?) to swap the objects as needed and create the i=
llusion
> of a much larger object space.
> =

> Can the abrmd swap resources from a single user? I thought the purpose is=
 to
> swap resources from multiple connections (users), but in this case there =
is just
> one greedy user.

Yes it swaps objects for a single user as well.

> =

> The https://github.com/tpm2-software/tpm2-abrmd README.md says: The
> current implementations are mostly equivalent with a few differences. But=
 if
> abrmd can swap resources much better than the in-kernel RM, then I wouldn=
't
> call them "mostly equivalent".
> =


I would agree with your conclusion, not only does it not handle session ung=
apping
But its support as an RM is very limited due to its limited swap space.

I wonder if there is a feature we could add to the in-kernel RM to send the=
 driver some pages from
the calling process's memory space to increase the per-process map space or=
 if the driver could
carve out some more space on behalf of the calling process. Anything to bum=
p the swap, make
it opt in, and add any needed syscalls into the device driver.

> =

> Petr

--===============0303130541066380752==--

