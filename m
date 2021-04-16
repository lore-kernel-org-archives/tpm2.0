Content-Type: multipart/mixed; boundary="===============6109938949050861882=="
MIME-Version: 1.0
From: Ted Kim <ted.h.kim at oracle.com>
Subject: [tpm2] does -p (password) work with tpm2_import ?
Date: Fri, 16 Apr 2021 11:28:32 -0700
Message-ID: <d6043ca8-d5bb-a96e-fb21-f021989aa30d@oracle.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6109938949050861882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

I tried tpm2_import with the -p option with a password, and it doesn't =

seem to work for me.

Subsequent tpm2_rsadecrypt commands using the key from the import seem =

to work fine without any -p option.

* Does import work with -p ?=C2=A0 Is there something I have overlooked in =
this?



I understand that tpm2_rsaencrypt does not take the -p option in line =

with the idea of using a "public" key.

* Is it correct to say that if I want to have authorization on =

encryption, I have to use tpm2_encryptdecrypt (i.e. use symmetric keys) ?



Thanks,

-ted


--===============6109938949050861882==--

