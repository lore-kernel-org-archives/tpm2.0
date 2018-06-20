Content-Type: multipart/mixed; boundary="===============4070724106418600251=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] seal and unseal data based on a PCR value
Date: Wed, 20 Jun 2018 16:22:38 -0700
Message-ID: <81ffef76-14d0-2769-35a5-bc4188300dd4@intel.com>
In-Reply-To: 20180620204223.GA2642@carbon
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4070724106418600251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/20/2018 01:42 PM, Petko Manolov wrote:
> I know this one has been asked many times, but i could not find a definit=
ive =

> howto, exact steps, etc.
> =

> This project requires that a piece of data is being sealed to a TPM2 base=
d on a =

> PCR value and then unsealed from TBoot.  I've harvested some bits an piec=
es from =

> various discussions and still can't build a coherent picture in my mind.
> =

> What would be the best place to start reading up on this?

The steps to do this using the System API would be

1. Make sure PCRs state are in a know good state i.e. system is healthy.
2. Call TPM2_StartAuthSession() to create Policy session
3. Call TPM2_PolicyPCR() selecting the PCRs you want to include and the ses=
sion created in step 2.
4. Call TPM2_Create() using the session created in step 2.
5. Optionally TPM2_Load() to load the data created in 4 into TPM.

This is result in a key "sealed" in the TPM, which can only be unsealed whe=
n the PCR are in the same state when the key was created.
The steps to unseal the key/data:

1. Call TPM2_StartAuthSession() to create Policy session
2. Call TPM2_PolicyPCR() selecting the session created in step 1
3. Call TPM2_Unseal() selecting the session created in step 1

Thanks,
-- =

Tadeusz

--===============4070724106418600251==--

