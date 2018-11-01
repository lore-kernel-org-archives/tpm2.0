Content-Type: multipart/mixed; boundary="===============1935316666047377071=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] what the different between 0x1d5 and 0x3d5
Date: Thu, 01 Nov 2018 08:48:50 -0700
Message-ID: <d6074499-8e4d-f61c-e317-4eeba88dde28@intel.com>
In-Reply-To: CA+tBKVjSH9vXnAgw_KjTubcOZX7v34OW0J-MmOgxdV7gziaHtw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1935316666047377071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/1/18 12:47 AM, Terry An wrote:
> 782=C2=A0 =C2=A0 =C2=A0TSS2_RC rval =3D TSS2_RETRY_EXP(Tss2_Sys_Import(sa=
pi_context, phandle,
> 783=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&session=
sData, enc_sensitive_key, public,
> 784=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0private,=
 encrypted_seed, sym_alg,
> 785=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imported=
_private, &npsessionsDataOut));
> 786=C2=A0 =C2=A0 =C2=A0if (rval !=3D TPM2_RC_SUCCESS) {
> 787=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_ERROR("Tss2_Sys_Import() failed:=
 %#x", rval);
> 788=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> 789=C2=A0 =C2=A0 =C2=A0}
> =

> =

> This function returns 0x3d5, and I don't know which parameter should be c=
hecked.

I would say that it complains about the sessionsData.

-- =

Tadeusz

--===============1935316666047377071==--

