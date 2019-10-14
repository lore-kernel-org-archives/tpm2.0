Content-Type: multipart/mixed; boundary="===============7659744617739060271=="
MIME-Version: 1.0
From: mohammed.aitbendaoud at gmail.com
Subject: [tpm2] Re: tpm2_createprimary command
Date: Mon, 14 Oct 2019 09:05:43 +0000
Message-ID: <20191014090543.2603.52642@new-ml01.vlan13.01.org>
In-Reply-To: a7790d21-be82-2e8a-4638-afa8f6cfed26@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7659744617739060271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for your reply.
It's clear.

I have another somes questions in this regard, at the tpm2_create level thi=
s time :

     tpm2_create -H 0x80000000 -g sha256 -G symcipher -u key.pub -r AESkey.=
priv =


 1- I need to create a symmetric private key AES, why in the function we ha=
ve to specify -u and -r ? if no it does not work !

     tpm2_create -H 0x80000000 -g sha256 -G aes -u key.pub -r AESkey.priv =


when I put aes in parameter it returns me an error : type algorithm not sup=
port 0x6

 2- Why the tpm2-tools does not support aes while the hardware chip of the =
TPM supports it ?


Thank you
--===============7659744617739060271==--

