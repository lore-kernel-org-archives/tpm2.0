Content-Type: multipart/mixed; boundary="===============0598840852954868975=="
MIME-Version: 1.0
From: =?utf-8?q?Eduardo_Falc=C3=A3o_=3Ceduardolfalcao_at_gmail=2Ecom=3E?=
Subject: [tpm2] Re: IMA determinism
Date: Tue, 09 Jun 2020 19:36:08 +0000
Message-ID: <20200609193608.2851.57936@ml01.vlan13.01.org>
In-Reply-To: 20200609185736.2851.45258@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0598840852954868975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> I don't think IMA was designed to be deterministic. And I think you shoul=
d not rely on
> the TPM PCR 10 value being in an specific state for e.g. secret sealing.
> =

> The reason is the asynchronous nature of the OS. Things happens when they=
 are ready, and
> IMA measures them as they are requested. =


Sure. I agree with you.

> =

> I think the sole purpose of the IMA Measurement and the TPM PCR 10 extens=
ion is to extend
> the hardware root of trust to the user space, and have user space remote =
attestation
> capabilities. For this, you need the IMA Measurement Log, and check that =
the quoted PCR 10
> value matches the aggregated digest calculated from IMA Measurement Log.
> =

> You could reduce the IMA Measurement policy to a very reduced set of user=
 files, like only
> measuring the Kernel Modules for example, but that will imply not measuri=
ng important
> parts of the Trusted Computing Base.
> =

> Could you expand on the reason to the a deterministic PCR 10?

My main goal is to attest the state of a VM. I was thinking in booting a fr=
esh installed Ubuntu, and add some application to run after boot. I am tryi=
ng to prove this application runs in an incorrupt VM.

At first, I would get the digest of PCR10, and would consider this hash as =
the unique acceptable hash for considering my VM healthy. I would use this =
value for remote attestation purposes. But, as you mentioned, the indetermi=
nism of programs' execution order makes this strategy unfeasible.

I'm considering only PCR10 because I know that PCRs 0-7 are hashed to a boo=
t agregate, which is the first line of the measurements file. Thus, somehow=
, PCRs 0-7 are directly bound to PCR10.

As you said, reducing the IMA Measurement policy to measure less files redu=
ces the security surface. I won't follow this path.

So, I think your idea would be sending the IMA Measurement Log along with t=
he quote. If the quote is can be verified and matches with IMA digest, then=
, the second step would be to check the hashes of each file separately. If =
all files have the expected hash, then I have a healthy state...

Did I get it right?

Thanks, Nicolas, for your comments.
--===============0598840852954868975==--

