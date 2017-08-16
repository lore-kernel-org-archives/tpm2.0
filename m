Content-Type: multipart/mixed; boundary="===============7660741141549516240=="
MIME-Version: 1.0
From: Raveau, Sebastien <sebastien.raveau at baesystems.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Wed, 16 Aug 2017 17:32:28 +0000
Message-ID: <1FEB6BE5D027454BAEDB8EA7F2D809DED80CFC2B@UKDC1CSUEXMV01.CSU.LOCAL>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563EAA9851@ORSMSX103.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7660741141549516240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi William,

> > For example if I copy your exact /boot onto another disk, copy your LUKS
> > header into a tiny partition just for your initrd to retrieve the sealed
> > keys, and add my own root partition unencrypted but with the same UUID =
as
> > that of your crypt_root then I am likely to end up with a fully functio=
nal
> > system of my own where your keys are unsealed.

> The keys themselves I would imagine are being loaded into the TPM on boot
> since they are Not persistent, those keys shouldn't be able to be unwrapp=
ed
> by a separate TPM.

Of course :-) I was referring to me using your own TPM against you.

Best regards,

Sebastien
Please consider the environment before printing this email. This message sh=
ould be regarded as confidential. If you have received this email in error =
please notify the sender and destroy it immediately. Statements of intent s=
hall only become binding when confirmed in hard copy by an authorised signa=
tory. The contents of this email may relate to dealings with other companie=
s under the control of BAE Systems PLC, details of which can be found at ht=
tp://www.baesystems.com/Businesses/index.htm.

--===============7660741141549516240==--

