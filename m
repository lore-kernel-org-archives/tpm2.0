Content-Type: multipart/mixed; boundary="===============0462876315844085008=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] what the different between 0x1d5 and 0x3d5
Date: Wed, 31 Oct 2018 09:46:58 -0700
Message-ID: <28a8dda7-a4a4-fc47-a86d-91747d94adf3@intel.com>
In-Reply-To: CA+tBKVhSh75EO1jwhgVXjPffCEitQ5PX6HCWYrU6feYosPeCdg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0462876315844085008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/31/18 2:15 AM, Terry An wrote:
> [root(a)localhost tpm2-init]# tpm2_rc_decode=C2=A0 0x1d5
> tpm:parameter(1):structure is the wrong size
> [root(a)localhost tpm2-init]# tpm2_rc_decode=C2=A0 0x3d5
> tpm:parameter(3):structure is the wrong size
> =

> I'm so confusing where my code is wrong.

The first error code indicates that the size of the
first parameter is wrong, and the second error code
says that the size of the third parameter is wrong.
See section 6.6 of: https://trustedcomputinggroup.org/wp-content/uploads/TP=
M-Rev-2.0-Part-2-Structures-01.38.pdf
for details.

-- =

Tadeusz

--===============0462876315844085008==--

