Content-Type: multipart/mixed; boundary="===============3216251523292062266=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: ActivateCredential not working
Date: Thu, 16 Jan 2020 19:07:51 +0000
Message-ID: <20200116190751.2574.74668@ml01.vlan13.01.org>
In-Reply-To: 8592e618-4b74-14cd-bb81-a35e783afce1@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3216251523292062266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Apparently they are not interchangeable. I think the correct way is to use =
tpm2_createek:

https://github.com/tpm2-software/tpm2-tools/issues/1884  [SOLVED]
https://github.com/tpm2-software/tpm2-tools/issues/1883 [NOT SOLVED]

There are some additional authorization steps you need to do when using the=
 key created with tpm2_createek, that are not needed if you create it with =
tpm2_createprimary
--===============3216251523292062266==--

