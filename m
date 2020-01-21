Content-Type: multipart/mixed; boundary="===============0465074283294111006=="
MIME-Version: 1.0
From: s.schwebel at uvensys.de
Subject: [tpm2] Re: Key Certification
Date: Tue, 21 Jan 2020 11:05:58 +0000
Message-ID: <20200121110558.2993.65560@ml01.vlan13.01.org>
In-Reply-To: f398826e-0263-190c-bff6-923ba5475071@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0465074283294111006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I just discovered that openssl will accept key handles as well

openssl req -new -key 0x817FFFFF -engine tpm2tss -keyform engine -out key.c=
sr -config csr.cnf

that solves my problem.
--===============0465074283294111006==--

