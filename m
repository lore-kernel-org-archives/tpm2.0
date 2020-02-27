Content-Type: multipart/mixed; boundary="===============0771462093435092655=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] How can I get EK certificate?
Date: Thu, 27 Feb 2020 19:29:44 +0000
Message-ID: <20200227192944.2640.91090@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0771462093435092655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Anyone knows how to get EK certificate?

I am able to get EK public key by using the command below, but not sure how=
 to get EK cert.

#tpm2_readpublic -c 0x81010001 -o ek.pub.pem -f pem


TPM2 tools version:
tpm2-tools-4.1.1
tpm2-abrmd-2.3.1
tpm2-tss-2.3.2
--===============0771462093435092655==--

