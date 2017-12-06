Content-Type: multipart/mixed; boundary="===============3943995786840420316=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] tpm2-tss 1.3.0-rc0 available
Date: Wed, 06 Dec 2017 08:50:15 -0800
Message-ID: <0dc5a8e2-eeb8-1975-a90c-227393562696@twobit.us>
In-Reply-To: d432025c-5971-56da-ce69-48bf74790806@twobit.us
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3943995786840420316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/21/2017 01:45 PM, Philip Tricca wrote:
> On 11/14/2017 12:43 PM, Philip Tricca wrote:
>> On 11/01/2017 08:29 PM, philip.b.tricca(a)intel.com wrote:
>>> I've just pushed a tag for the first release candidate for version 1.3.0
>>> of the TSS libraries. It's available here:
>>> https://github.com/01org/tpm2-tss/releases/tag/1.3.0-rc0
>>>
>>> The CHANGELOG is very short, just fixing two broken macros and adding
>>> support for the EncryptDecrypt2 command. This release is necessary for
>>> users with TPM2 devices that have deprecated support for the
>>> EncryptDecrypt function. Support for this function in the tools is
>>> forthcoming.
>>
>> I've just signed an RC1 tag for 1.3.0. Tarballs and the changelog are
>> available here:
>> https://github.com/intel/tpm2-tss/releases/tag/1.3.0-rc1. This should
>> bring us up to parity with what's required for the 3.x release of the to=
ols.
>>
>> Please provide feedback from testing. I'll be doing the static analysis
>> through coverity next. Changes (if any) required for the static analysis
>> will be in RC2.
> =

> There's now an RC2 tag for 1.3.0 & tarballs on github. The only change
> since the last RC are minor changes to keep coverity happy.
> =

> Like the 1.2.0 release of tpm2-abrmd this one is intended to be paired
> with the 3.x tools release so please use this tag in your testing.

There's now an RC3 tag for 1.3.0 & tarballs on github:
https://github.com/intel/tpm2-tss/releases/tag/1.3.0-rc3

There has only been a single commit added since RC2 and it only affects
the test code.

Regards,
Philip


--===============3943995786840420316==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSkVCQUVCQ2dBdUZpRUVPOXJlUmQza1N2
MUJJQ21BTXZkK2RjTGgwN29GQWxvb0g4d1FIR1pzYVdod1FIUjMKYjJKcGRDNTFjd0FLQ1JBeTkz
NTF3dUhUdXZtNUQvNHhHcUlDb2sxK1MvTmRzWVZQZ0QwbEdqV05NblhqdEtzOQo5cnBuWGExNHNR
OVFOeCs5ZVdodXlxZWZaV1Zlek5iclVjby9NMWVrV1FSM0dReUZXdDJnYkZ4QXc3enpWaUVECkpO
SkFmMGg2dUhnT0JlbUVMbHYwbmJYYUpndEtRUmJtVEoyc2d1c085bEp1WFIxcndkSXYrNGJFZ2xr
VzFrWW8Kd0RMa0tiMEwwczdKdjg0KzBueWs4SUtmNXlmbERvN0xkcTczTWpyY3FjQkxiSk52Tzlv
S0VUdGptK2xENTh1RApQT2VGbklscDJLRG1jWnFmbC9nRnVsYjFmQXR4U3hYeERJd25BWjZza20z
TnhLZmY0ZkxvN3BpRzZtVnN5MDVmCjRMc2R2TlBiT3RVZC9XVFFndWdoTGljNVB2SVRTTmVxRk1q
bW11QlFoamlzOUd3eWdWcFRsTGF1dWx4VnpmYWUKVURRYmN1YUhIM1V2Qzc2UXlESjA2T3JCTWU1
RXltTlhJeWM3V0JtOWhpWlR2bjgzTFR6QlB2NFVWWU10STRhegoxTm9ETWxBZTBkZFNqOVhRbnIz
ZnVjNG5LdW8zN1VBNkNtSUl0MFdleHI2TFl5dW1jZWZtbHNjSDBoNmpub1pCCmoxZnZUL2J0dCs5
b1VLY1V3aXpCS0FGM0svR0NGbk44emQ1Mmx1MEdZTDZZN3dCKy9Vd25EcjJSOFhSdjlESVgKV0NG
R3dnWHlJc2ZpWDE2YWlrb0x5WW5ZRTdvWEh5S2E3cUdGTVVNNlBVQ0E3T1ZWWGRmTWVGZk9oMlJL
T2NGRwppK29qRjAyYjNFMlJhRjBwOVpLazFxeDhSU2pMdFZEN0ZVSXRtU3J0Vk1MeE1aL3I3MUc3
NjhQNE91bm0wZk1sCnUxM2tsRitCVHc9PQo9NWl3RQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0t
LS0K

--===============3943995786840420316==--

