Content-Type: multipart/mixed; boundary="===============2051077309954621403=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] tpm2-tss 1.3.0-rc0 available
Date: Tue, 21 Nov 2017 13:45:05 -0800
Message-ID: <d432025c-5971-56da-ce69-48bf74790806@twobit.us>
In-Reply-To: 7f193f87-33c3-0b2d-bbd4-90b8eade9b51@twobit.us
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2051077309954621403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/14/2017 12:43 PM, Philip Tricca wrote:
> On 11/01/2017 08:29 PM, philip.b.tricca(a)intel.com wrote:
>> I've just pushed a tag for the first release candidate for version 1.3.0
>> of the TSS libraries. It's available here:
>> https://github.com/01org/tpm2-tss/releases/tag/1.3.0-rc0
>>
>> The CHANGELOG is very short, just fixing two broken macros and adding
>> support for the EncryptDecrypt2 command. This release is necessary for
>> users with TPM2 devices that have deprecated support for the
>> EncryptDecrypt function. Support for this function in the tools is
>> forthcoming.
> =

> I've just signed an RC1 tag for 1.3.0. Tarballs and the changelog are
> available here:
> https://github.com/intel/tpm2-tss/releases/tag/1.3.0-rc1. This should
> bring us up to parity with what's required for the 3.x release of the too=
ls.
> =

> Please provide feedback from testing. I'll be doing the static analysis
> through coverity next. Changes (if any) required for the static analysis
> will be in RC2.

There's now an RC2 tag for 1.3.0 & tarballs on github. The only change
since the last RC are minor changes to keep coverity happy.

Like the 1.2.0 release of tpm2-abrmd this one is intended to be paired
with the 3.x tools release so please use this tag in your testing.

Regards,
Philip


--===============2051077309954621403==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSkVCQUVCQ2dBdUZpRUVPOXJlUmQza1N2
MUJJQ21BTXZkK2RjTGgwN29GQWxvVW5tRVFIR1pzYVdod1FIUjMKYjJKcGRDNTFjd0FLQ1JBeTkz
NTF3dUhUdXZTdkQvOXAzNElMelhWZGxaUmtTZEEwVEJFNDdPaGpTVkk0SkxXagpmR3kyZktFNGM4
V0F1SXNKUWdrMjMxc3hJWjZEYjdkcDhBMkV2YzNHT05aK2hsUEFDY0NiQzc4ejNMTnhrc29KCjRW
OVc1UzNHTHozck9DVXNlSGtidHBpQjdRaTRMREJQeUwvN2FibjNYL2o5N25JNHA2YVN2Um9PZ0lm
LzNZcXkKdUpmTDlsT0ttMVZ1ZlFScGJhMXlnaHR1YzlvVFhoOVN6c0t2NmZlWnE5cXltQ21xUVJ0
elU2d3FZSng0MHp0Lwp3S3NyWEhpZ2VaM2tJR0IxSUtEZUlxclJvd3hGcXN3cy8yR1dxV3gyY2dU
WmN3RTFsUGdoUlhJZUdVTk1GK3B2CnVVRkJOSks4Zk9KZlRmWHBhSSs3M2pXOVlQQTNMdkdEMkhE
emRJd1pFZTdsS1RhdDNkM0ZtYWU2aFRPeDRlakYKd29nNWNhcnErZ2NWWEViS2ZrZVlWVlN2NzIy
WkFXL08xOUgyaC8vaFV0Unc4eUtWcjRUYkxjb2I4cVVlbjlIMQo0S0xYLzVIUVdWbFc5cTFYMFNn
RVcrMWtoRnQrZlFhbXdDS2hMTTgxcmpiSEVRYU1SYnZhWmJRaUhCdDFVL3ZECm9WZlhxaUpoV2x5
U2VaMHB5bDBNbkwwYWxHMkxDM2d1TFd4OWRZTGpvMVZGam9ITXcxdEdHcXJSZzRBYlhRd3gKRkwx
K0RzN0lBMEIrRCtnUndCcmFZZ2xWbEo4cGdCVS9ZS1JwRUlMUU9kU25OZDI5SzVYWHV4OUFRcXBM
UTNDQgo0SlZlUk5nYnViM1d0V1BOYnFCNXBnbVpidEJJY2FJNENORTdvc0UraE1RcG9nT3RYVE5F
dHkxN0twM3RQbCtnCnEvRkVCQm5BcHc9PQo9aVJEdAotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0t
LS0K

--===============2051077309954621403==--

