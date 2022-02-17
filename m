Content-Type: multipart/mixed; boundary="===============9020790538836183034=="
MIME-Version: 1.0
From: arlotito at microsoft.com
Subject: [tpm2] Re: Help - how to store a certificate in the NV under the
 platform hierarchy?
Date: Thu, 17 Feb 2022 10:21:02 +0000
Message-ID: <20220217102102.2855.23112@ml01.vlan13.01.org>
In-Reply-To: 20220217101515.2855.27262@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9020790538836183034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hmm, interesting...

I tried the same command on a RPI4 with a physical TPM (Infineon SLB9670)..=
. and it worked.

tpm2_nvdefine 0x01C90000 -C p -s 898 -a "ppread|ppwrite|platformcreate"

and this is what I get:
nv-index: 0x1c90000

Maybe, as you commented, it could be a specific issue of the ibm swtpm (v16=
61).

I'll keep on working on both (swtpm and rpi4/slb9670)

Thanks!
--===============9020790538836183034==--

