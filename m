Content-Type: multipart/mixed; boundary="===============9062508709529679035=="
MIME-Version: 1.0
From: Ignacio Jaureguiberry <ignaciox.jaureguiberry at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Fri, 29 Nov 2019 17:13:48 +0000
Message-ID: <20191129171348.2967.13973@new-ml01.vlan13.01.org>
In-Reply-To: fb72c2034091997dbaf40b6c779e498b10d5fa78.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9062508709529679035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It works as the original with the added bonus that I no longer need to supp=
ly the path to pkcs11_module_path or pkcs11_engine_path. Also I don't need =
to specify the engine id and name. And extracting the key using p11tool to =
add it to key_id is an extra step that is avoided by using the pkcs11:... s=
tring.
I still have the original problem, though.
--===============9062508709529679035==--

