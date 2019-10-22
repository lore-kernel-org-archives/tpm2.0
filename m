Content-Type: multipart/mixed; boundary="===============5575846923660499392=="
MIME-Version: 1.0
From: Jonas Witschel <diabonas at gmx.de>
Subject: [tpm2] tpm2-totp v0.2.0
Date: Tue, 22 Oct 2019 19:19:04 +0200
Message-ID: <bd6ca9d4-15f3-7722-07f5-3336e82f8b05@gmx.de>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5575846923660499392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

tpm2-totp 0.2.0 is now available at

https://github.com/tpm2-software/tpm2-totp/releases/tag/v0.2.0

Added

- pkg-config file for libtpm2-totp.

- New option `-T`/`--tcti` to specify the TCTI to be used.

- New binary `plymouth-tpm2-totp` for integration with plymouth during boot.

- Integration into initramfs images using mkinitcpio, dracut and
initramfs-tools.

- New option `--disable-defaultflags` to disable default compilation flags.

- tpm2-totp(3) man page for libtpm2-totp.



Fixed

- Fix overlinking of libqrencode and libdl.

Cheers,
Jonas


--===============5575846923660499392==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ2dBZEZpRUUwWkduanhpQjg0
UjFQSlorYUdzR09zUzhEc2tGQWwydk9oZ0FDZ2tRYUdzR09zUzgKRHNrT1J3Ly9jRmVnbjQ0dDVh
eUJsU245b1I4RytPWTljVzJZK1MxbjhscENKcXJyYzVqK0hsS2NudXlWRTVLQwpHQWlzTXVsTllZ
cmhuMVJtWUUxM2R1TTRKMFQyV2JwR0FqTWgzczNoMTYyeis2YlRvYXNEaHBaSkFuaS9yLy9aCkQy
bUV3SlkxN2llcUpveEg5Wk1PbmZ1bGpUd3ZJYkZ4NWpDR0JjMmdCbzdnNFY5MFJLVlpWeWRtaFlG
SkRpcGEKbHMyMDRJc1I3U1NZY3Z1Z2VPTDZ4WVhqbGpZblgvT0pTdEswM1Yyc2d4d09IaUlJSWZ0
eWJNR2FHSGxsRVA4Wgp5V1RyN2FwOXNxbHdrY0RITFVKTkJUMWNhM0h2K2Focld0bjdLcWNsaTlR
NTloaDFiVUY3anpSWHFkNk1nRmlhCm1Hc0lidmp1bUZPdE8wMVpvSitjMG1kMGxXZU03MmZ1WkVL
ak5teWEwZEtTeEs4S2Fqc2lDVWlOdFRmYU5oRGoKdXllNVlud212Q0RCdjduK3lTV0trSVltOVVo
Z2dXWDZIRnBWNlUxcWhhcWFhVUNTbGl1bWZaUy9xL2pyZ1dhNAplVDlBMGVZUm9WK1o4aTUzbWtw
TGdYNFA0bEkwL1pMKzlKRWJQaDNsQ3dDZU9VcEh6ZEwxaWNhZloxZGhrQVVtCkFoTUxyUDQ5RWFC
VVVBVWNCZzBWcmI4Y0wzdFVXaURKbWVzTVM5ZTByZzJJRzRzMnZQY0lUTHMrRlV6d3p0czgKeTFB
T2FNdk8rZi9aOHNMUCtaaE0vVnJDZS9RcnVYTGpwTWk1RXp5WWNEUmRlQ2h5MjlMTVB6eWl0cllV
M25TQwp1cW1JNXpWRHppOGhScmttM1VGcGd1TzdrRHk0NTR0Sm9wQzdrSjZMdnRuc1F2ZmdhaTQ9
Cj1vdXRLCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============5575846923660499392==--

