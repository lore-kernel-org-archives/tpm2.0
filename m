Content-Type: multipart/mixed; boundary="===============6930356605930110024=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: How do I use Microsoft's sim (TSS.MSR) with lib tss2-esys
Date: Fri, 11 Mar 2022 13:34:12 +0000
Message-ID: <
 <BN8PR15MB2753A06089AAE9A2E25EEEC2F20C9@BN8PR15MB2753.namprd15.prod.outlook.com>>
In-Reply-To: 1415184b6ee4715a0026deef74ea2620e392d4da.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6930356605930110024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-03-10 at 07:44 -0800, Markus Willhelm Schmid wrote:
> I made an error in my previous email, I pasted in the URL to IBM's TCC =

> stack and not to IBM's SW TPM. This is what I am trying to compile.
> INVALID URI REMOVED
> rojects_ibmswtpm2_&d=3DDwIGaQ&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3DDZCVG43VcL8G=
Tne
> MZb8k8lEwb-O1GZktFfre1-mlmiA&m=3Dk6WL9yJ4ArEed9DYXhOAaVAksQL5eN0-AESxyTz
> f2Oo&s=3DjrTnVugnHRzLNiYwgHBvGhVR1XxGQJy1WFmXGZQyrBw&e=3D


FYI Ken has a staged version that's ready to go with OpenSSL 3.0.1:
https://github.com/kgoldman/ibmswtpm2/tree/next =


[kgold] A bit of background.  The TPM reference code (from the specificatio=
n) sometimes looks inside a OpenSSL structure that was later made opaque.  =
Each time a new openssl version is released, I check to see if the structur=
e has changed.  The #error message reminds me to check.  So far, we're good=
 to 3.0.1.

As Bill said, the staged version updated the check.

--===============6930356605930110024==--

