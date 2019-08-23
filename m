Content-Type: multipart/mixed; boundary="===============0796654924996857771=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Question about SPI encryption
Date: Fri, 23 Aug 2019 17:35:27 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEE532@ORSMSX101.amr.corp.intel.com>
In-Reply-To: f965b5a9-b367-0e98-2455-02a0a47abca4@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0796654924996857771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ESAPI makes it easy to implement this, and the tools have limited support f=
or encrypted sessions and
default to hmac sessions for commands when a password is used.

Bill

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Tadeusz Struk
> Sent: Wednesday, August 14, 2019 3:04 PM
> To: Gallagher, James <james.gallagher(a)uky.edu>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] Question about SPI encryption
> =

> Hello James,
> On 8/14/19 11:56 AM, Gallagher, James wrote:
> > Hello,
> > Supposing I was using a TPM that is connected to its host device via th=
e SPI bus,
> would it be possible to encrypt all communication over that bus. I recent=
ly read
> the TPMgeany papers, linked here:=C2=A0https://github.com/nccgroup/TPMGen=
ie=C2=A0in
> which a man-in-the-middle attack could be used to spoof packets to and fr=
om the
> TPM.
> > I was curious if The ESAPI, SAPI or something else could be used to
> > encrypt communication over the SPI bus to mitigate these vulnerabilitie=
s.
> =

> There is nothing it the TPM software stack that will allow all communicat=
ion to be
> encrypted, however some commands support sensitive parameters in requests
> and/or responses to be encrypted using a TPM session key. Have a look at
> section 21. "Session-based encryption" of the spec[1] This will prevent s=
niffing
> TPM communication. An HMAC session can be used to prevent packet spoofing.
> =

> [1] https://www.trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-
> 2.0-Part-1-Architecture-01.38.pdf
> --
> Tadeusz
> =

> =

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============0796654924996857771==--

