Content-Type: multipart/mixed; boundary="===============3192799110475403982=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: IMA determinism
Date: Tue, 09 Jun 2020 18:57:36 +0000
Message-ID: <20200609185736.2851.45258@ml01.vlan13.01.org>
In-Reply-To: 20200609154528.2851.72508@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3192799110475403982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I don't think IMA was designed to be deterministic. And I think you should =
not rely on the TPM PCR 10 value being in an specific state for e.g. secret=
 sealing.

The reason is the asynchronous nature of the OS. Things happens when they a=
re ready, and IMA measures them as they are requested. =


I think the sole purpose of the IMA Measurement and the TPM PCR 10 extensio=
n is to extend the hardware root of trust to the user space, and have user =
space remote attestation capabilities. For this, you need the IMA Measureme=
nt Log, and check that the quoted PCR 10 value matches the aggregated diges=
t calculated from IMA Measurement Log.

You could reduce the IMA Measurement policy to a very reduced set of user f=
iles, like only measuring the Kernel Modules for example, but that will imp=
ly not measuring important parts of the Trusted Computing Base.

Could you expand on the reason to the a deterministic PCR 10?
--===============3192799110475403982==--

