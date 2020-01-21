Content-Type: multipart/mixed; boundary="===============1675745605009049618=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: Key Certification
Date: Tue, 21 Jan 2020 15:46:07 +0000
Message-ID: <20200121154607.2993.46650@ml01.vlan13.01.org>
In-Reply-To: 20200121110558.2993.65560@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1675745605009049618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have a gist with that :)

https://gist.github.com/dnoliver/04364e72d8b81368f72ad4e6896f688d#file-enro=
llment-sh-L106

That one creates an ECC signing key, derives a CSR with tpm2tss engine, and=
 certify the key with tpm2_makecredential and tpm2_activatecredential
--===============1675745605009049618==--

