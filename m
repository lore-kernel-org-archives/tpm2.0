Content-Type: multipart/mixed; boundary="===============4886358003268378513=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Importing AES key protected by PolicyAuthorize
Date: Thu, 21 Nov 2019 22:59:11 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E460F3@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAHmz7DMwMfiZYx1y0v94S2jHVZ+ow0yq4utZgGKNEUh73QzbEQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4886358003268378513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Andrey Larionov [mailto:anlarionov(a)gmail.com]
> Sent: Wednesday, November 20, 2019 3:23 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Importing AES key protected by PolicyAuthorize
> =

> Hello. First of all i would like to thank all the contributors of project=
 for such
> tremendous work of creating really pleasant experience for such complicat=
ed
> topic.
> =

> Previously asked this question via github issue. So just closed it and cr=
sossposting
> to mailing list.
> =

> =

> =

> I'm trying to permanently import AES key into TPM. And use sequence of
> commands for this
> =

> tpm2_import -C -G aes -i -r -u
> tpm2_load -C -u -r -n -c
> tpm2_evictcontrol -c
> =

> =

> And this works fine. But whet i try to import key protected by a policy, =
generated
> with tpm2_policyauthorize, via -L argument in tpm2_import i got this error
> message, which i think irrelevant, because i don't import duplicated key.
> ERROR: Expected SymSeed to be specified via "-s", missing option.
> =

> Did i misunderstand something? Is it achievable?

This looks like a limitation in the tool implementation. When you specify -=
L it heads
Down a path called tpm2_import where it expects TPM public and private blobs
instead of just raw key material.

I have this working on a PR:
https://github.com/tpm2-software/tpm2-tools/pull/1857

This sudo code should work, or be close (the test has this too in the PR)

# create a primary key
tpm2_createprimary -c primary.ctx

# create an aes 256 key (16 byte key)
dd if=3D/dev/urandom of=3Daes.key bs=3D16 count=3D1

# create a fake policy, size sha256 (32 bytes)
dd if=3D/dev/urandom of=3Dpolicy.dat bs=3D32 count=3D1

# import to tpm
tpm2_import -G aes -i aes.key -L policy.dat -r aes.priv -u aes.pub

> =

> Also, i think this CLI parameter, -L, in tpm2_import could have better
> documentation. It's unclear what policy should be specified, and how it w=
ould be
> used.

Policies in TPM's are just hashes. You execute a set of tpm2_policyxxx comm=
ands
with a trial session and get a policy hash. This hash is specified when you=
 create the
object and is immutable. When you wish to use the object, you satisfy the p=
olicy on
a policy session and when you access the object, the TPM checks the interna=
l state
of the session, and if the hashes match, it grants access.

In the test code, I just generated a random 32 byte (sha256 size hash). So =
essentially
I said create the object with a random and thus unsatisfiable policy, not s=
omething
you would likely do in the real world.

The option "-L the policy file" is a pretty terrible help message, ill make=
 a bug so we don't
Forget this:
  - https://github.com/tpm2-software/tpm2-tools/issues/1858

> =

> =

> =

> I'll try to clarify my needs:
> I would like to provision many TPM2 devices with same, externaly generate=
d, AES
> key in Platform Hierarchy (but only AES key should be same, primary objec=
ts and
> parent objects should differs).
> I need this key to be persisted inside TPM.
> I would like to have this AES key protected by flexible policy
> (TPM2_PolicyAuthorize), to be accessed in target system with obtainable p=
olicy.
> So i expect to use this sequence (briefly, without session management
> commands):
> =

> tpm2_createprimary
> tpm2_loadexternal
> tpm2_policyauthorize
> tpm2_import
> tpm2_load
> tpm2_evictcontrol
> =

> =

> What am i missing here?


--===============4886358003268378513==--

