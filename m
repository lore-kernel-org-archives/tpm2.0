Content-Type: multipart/mixed; boundary="===============8683381106168396919=="
MIME-Version: 1.0
From: Matthias Gerstner <mgerstner at suse.de>
Subject: Re: [tpm2] tpm2-tools man pages not installing?
Date: Tue, 03 Jul 2018 16:53:23 +0200
Message-ID: <20180703145323.GA16483@f195.suse.de>
In-Reply-To: 3acb402299484e99a21524f88031fb51@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8683381106168396919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jul 03, 2018 at 01:46:14PM +0000, Scheie, Peter M wrote:
> When I build & install tpm2-tools, the man pages don't seem to get
> installed.  I'm just using the default './configure; make; sudo make
> install' routine, so everything is going into /usr/local/; therefore,
> I'd expect the man pages to end up in /usr/local/share/man, but they
> don't.  Do I need add an argument to configure to make that happen?

that is actually a bug and I addressed it via commit
72a28f36151db9bfa59a460ae0114dcece218862, however that commit didn't
make it into the current release.

So you either have to install them manually or, as a workaround, if you
have pandoc installed on the system, then the build system tries to
generate the man pages and alongside that also installs them.

Regards

Matthias

-- =

Matthias Gerstner <matthias.gerstner(a)suse.de>
Dipl.-Wirtsch.-Inf. (FH), Security Engineer
https://www.suse.com/security
Telefon: +49 911 740 53 290
GPG Key ID: 0x14C405C971923553

SUSE Linux GmbH
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nuernberg)

--===============8683381106168396919==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ0FBZEZpRUU4Mm9HMUE4YWIx
ZUVTWmRqRk1RRnlYR1NOVk1GQWxzN2pkOEFDZ2tRRk1RRnlYR1MKTlZQNEJBLzhDVTVNdHZDcE5H
MmtNU05YbDVjWjYrdGtrRGFKNXVXUnhLZTBjaEhHWmJZWTIwYnE3OEo1WG84KwphTU1keG91UXBy
WW9tTzh0eXdGeWhzRm1BUm1TcjZJUmFVYmwzbEJhZUFOQWJER1lQNU1GUmgyNlJ2akVDZEJKCm5T
TFZMSkNUMEI4R1VNbkE0N1VBRTBHM3Z3OXd4MDZNajFJWUFuTW1VdHRMZElPbUc1R0U2UGFvTWxk
aHU3dkUKWmFLV1cwTGphVHhVU1I2Wld6ZldheENIWERQUXc2NzJmb3hIYzExeVBjanpWQUdJR2dJ
clFPUHZFWVBtUlBzZwp1V0NGMUhTUTBrQTMyUlVyMnNsa25mZHN0WG1zc25jYi9BcXhUcjJMV1hO
NDdTSG41K0s5ZXZCOE5lOGNKVEpQCnJLNGpxWlRMZlh0VXBSNWpwd0MzYXo2bU43b0lUZmRFdVdw
OGR5cnRBa0s4ZWo2T3JlOEFrNkZua3daYkxpeWoKd3hmM2hDSWRYV2V4NENiRmw1R2hVUWw0bDgv
QU5TY1Jlci9RWUw3czkwZGREWG5EOC9GRXVaWXF6RFlZUWNKQQorZ2pFeXZkV1pGVjZqaUxndEY1
MEtJTmhxa0Y3U3IycnkyZlA5clYrdmNzVXZQRExTdGM2WTNDaUhzakVYcHVwCkV5QWFLd0RIMjNu
aXhaZnNQeHhlMGFVVHFhRWpBdks4bTNodzVNNXVVaWRpM2I2Qk95NUIrQk9tenI5aG1xSlgKU3FW
VzZvdFRHTUlYV3R6UjVWK0VMZUQ2WGsrSWJIc1BSSkhsaiswNGlMVXpMN0NOL1dvMjFHMzBBYklw
cGZBagprbW1oQkFRR2JwMVhMTUhrYWlxemF6ZGNGbmN5NEJ0UkNqUG9oL2tOVm9IWG9SNzd3L3c9
Cj0zYmdECi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8683381106168396919==--

