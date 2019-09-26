Content-Type: multipart/mixed; boundary="===============3575322739838970293=="
MIME-Version: 1.0
From: Jonas Witschel <diabonas at gmx.de>
Subject: Re: [tpm2] [TPM][tpm2_tools] Why tpm2_nvreadlock can't work normally
 with the attribute "policyread|policywrite|read_stclear"?
Date: Thu, 26 Sep 2019 10:35:32 +0200
Message-ID: <07a402e6-b1ca-5c66-d196-fa97f111a848@gmx.de>
In-Reply-To: A888B25CD99C1141B7C254171A953E8E490765B6@shsmsx102.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3575322739838970293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Shirley,

On 2019-09-26 09:39, Zhao, Shirley wrote:
> Seems tpm2_nvreadlock can't accept the policy option, right?
> If so, is there any plan to support policy?

tpm2-tools 4 supports an authorisation value for tpm2_nvreadlock, so
your example would be

tpm2_createpolicy --policy-pcr --pcr-list sha256:7 --policy pcr.policy
tpm2_nvdefine --size 64 --attributes
'policyread|policywrite|read_stclear' --policy pcr.policy 0x1500018
tpm2_nvwrite --auth pcr:sha256:7 --input test.bin 0x1500018
tpm2_nvread --auth pcr:sha256:7 0x1500018
tpm2_nvreadlock --auth pcr:sha256:7 0x1500018

Keep in mind that the new version changed many option names, so other
scripts that you might have will probably need to be updated as well.

Best regards,
Jonas


--===============3575322739838970293==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ2dBZEZpRUUwWkduanhpQjg0
UjFQSlorYUdzR09zUzhEc2tGQWwyTWVGZ0FDZ2tRYUdzR09zUzgKRHNrMmFBLy9WcWVMcHl4TnJF
WGR3d3Y1NTRpdzZXVUg4ZDR6ZVZnWFJkOG12VGdEMlQwcFNLdzA2YjVNVDZIegpLMWZJelpyL3h5
djBuVjBJNU05bW9EbU9GNWxqa2E3OUZ1aW4yaFhFRzFmMXBvUCtnYVp1THpNU1dHVVFVNWZzClZM
dG9FWXoxL01aUnp4dHU1QzgyNGxaMHRpK2V3d2xQZlFkZGFxTTlCUFByMmRzaUROa0h2cWplUzdy
djNacXUKS2puVDdyMW9Ld3F5d1FsbHNtSFRSMnNtSTdQYU1zalh4bG5UaFkyc1IwRDdlWTFzSkRI
UW5YNlA4L1cvR0tVZApzZGVQVjBiTGRLcTdkYTQwUUFRQlJHU1VsQUxtZjgwZktxanIxZzkvSTRB
Ty93ekZkY2ZlVnloc1RPT3NBaDI4CmRpQXRicUFJNUIxbDBVaFpKUmx1anI4ZmNWKzhaTFE4bVha
ZU1mWnhiYzYrb2ZhZ2pEOWlORitSRytpa3lmTE0KYWhzUFUxajhxSTMzaFlzU2kvNHhXa0tMOWp0
c1R4bjZoKzE1TytVRTBSUWgzMmNYYUQvRmQ4YytQSEdpcVVGagpEVVlUalFBQnJZaU1xV00vVTQ4
bGRYSXRWdWk2eExBdWp0ODRvTElWZnBybW1QQmRHdDVyMjdJWWF1MERVVHhKCkJPT0pjUEV4ZWly
b3pieWNZcmU4WDlGQ1FrTzdKbUpaSlpJUDd3aGgxWVkxMEhYNENMeHQ2WUF5ZGxZVFlqVXkKTnNS
akpQUElFZFR2ZVRMSEhUenZWN1lSS0VDY0ptQ0Z4ajlFMnJ0YmxxWWNkd1RXeDYzdklRak9tTHZO
T1lqbQpFZm10YVpTcEtMZ1JqN3FoL0YwUkZscXZMaFRUcmNPMXU0VGJ4MDgzSEg4SlpBU3FaaFU9
Cj1aVWhGCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============3575322739838970293==--

