Content-Type: multipart/mixed; boundary="===============0095087716388088537=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] tpm2-tss 2.2.3_rc2 and 2.1.4_rc2
Date: Thu, 16 May 2019 11:23:36 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0162F3CA9E@exch2010c.sit.fraunhofer.de>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0095087716388088537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I published the new rcs for both stable releases 2.2.x and 2.1.x.
The can bout found here:

https://github.com/tpm2-software/tpm2-tss/releases/tag/2.1.4_rc2
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.2.3_rc2

Both include a fix for the handling of Esys_PolicyPassword.
(P.S. This should not be used, because it transports passwords in
plain; use Esys_PolicyAuthValue instead)

I'll be releasing the final bugfix releases beginning of next week.

Best regards,
Andreas
--===============0095087716388088537==--

