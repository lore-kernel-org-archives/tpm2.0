Content-Type: multipart/mixed; boundary="===============4706000343041918061=="
MIME-Version: 1.0
From: Tim K <tpm2 at bitzap.e4ward.com>
Subject: [tpm2] Recommended way to encrypt a credential
Date: Sat, 16 Jul 2022 16:18:49 +0000
Message-ID: <20220716161849.2570.27559@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4706000343041918061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Let's assume I have a credential for some other remote system that I'd like=
 to store somewhat protected so it can be used in a cron job. What is the r=
ecommended way? I see a few possibilities:

1. Create a primary key, an encryption key and seal the credential (it's sm=
all, less than 128 bytes)
2. Use an encryption key to encrypt something like a GPG passphrase (or may=
be the GPG private key without a passphrase) and then gpg-encrypt a file th=
at holds my credential
3. Use tpm2_encryptdecrypt which looks like some form of simplifying #2 abo=
ve and may also work with files that may slightly exceed 128 bytes
4. Just store the credential directly at an NV index

Thanks!
--===============4706000343041918061==--

