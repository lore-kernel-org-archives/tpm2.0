Content-Type: multipart/mixed; boundary="===============4548240213612759861=="
MIME-Version: 1.0
From: Juergen Repp <Juergen.Repp at sit.fraunhofer.de>
Subject: [tpm2] Re: tss2_createkey - unable to set persistent handle
Date: Mon, 08 Nov 2021 19:10:50 +0100
Message-ID: <fac4cc8e-0d58-de13-0975-811d107177fc@sit.fraunhofer.de>
In-Reply-To: CAOCvsSm0qsvZwwO6cE8XPcxZJgkSDcDh0vUi9tq3aBpDD5+Tuw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4548240213612759861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am 08.11.21 um 16:49 schrieb Steven Clark:
> I think creating a loaded key in a persistent handle is a separate
> optional command not every TPM implements.  I don't know why the tool
> doesn't just use getcap to figure this out and make a multi step
> create-load-evict process when the one-step command is unavailable but
> there you are.

If I execute the commands from Christians mail I get the follwing output:

tpm2_getcap -T swtpm handles-persistent
- 0x81000001
- 0x81020001

The persistent handles from your profile and your tss2_createkey are displa=
yed.
So I do not understand your problem?

Best, Juergen


> =

> On Sun, Nov 7, 2021 at 11:38 PM Christian Plappert
> <christian.plappert(a)sit.fraunhofer.de> wrote:
>>
>> Hi,
>>
>> for me it looks like that you use the fapi tools (tss2 command prefix)
>> with the swtpm and the esapi tools (tpm2 command prefix) with the device
>> tpm (since you did not specify anything). If you call the esapi tools
>> with the swtpm as TCTI (-T swtpm), all commands should target the swtpm.
>>
>>
>> I tried your commands like this and it works for me ("-T swtpm" for the
>> esapi tools is important):
>>
>>
>> ```
>> - tss2_provision
>> - tpm2_getcap -T swtpm handles-persistent
>> - tss2_createkey --path=3D"/P_ECCP256SHA256/HS/SRK/device_key"
>> --type=3D"sign, decrypt, noDa, 0x81020001" --authValue=3D""
>> - tpm2_getcap -T swtpm handles-persistent
>> ``
>>
>> Best,
>> Christian
>>
>>
>>
>>
>>
>> On 02.11.21 05:41, z4pu(a)pm.me wrote:
>>> Hello everyone
>>>
>>> I am having issues using the Feature_API to create a key under the `/P_=
ECCP256SHA256/HS/SRK/` path. This is using `tss2_createkey` as well as usin=
g the Feature API programmatically. The issue is that I am able to generate=
 a key at the path, but I am never able to set a persistent handle for it.
>>>
>>> I would like to set a persistent handle for my child key as I am lookin=
g to use https://github.com/tpm2-software/tpm2-tss-engine/ programmatically=
. When loading a key using the engine library, according to https://github.=
com/tpm2-software/tpm2-tss-engine/blob/89327fa8b51962348c46ddc659fb8c363633=
6a60/src/tpm2-tss-engine.c#L190-L191, I can  load a key by:
>>> - specifying the persistent handle or
>>> - providing the path to the encrypted TSS key file.
>>>
>>> I am using the following:
>>> - Ubuntu 20.04
>>> - swtpm --version: TPM emulator version 0.7.0, Copyright (c) 2014-2021 =
IBM Corp. This is running in a Docker container exposing ports 2322 and 232=
1 using `docker run --name swtpm -p 2322:2322 -p 2321:2321 --rm --detach sw=
tpm:latest`
>>> - https://github.com/tpm2-software/tpm2-tss: latest master branch, base=
d on release 2.4.6
>>> - https://github.com/tpm2-software/tpm2-tools: latest master branch, ba=
sed on 5.2 2021-09-28
>>>
>>> fapi-config.json :
>>> ```
>>> {
>>>       "profile_name": "P_ECCP256SHA256",
>>>       "profile_dir": "/usr/local/etc/tpm2-tss/fapi-profiles/",
>>>       "user_dir": "~/.local/share/tpm2-tss/user/keystore",
>>>       "system_dir": "/usr/local/var/lib/tpm2-tss/system/keystore",
>>>       "tcti": "swtpm:port=3D2321",
>>>       "ek_cert_less":"YES",
>>>       "system_pcrs" : [],
>>>       "log_dir" : "/usr/local/var/run/tpm2-tss/eventlog/"
>>> }
>>> ```
>>> The profiles at /usr/local/etc/tpm2-tss/fapi-profiles are the defaults:
>>> ```
>>> cat /usr/local/etc/tpm2-tss/fapi-profiles/P_ECCP256SHA256.json
>>> {
>>>      "type": "TPM2_ALG_ECC",
>>>      "nameAlg":"TPM2_ALG_SHA256",
>>>      "srk_template": "system,restricted,decrypt,0x81000001",
>>>      "srk_description": "Storage root key SRK",
>>>      "srk_persistent": 0,
>>>      "ek_template":  "system,restricted,decrypt",
>>>      "ek_description": "Endorsement key EK",
>>>      "ecc_signing_scheme": {
>>>          "scheme":"TPM2_ALG_ECDSA",
>>>          "details":{
>>>              "hashAlg":"TPM2_ALG_SHA256"
>>>          },
>>>      },
>>>      "sym_mode":"TPM2_ALG_CFB",
>>>      "sym_parameters": {
>>>          "algorithm":"TPM2_ALG_AES",
>>>          "keyBits":"128",
>>>          "mode":"TPM2_ALG_CFB"
>>>      },
>>>      "sym_block_size": 16,
>>>      "pcr_selection": [
>>>         { "hash": "TPM2_ALG_SHA1",
>>>           "pcrSelect": [ ],
>>>         },
>>>         { "hash": "TPM2_ALG_SHA256",
>>>           "pcrSelect": [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, =
14, 15, 16, 17, 18, 19, 20, 21, 22, 23 ]
>>>         }
>>>      ],
>>>      "curveID": "TPM2_ECC_NIST_P256",
>>>      "ek_policy": {
>>>          "description": "Endorsement hierarchy used for policy secret.",
>>>          "policy":[
>>>              {
>>>                  "type":"POLICYSECRET",
>>>                  "objectName": "4000000b",
>>>              }
>>>          ]
>>>      }
>>> }
>>> ```
>>> I'm also making sure to remove the following folders in between my expe=
riments:
>>> - /usr/local/var/lib/tpm2-tss/system/keystore/P_ECCP256SHA256
>>> -  /root/.local/share/tpm2-tss/user/keystore/P_ECCP256SHA256 (as my Doc=
ker container is running as root)
>>> - ~/.local/share/tpm2-tss/user/keystore/P_ECCP256SHA256
>>>
>>> The handle I am choosing for the child key is `0x81020001`, based on my=
 reading of Table 7 of and the surrounding text at https://www.trustedcompu=
tinggroup.org/wp-content/uploads/131011-Registry-of-reserved-TPM2-handles-a=
nd-localities.pdf
>>>
>>> The sequence of commands I am running as root is:
>>> - tss2_provision to provision the TPM
>>> - tpm2_getcap handles-persistent to list the used handles: Output is `-=
 0x81800000 - 0x81800001`
>>> - tss2_list to confirm that the keys under the hierarchies have been cr=
eated. Output is `/P_ECCP256SHA256/HN:/P_ECCP256SHA256/HE:/P_ECCP256SHA256/=
HE/EK:/P_ECCP256SHA256/LOCKOUT:/P_ECCP256SHA256/HS/SRK:/P_ECCP256SHA256/HS`
>>> - tss2_createkey --path=3D"/P_ECCP256SHA256/HS/SRK/device_key"  --type=
=3D"sign, decrypt, noDa, 0x81020001" --authValue=3D""
>>> - tss2_list again, Output is `/P_ECCP256SHA256/HN:/P_ECCP256SHA256/HE:/=
P_ECCP256SHA256/HE/EK:/P_ECCP256SHA256/LOCKOUT:/P_ECCP256SHA256/HS/SRK:/P_E=
CCP256SHA256/HS:/P_ECCP256SHA256/HS/SRK/device_key`
>>> - tpm2_getcap handles-persistent does not list the requested handle: Ou=
tput is `- 0x81800000 - 0x81800001`
>>>
>>> However, when I restart the TPM, and do not provision it, I can run the=
 following commands as root to generate a child key and the parent key with=
 a persistent handle:
>>> - tpm2_getcap handles-persistent: Output is `- 0x81800000 - 0x81800001`
>>> - tpm2_createprimary --hierarchy=3Do --key-algorithm=3Decc256 --key-con=
text=3Downer_primary.ctx --format=3Dpem --output=3Downer_primary_public_key=
.pem
>>> output is
>>> ```
>>> name-alg:
>>>    value: sha256
>>>    raw: 0xb
>>> attributes:
>>>    value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restric=
ted|decrypt
>>>    raw: 0x30072
>>> type:
>>>    value: ecc
>>>    raw: 0x23
>>> curve-id:
>>>    value: NIST p256
>>>    raw: 0x3
>>> kdfa-alg:
>>>    value: null
>>>    raw: 0x10
>>> kdfa-halg:
>>>    value: (null)
>>>    raw: 0x0
>>> scheme:
>>>    value: null
>>>    raw: 0x10
>>> scheme-halg:
>>>    value: (null)
>>>    raw: 0x0
>>> sym-alg:
>>>    value: aes
>>>    raw: 0x6
>>> sym-mode:
>>>    value: cfb
>>>    raw: 0x43
>>> sym-keybits: 128
>>> x: 9eecfa05a9a8ddadc8adabe4c9ce3d34b60afe0fd35cc799e28badc638cae6ad
>>> y: 30dfc43266c2aa3480f31366ac5d189abf793dae100f30b50b344b7207f03994
>>> ```
>>> - tpm2_create --parent-context=3Downer_primary.ctx --key-algorithm=3Dec=
c256 --public=3Dchild_public.key --private=3Dchild_private.key
>>> Output is
>>> ```
>>> name-alg:
>>>    value: sha256
>>>    raw: 0xb
>>> attributes:
>>>    value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
>>>    raw: 0x60072
>>> type:
>>>    value: ecc
>>>    raw: 0x23
>>> curve-id:
>>>    value: NIST p256
>>>    raw: 0x3
>>> kdfa-alg:
>>>    value: null
>>>    raw: 0x10
>>> kdfa-halg:
>>>    value: (null)
>>>    raw: 0x0
>>> scheme:
>>>    value: null
>>>    raw: 0x10
>>> scheme-halg:
>>>    value: (null)
>>>    raw: 0x0
>>> sym-alg:
>>>    value: null
>>>    raw: 0x10
>>> sym-mode:
>>>    value: (null)
>>>    raw: 0x0
>>> sym-keybits: 0
>>> x: 801553461b62972e1e3894e1baa1d56196774f829285f714a163c63a57a219de
>>> y: ebfd148f186f2560a0a6713b5f6f50bfaa39b7a320304f8620c36bdee4dfa379
>>> ```
>>> - tpm2_load --parent-context=3Downer_primary.ctx --public=3Dchild_publi=
c.key --private=3Dchild_private.key --key-context=3Dchild_key.ctx
>>> Output is `name: 000b18738b4a5366d3f863920c7b98db696c723fd88e030b7cad32=
e1d3ac33e6fb6c`
>>> - tpm2_evictcontrol --hierarchy=3Do --object-context=3Dchild_key.ctx 0x=
81020001
>>> Output is
>>> ```
>>> persistent-handle: 0x81020001
>>> action: persisted
>>> ```
>>> - tpm2_evictcontrol --hierarchy=3Do --object-context=3Downer_primary.ct=
x 0x81010001
>>> Output is
>>> ```
>>> persistent-handle: 0x81010001
>>> action: persisted
>>> ```
>>> - tpm2_getcap handles-persistent
>>> Output is
>>> ```
>>> - 0x81010001
>>> - 0x81020001
>>> - 0x81800000
>>> - 0x81800001
>>> ```
>>> - tss2_list
>>> Output is an error message
>>> ```
>>> WARNING:fapi:src/tss2-fapi/api/Fapi_List.c:216:Fapi_List_Finish() Path =
not found:
>>> ERROR:fapi:src/tss2-fapi/api/Fapi_List.c:81:Fapi_List() ErrorCode (0x00=
060034) Entities_List
>>> Fapi_List(0x60034) - fapi:Provisioning was not executed.
>>> ```
>>> There isn't anything in `/usr/local/var/run/tpm2-tss/eventlog/` for me =
to look at, possibly because of the Dockerised setup.
>>>
>>> I can later delete these persistent handles using e.g. tpm2_evictcontro=
l --hierarchy=3Do --object-context=3D0x81020001
>>>
>>> Thanks very much in advance
>>>
>>> Cheers
>>> z.
>>> _______________________________________________
>>> tpm2 mailing list -- tpm2(a)lists.01.org
>>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>>
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>=20

--===============4548240213612759861==--

