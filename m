Content-Type: multipart/mixed; boundary="===============7570270765386310759=="
MIME-Version: 1.0
From: David Woodhouse <dwmw2 at infradead.org>
Subject: Re: [tpm2] Using TPM to protect private key
Date: Thu, 12 Sep 2019 12:23:58 +0000
Message-ID: <f6b4d0b5e1930e2ed984bd56fdf4bcd1.squirrel@twosheds.infradead.org>
In-Reply-To: CAE8e83QZwQx_a7S45yWk1_6-BQVpb58FrVFCXNM_buoxpprg_A@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7570270765386310759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> Thanks for the reference. Yes, we plan to use tpm2.0 for existing IPsec
> vpn
> which supports both psk and certificate based authentication.


Is this an open source implementation?

FWIW my definition of "well behaved", which covers software key files,
PKCS#11 and TPM (but needs updating now that we have a standard way to
store TPMv2 wrapped keys) is at
http://david.woodhou.se/draft-woodhouse-cert-best-practice.html

-- =

dwmw2


--===============7570270765386310759==--

