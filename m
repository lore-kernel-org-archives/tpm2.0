Content-Type: multipart/mixed; boundary="===============0516124106369244357=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: Re: [tpm2] uriparser dependency
Date: Tue, 17 Apr 2018 19:21:08 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3B11E10@ORSMSX108.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0516124106369244357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Please don't try and parse the host part or restrict the host to IPv4 addre=
sses. This will allow hostnames and IPv6.
In other words, just pass everything after the host=3D part.  Also consider=
 making port optional with a default (12345?).

This would allow things such as:
host=3D10.11.12.13
host=3Dfoo.bar.com,port=3D12345
host=3D2001:470:7b:5e7::2,port=3D12345

Dan


--===============0516124106369244357==--

