Content-Type: multipart/mixed; boundary="===============2639830220354258874=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: tpm2_createak fails. Error code: 0x184. Reboot doesn't
 help!
Date: Wed, 08 Jul 2020 20:44:55 +0000
Message-ID: <20200708204455.2823.42404@ml01.vlan13.01.org>
In-Reply-To: 20200708063906.2823.15430@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2639830220354258874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Simply R\unning ```tpm2_clear``` should suffice and it should both clear th=
e TPM and also flush the persistent handles
--===============2639830220354258874==--

