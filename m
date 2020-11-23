Content-Type: multipart/mixed; boundary="===============7203025989315861039=="
MIME-Version: 1.0
From: Jonas Witschel <diabonas at gmx.de>
Subject: [tpm2] Re: RELEASE CANDIDATE tpm2-tss 3.0.3-rc0 and 2.4.5-rc0
Date: Mon, 23 Nov 2020 16:31:48 +0100
Message-ID: <20201123153148.3wekorvuqtoyxbf3@gmx.de>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0171BD643C@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7203025989315861039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On 2020-11-23 12:03, Fuchs, Andreas wrote:
> https://github.com/tpm2-software/tpm2-tss/releases/tag/3.0.3-rc0

this looks good to me, I confirm that this release candidate contains all t=
he
necessary changes on the tpm2-tss side to make the other tpm2-software test
suites pass, as far as I am aware.

For the benefit of other people trying to run the various test suites with =
the
latest released versions, I will note that there are currently two pending
changes to make all the tests pass:

- https://github.com/tpm2-software/tpm2-tools/pull/2268 to make tpm2-tools
  compatible with tpm2-tss >=3D 3.0.2
- https://github.com/tpm2-software/tpm2-pkcs11/pull/630 to make tpm2-pkcs11
  compatible with tpm2-tss-engine >=3D 1.1.0

This is just FYI, e.g. for distribution packagers, no further changes to ot=
her
tpm2-software projects are necessary.

Best,
Jonas

--===============7203025989315861039==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ2dBZEZpRUUwWkduanhpQjg0
UjFQSlorYUdzR09zUzhEc2tGQWwrNzFkNEFDZ2tRYUdzR09zUzgKRHNsYTBSQUFzd05mRk53YWVQ
ck9sWllrRE5qNXBZSmRYY0tGbU1Rc0ZTOXI1MW1YQzFHaVR0S3dQaTkvSSszYwpBTm9WSU5GNmF2
Nko5c3k5UGl4VEFGcVhMa3p2dE9vdDNCL3ZJa3o5TWtDR0F4eWFpZTJwT29VT2wzTHlzbmZLCkRV
SVRTb0lhU2hacFhMUzljYmZUV1lCbFI0S2JMV2hrU3c2dUpUdkdMWXJFUmw5MEVjQjhqWkRlaVVz
dmxoUy8KZnppUkF0cWVaWXNLZzZ1ck5zeDdnSEtOTW1HRkMrL2pWNGhxdUQrS2hVMmdaZUVtNXd4
VE5CZDU0MmFIbytiZApqbjRmbnhtdFR5dVhRdnNpeW5RTEgxWllTRXFRMEJLQnBBcERoSExMN1c5
a2Y4dWZGd04rK1VHbXA3T25ZdHg0CjFSckZSODNOQWRMVXVjYjZMSVF5ZDJGVllQMzZETnRuLzJ3
ZUlBL2cwUWVmeG1UQ2pRSkxMeEk3LzFtdDBuRDEKTUZDNFpidTU5VnU2TmUxc0FIOFBXZXBDc3B4
Y21NQUdVdDZ4SkhVRlNYdmZKdHVjdVlRSnRTdVUvWnZEYm1VUgpPUStKSlJ1NzVhSnJCbE90QVU5
QXJDWW1VeXhiZEV0MllKK0dYOTB1N1lLNVZaQWNKU29NaXBFcjFTMFpwME9VCmRDTHZGeGszTElY
SkRpMlBOeVRTUjU3SU9XVGhWWHJjTmhIcjAweWRqeERsdGlVN2FHeUpoS2ZhY1YwK2VVcTYKc05t
KzBmYXlISVFlZC93WElnaU5vQS9PWlFQeG9JVGs4bjFPK1ZySDBDc25mTitzWmdlUEFVbUlkQlEz
RWhlYQozV2JMc0Q2b3NKdzdxUitySUJ6dy85RXBjWU03L3M1QmZYVTlPMUZPdDlDdXVwQkp4WkU9
Cj1tRVVmCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7203025989315861039==--

