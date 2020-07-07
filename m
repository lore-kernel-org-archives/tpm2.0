Content-Type: multipart/mixed; boundary="===============4988768598102146841=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] Re: tpm2_createak fails. Error code: 0x184. Reboot doesn't
 help!
Date: Tue, 07 Jul 2020 06:07:46 +0000
Message-ID: <20200707060746.2823.61568@ml01.vlan13.01.org>
In-Reply-To: 20200706180322.2823.66693@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4988768598102146841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

thanks Imran for looking into it. Below is the output. Does the information=
 help?


[root(a)myhost ~]# tpm2_readpublic -c 0x81010001
name: 000bc11d18cdceffa5af9080820ae0d2998fda7041a1378edf72aa9236efef63f4e8
qualified name: 000b75134daa3d3ce6ab75530a78735376f72277dc0babe7f2d3fc89be0=
3e2e5ca18
name-alg:
  value: sha256
  raw: 0xb
attributes:
  value: fixedtpm|fixedparent|sensitivedataorigin|adminwithpolicy|restricte=
d|decrypt
  raw: 0x300b2
type:
  value: rsa
  raw: 0x1
exponent: 0x0
bits: 2048
scheme:
  value: null
  raw: 0x10
scheme-halg:
  value: (null)
  raw: 0x0
sym-alg:
  value: aes
  raw: 0x6
sym-mode:
  value: cfb
  raw: 0x43
sym-keybits: 128
rsa: 803d <I omit some contents here ... ... > 69aa
authorization policy: 837197674484b3f81a90cc8d46a5d724fd52d76e06520b64f2a1d=
a1b331469aa
--===============4988768598102146841==--

