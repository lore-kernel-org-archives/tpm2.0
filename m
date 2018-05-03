Content-Type: multipart/mixed; boundary="===============3696336839021988200=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: [tpm2] clevis with tpm-tools 2.1.0 (tpm2_create proper use for
 tpm2_unseal compatibility)
Date: Thu, 03 May 2018 12:44:05 +0200
Message-ID: <CANtcRX5LHqtU4gN5yv7CRUf=AdjzYvfL1uWBO189XksCLxFA2A@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3696336839021988200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to get clevis 9 working with Ubuntu18 tpm-tools 2.1.0, but
clevis decrypt (tpm2_unseal) fail. l suspect the obj_attr values feed
to tpm2_create in clevis-encrypt-tpm2 might be root cause, but I
haven't succeeded in making sense of it.

A diff on clevis-encrypt-tpm2 is included in the end of this mail.

 Any helpful pointers on what  appropriate change of clevis-encrypt
would be appreciated.

echo hi | clevis encrypt tpm2 '{}'  | clevis decrypt

tpm2_createprimary -A o --halg 0xB --kalg 0x23 -C ...primary.context
-T device -d /dev/tpmrm0
nameAlg =3D 0x000b
type =3D 0x0023
contextFile =3D ...primary.context

CreatePrimary Succeed ! Handle: 0x80ffffff


tpm2_load -T device -d /dev/tpmrm0 -c ...primary.context -u ...jwk.pub
-r ...jwk.priv -C ...load.context -n ...name.structure

contextParentFile =3D ...primary.context
contextFile =3D ...load.context

Load succ.
LoadedHandle: 0x80fffffe

tpm2_unseal -T device -d /dev/tpmrm0 -c ...load.context -o -
ERROR: Sys_Unseal failed. Error Code: 0x12f
Unsealing jwk from TPM failed!





diff ~/gits/clevis/src/clevis-encrypt-tpm2 /usr/local/bin/clevis-encrypt-tp=
m2
25c25,30
< alg_create_key=3D"keyedhash"
---
>
> #*****************************************************
> #alg_create_key=3D"keyedhash"
> alg_create_key=3D0x8
> #*****************************************************
>
27c32,56
< obj_attr=3D"fixedtpm|fixedparent|sensitivedataorigin|noda|adminwithpolicy"
---
>
> #*****************************************************
> #obj_attr=3D"fixedtpm|fixedparent|sensitivedataorigin|noda|adminwithpolic=
y"
> #obj_attr=3D0x4B2 #0x00000002 + 0x00000010 + 0x00000020 + 0x00000400 + 0x=
00000080  -- error 0x2d2: incompatible scheme
> #obj_attr=3D0x4A2 #0x00000002 + 0x00000020 + 0x00000400 + 0x00000080     =
          -- error 0x2c2: inconsistent attributes
> #obj_attr=3D0x492 #0x00000002 + 0x00000010 + 0x00000020 + 0x00000400 + 0x=
00000080  -- error 0x1c2: inconsistent attributes
> #obj_attr=3D0x432 #0x00000002 + 0x00000010 + 0x00000020 + 0x00000400     =
           -- error 0x2d2
> obj_attr=3D0x404B2
> #define TPMA_OBJECT_RESERVED1_MASK       0x00000001 /* shall be zero */
> #define TPMA_OBJECT_FIXEDTPM             0x00000002 /* SET 1 The hierarch=
y of the object as indicated by its Qualified Name may not change. CLEAR 0 =
The hierarchy of the object may change as a result of this object or an anc=
estor key being duplicated for use in another hierarchy. */
> #define TPMA_OBJECT_STCLEAR              0x00000004 /* SET 1 Previously s=
aved contexts of this object may not be loaded after StartupCLEAR. CLEAR 0 =
Saved contexts of this object may be used after a ShutdownSTATE and subsequ=
ent Startup. */
> #define TPMA_OBJECT_RESERVED2_MASK       0x00000008 /* shall be zero */
> #define TPMA_OBJECT_FIXEDPARENT          0x00000010 /* SET 1 The parent o=
f the object may not change. CLEAR 0 The parent of the object may change as=
 the result of a TPM2_Duplicate of the object. */
> #define TPMA_OBJECT_SENSITIVEDATAORIGIN  0x00000020 /* SET 1 Indicates th=
at when the object was created with TPM2_Create or TPM2_CreatePrimary the T=
PM generated all of the sensitive data other than the authValue. CLEAR 0 A =
portion of the sensitive data other than the authValue was provided by the =
caller. */
> #define TPMA_OBJECT_USERWITHAUTH         0x00000040 /* SET 1 Approval of =
USER role actions with this object may be with an HMAC session or with a pa=
ssword using the authValue of the object or a policy session. CLEAR 0 Appro=
val of USER role actions with this object may only be done with a policy se=
ssion. */
> #define TPMA_OBJECT_ADMINWITHPOLICY      0x00000080 /* SET 1 Approval of =
ADMIN role actions with this object may only be done with a policy session.=
 CLEAR 0 Approval of ADMIN role actions with this object may be with an HMA=
C session or with a password using the authValue of the object or a policy =
session. */
> #define TPMA_OBJECT_RESERVED3_MASK       0x00000300 /* shall be zero */
> #define TPMA_OBJECT_NODA                 0x00000400 /* SET 1 The object i=
s not subject to dictionary attack protections. CLEAR 0 The object is subje=
ct to dictionary attack protections. */
> #define TPMA_OBJECT_ENCRYPTEDDUPLICATION 0x00000800 /* SET 1 If the objec=
t is duplicated then symmetricAlg shall not be TPM2_ALG_NULL and newParentH=
andle shall not be TPM2_RH_NULL. CLEAR 0 The object may be duplicated witho=
ut an inner wrapper on the private portion of the object and the new parent=
 may be TPM2_RH_NULL. */
> #define TPMA_OBJECT_RESERVED4_MASK       0x0000F000 /* shall be zero */
> #define TPMA_OBJECT_RESTRICTED           0x00010000 /* SET 1 Key usage is=
 restricted to manipulate structures of known format the parent of this key=
 shall have restricted SET. CLEAR 0 Key usage is not restricted to use on s=
pecial formats. */
> #define TPMA_OBJECT_DECRYPT              0x00020000 /* SET 1 The private =
portion of the key may be used to decrypt. CLEAR 0 The private portion of t=
he key may not be used to decrypt. */
> #define TPMA_OBJECT_SIGN_ENCRYPT         0x00040000 /* SET 1 For a symmet=
ric cipher object the private portion of the key may be used to encrypt.  F=
or other objects the private portion of the key may be used to sign. CLEAR =
0 The private portion of the key may not be used to sign or encrypt. */
> #define TPMA_OBJECT_RESERVED5_MASK       0xFFF80000 /* shall be zero */
> #*****************************************************
102c131,161
< if ! tpm2_createprimary -Q -H "$auth" -g "$hash" -G "$key" -C
$TMP/primary.context; then
---
> #if ! tpm2_createprimary -Q -H "$auth" -g "$hash" -G "$key" -C $TMP/prima=
ry.context; then
> #************************************************************
> case $hash in
>  sha1)
>   __hash=3D'0x4'
>   ;;
>  sha256)
>   __hash=3D'0xB'
>   ;;
>  sha384)
>   __hash=3D'0xC'
>   ;;
>  *)
>   echo "*** hash converter failed...****" >&2
>   exit 1;
> esac
> case $key in
>  rsa)
>   __key=3D'0x1'
>   ;;
>  ecc)
>   __key=3D'0x23'
>   ;;
>  *)
>   echo "*** key converter failed...****" >&2
>   exit 1;
> esac
>
> #echo tpm2_createprimary -A "$auth" --halg "$__hash" --kalg "$__key" -C $=
TMP/primary.context -T $TPM2TOOLS_TCTI_NAME -d $TPM2TOOLS_DEVICE_FILE
> if ! tpm2_createprimary -A "$auth" --halg "$__hash" --kalg "$__key" -C $T=
MP/primary.context -T $TPM2TOOLS_TCTI_NAME -d $TPM2TOOLS_DEVICE_FILE >/dev/=
null; then
> #************************************************************
128,129c187,191
< if ! tpm2_create -Q -g "$hash" -G "$alg_create_key" -c
$TMP/primary.context -u $TMP/jwk.pub \
<      -r $TMP/jwk.priv -A "$obj_attr" $policy_options -I- <<< "$jwk"; then
---
> #if ! tpm2_create -Q -g "$hash" -G "$alg_create_key" -c $TMP/primary.cont=
ext -u $TMP/jwk.pub \
> #     -r $TMP/jwk.priv -A "$obj_attr" $policy_options -I- <<< "$jwk"; then
> #echo tpm2_create -A "$obj_attr" -g "$__hash" -G "$alg_create_key" -c $TM=
P/primary.context --opu $TMP/jwk.pub --opr $TMP/jwk.priv $policy_options -T=
 $TPM2TOOLS_TCTI_NAME -d $TPM2TOOLS_DEVICE_FILE >&2
> if ! tpm2_create -A "$obj_attr" -g "$__hash" -G "$alg_create_key" -c $TMP=
/primary.context --opu $TMP/jwk.pub --opr $TMP/jwk.priv $policy_options -T =
$TPM2TOOLS_TCTI_NAME -d $TPM2TOOLS_DEVICE_FILE <<< "$jwk" >/dev/null; then
> #if ! tpm2_create -A "$obj_attr" -g "$__hash" -G "$alg_create_key" -c $TM=
P/primary.context --opu $TMP/jwk.pub --opr $TMP/jwk.priv $policy_options -T=
 $TPM2TOOLS_TCTI_NAME -d $TPM2TOOLS_DEVICE_FILE <<< "$jwk"; then

--===============3696336839021988200==--

