Content-Type: multipart/mixed; boundary="===============3534900846601255391=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tss2_createkey - unable to set persistent handle
Date: Mon, 08 Nov 2021 17:03:59 +0000
Message-ID: <SN6PR11MB3437C1E23E367695EB060D13B8919@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CAOCvsSm0qsvZwwO6cE8XPcxZJgkSDcDh0vUi9tq3aBpDD5+Tuw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3534900846601255391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Imran

> I think creating a loaded key in a persistent handle is a separate
> optional command not every TPM implements.

the command is TPM2_EvictControl to make a handle persistent. The command i=
s mandatory per the PC Client Spec:
https://trustedcomputinggroup.org/wp-content/uploads/TCG_PC_Client_Platform=
_TPM_Profile_PTP_Specification_Family_2.0_Revision_1.3v22.pdf

>  I don't know why the tool
> doesn't just use getcap to figure this out and make a multi step
> create-load-evict process when the one-step command is unavailable but
> there you are.

I think you're referring to the -c option on tpm2_create, which doesn't cre=
ate a persistent object, but rather invokes the createloaded command.
and returns a transient object that is loaded.

That was actually a bad decision on my part, because when it comes to creat=
ing cphash's for policies, we know are invoking a different command,
which also has different inputs and outputs to tpm2_create and tpm2_load.

I thought their was bug in tpm2-tools to implement this feature, but perhap=
s it got dropped or completed. Imran, plans on this?

On Sun, Nov 7, 2021 at 11:38 PM Christian Plappert
<christian.plappert(a)sit.fraunhofer.de> wrote:
>
> Hi,
>
> for me it looks like that you use the fapi tools (tss2 command prefix)
> with the swtpm and the esapi tools (tpm2 command prefix) with the device
> tpm (since you did not specify anything). If you call the esapi tools
> with the swtpm as TCTI (-T swtpm), all commands should target the swtpm.
>
>
> I tried your commands like this and it works for me ("-T swtpm" for the
> esapi tools is important):
>
>
> ```
> - tss2_provision
> - tpm2_getcap -T swtpm handles-persistent
> - tss2_createkey --path=3D"/P_ECCP256SHA256/HS/SRK/device_key"
> --type=3D"sign, decrypt, noDa, 0x81020001" --authValue=3D""
> - tpm2_getcap -T swtpm handles-persistent
> ``
>
> Best,
> Christian
>
>
>
>
>
> On 02.11.21 05:41, z4pu(a)pm.me wrote:
> > Hello everyone
> >
> > I am having issues using the Feature_API to create a key under the `/P_=
ECCP256SHA256/HS/SRK/` path. This is using `tss2_createkey` as well as usin=
g the Feature API programmatically. The issue is that I am able to generate=
 a key at the path, but I am never able to set a persistent handle for it.
> >
> > I would like to set a persistent handle for my child key as I am lookin=
g to use https://github.com/tpm2-software/tpm2-tss-engine/ programmatically=
. When loading a key using the engine library, according to https://github.=
com/tpm2-software/tpm2-tss-engine/blob/89327fa8b51962348c46ddc659fb8c363633=
6a60/src/tpm2-tss-engine.c#L190-L191, I can  load a key by:
> > - specifying the persistent handle or
> > - providing the path to the encrypted TSS key file.
> >
> > I am using the following:
> > - Ubuntu 20.04
> > - swtpm --version: TPM emulator version 0.7.0, Copyright (c) 2014-2021 =
IBM Corp. This is running in a Docker container exposing ports 2322 and 232=
1 using `docker run --name swtpm -p 2322:2322 -p 2321:2321 --rm --detach sw=
tpm:latest`
> > - https://github.com/tpm2-software/tpm2-tss: latest master branch, base=
d on release 2.4.6
> > - https://github.com/tpm2-software/tpm2-tools: latest master branch, ba=
sed on 5.2 2021-09-28
> >
> > fapi-config.json :
> > ```
> > {
> >       "profile_name": "P_ECCP256SHA256",
> >       "profile_dir": "/usr/local/etc/tpm2-tss/fapi-profiles/",
> >       "user_dir": "~/.local/share/tpm2-tss/user/keystore",
> >       "system_dir": "/usr/local/var/lib/tpm2-tss/system/keystore",
> >       "tcti": "swtpm:port=3D2321",
> >       "ek_cert_less":"YES",
> >       "system_pcrs" : [],
> >       "log_dir" : "/usr/local/var/run/tpm2-tss/eventlog/"
> > }
> > ```
> > The profiles at /usr/local/etc/tpm2-tss/fapi-profiles are the defaults:
> > ```
> > cat /usr/local/etc/tpm2-tss/fapi-profiles/P_ECCP256SHA256.json
> > {
> >      "type": "TPM2_ALG_ECC",
> >      "nameAlg":"TPM2_ALG_SHA256",
> >      "srk_template": "system,restricted,decrypt,0x81000001",
> >      "srk_description": "Storage root key SRK",
> >      "srk_persistent": 0,
> >      "ek_template":  "system,restricted,decrypt",
> >      "ek_description": "Endorsement key EK",
> >      "ecc_signing_scheme": {
> >          "scheme":"TPM2_ALG_ECDSA",
> >          "details":{
> >              "hashAlg":"TPM2_ALG_SHA256"
> >          },
> >      },
> >      "sym_mode":"TPM2_ALG_CFB",
> >      "sym_parameters": {
> >          "algorithm":"TPM2_ALG_AES",
> >          "keyBits":"128",
> >          "mode":"TPM2_ALG_CFB"
> >      },
> >      "sym_block_size": 16,
> >      "pcr_selection": [
> >         { "hash": "TPM2_ALG_SHA1",
> >           "pcrSelect": [ ],
> >         },
> >         { "hash": "TPM2_ALG_SHA256",
> >           "pcrSelect": [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, =
14, 15, 16, 17, 18, 19, 20, 21, 22, 23 ]
> >         }
> >      ],
> >      "curveID": "TPM2_ECC_NIST_P256",
> >      "ek_policy": {
> >          "description": "Endorsement hierarchy used for policy secret.",
> >          "policy":[
> >              {
> >                  "type":"POLICYSECRET",
> >                  "objectName": "4000000b",
> >              }
> >          ]
> >      }
> > }
> > ```
> > I'm also making sure to remove the following folders in between my expe=
riments:
> > - /usr/local/var/lib/tpm2-tss/system/keystore/P_ECCP256SHA256
> > -  /root/.local/share/tpm2-tss/user/keystore/P_ECCP256SHA256 (as my Doc=
ker container is running as root)
> > - ~/.local/share/tpm2-tss/user/keystore/P_ECCP256SHA256
> >
> > The handle I am choosing for the child key is `0x81020001`, based on my=
 reading of Table 7 of and the surrounding text at https://www.trustedcompu=
tinggroup.org/wp-content/uploads/131011-Registry-of-reserved-TPM2-handles-a=
nd-localities.pdf
> >
> > The sequence of commands I am running as root is:
> > - tss2_provision to provision the TPM
> > - tpm2_getcap handles-persistent to list the used handles: Output is `-=
 0x81800000 - 0x81800001`
> > - tss2_list to confirm that the keys under the hierarchies have been cr=
eated. Output is `/P_ECCP256SHA256/HN:/P_ECCP256SHA256/HE:/P_ECCP256SHA256/=
HE/EK:/P_ECCP256SHA256/LOCKOUT:/P_ECCP256SHA256/HS/SRK:/P_ECCP256SHA256/HS`
> > - tss2_createkey --path=3D"/P_ECCP256SHA256/HS/SRK/device_key"  --type=
=3D"sign, decrypt, noDa, 0x81020001" --authValue=3D""
> > - tss2_list again, Output is `/P_ECCP256SHA256/HN:/P_ECCP256SHA256/HE:/=
P_ECCP256SHA256/HE/EK:/P_ECCP256SHA256/LOCKOUT:/P_ECCP256SHA256/HS/SRK:/P_E=
CCP256SHA256/HS:/P_ECCP256SHA256/HS/SRK/device_key`
> > - tpm2_getcap handles-persistent does not list the requested handle: Ou=
tput is `- 0x81800000 - 0x81800001`
> >
> > However, when I restart the TPM, and do not provision it, I can run the=
 following commands as root to generate a child key and the parent key with=
 a persistent handle:
> > - tpm2_getcap handles-persistent: Output is `- 0x81800000 - 0x81800001`
> > - tpm2_createprimary --hierarchy=3Do --key-algorithm=3Decc256 --key-con=
text=3Downer_primary.ctx --format=3Dpem --output=3Downer_primary_public_key=
.pem
> > output is
> > ```
> > name-alg:
> >    value: sha256
> >    raw: 0xb
> > attributes:
> >    value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restric=
ted|decrypt
> >    raw: 0x30072
> > type:
> >    value: ecc
> >    raw: 0x23
> > curve-id:
> >    value: NIST p256
> >    raw: 0x3
> > kdfa-alg:
> >    value: null
> >    raw: 0x10
> > kdfa-halg:
> >    value: (null)
> >    raw: 0x0
> > scheme:
> >    value: null
> >    raw: 0x10
> > scheme-halg:
> >    value: (null)
> >    raw: 0x0
> > sym-alg:
> >    value: aes
> >    raw: 0x6
> > sym-mode:
> >    value: cfb
> >    raw: 0x43
> > sym-keybits: 128
> > x: 9eecfa05a9a8ddadc8adabe4c9ce3d34b60afe0fd35cc799e28badc638cae6ad
> > y: 30dfc43266c2aa3480f31366ac5d189abf793dae100f30b50b344b7207f03994
> > ```
> > - tpm2_create --parent-context=3Downer_primary.ctx --key-algorithm=3Dec=
c256 --public=3Dchild_public.key --private=3Dchild_private.key
> > Output is
> > ```
> > name-alg:
> >    value: sha256
> >    raw: 0xb
> > attributes:
> >    value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> >    raw: 0x60072
> > type:
> >    value: ecc
> >    raw: 0x23
> > curve-id:
> >    value: NIST p256
> >    raw: 0x3
> > kdfa-alg:
> >    value: null
> >    raw: 0x10
> > kdfa-halg:
> >    value: (null)
> >    raw: 0x0
> > scheme:
> >    value: null
> >    raw: 0x10
> > scheme-halg:
> >    value: (null)
> >    raw: 0x0
> > sym-alg:
> >    value: null
> >    raw: 0x10
> > sym-mode:
> >    value: (null)
> >    raw: 0x0
> > sym-keybits: 0
> > x: 801553461b62972e1e3894e1baa1d56196774f829285f714a163c63a57a219de
> > y: ebfd148f186f2560a0a6713b5f6f50bfaa39b7a320304f8620c36bdee4dfa379
> > ```
> > - tpm2_load --parent-context=3Downer_primary.ctx --public=3Dchild_publi=
c.key --private=3Dchild_private.key --key-context=3Dchild_key.ctx
> > Output is `name: 000b18738b4a5366d3f863920c7b98db696c723fd88e030b7cad32=
e1d3ac33e6fb6c`
> > - tpm2_evictcontrol --hierarchy=3Do --object-context=3Dchild_key.ctx 0x=
81020001
> > Output is
> > ```
> > persistent-handle: 0x81020001
> > action: persisted
> > ```
> > - tpm2_evictcontrol --hierarchy=3Do --object-context=3Downer_primary.ct=
x 0x81010001
> > Output is
> > ```
> > persistent-handle: 0x81010001
> > action: persisted
> > ```
> > - tpm2_getcap handles-persistent
> > Output is
> > ```
> > - 0x81010001
> > - 0x81020001
> > - 0x81800000
> > - 0x81800001
> > ```
> > - tss2_list
> > Output is an error message
> > ```
> > WARNING:fapi:src/tss2-fapi/api/Fapi_List.c:216:Fapi_List_Finish() Path =
not found:
> > ERROR:fapi:src/tss2-fapi/api/Fapi_List.c:81:Fapi_List() ErrorCode (0x00=
060034) Entities_List
> > Fapi_List(0x60034) - fapi:Provisioning was not executed.
> > ```
> > There isn't anything in `/usr/local/var/run/tpm2-tss/eventlog/` for me =
to look at, possibly because of the Dockerised setup.
> >
> > I can later delete these persistent handles using e.g. tpm2_evictcontro=
l --hierarchy=3Do --object-context=3D0x81020001
> >
> > Thanks very much in advance
> >
> > Cheers
> > z.
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3534900846601255391==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+IFAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fSA8L3N0
eWxlPgo8L2hlYWQ+Cjxib2R5IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENh
bGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPgorIEltcmFuPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KPGJyPgo8L2Rpdj4KPGRpdiBjbGFzcz0iQm9keUZyYWdt
ZW50Ij48Zm9udCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPgo8ZGl2IGNs
YXNzPSJQbGFpblRleHQiPiZndDsgSSB0aGluayBjcmVhdGluZyBhIGxvYWRlZCBrZXkgaW4gYSBw
ZXJzaXN0ZW50IGhhbmRsZSBpcyBhIHNlcGFyYXRlPGJyPgomZ3Q7IG9wdGlvbmFsIGNvbW1hbmQg
bm90IGV2ZXJ5IFRQTSBpbXBsZW1lbnRzLiZuYnNwOzwvZGl2Pgo8ZGl2IGNsYXNzPSJQbGFpblRl
eHQiPjxicj4KPC9kaXY+CjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+dGhlIGNvbW1hbmQgaXMgVFBN
Ml9FdmljdENvbnRyb2wgdG8gbWFrZSBhIGhhbmRsZSBwZXJzaXN0ZW50LiBUaGUgY29tbWFuZCBp
cyBtYW5kYXRvcnkgcGVyIHRoZSBQQyBDbGllbnQgU3BlYzo8L2Rpdj4KPGRpdiBjbGFzcz0iUGxh
aW5UZXh0Ij48YSBocmVmPSJodHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29u
dGVudC91cGxvYWRzL1RDR19QQ19DbGllbnRfUGxhdGZvcm1fVFBNX1Byb2ZpbGVfUFRQX1NwZWNp
ZmljYXRpb25fRmFtaWx5XzIuMF9SZXZpc2lvbl8xLjN2MjIucGRmIiBpZD0iTFBsbms5MDUyODIi
Pmh0dHBzOi8vdHJ1c3RlZGNvbXB1dGluZ2dyb3VwLm9yZy93cC1jb250ZW50L3VwbG9hZHMvVENH
X1BDX0NsaWVudF9QbGF0Zm9ybV9UUE1fUHJvZmlsZV9QVFBfU3BlY2lmaWNhdGlvbl9GYW1pbHlf
Mi4wX1JldmlzaW9uXzEuM3YyMi5wZGY8L2E+PGJyPgo8L2Rpdj4KPGRpdiBjbGFzcz0iUGxhaW5U
ZXh0Ij48YnI+CjwvZGl2Pgo8ZGl2IGNsYXNzPSJQbGFpblRleHQiPiZndDsmbmJzcDsgSSBkb24n
dCBrbm93IHdoeSB0aGUgdG9vbDxicj4KJmd0OyBkb2Vzbid0IGp1c3QgdXNlIGdldGNhcCB0byBm
aWd1cmUgdGhpcyBvdXQgYW5kIG1ha2UgYSBtdWx0aSBzdGVwPGJyPgomZ3Q7IGNyZWF0ZS1sb2Fk
LWV2aWN0IHByb2Nlc3Mgd2hlbiB0aGUgb25lLXN0ZXAgY29tbWFuZCBpcyB1bmF2YWlsYWJsZSBi
dXQ8YnI+CiZndDsgdGhlcmUgeW91IGFyZS48L2Rpdj4KPGRpdiBjbGFzcz0iUGxhaW5UZXh0Ij48
YnI+CjwvZGl2Pgo8ZGl2IGNsYXNzPSJQbGFpblRleHQiPkkgdGhpbmsgeW91J3JlIHJlZmVycmlu
ZyB0byB0aGUgLWMgb3B0aW9uIG9uIHRwbTJfY3JlYXRlLCB3aGljaCBkb2Vzbid0IGNyZWF0ZSBh
IHBlcnNpc3RlbnQgb2JqZWN0LCBidXQgcmF0aGVyIGludm9rZXMgdGhlIGNyZWF0ZWxvYWRlZCBj
b21tYW5kLjxicj4KPC9kaXY+CjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+YW5kIHJldHVybnMgYSB0
cmFuc2llbnQgb2JqZWN0IHRoYXQgaXMgbG9hZGVkLjwvZGl2Pgo8ZGl2IGNsYXNzPSJQbGFpblRl
eHQiPjxicj4KPC9kaXY+CjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+VGhhdCB3YXMgYWN0dWFsbHkg
YSBiYWQgZGVjaXNpb24gb24gbXkgcGFydCwgYmVjYXVzZSB3aGVuIGl0IGNvbWVzIHRvIGNyZWF0
aW5nIGNwaGFzaCdzIGZvciBwb2xpY2llcywgd2Uga25vdyBhcmUgaW52b2tpbmcgYSBkaWZmZXJl
bnQgY29tbWFuZCw8L2Rpdj4KPGRpdiBjbGFzcz0iUGxhaW5UZXh0Ij53aGljaCBhbHNvIGhhcyBk
aWZmZXJlbnQgaW5wdXRzIGFuZCBvdXRwdXRzIHRvIHRwbTJfY3JlYXRlIGFuZCB0cG0yX2xvYWQu
PC9kaXY+CjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+PGJyPgo8L2Rpdj4KPGRpdiBjbGFzcz0iUGxh
aW5UZXh0Ij5JIHRob3VnaHQgdGhlaXIgd2FzIGJ1ZyBpbiB0cG0yLXRvb2xzIHRvIGltcGxlbWVu
dCB0aGlzIGZlYXR1cmUsIGJ1dCBwZXJoYXBzIGl0IGdvdCBkcm9wcGVkIG9yIGNvbXBsZXRlZC4g
SW1yYW4sIHBsYW5zIG9uIHRoaXM/PGJyPgo8YnI+Ck9uIFN1biwgTm92IDcsIDIwMjEgYXQgMTE6
MzggUE0gQ2hyaXN0aWFuIFBsYXBwZXJ0PGJyPgombHQ7Y2hyaXN0aWFuLnBsYXBwZXJ0QHNpdC5m
cmF1bmhvZmVyLmRlJmd0OyB3cm90ZTo8YnI+CiZndDs8YnI+CiZndDsgSGksPGJyPgomZ3Q7PGJy
PgomZ3Q7IGZvciBtZSBpdCBsb29rcyBsaWtlIHRoYXQgeW91IHVzZSB0aGUgZmFwaSB0b29scyAo
dHNzMiBjb21tYW5kIHByZWZpeCk8YnI+CiZndDsgd2l0aCB0aGUgc3d0cG0gYW5kIHRoZSBlc2Fw
aSB0b29scyAodHBtMiBjb21tYW5kIHByZWZpeCkgd2l0aCB0aGUgZGV2aWNlPGJyPgomZ3Q7IHRw
bSAoc2luY2UgeW91IGRpZCBub3Qgc3BlY2lmeSBhbnl0aGluZykuIElmIHlvdSBjYWxsIHRoZSBl
c2FwaSB0b29sczxicj4KJmd0OyB3aXRoIHRoZSBzd3RwbSBhcyBUQ1RJICgtVCBzd3RwbSksIGFs
bCBjb21tYW5kcyBzaG91bGQgdGFyZ2V0IHRoZSBzd3RwbS48YnI+CiZndDs8YnI+CiZndDs8YnI+
CiZndDsgSSB0cmllZCB5b3VyIGNvbW1hbmRzIGxpa2UgdGhpcyBhbmQgaXQgd29ya3MgZm9yIG1l
ICgmcXVvdDstVCBzd3RwbSZxdW90OyBmb3IgdGhlPGJyPgomZ3Q7IGVzYXBpIHRvb2xzIGlzIGlt
cG9ydGFudCk6PGJyPgomZ3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7IGBgYDxicj4KJmd0OyAtIHRzczJf
cHJvdmlzaW9uPGJyPgomZ3Q7IC0gdHBtMl9nZXRjYXAgLVQgc3d0cG0gaGFuZGxlcy1wZXJzaXN0
ZW50PGJyPgomZ3Q7IC0gdHNzMl9jcmVhdGVrZXkgLS1wYXRoPSZxdW90Oy9QX0VDQ1AyNTZTSEEy
NTYvSFMvU1JLL2RldmljZV9rZXkmcXVvdDs8YnI+CiZndDsgLS10eXBlPSZxdW90O3NpZ24sIGRl
Y3J5cHQsIG5vRGEsIDB4ODEwMjAwMDEmcXVvdDsgLS1hdXRoVmFsdWU9JnF1b3Q7JnF1b3Q7PGJy
PgomZ3Q7IC0gdHBtMl9nZXRjYXAgLVQgc3d0cG0gaGFuZGxlcy1wZXJzaXN0ZW50PGJyPgomZ3Q7
IGBgPGJyPgomZ3Q7PGJyPgomZ3Q7IEJlc3QsPGJyPgomZ3Q7IENocmlzdGlhbjxicj4KJmd0Ozxi
cj4KJmd0Ozxicj4KJmd0Ozxicj4KJmd0Ozxicj4KJmd0Ozxicj4KJmd0OyBPbiAwMi4xMS4yMSAw
NTo0MSwgejRwdUBwbS5tZSB3cm90ZTo8YnI+CiZndDsgJmd0OyBIZWxsbyBldmVyeW9uZTxicj4K
Jmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgSSBhbSBoYXZpbmcgaXNzdWVzIHVzaW5nIHRoZSBGZWF0
dXJlX0FQSSB0byBjcmVhdGUgYSBrZXkgdW5kZXIgdGhlIGAvUF9FQ0NQMjU2U0hBMjU2L0hTL1NS
Sy9gIHBhdGguIFRoaXMgaXMgdXNpbmcgYHRzczJfY3JlYXRla2V5YCBhcyB3ZWxsIGFzIHVzaW5n
IHRoZSBGZWF0dXJlIEFQSSBwcm9ncmFtbWF0aWNhbGx5LiBUaGUgaXNzdWUgaXMgdGhhdCBJIGFt
IGFibGUgdG8gZ2VuZXJhdGUgYSBrZXkgYXQgdGhlIHBhdGgsIGJ1dCBJIGFtIG5ldmVyCiBhYmxl
IHRvIHNldCBhIHBlcnNpc3RlbnQgaGFuZGxlIGZvciBpdC48YnI+CiZndDsgJmd0Ozxicj4KJmd0
OyAmZ3Q7IEkgd291bGQgbGlrZSB0byBzZXQgYSBwZXJzaXN0ZW50IGhhbmRsZSBmb3IgbXkgY2hp
bGQga2V5IGFzIEkgYW0gbG9va2luZyB0byB1c2UKPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29t
L3RwbTItc29mdHdhcmUvdHBtMi10c3MtZW5naW5lLyI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi10c3MtZW5naW5lLzwvYT4gcHJvZ3JhbW1hdGljYWxseS4gV2hlbiBsb2Fk
aW5nIGEga2V5IHVzaW5nIHRoZSBlbmdpbmUgbGlicmFyeSwgYWNjb3JkaW5nIHRvCjxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzLWVuZ2luZS9ibG9iLzg5
MzI3ZmE4YjUxOTYyMzQ4YzQ2ZGRjNjU5ZmI4YzM2MzYzMzZhNjAvc3JjL3RwbTItdHNzLWVuZ2lu
ZS5jI0wxOTAtTDE5MSI+Cmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNz
LWVuZ2luZS9ibG9iLzg5MzI3ZmE4YjUxOTYyMzQ4YzQ2ZGRjNjU5ZmI4YzM2MzYzMzZhNjAvc3Jj
L3RwbTItdHNzLWVuZ2luZS5jI0wxOTAtTDE5MTwvYT4sIEkgY2FuJm5ic3A7IGxvYWQgYSBrZXkg
Ynk6PGJyPgomZ3Q7ICZndDsgLSBzcGVjaWZ5aW5nIHRoZSBwZXJzaXN0ZW50IGhhbmRsZSBvcjxi
cj4KJmd0OyAmZ3Q7IC0gcHJvdmlkaW5nIHRoZSBwYXRoIHRvIHRoZSBlbmNyeXB0ZWQgVFNTIGtl
eSBmaWxlLjxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgSSBhbSB1c2luZyB0aGUgZm9sbG93
aW5nOjxicj4KJmd0OyAmZ3Q7IC0gVWJ1bnR1IDIwLjA0PGJyPgomZ3Q7ICZndDsgLSBzd3RwbSAt
LXZlcnNpb246IFRQTSBlbXVsYXRvciB2ZXJzaW9uIDAuNy4wLCBDb3B5cmlnaHQgKGMpIDIwMTQt
MjAyMSBJQk0gQ29ycC4gVGhpcyBpcyBydW5uaW5nIGluIGEgRG9ja2VyIGNvbnRhaW5lciBleHBv
c2luZyBwb3J0cyAyMzIyIGFuZCAyMzIxIHVzaW5nIGBkb2NrZXIgcnVuIC0tbmFtZSBzd3RwbSAt
cCAyMzIyOjIzMjIgLXAgMjMyMToyMzIxIC0tcm0gLS1kZXRhY2ggc3d0cG06bGF0ZXN0YDxicj4K
Jmd0OyAmZ3Q7IC0gPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBt
Mi10c3M6Ij5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzczo8L2E+IGxh
dGVzdCBtYXN0ZXIgYnJhbmNoLCBiYXNlZCBvbiByZWxlYXNlIDIuNC42PGJyPgomZ3Q7ICZndDsg
LSA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzOiI+
aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29sczo8L2E+IGxhdGVzdCBt
YXN0ZXIgYnJhbmNoLCBiYXNlZCBvbiA1LjIgMjAyMS0wOS0yODxicj4KJmd0OyAmZ3Q7PGJyPgom
Z3Q7ICZndDsgZmFwaS1jb25maWcuanNvbiA6PGJyPgomZ3Q7ICZndDsgYGBgPGJyPgomZ3Q7ICZn
dDsgezxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZx
dW90O3Byb2ZpbGVfbmFtZSZxdW90OzogJnF1b3Q7UF9FQ0NQMjU2U0hBMjU2JnF1b3Q7LDxicj4K
Jmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZxdW90O3Byb2Zp
bGVfZGlyJnF1b3Q7OiAmcXVvdDsvdXNyL2xvY2FsL2V0Yy90cG0yLXRzcy9mYXBpLXByb2ZpbGVz
LyZxdW90Oyw8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyAmcXVvdDt1c2VyX2RpciZxdW90OzogJnF1b3Q7fi8ubG9jYWwvc2hhcmUvdHBtMi10c3MvdXNl
ci9rZXlzdG9yZSZxdW90Oyw8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyAmcXVvdDtzeXN0ZW1fZGlyJnF1b3Q7OiAmcXVvdDsvdXNyL2xvY2FsL3Zhci9s
aWIvdHBtMi10c3Mvc3lzdGVtL2tleXN0b3JlJnF1b3Q7LDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZxdW90O3RjdGkmcXVvdDs6ICZxdW90O3N3dHBt
OnBvcnQ9MjMyMSZxdW90Oyw8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyAmcXVvdDtla19jZXJ0X2xlc3MmcXVvdDs6JnF1b3Q7WUVTJnF1b3Q7LDxicj4K
Jmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZxdW90O3N5c3Rl
bV9wY3JzJnF1b3Q7IDogW10sPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgJnF1b3Q7bG9nX2RpciZxdW90OyA6ICZxdW90Oy91c3IvbG9jYWwvdmFyL3J1
bi90cG0yLXRzcy9ldmVudGxvZy8mcXVvdDs8YnI+CiZndDsgJmd0OyB9PGJyPgomZ3Q7ICZndDsg
YGBgPGJyPgomZ3Q7ICZndDsgVGhlIHByb2ZpbGVzIGF0IC91c3IvbG9jYWwvZXRjL3RwbTItdHNz
L2ZhcGktcHJvZmlsZXMgYXJlIHRoZSBkZWZhdWx0czo8YnI+CiZndDsgJmd0OyBgYGA8YnI+CiZn
dDsgJmd0OyBjYXQgL3Vzci9sb2NhbC9ldGMvdHBtMi10c3MvZmFwaS1wcm9maWxlcy9QX0VDQ1Ay
NTZTSEEyNTYuanNvbjxicj4KJmd0OyAmZ3Q7IHs8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyAmcXVvdDt0eXBlJnF1b3Q7OiAmcXVvdDtUUE0yX0FMR19FQ0MmcXVv
dDssPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJnF1b3Q7bmFt
ZUFsZyZxdW90OzomcXVvdDtUUE0yX0FMR19TSEEyNTYmcXVvdDssPGJyPgomZ3Q7ICZndDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJnF1b3Q7c3JrX3RlbXBsYXRlJnF1b3Q7OiAmcXVv
dDtzeXN0ZW0scmVzdHJpY3RlZCxkZWNyeXB0LDB4ODEwMDAwMDEmcXVvdDssPGJyPgomZ3Q7ICZn
dDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJnF1b3Q7c3JrX2Rlc2NyaXB0aW9uJnF1
b3Q7OiAmcXVvdDtTdG9yYWdlIHJvb3Qga2V5IFNSSyZxdW90Oyw8YnI+CiZndDsgJmd0OyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVvdDtzcmtfcGVyc2lzdGVudCZxdW90OzogMCw8
YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVvdDtla190ZW1w
bGF0ZSZxdW90OzombmJzcDsgJnF1b3Q7c3lzdGVtLHJlc3RyaWN0ZWQsZGVjcnlwdCZxdW90Oyw8
YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVvdDtla19kZXNj
cmlwdGlvbiZxdW90OzogJnF1b3Q7RW5kb3JzZW1lbnQga2V5IEVLJnF1b3Q7LDxicj4KJmd0OyAm
Z3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZxdW90O2VjY19zaWduaW5nX3NjaGVt
ZSZxdW90Ozogezxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZxdW90O3NjaGVtZSZxdW90OzomcXVvdDtUUE0yX0FMR19F
Q0RTQSZxdW90Oyw8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVvdDtkZXRhaWxzJnF1b3Q7Ons8YnI+CiZndDsgJmd0
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVvdDtoYXNoQWxnJnF1b3Q7OiZxdW90O1RQTTJfQUxH
X1NIQTI1NiZxdW90Ozxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH0sPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgfSw8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyAmcXVvdDtzeW1fbW9kZSZxdW90OzomcXVvdDtUUE0yX0FMR19DRkImcXVvdDssPGJyPgom
Z3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJnF1b3Q7c3ltX3BhcmFtZXRl
cnMmcXVvdDs6IHs8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVvdDthbGdvcml0aG0mcXVvdDs6JnF1b3Q7VFBNMl9B
TEdfQUVTJnF1b3Q7LDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZxdW90O2tleUJpdHMmcXVvdDs6JnF1b3Q7MTI4JnF1
b3Q7LDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7ICZxdW90O21vZGUmcXVvdDs6JnF1b3Q7VFBNMl9BTEdfQ0ZCJnF1b3Q7
PGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfSw8YnI+CiZndDsg
Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVvdDtzeW1fYmxvY2tfc2l6ZSZx
dW90OzogMTYsPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJnF1
b3Q7cGNyX3NlbGVjdGlvbiZxdW90OzogWzxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHsgJnF1b3Q7aGFzaCZxdW90OzogJnF1b3Q7
VFBNMl9BTEdfU0hBMSZxdW90Oyw8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVvdDtwY3JTZWxlY3QmcXVv
dDs6IFsgXSw8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyB9LDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHsgJnF1b3Q7aGFzaCZxdW90OzogJnF1b3Q7VFBNMl9BTEdf
U0hBMjU2JnF1b3Q7LDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZxdW90O3BjclNlbGVjdCZxdW90OzogWyAw
LCAxLCAyLCAzLCA0LCA1LCA2LCA3LCA4LCA5LCAxMCwgMTEsIDEyLCAxMywgMTQsIDE1LCAxNiwg
MTcsIDE4LCAxOSwgMjAsIDIxLCAyMiwgMjMgXTxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+CiZndDsgJmd0OyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBdLDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7ICZxdW90O2N1cnZlSUQmcXVvdDs6ICZxdW90O1RQTTJfRUNDX05JU1RfUDI1
NiZxdW90Oyw8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVv
dDtla19wb2xpY3kmcXVvdDs6IHs8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmcXVvdDtkZXNjcmlwdGlvbiZxdW90Ozog
JnF1b3Q7RW5kb3JzZW1lbnQgaGllcmFyY2h5IHVzZWQgZm9yIHBvbGljeSBzZWNyZXQuJnF1b3Q7
LDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7ICZxdW90O3BvbGljeSZxdW90OzpbPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgezxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7ICZxdW90O3R5cGUmcXVvdDs6JnF1b3Q7UE9MSUNZU0VDUkVUJnF1b3Q7
LDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7ICZxdW90O29iamVjdE5hbWUmcXVvdDs6ICZxdW90OzQwMDAwMDBiJnF1b3Q7LDxicj4KJmd0
OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBdPGJyPgomZ3Q7ICZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4KJmd0OyAmZ3Q7IH08YnI+CiZndDsg
Jmd0OyBgYGA8YnI+CiZndDsgJmd0OyBJJ20gYWxzbyBtYWtpbmcgc3VyZSB0byByZW1vdmUgdGhl
IGZvbGxvd2luZyBmb2xkZXJzIGluIGJldHdlZW4gbXkgZXhwZXJpbWVudHM6PGJyPgomZ3Q7ICZn
dDsgLSAvdXNyL2xvY2FsL3Zhci9saWIvdHBtMi10c3Mvc3lzdGVtL2tleXN0b3JlL1BfRUNDUDI1
NlNIQTI1Njxicj4KJmd0OyAmZ3Q7IC0mbmJzcDsgL3Jvb3QvLmxvY2FsL3NoYXJlL3RwbTItdHNz
L3VzZXIva2V5c3RvcmUvUF9FQ0NQMjU2U0hBMjU2IChhcyBteSBEb2NrZXIgY29udGFpbmVyIGlz
IHJ1bm5pbmcgYXMgcm9vdCk8YnI+CiZndDsgJmd0OyAtIH4vLmxvY2FsL3NoYXJlL3RwbTItdHNz
L3VzZXIva2V5c3RvcmUvUF9FQ0NQMjU2U0hBMjU2PGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0
OyBUaGUgaGFuZGxlIEkgYW0gY2hvb3NpbmcgZm9yIHRoZSBjaGlsZCBrZXkgaXMgYDB4ODEwMjAw
MDFgLCBiYXNlZCBvbiBteSByZWFkaW5nIG9mIFRhYmxlIDcgb2YgYW5kIHRoZSBzdXJyb3VuZGlu
ZyB0ZXh0IGF0CjxhIGhyZWY9Imh0dHBzOi8vd3d3LnRydXN0ZWRjb21wdXRpbmdncm91cC5vcmcv
d3AtY29udGVudC91cGxvYWRzLzEzMTAxMS1SZWdpc3RyeS1vZi1yZXNlcnZlZC1UUE0yLWhhbmRs
ZXMtYW5kLWxvY2FsaXRpZXMucGRmIj4KaHR0cHM6Ly93d3cudHJ1c3RlZGNvbXB1dGluZ2dyb3Vw
Lm9yZy93cC1jb250ZW50L3VwbG9hZHMvMTMxMDExLVJlZ2lzdHJ5LW9mLXJlc2VydmVkLVRQTTIt
aGFuZGxlcy1hbmQtbG9jYWxpdGllcy5wZGY8L2E+PGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0
OyBUaGUgc2VxdWVuY2Ugb2YgY29tbWFuZHMgSSBhbSBydW5uaW5nIGFzIHJvb3QgaXM6PGJyPgom
Z3Q7ICZndDsgLSB0c3MyX3Byb3Zpc2lvbiB0byBwcm92aXNpb24gdGhlIFRQTTxicj4KJmd0OyAm
Z3Q7IC0gdHBtMl9nZXRjYXAgaGFuZGxlcy1wZXJzaXN0ZW50IHRvIGxpc3QgdGhlIHVzZWQgaGFu
ZGxlczogT3V0cHV0IGlzIGAtIDB4ODE4MDAwMDAgLSAweDgxODAwMDAxYDxicj4KJmd0OyAmZ3Q7
IC0gdHNzMl9saXN0IHRvIGNvbmZpcm0gdGhhdCB0aGUga2V5cyB1bmRlciB0aGUgaGllcmFyY2hp
ZXMgaGF2ZSBiZWVuIGNyZWF0ZWQuIE91dHB1dCBpcyBgL1BfRUNDUDI1NlNIQTI1Ni9ITjovUF9F
Q0NQMjU2U0hBMjU2L0hFOi9QX0VDQ1AyNTZTSEEyNTYvSEUvRUs6L1BfRUNDUDI1NlNIQTI1Ni9M
T0NLT1VUOi9QX0VDQ1AyNTZTSEEyNTYvSFMvU1JLOi9QX0VDQ1AyNTZTSEEyNTYvSFNgPGJyPgom
Z3Q7ICZndDsgLSB0c3MyX2NyZWF0ZWtleSAtLXBhdGg9JnF1b3Q7L1BfRUNDUDI1NlNIQTI1Ni9I
Uy9TUksvZGV2aWNlX2tleSZxdW90OyZuYnNwOyAtLXR5cGU9JnF1b3Q7c2lnbiwgZGVjcnlwdCwg
bm9EYSwgMHg4MTAyMDAwMSZxdW90OyAtLWF1dGhWYWx1ZT0mcXVvdDsmcXVvdDs8YnI+CiZndDsg
Jmd0OyAtIHRzczJfbGlzdCBhZ2FpbiwgT3V0cHV0IGlzIGAvUF9FQ0NQMjU2U0hBMjU2L0hOOi9Q
X0VDQ1AyNTZTSEEyNTYvSEU6L1BfRUNDUDI1NlNIQTI1Ni9IRS9FSzovUF9FQ0NQMjU2U0hBMjU2
L0xPQ0tPVVQ6L1BfRUNDUDI1NlNIQTI1Ni9IUy9TUks6L1BfRUNDUDI1NlNIQTI1Ni9IUzovUF9F
Q0NQMjU2U0hBMjU2L0hTL1NSSy9kZXZpY2Vfa2V5YDxicj4KJmd0OyAmZ3Q7IC0gdHBtMl9nZXRj
YXAgaGFuZGxlcy1wZXJzaXN0ZW50IGRvZXMgbm90IGxpc3QgdGhlIHJlcXVlc3RlZCBoYW5kbGU6
IE91dHB1dCBpcyBgLSAweDgxODAwMDAwIC0gMHg4MTgwMDAwMWA8YnI+CiZndDsgJmd0Ozxicj4K
Jmd0OyAmZ3Q7IEhvd2V2ZXIsIHdoZW4gSSByZXN0YXJ0IHRoZSBUUE0sIGFuZCBkbyBub3QgcHJv
dmlzaW9uIGl0LCBJIGNhbiBydW4gdGhlIGZvbGxvd2luZyBjb21tYW5kcyBhcyByb290IHRvIGdl
bmVyYXRlIGEgY2hpbGQga2V5IGFuZCB0aGUgcGFyZW50IGtleSB3aXRoIGEgcGVyc2lzdGVudCBo
YW5kbGU6PGJyPgomZ3Q7ICZndDsgLSB0cG0yX2dldGNhcCBoYW5kbGVzLXBlcnNpc3RlbnQ6IE91
dHB1dCBpcyBgLSAweDgxODAwMDAwIC0gMHg4MTgwMDAwMWA8YnI+CiZndDsgJmd0OyAtIHRwbTJf
Y3JlYXRlcHJpbWFyeSAtLWhpZXJhcmNoeT1vIC0ta2V5LWFsZ29yaXRobT1lY2MyNTYgLS1rZXkt
Y29udGV4dD1vd25lcl9wcmltYXJ5LmN0eCAtLWZvcm1hdD1wZW0gLS1vdXRwdXQ9b3duZXJfcHJp
bWFyeV9wdWJsaWNfa2V5LnBlbTxicj4KJmd0OyAmZ3Q7IG91dHB1dCBpczxicj4KJmd0OyAmZ3Q7
IGBgYDxicj4KJmd0OyAmZ3Q7IG5hbWUtYWxnOjxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IHZhbHVlOiBzaGEyNTY8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyByYXc6IDB4
Yjxicj4KJmd0OyAmZ3Q7IGF0dHJpYnV0ZXM6PGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJz
cDsgdmFsdWU6IGZpeGVkdHBtfGZpeGVkcGFyZW50fHNlbnNpdGl2ZWRhdGFvcmlnaW58dXNlcndp
dGhhdXRofHJlc3RyaWN0ZWR8ZGVjcnlwdDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IHJhdzogMHgzMDA3Mjxicj4KJmd0OyAmZ3Q7IHR5cGU6PGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJz
cDsmbmJzcDsgdmFsdWU6IGVjYzxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJhdzog
MHgyMzxicj4KJmd0OyAmZ3Q7IGN1cnZlLWlkOjxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IHZhbHVlOiBOSVNUIHAyNTY8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyByYXc6
IDB4Mzxicj4KJmd0OyAmZ3Q7IGtkZmEtYWxnOjxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IHZhbHVlOiBudWxsPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsgcmF3OiAweDEw
PGJyPgomZ3Q7ICZndDsga2RmYS1oYWxnOjxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IHZhbHVlOiAobnVsbCk8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyByYXc6IDB4MDxi
cj4KJmd0OyAmZ3Q7IHNjaGVtZTo8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyB2YWx1
ZTogbnVsbDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJhdzogMHgxMDxicj4KJmd0
OyAmZ3Q7IHNjaGVtZS1oYWxnOjxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHZhbHVl
OiAobnVsbCk8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyByYXc6IDB4MDxicj4KJmd0
OyAmZ3Q7IHN5bS1hbGc6PGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsgdmFsdWU6IGFl
czxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJhdzogMHg2PGJyPgomZ3Q7ICZndDsg
c3ltLW1vZGU6PGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsgdmFsdWU6IGNmYjxicj4K
Jmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJhdzogMHg0Mzxicj4KJmd0OyAmZ3Q7IHN5bS1r
ZXliaXRzOiAxMjg8YnI+CiZndDsgJmd0OyB4OiA5ZWVjZmEwNWE5YThkZGFkYzhhZGFiZTRjOWNl
M2QzNGI2MGFmZTBmZDM1Y2M3OTllMjhiYWRjNjM4Y2FlNmFkPGJyPgomZ3Q7ICZndDsgeTogMzBk
ZmM0MzI2NmMyYWEzNDgwZjMxMzY2YWM1ZDE4OWFiZjc5M2RhZTEwMGYzMGI1MGIzNDRiNzIwN2Yw
Mzk5NDxicj4KJmd0OyAmZ3Q7IGBgYDxicj4KJmd0OyAmZ3Q7IC0gdHBtMl9jcmVhdGUgLS1wYXJl
bnQtY29udGV4dD1vd25lcl9wcmltYXJ5LmN0eCAtLWtleS1hbGdvcml0aG09ZWNjMjU2IC0tcHVi
bGljPWNoaWxkX3B1YmxpYy5rZXkgLS1wcml2YXRlPWNoaWxkX3ByaXZhdGUua2V5PGJyPgomZ3Q7
ICZndDsgT3V0cHV0IGlzPGJyPgomZ3Q7ICZndDsgYGBgPGJyPgomZ3Q7ICZndDsgbmFtZS1hbGc6
PGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsgdmFsdWU6IHNoYTI1Njxicj4KJmd0OyAm
Z3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJhdzogMHhiPGJyPgomZ3Q7ICZndDsgYXR0cmlidXRlczo8
YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyB2YWx1ZTogZml4ZWR0cG18Zml4ZWRwYXJl
bnR8c2Vuc2l0aXZlZGF0YW9yaWdpbnx1c2Vyd2l0aGF1dGh8ZGVjcnlwdHxzaWduPGJyPgomZ3Q7
ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsgcmF3OiAweDYwMDcyPGJyPgomZ3Q7ICZndDsgdHlwZTo8
YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyB2YWx1ZTogZWNjPGJyPgomZ3Q7ICZndDsm
bmJzcDsmbmJzcDsmbmJzcDsgcmF3OiAweDIzPGJyPgomZ3Q7ICZndDsgY3VydmUtaWQ6PGJyPgom
Z3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsgdmFsdWU6IE5JU1QgcDI1Njxicj4KJmd0OyAmZ3Q7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJhdzogMHgzPGJyPgomZ3Q7ICZndDsga2RmYS1hbGc6PGJyPgom
Z3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsgdmFsdWU6IG51bGw8YnI+CiZndDsgJmd0OyZuYnNw
OyZuYnNwOyZuYnNwOyByYXc6IDB4MTA8YnI+CiZndDsgJmd0OyBrZGZhLWhhbGc6PGJyPgomZ3Q7
ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsgdmFsdWU6IChudWxsKTxicj4KJmd0OyAmZ3Q7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IHJhdzogMHgwPGJyPgomZ3Q7ICZndDsgc2NoZW1lOjxicj4KJmd0OyAmZ3Q7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IHZhbHVlOiBudWxsPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsm
bmJzcDsgcmF3OiAweDEwPGJyPgomZ3Q7ICZndDsgc2NoZW1lLWhhbGc6PGJyPgomZ3Q7ICZndDsm
bmJzcDsmbmJzcDsmbmJzcDsgdmFsdWU6IChudWxsKTxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHJhdzogMHgwPGJyPgomZ3Q7ICZndDsgc3ltLWFsZzo8YnI+CiZndDsgJmd0OyZuYnNw
OyZuYnNwOyZuYnNwOyB2YWx1ZTogbnVsbDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IHJhdzogMHgxMDxicj4KJmd0OyAmZ3Q7IHN5bS1tb2RlOjxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IHZhbHVlOiAobnVsbCk8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyBy
YXc6IDB4MDxicj4KJmd0OyAmZ3Q7IHN5bS1rZXliaXRzOiAwPGJyPgomZ3Q7ICZndDsgeDogODAx
NTUzNDYxYjYyOTcyZTFlMzg5NGUxYmFhMWQ1NjE5Njc3NGY4MjkyODVmNzE0YTE2M2M2M2E1N2Ey
MTlkZTxicj4KJmd0OyAmZ3Q7IHk6IGViZmQxNDhmMTg2ZjI1NjBhMGE2NzEzYjVmNmY1MGJmYWEz
OWI3YTMyMDMwNGY4NjIwYzM2YmRlZTRkZmEzNzk8YnI+CiZndDsgJmd0OyBgYGA8YnI+CiZndDsg
Jmd0OyAtIHRwbTJfbG9hZCAtLXBhcmVudC1jb250ZXh0PW93bmVyX3ByaW1hcnkuY3R4IC0tcHVi
bGljPWNoaWxkX3B1YmxpYy5rZXkgLS1wcml2YXRlPWNoaWxkX3ByaXZhdGUua2V5IC0ta2V5LWNv
bnRleHQ9Y2hpbGRfa2V5LmN0eDxicj4KJmd0OyAmZ3Q7IE91dHB1dCBpcyBgbmFtZTogMDAwYjE4
NzM4YjRhNTM2NmQzZjg2MzkyMGM3Yjk4ZGI2OTZjNzIzZmQ4OGUwMzBiN2NhZDMyZTFkM2FjMzNl
NmZiNmNgPGJyPgomZ3Q7ICZndDsgLSB0cG0yX2V2aWN0Y29udHJvbCAtLWhpZXJhcmNoeT1vIC0t
b2JqZWN0LWNvbnRleHQ9Y2hpbGRfa2V5LmN0eCAweDgxMDIwMDAxPGJyPgomZ3Q7ICZndDsgT3V0
cHV0IGlzPGJyPgomZ3Q7ICZndDsgYGBgPGJyPgomZ3Q7ICZndDsgcGVyc2lzdGVudC1oYW5kbGU6
IDB4ODEwMjAwMDE8YnI+CiZndDsgJmd0OyBhY3Rpb246IHBlcnNpc3RlZDxicj4KJmd0OyAmZ3Q7
IGBgYDxicj4KJmd0OyAmZ3Q7IC0gdHBtMl9ldmljdGNvbnRyb2wgLS1oaWVyYXJjaHk9byAtLW9i
amVjdC1jb250ZXh0PW93bmVyX3ByaW1hcnkuY3R4IDB4ODEwMTAwMDE8YnI+CiZndDsgJmd0OyBP
dXRwdXQgaXM8YnI+CiZndDsgJmd0OyBgYGA8YnI+CiZndDsgJmd0OyBwZXJzaXN0ZW50LWhhbmRs
ZTogMHg4MTAxMDAwMTxicj4KJmd0OyAmZ3Q7IGFjdGlvbjogcGVyc2lzdGVkPGJyPgomZ3Q7ICZn
dDsgYGBgPGJyPgomZ3Q7ICZndDsgLSB0cG0yX2dldGNhcCBoYW5kbGVzLXBlcnNpc3RlbnQ8YnI+
CiZndDsgJmd0OyBPdXRwdXQgaXM8YnI+CiZndDsgJmd0OyBgYGA8YnI+CiZndDsgJmd0OyAtIDB4
ODEwMTAwMDE8YnI+CiZndDsgJmd0OyAtIDB4ODEwMjAwMDE8YnI+CiZndDsgJmd0OyAtIDB4ODE4
MDAwMDA8YnI+CiZndDsgJmd0OyAtIDB4ODE4MDAwMDE8YnI+CiZndDsgJmd0OyBgYGA8YnI+CiZn
dDsgJmd0OyAtIHRzczJfbGlzdDxicj4KJmd0OyAmZ3Q7IE91dHB1dCBpcyBhbiBlcnJvciBtZXNz
YWdlPGJyPgomZ3Q7ICZndDsgYGBgPGJyPgomZ3Q7ICZndDsgV0FSTklORzpmYXBpOnNyYy90c3My
LWZhcGkvYXBpL0ZhcGlfTGlzdC5jOjIxNjpGYXBpX0xpc3RfRmluaXNoKCkgUGF0aCBub3QgZm91
bmQ6PGJyPgomZ3Q7ICZndDsgRVJST1I6ZmFwaTpzcmMvdHNzMi1mYXBpL2FwaS9GYXBpX0xpc3Qu
Yzo4MTpGYXBpX0xpc3QoKSBFcnJvckNvZGUgKDB4MDAwNjAwMzQpIEVudGl0aWVzX0xpc3Q8YnI+
CiZndDsgJmd0OyBGYXBpX0xpc3QoMHg2MDAzNCkgLSBmYXBpOlByb3Zpc2lvbmluZyB3YXMgbm90
IGV4ZWN1dGVkLjxicj4KJmd0OyAmZ3Q7IGBgYDxicj4KJmd0OyAmZ3Q7IFRoZXJlIGlzbid0IGFu
eXRoaW5nIGluIGAvdXNyL2xvY2FsL3Zhci9ydW4vdHBtMi10c3MvZXZlbnRsb2cvYCBmb3IgbWUg
dG8gbG9vayBhdCwgcG9zc2libHkgYmVjYXVzZSBvZiB0aGUgRG9ja2VyaXNlZCBzZXR1cC48YnI+
CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IEkgY2FuIGxhdGVyIGRlbGV0ZSB0aGVzZSBwZXJzaXN0
ZW50IGhhbmRsZXMgdXNpbmcgZS5nLiB0cG0yX2V2aWN0Y29udHJvbCAtLWhpZXJhcmNoeT1vIC0t
b2JqZWN0LWNvbnRleHQ9MHg4MTAyMDAwMTxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgVGhh
bmtzIHZlcnkgbXVjaCBpbiBhZHZhbmNlPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyBDaGVl
cnM8YnI+CiZndDsgJmd0OyB6Ljxicj4KJmd0OyAmZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fPGJyPgomZ3Q7ICZndDsgdHBtMiBtYWlsaW5nIGxpc3Qg
LS0gdHBtMkBsaXN0cy4wMS5vcmc8YnI+CiZndDsgJmd0OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFu
IGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEub3JnPGJyPgomZ3Q7ICZndDsgJSh3ZWJfcGFn
ZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CiZndDsgJmd0
Ozxicj4KJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xzxicj4KJmd0OyB0cG0yIG1haWxpbmcgbGlzdCAtLSB0cG0yQGxpc3RzLjAxLm9yZzxicj4KJmd0
OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEub3Jn
PGJyPgomZ3Q7ICUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxf
bmFtZSlzPGJyPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xzxicj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0gdHBtMkBsaXN0cy4wMS5vcmc8YnI+ClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gdHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8YnI+CiUod2Vi
X3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPGJyPgo8L2Rp
dj4KPC9zcGFuPjwvZm9udD48L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============3534900846601255391==--

