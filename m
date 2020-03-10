Content-Type: multipart/mixed; boundary="===============1766047428924543409=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: tpm2_certify signature verification
Date: Tue, 10 Mar 2020 17:12:35 +0000
Message-ID: <20200310171235.2908.1896@ml01.vlan13.01.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E9937A@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1766047428924543409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Try this:

tpm2_createprimary -C o -c primary.ctx -Q =

tpm2_create -G rsa -u rsa.pub -r rsa.priv -C primary.ctx -Q =

tpm2_load -C primary.ctx -u rsa.pub -r rsa.priv -c rsa.ctx
tpm2_certify -c primary.ctx -C rsa.ctx -g sha256 -o attest.out -s sig.out
tpm2_verifysignature -c rsa.ctx -g sha256 -m attest.out -s sig.out
--===============1766047428924543409==--

