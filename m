Content-Type: multipart/mixed; boundary="===============4495284467330092421=="
MIME-Version: 1.0
From: dawn.howe at alten.com
Subject: [tpm2] Re: Ecrypting and decrypting a file using a TPM2
Date: Wed, 15 Jun 2022 19:29:28 +0000
Message-ID: <20220615192928.1682.44443@ml01.vlan13.01.org>
In-Reply-To: 20220615152121.213AA4F3@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4495284467330092421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Petr:
Thanks so much for the suggestion.  I was able to encrypt and decrypt my fi=
les based on the pattern in https://github.com/tpm2-software/tpm2-openssl/b=
lob/master/test/cipher_aes128_cbc.sh.  I think I can accomplish what I want=
 with some system calls to openssl.

The code I'm writing is in C++. Is there a way to replace the system call t=
o openssl with a c++ library call (perhaps that takes a provider parameter)?

i.e. Replace the following with a C++ library call =

openssl enc -provider tpm2 -aes128 -e -K $KEY -iv $IV -in testdata -out tes=
tdata.enc

I'd love to see a code sample if you have one.

thanks,
Dawn
--===============4495284467330092421==--

