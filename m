Content-Type: multipart/mixed; boundary="===============2623307418725526706=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: CMP error: cannot duplicate context:2306 tpm:warn(2.0):
 out of memory for object contexts
Date: Thu, 14 Oct 2021 18:48:47 +0200
Message-ID: <20211014184847.7BEC86AB@centrum.cz>
In-Reply-To: SN6PR11MB3437FA7C3AFE75B0148E66E5B8B69@sn6pr11mb3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2623307418725526706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bill,
=C2=A0
>> Example 1: OpenSSL often duplicates hash sequences: To hash sequences A,=
B,C1 and then A,B,C2 they first hash A,B, then duplicate/fork the hash sequ=
ence and then complete the hash first for C1 and then for C2. This is a gre=
at performance optimization, but when too many dup (forks) are made, the TP=
M runs out of objects.
 =C2=A0
> Why are we doing hashing with the TPM? If we're in an OpenSSL provider ca=
nt we just use software provided hashing routines? I see hashing is configu=
rable, but I would imagine off be default is what you want. Do we use valid=
ation tickets or anything like that or just the resulting digest? If all we=
 use are the digests, I would make TPM not hash and make that option a nop.
=C2=A0
Signing by a restricted signing key requires validation tickets, so the has=
h must be done by the TPM. The OpenSSL has a combined operation "EVP_Digest=
Sign", which enables the tpm2 provider to hash, obtain the validation ticke=
t and then immediately sign the hash using this ticket. This is beautiful, =
but it needs the TPM hashing.
=C2=A0
=C2=A0
>> Example 2: The CMP key update needs 4 objects to operate (old client key=
, new client key, server key and hash sequence), but the kernel RM (tpm_spa=
ce.context_tbl) allows only 3 objects. (If I am right.)
 =C2=A0
 > It does seem that way, but TPM commands only ever need 3 objects alive a=
t once, so that's likely why that was chosen.
=C2=A0
Yeah, I thought this is so.
=C2=A0
> Does CMP key really need all 4 of those things in the TPM at once, becaus=
e currently today that's not actually happening as abrmd is just swapping t=
hem in and out.
=C2=A0
Currently, the tpm2 provider does not do any internal resource management. =
If someone loads a public / private key, the provider creates a TPM object =
for this. This key may be used for some later TPM operation or even not use=
d at all, for example when a pubkey is being validated against a privkey. U=
nfortunately, the provider cannot know in advance if and how the key being =
loaded will be used.
(The user is free not to use the TPM provider for loading a pubkey, but if =
it does a TPM object is created.)
=C2=A0
Typical OpenSSL based implementations are not optimized to reduce the numbe=
r of concurrently loaded keys. The code often pre-loads all keys and then u=
ses the keys in various operations. Even though a single operation never ne=
eds more than 3 objects, the code may prepare more than 3 objects because i=
t is going to invoke more than one operation later.
=C2=A0
> Also, doesn't CMP use public objects (x509 certs) for some of it?
=C2=A0
Yes, it does. X.509 certs also include pubkeys and CMP sometimes wants to e=
xtract a pubkey from a certificate to match it against a privkey it has. Th=
is also consumes two objects (one for the pubkey and one for the privkey) a=
lthough no TPM operation can be invoked. (But it might be and we don't know=
, as said above.)
=C2=A0
> Are public key operations implemented in software? In tpm2-pkcs11 we impl=
ement them in software and hash in software and I have yet to have someone =
hit a limit but perhaps they are all using abrmd but I thought some were us=
ing in-kernel RM.
=C2=A0
Yes. Some public key operations are implemented. Applications can use only =
one RSA/ECC key management-- if a TPM based RSA (or ECC) key management is =
loaded in OpenSSL, it will be used for both sign and validate operations-- =
a typical OpenSSL application cannot say "do privkey in the TPM and pubkey =
in the default provider"; it can choose only one for both (or create two co=
ntexts, but nobody does that). This is OK because TPM can do public key ope=
rations too, but it needs more resources if the app pre-loads everything as=
 said above.
=C2=A0
=C2=A0
I can see 3 possible solutions how to solve the resource problem:
1) Optimize the code for resource consumption. But then the OpenSSL applica=
tions must be TPM aware, which is what I wanted to avoid.
2) Implement some more intelligent resource (less greedy) usage in the tpm2=
 provider itself. But this feels like re-implementing the RM elsewhere.
3) Rely on the RM (abrmd?) to swap the objects as needed and create the ill=
usion of a much larger object space.
=C2=A0
Can the abrmd swap resources from a single user? I thought the purpose is t=
o swap resources from multiple connections (users), but in this case there =
is just one greedy user.
=C2=A0
The https://github.com/tpm2-software/tpm2-abrmd README.md says: The current=
 implementations are mostly equivalent with a few differences. But if abrmd=
 can swap resources much better than the in-kernel RM, then I wouldn't call=
 them "mostly equivalent".
=C2=A0
=C2=A0
Petr
--===============2623307418725526706==--

