Content-Type: multipart/mixed; boundary="===============5518407622200767195=="
MIME-Version: 1.0
From: Matthias Gerstner <mgerstner at suse.de>
Subject: Re: [tpm2] Question
Date: Thu, 26 Jul 2018 09:43:27 +0200
Message-ID: <20180726074327.GA8116@f195.suse.de>
In-Reply-To: CAJoYW0+mqTOADfuZoX_KMiKRYzNLXnooOFOOk3f2ZrNNmaco8Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5518407622200767195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Joshua,

On Wed, Jul 25, 2018 at 08:01:33PM -0500, Joshua Muscara wrote:
> I dont know where to post a question. About the tpm2 software posted on
> github it directed to to this list I was wondering how to set it up with =
my
> opensuse linux pc it has an Intel tpm 2.0 tpm and I  keep getting an error

I happen to be the maintainer of the SUSE tpm2 packages. Which openSUSE
version are you using?

> saying "** (proccess:5542): warning **: failed to create connection with
> service GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: the name
> com.intel.tss2.Tabrmd was not provided by any .Service files Error failed
> to initialize  TABRMD TCTI context: 0xa0008" whenever I try to take
> ownership of my tpm.

What is the exact command you're executing?

It looks like you are missing the tpm2 resource manager daemon. Try to
install package tpm2.0-abrmd if not done so already.

Cheers

Matthias

--===============5518407622200767195==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ0FBZEZpRUU4Mm9HMUE4YWIx
ZUVTWmRqRk1RRnlYR1NOVk1GQWx0WmU1OEFDZ2tRRk1RRnlYR1MKTlZPK2FnLy9SeWNLR3Vpa2J3
WHgyN1kvZ2dRWGJKbUt0SmhKWDIwOUY5bmlaUG5lR0pwWFZSKzVTTGZQZVhiRAp2ditxTVphbTFZ
Z3o0VndxUy8wYXFRVDUyVVZWbHNQSWFFZ1NFc3dBL0ZPdVkxMHdxVndrdjVwb1VxelFDU2ZkClNv
ZlAySWR2RzRYT3c3RVZVbisvVlUwNmR4a2tUZjdSWUVxY1MveFNFQnRtYUhBUnR6U3p1ZXFGQVNi
aGg2MkUKcU8rUjhkaTJTRjlNdGVsd0NmRTBwemNYakJ4VXpOSlZ4ZjlYT0swZHlCZFBCclZ3YlEw
R3JYWFJRdG5uSHMzVAo4bjFPTDdQVGRFYTZpT25PS1VTZGpQTFZsa1h6ZjZMOFVTeFlmOW1MMHVu
RUU0VmxkcnpjWDlsNVhiU1d5UldNCmx6MG0wRWVrRU90bHp4aE5HV2NMNy9hSjB3dlNOUUtibTdS
ZXRocEVlZWFvenhFMWZ2ZlBmTWFaKzBtOFFWL04KYkJxR2U5eGlSZkpXMEhnL3luOWpXM2RrWGpi
cnhMVXZ2bGhTeXFabGdoQzB4eUs3eG5vMHVmNkJDVXNUbHAxQwp6VGgyMmt0ZzE0WXRBWUZUQXlh
Y21EeFE5R1lXUjdTcHhnWGYycFZrSzh3Vnk1VEVmampBTDF6QUcva3liQkVwCm4rY1JCSDA1UFdN
SUZhY0ZCVW1nV0RpQ0gxQ0xVZ1psU3ZSZTZSVDZ6azlmVVhYUFozVVVNK08rWjNvR2lhOEEKZm9u
cW1udi9BcU9jSEdwQXFpQStyL1ZkNm4zZ0E0T2MyMERvSGlnRDlrZzlrOEpWTmR3bFFhM29IaUNn
emkxRQpPQzhQdGVKbHJidEdGek5pQVBFWDFOTUo0c0ozN1R1L2Zab2dhcmhpcEcwWkx1WVZnQTg9
Cj0xc3JoCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============5518407622200767195==--

