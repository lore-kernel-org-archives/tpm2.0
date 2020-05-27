Content-Type: multipart/mixed; boundary="===============2984794901605350108=="
MIME-Version: 1.0
From: Benjamin Berg <benjamin at sipsolutions.net>
Subject: [tpm2] Possible TPM uses in fprintd/libfprint
Date: Wed, 27 May 2020 16:24:03 +0200
Message-ID: <1a6d8509d88d2ebd7ece0ed0a111c61c3c1cfcca.camel@sipsolutions.net>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2984794901605350108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I was wondering if someone has ideas about integrating the TPM with
Fingerprint readers.

Recently I started looking into supporting Secure Device Connection
Protocol (SDCP, [1]) in libfprint. The general idea is to verify that
the Fingerprint reader can be trusted, but I initially also imagined
that further use-cases like unsealing data in a TPM may be possible
(e.g. to retrieve disk encryption keys).

However, looking into it more, my current conclusion is that there is
little to no advantage to use the TPM. At least not unless one also has
a trusted (userspace) program which is capable of signing TPM
authorizations. One could easily offload the required parts into a
small helper, but that may require ensuring it runs in a trusted
execution environment.
Microsoft seems to run relevant parts as trustlets that are walled off
from the rest of the system. That seems sensible to me, but it also
means requiring all the infrastructure for execution and signing and I
doubt that is feasible currently.


Right now I'll probably go the way of not using the TPM at all. But I
am really not an expert for this. So should someone see scenarios where
a TPM is actually helpful in this context, then I would like to hear
about them.

Benjamin

PS: A quick summary of how SDCP works:
 * Device has a private ECC key that signs the firmware and ephemeral
   keys during boot (and is inaccessible afterwards)
 * A certificate proofs that this key was provisioned in factory
 * Device builds a shared secret with the host (s)
 * Device sends id, HMAC_SHA256(s, "identify" || nonce || id)
   when the finger "id" was presented.
 * The HMAC proofs knowledge of the shared secret and authorizes the
   print.

[1] https://github.com/microsoft/SecureDeviceConnectionProtocol/wiki/Secure=
-Device-Connection-Protocol

--===============2984794901605350108==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ0FBZEZpRUVEMk5PNHZNUzMz
VzhFNEFGcTZaV2hwbUZZM0FGQWw3T2VBTUFDZ2tRcTZaV2hwbUYKWTNBa1poQUFvbE1pSWg5TmZR
eUtMTjBWOTAvcmg1STZTYlFUd0l4N0xDZ0I4cmNwMUdzZFN5NWFiSlhTK0J2agpEcmtmbllLd0xT
cDQraDhKOTMxNkl0N3Y5SDI1RVVwRnBxUG9zRzF0R21NZHN5em1nSmVaRGh3cmJSd2QvUW1aCks0
ZGwrK0dSbC96dDVEa1c2SzNTaVdaL25NQytSTzU3RVl0b2UzYjZHc2U3NlozMGJodS9ITExZZ1N3
ZGNEbVEKYjY4OUIxYlJTdGgycUVIUFIrSEg4YjNPTzUwdHBacDg1bSs2dGdHMktDaDhNVnphWkhD
R3lJd0VTbWFZTktXbwpsUFZSNzUxSHZzY2ZXbklVZTVTVVlKTEpMS1hWU2YwVCtoVG9UYU40UmEv
Y1dETFc5S3lDakNWeTBFc0RDNHhrCnZuUldYRlQ4NGRRcGxZSVNuWG1JKzFBTUxHRmgyQWtsWGVw
WEtOQ0RZUEczeG4yc3BVTjRJdXpydTlCWFMvSlIKU2NYbmNBSlhoVzJKM2RBTWF1bjJtUUNwK2wx
WTBYY2RtT0I5SzBBeWg4eVJBY2oyc09OOG8vN3hGWEpWOHdYRwpwaCtmSW5PYTl0ZW0rOTg3ejJm
endqNzRvVkRvWnZMcmp1ekVPam5FMllaaXdxMjZIU3VPTlNQT0JFTlBBYksvCjZmaDF1ZkY4anFh
aDRPbVZCV2Zrd1Z6SU83QTA3ZVFsbTVXMU5pR00xRHlNS3pmS0xoc2FQZ0J4bmZWRGh4UkIKaUc5
clYwaUs5QlFmTVRiM051MzNiZDhnN1ZIY2tJcVcvWjlpTHJHVDliZzgvNytodTBBRlRnTHNpVG5Q
UWVBSwpjRlZzeE95elNqNmw1VGJZVk9lamF5eE9ySzhjSE1pOHpNVkdPQTlFTmFCVUVJNTZDSzg9
Cj1pMGgxCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============2984794901605350108==--

