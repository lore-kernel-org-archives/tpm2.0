Content-Type: multipart/mixed; boundary="===============0701461581556767966=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] swtpm tests question
Date: Thu, 19 Sep 2019 14:34:21 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E0D24D@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 3c698152b8aa4634943393c8f2d9ea45@lmco.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0701461581556767966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That's a different project, I would reach out to that development community.

Bill

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Stone, Thoma=
s G
> Sent: Wednesday, September 18, 2019 9:35 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] swtpm tests question
> =

> I am trying, unsuccessfully, to see how the TPM_CC_Hash value 0x0000017D =
gets
> sent to the swtpm.   Additionally, the _test_hashing script is sending th=
e string
> "1234" to the swtpm and then verifies a twenty byte return, which is 160 =
bits,
> against the hash code "97 e9 76 e4 f2 2c d6 d2 4a fd 21 20 85 ad 7a 86 64=
 7f 2a e5"
> which does not appear to correspond to to any hash that I separately calc=
ulate.
> Nor do I see where the hashing algorithm to be used is sent to the swtpm =
(eg
> 0x0004 for sha1 or 0x000b for sha2.
> =

> =

> =

> I was hoping to use the existing tests as templates for new tests such as=
 testing
> TPM_CC_GetRandom.  I can't do that if I cannot find where the TPM_CC_Hash=
 is
> specified or where the hashing algorithm to use is specified.
> =

> =

> =

> The _test_hashing code is
> =

> =

> =

> run_swtpm_ioctl ${SWTPM_INTERFACE} -h 1234
> =

> if [ $? -ne 0 ]; then
> =

>         echo "Error: Hash command did not work."
> =

>         exit 1
> =

> fi
> =

> =

> =

> # Read PCR 17
> =

> Swtpm_open_cmddev ${SWTPM_INTERFACE} 100
> =

> RES=3D$(swtpm_cmd_tx ${SWTPM_INTERFACE}
> '\x00\xC1\x00\x00\x00\x0E\x00\x00\x00\x15\x00\x00\x00\x11')
> =

> exp=3D' 00 c4 00 00 00 1e 00 00 00 00 97 e9 76 e4 f2 2c d6 d2 4a fd 21 20=
 85 ad 7a 86 64
> 7f 2a e5'
> =

> if [ "$RES" !=3D "$exp" ]; then
> =

>         echo "Error: (1) Did not get expected result from TPM_PCRRead(17)"
> =

>         echo "expected: $exp"
> =

>         echo "received: $RES"
> =

>         exit 1
> =

> fi
> =

> =

> =

> Any pointers will be appreciated.  This is the first time I have attempte=
d to use a
> tpm so the answer is probably something obvious that I am overlooking.
> =

> =

> =

> Thomas Stone, CISSP
> =

> Information Assurance Engineer Staff
> =

> Lockheed Martin Missiles and Fire Control
> =

> Phone (407) 356-6913
> =

> Cell (919) 812-0607
> =

> Email: thomas.g.stone(a)lmco.com <mailto:thomas.g.stone(a)lmco.com>
> =

> =

> =

> =



--===============0701461581556767966==--

