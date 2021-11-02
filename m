Content-Type: multipart/mixed; boundary="===============3161625721985493857=="
MIME-Version: 1.0
From: z4pu at pm.me
Subject: [tpm2] tss2_createkey - unable to set persistent handle
Date: Tue, 02 Nov 2021 04:41:05 +0000
Message-ID: <20211102044105.2830.9595@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3161625721985493857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello everyone

I am having issues using the Feature_API to create a key under the `/P_ECCP=
256SHA256/HS/SRK/` path. This is using `tss2_createkey` as well as using th=
e Feature API programmatically. The issue is that I am able to generate a k=
ey at the path, but I am never able to set a persistent handle for it. =


I would like to set a persistent handle for my child key as I am looking to=
 use https://github.com/tpm2-software/tpm2-tss-engine/ programmatically. Wh=
en loading a key using the engine library, according to https://github.com/=
tpm2-software/tpm2-tss-engine/blob/89327fa8b51962348c46ddc659fb8c3636336a60=
/src/tpm2-tss-engine.c#L190-L191, I can  load a key by:
- specifying the persistent handle or =

- providing the path to the encrypted TSS key file. =


I am using the following:
- Ubuntu 20.04
- swtpm --version: TPM emulator version 0.7.0, Copyright (c) 2014-2021 IBM =
Corp. This is running in a Docker container exposing ports 2322 and 2321 us=
ing `docker run --name swtpm -p 2322:2322 -p 2321:2321 --rm --detach swtpm:=
latest`
- https://github.com/tpm2-software/tpm2-tss: latest master branch, based on=
 release 2.4.6
- https://github.com/tpm2-software/tpm2-tools: latest master branch, based =
on 5.2 2021-09-28 =


fapi-config.json :
```
{
     "profile_name": "P_ECCP256SHA256",
     "profile_dir": "/usr/local/etc/tpm2-tss/fapi-profiles/",
     "user_dir": "~/.local/share/tpm2-tss/user/keystore",
     "system_dir": "/usr/local/var/lib/tpm2-tss/system/keystore",
     "tcti": "swtpm:port=3D2321",
     "ek_cert_less":"YES",
     "system_pcrs" : [],
     "log_dir" : "/usr/local/var/run/tpm2-tss/eventlog/"
}
```
The profiles at /usr/local/etc/tpm2-tss/fapi-profiles are the defaults:
```
cat /usr/local/etc/tpm2-tss/fapi-profiles/P_ECCP256SHA256.json =

{
    "type": "TPM2_ALG_ECC",
    "nameAlg":"TPM2_ALG_SHA256",
    "srk_template": "system,restricted,decrypt,0x81000001",
    "srk_description": "Storage root key SRK",
    "srk_persistent": 0,
    "ek_template":  "system,restricted,decrypt",
    "ek_description": "Endorsement key EK",
    "ecc_signing_scheme": {
        "scheme":"TPM2_ALG_ECDSA",
        "details":{
            "hashAlg":"TPM2_ALG_SHA256"
        },
    },
    "sym_mode":"TPM2_ALG_CFB",
    "sym_parameters": {
        "algorithm":"TPM2_ALG_AES",
        "keyBits":"128",
        "mode":"TPM2_ALG_CFB"
    },
    "sym_block_size": 16,
    "pcr_selection": [
       { "hash": "TPM2_ALG_SHA1",
         "pcrSelect": [ ],
       },
       { "hash": "TPM2_ALG_SHA256",
         "pcrSelect": [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1=
5, 16, 17, 18, 19, 20, 21, 22, 23 ]
       }
    ],
    "curveID": "TPM2_ECC_NIST_P256",
    "ek_policy": {
        "description": "Endorsement hierarchy used for policy secret.",
        "policy":[
            {
                "type":"POLICYSECRET",
                "objectName": "4000000b",
            }
        ]
    }
}
```
I'm also making sure to remove the following folders in between my experime=
nts:
- /usr/local/var/lib/tpm2-tss/system/keystore/P_ECCP256SHA256
-  /root/.local/share/tpm2-tss/user/keystore/P_ECCP256SHA256 (as my Docker =
container is running as root)
- ~/.local/share/tpm2-tss/user/keystore/P_ECCP256SHA256

The handle I am choosing for the child key is `0x81020001`, based on my rea=
ding of Table 7 of and the surrounding text at https://www.trustedcomputing=
group.org/wp-content/uploads/131011-Registry-of-reserved-TPM2-handles-and-l=
ocalities.pdf

The sequence of commands I am running as root is:
- tss2_provision to provision the TPM
- tpm2_getcap handles-persistent to list the used handles: Output is `- 0x8=
1800000 - 0x81800001`
- tss2_list to confirm that the keys under the hierarchies have been create=
d. Output is `/P_ECCP256SHA256/HN:/P_ECCP256SHA256/HE:/P_ECCP256SHA256/HE/E=
K:/P_ECCP256SHA256/LOCKOUT:/P_ECCP256SHA256/HS/SRK:/P_ECCP256SHA256/HS`
- tss2_createkey --path=3D"/P_ECCP256SHA256/HS/SRK/device_key"  --type=3D"s=
ign, decrypt, noDa, 0x81020001" --authValue=3D""
- tss2_list again, Output is `/P_ECCP256SHA256/HN:/P_ECCP256SHA256/HE:/P_EC=
CP256SHA256/HE/EK:/P_ECCP256SHA256/LOCKOUT:/P_ECCP256SHA256/HS/SRK:/P_ECCP2=
56SHA256/HS:/P_ECCP256SHA256/HS/SRK/device_key`
- tpm2_getcap handles-persistent does not list the requested handle: Output=
 is `- 0x81800000 - 0x81800001`

However, when I restart the TPM, and do not provision it, I can run the fol=
lowing commands as root to generate a child key and the parent key with a p=
ersistent handle:
- tpm2_getcap handles-persistent: Output is `- 0x81800000 - 0x81800001`
- tpm2_createprimary --hierarchy=3Do --key-algorithm=3Decc256 --key-context=
=3Downer_primary.ctx --format=3Dpem --output=3Downer_primary_public_key.pem
output is =

```
name-alg:
  value: sha256
  raw: 0xb
attributes:
  value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricted|d=
ecrypt
  raw: 0x30072
type:
  value: ecc
  raw: 0x23
curve-id:
  value: NIST p256
  raw: 0x3
kdfa-alg:
  value: null
  raw: 0x10
kdfa-halg:
  value: (null)
  raw: 0x0
scheme:
  value: null
  raw: 0x10
scheme-halg:
  value: (null)
  raw: 0x0
sym-alg:
  value: aes
  raw: 0x6
sym-mode:
  value: cfb
  raw: 0x43
sym-keybits: 128
x: 9eecfa05a9a8ddadc8adabe4c9ce3d34b60afe0fd35cc799e28badc638cae6ad
y: 30dfc43266c2aa3480f31366ac5d189abf793dae100f30b50b344b7207f03994
```
- tpm2_create --parent-context=3Downer_primary.ctx --key-algorithm=3Decc256=
 --public=3Dchild_public.key --private=3Dchild_private.key
Output is
```
name-alg:
  value: sha256
  raw: 0xb
attributes:
  value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|sign
  raw: 0x60072
type:
  value: ecc
  raw: 0x23
curve-id:
  value: NIST p256
  raw: 0x3
kdfa-alg:
  value: null
  raw: 0x10
kdfa-halg:
  value: (null)
  raw: 0x0
scheme:
  value: null
  raw: 0x10
scheme-halg:
  value: (null)
  raw: 0x0
sym-alg:
  value: null
  raw: 0x10
sym-mode:
  value: (null)
  raw: 0x0
sym-keybits: 0
x: 801553461b62972e1e3894e1baa1d56196774f829285f714a163c63a57a219de
y: ebfd148f186f2560a0a6713b5f6f50bfaa39b7a320304f8620c36bdee4dfa379
```
- tpm2_load --parent-context=3Downer_primary.ctx --public=3Dchild_public.ke=
y --private=3Dchild_private.key --key-context=3Dchild_key.ctx
Output is `name: 000b18738b4a5366d3f863920c7b98db696c723fd88e030b7cad32e1d3=
ac33e6fb6c`
- tpm2_evictcontrol --hierarchy=3Do --object-context=3Dchild_key.ctx 0x8102=
0001
Output is =

```
persistent-handle: 0x81020001
action: persisted
```
- tpm2_evictcontrol --hierarchy=3Do --object-context=3Downer_primary.ctx 0x=
81010001
Output is =

```
persistent-handle: 0x81010001
action: persisted
```
- tpm2_getcap handles-persistent
Output is =

```
- 0x81010001
- 0x81020001
- 0x81800000
- 0x81800001
```
- tss2_list
Output is an error message
```
WARNING:fapi:src/tss2-fapi/api/Fapi_List.c:216:Fapi_List_Finish() Path not =
found:  =

ERROR:fapi:src/tss2-fapi/api/Fapi_List.c:81:Fapi_List() ErrorCode (0x000600=
34) Entities_List =

Fapi_List(0x60034) - fapi:Provisioning was not executed.
```
There isn't anything in `/usr/local/var/run/tpm2-tss/eventlog/` for me to l=
ook at, possibly because of the Dockerised setup. =


I can later delete these persistent handles using e.g. tpm2_evictcontrol --=
hierarchy=3Do --object-context=3D0x81020001

Thanks very much in advance

Cheers
z.
--===============3161625721985493857==--

