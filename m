Content-Type: multipart/mixed; boundary="===============4760159213883021548=="
MIME-Version: 1.0
From: s.schwebel at uvensys.de
Subject: [tpm2] Re: tpm2-pkcs11 and certificates, also Linux Networking
Date: Fri, 17 Jan 2020 08:28:04 +0000
Message-ID: <20200117082804.2574.8268@ml01.vlan13.01.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E67070@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4760159213883021548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

yes, "should" :)

I was just about to open an issue on github when I tried it again this morn=
ing.

For some reason it worked

steffenschwebel(a)ubuntu:/opt/tpm2-pkcs11/tools$ ./tpm2_ptool addcert --lab=
el soveryimportant /home/steffenschwebel/Projects/PKI_network/hardware.crt =
--key-label soveryimportant
action: add
cert:
  CKA_ID: f2bed0abc381728ab5406931d138288c9dbbee9e


But I have other problems with that now. If I try to list-all I just hangs.
And I cant use the certificate URL via wpa_supplicant

Not sure how to debug this further..
--===============4760159213883021548==--

