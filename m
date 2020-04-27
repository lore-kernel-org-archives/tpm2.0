Content-Type: multipart/mixed; boundary="===============3193996769671576384=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: One question about Marshal/Unmarshal
Date: Mon, 27 Apr 2020 15:50:15 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED7A24@ORSMSX101.amr.corp.intel.com>
In-Reply-To: A888B25CD99C1141B7C254171A953E8E490EA3AE@shsmsx102.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3193996769671576384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Zhao, Shirley [mailto:shirley.zhao(a)intel.com]
> Sent: Sunday, April 26, 2020 4:13 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] One question about Marshal/Unmarshal
> =

> Hi, all,
> =

> =

> =

> The size of the send command in TPM2.0 is not the size calculated directl=
y by
> sizeof(structure).
> =

> For example, when loading and external public key into TPM using
> tpm2_loadexternal, it needs to fill the structure TPM2_PUBLIC.
> =

> typedef struct {
> =

>   UINT16      size;
> =

>   TPMT_PUBLIC publicArea;
> =

> } TPM2B_PUBLIC;
> =

> But the size in the structure above is not sizeof(publicArea).
> =

> For example, if pub.publicArea.parameters.rsaDetail.scheme.scheme is
> TPM_ALG_NULL.
> =

> Then pub.publicArea.parameters.rsaDetail.scheme.details.anySig.hashAlg wi=
ll
> not be calculated in the send command.
> =

> =

> =

> But in the marshal function of Tss2_MU_##type##_Marshal in base-type.c, i=
t just
> copy from the src structure like below.
> =

> memcpy (&buffer [local_offset], &src, sizeof (src));
> =

> =

> =

> So there must be a rule to calculate the send command size according to e=
ach
> parameter requirement.
> =

> Where can I find these rules?

It's a combination of a few things, the architecture and marshaling library=
 specs are the main parts. However, each has
references to other things you should be aware of:
- Section 18 of https://trustedcomputinggroup.org/wp-content/uploads/TPM-Re=
v-2.0-Part-1-Architecture-01.38.pdf
- All of https://trustedcomputinggroup.org/wp-content/uploads/TCG_TSS_Marsh=
aling_Unmarshaling_API_v1p0_r07_pub.pdf



> =

> =

> =

> Thanks.
> =

> *	Shirley

--===============3193996769671576384==--

