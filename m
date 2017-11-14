Content-Type: multipart/mixed; boundary="===============9140736981673206836=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] tpm2-tss 1.3.0-rc0 available
Date: Tue, 14 Nov 2017 12:43:19 -0800
Message-ID: <7f193f87-33c3-0b2d-bbd4-90b8eade9b51@twobit.us>
In-Reply-To: c11fa167-0f09-568b-f290-779807645caf@twobit.us
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9140736981673206836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/01/2017 08:29 PM, philip.b.tricca(a)intel.com wrote:
> I've just pushed a tag for the first release candidate for version 1.3.0
> of the TSS libraries. It's available here:
> https://github.com/01org/tpm2-tss/releases/tag/1.3.0-rc0
> =

> The CHANGELOG is very short, just fixing two broken macros and adding
> support for the EncryptDecrypt2 command. This release is necessary for
> users with TPM2 devices that have deprecated support for the
> EncryptDecrypt function. Support for this function in the tools is
> forthcoming.

I've just signed an RC1 tag for 1.3.0. Tarballs and the changelog are
available here:
https://github.com/intel/tpm2-tss/releases/tag/1.3.0-rc1. This should
bring us up to parity with what's required for the 3.x release of the tools.

Please provide feedback from testing. I'll be doing the static analysis
through coverity next. Changes (if any) required for the static analysis
will be in RC2.

Thanks,
Philip


--===============9140736981673206836==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSkVCQUVCQ2dBdUZpRUVPOXJlUmQza1N2
MUJJQ21BTXZkK2RjTGgwN29GQWxvTFZXc1FIR1pzYVdod1FIUjMKYjJKcGRDNTFjd0FLQ1JBeTkz
NTF3dUhUdXJoSkQvOW1XRGtDdUtuZmZ2N2JtTytsa051bk05d2tUWUVDcHpMdwpMMVFUL1BFSVBq
dVFyM0M5b2wya2FtNnRvcDB0UTVJR1U0Smc0TWR1N2hsWDBXKzRFeFJhRlhianRTVjBvVDdwCkJB
Q0NidDhsNmtrc3pFM3BxZ0lhcTFZSGhTZW9oT0d3K1NTYTY1VXFDQzAzZFRjN1UyUEhtdDVIN3FP
WFV1SHgKQXFnczhiYmtSWWdUWUlHQ3pnRll3SCtsNUdSeHdndm1uT2FCaHdMNk9RcmxqeDhpNWd5
cUNudjFuNDJJa0E2WQo0VUhRWXZSejNQbS8xc3ZjanRFaWJiZ1ZBRElZRGdTQ1N3a3ZxK2wwMDJY
b1kxMlo2R1BWNjBHSXFyK0Y2L21EClFQNnVpdkJKUEJJYU1LYjFGM1hOazZKTlJITndYeVZKQXN1
YzBCSjFwV1liSjRqalhzUkJpdVNIWmQrNklybE0KbFJoekUySk9EcXZFYjBOajVCdzFiWCtEKzZw
VkJzTHRwN2I1bnBQbElBSjY5SjVmajUzcjk0YURXUlB6WTFGVQp2cG1ETHpZbTNGRFNEQ3FjN0Rw
NU81bDdXcTU1OGFNM1dUb1Rka3k3RlozdWc1eXRqWWpSTkE4aDVKMGJnUnFLCmVKVTJlb1JmYkc4
dlFLRTljWGc4Wis2TWp5bjlpZWxNc05uOHpLVEFlRHhHSENDZkRFYmZzRWtKVko5eng0NmYKVWhz
cEwxd3NRNFNkM3Z5N202UUJNalN0Q3lGOFI2cjd2c2hwNGRzNkFjZ1hGNmNJS1VmNGdibllRdktB
Mks5egoyb3EyVG5GdVRhM2Y2OURhZ283cnNtSVlqRXNXSEdaL1Z6cm5uYzBjaERQRy8za1l0MUxX
THRNK3pzUGlqdllwCnlwdWlQWWFxckE9PQo9WDBNRgotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0t
LS0K

--===============9140736981673206836==--

