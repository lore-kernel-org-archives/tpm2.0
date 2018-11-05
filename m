Content-Type: multipart/mixed; boundary="===============5265358040039015549=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Generate restricted signing key under owner hierarchy
Date: Mon, 05 Nov 2018 22:13:59 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C7A88A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: c544c73e-16e2-9771-1ff2-70c08fe0255a@polito.it
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5265358040039015549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Marco De
> Benedictis
> Sent: Monday, November 5, 2018 1:20 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Generate restricted signing key under owner hierarchy
> =

> Hi all,
> =

> I am using tpm2-tools on master (commit
> a9fbf1879a8b008f89dc90f32b4ac701ac5ce2dd) and I am unable to generate a
> restricted signing key under the owner hierarchy.
> =

> First, I have generated a primary key on the owner hierarchy:
> =

>    tpm2_createprimary -a o -g sha256 -G ecc -o primary/context.ctx
> =

> and then I run:
> =

>    tpm2_create -C primary/context.ctx \
>      -g sha256-G ecc \
>      -u child.pub \
>      -r child.priv \
>      -A
> "fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricted|sign"
> =

> I get an error:
> =

>    "ERROR: Tss2_Sys_Create(0x2D2) - tpm:parameter(2):unsupported or
>    incompatible scheme"
> =

> If I run the same command without the "restricted" object attribute, it w=
orks.
> Any idea on this behavior? Does this comply with the specs?

I see the same behavior on the simulator, your failing at the following che=
ck:

TPM_RC
SchemeChecks(
	     OBJECT          *parentObject,  // IN: parent (null if primary seed)
	     TPMT_PUBLIC     *publicArea     // IN: public area of the object
	     ) {
<snip>

			    // signing key that does not have a proper signing scheme.
			    // This is OK if the key is not restricted and its scheme
			    // is TPM_ALG_NULL
			    if(attributes.restricted || scheme !=3D TPM_ALG_NULL)
				return TPM_RCS_SCHEME;
<snip>
}

Which was added in Revision 101 of the spec (see the change log):
https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-Arc=
hitecture-01.38.pdf

If you apply this patch:
diff --git a/lib/tpm2_alg_util.c b/lib/tpm2_alg_util.c
index f109ca98e520..b018b1cbd9f0 100644
--- a/lib/tpm2_alg_util.c
+++ b/lib/tpm2_alg_util.c
@@ -302,11 +302,11 @@ static bool handle_asym_scheme_common(const char *ext=
, TPM2B_PUBLIC *public) {
         }
     }
 =

-    if (is_restricted && s->scheme.scheme !=3D TPM2_ALG_NULL) {
-        LOG_ERR("Restricted objects require a NULL scheme");
-        /* don't print another error message */
-        return false;
-    }
+//    if (is_restricted && s->scheme.scheme !=3D TPM2_ALG_NULL) {
+//        LOG_ERR("Restricted objects require a NULL scheme");
+//        /* don't print another error message */
+//        return false;
+//    }
 =

     /*
      * If the scheme is set, both the encrypt and decrypt attributes canno=
t be set,

---

It should work if you do (note I changed file names):
tpm2_create -C primary.ctx -g sha256 -G ecc256:ecdsa:null -u child.pub -r c=
hild.priv -A "fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restric=
ted|sign"

The important takeaway is that you need a full algorithm specified for a re=
stricted key, as restricted keys MUST have a signing scheme and MUST have a=
 NULL symmetric
details.

> =

> Thanks,
> Marco
> =

> =

> --
> MARCO DE BENEDICTIS
> Department of Control and Computer Engineering Politecnico di Torino
> E-mail: marco.debenedictis(a)polito.it - Phone: +39 (011) 090 7192


--===============5265358040039015549==--

