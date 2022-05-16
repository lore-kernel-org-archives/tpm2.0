Content-Type: multipart/mixed; boundary="===============8320561676604070819=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Hash sequence duplication without ContextSave/ContextLoad
Date: Mon, 16 May 2022 18:29:22 +0200
Message-ID: <20220516182922.3BF1EB1D@centrum.cz>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8320561676604070819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
=C2=A0
I need to duplicate a hash sequence. This is to implement TPM-based version=
 of OpenSSL's EVP_MD_CTX_dup.
=C2=A0
Background: EVP_MD_CTX_dup can be used to duplicate the message digest stat=
e. This is useful [...] if large amounts of data are to be hashed which onl=
y differ in the last few bytes.
=C2=A0
=C2=A0
So far I am using ContextSave/ContextLoad, but Windows is blocking these TP=
M commands.
https://docs.microsoft.com/en-us/windows/win32/tbs/command-blocking
=C2=A0
Is there some other way to duplicate a TPM hash sequence, please?
=C2=A0
=C2=A0
Petr=C2=A0
--===============8320561676604070819==--

