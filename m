Content-Type: multipart/mixed; boundary="===============6100676008212544236=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Random numbers from a noisy sensor?
Date: Mon, 06 Jan 2020 13:57:49 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163C43F12@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: CALtZhhM9DUgaPXisBzpYxKbaxOuC5XCV=LfidOE2jguWHwkksA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6100676008212544236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TPM2 chips have internal entropy sources.
However, more entropy is never a bad thing, thus stirrandom.

See
https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-Arc=
hitecture-01.38.pdf
Section 11.4.10.2 "Entropy Source and Collector"

Cheers,
Andreas
________________________________________
From: Frederick Gotham [cauldwell.thomas(a)gmail.com]
Sent: Monday, January 06, 2020 14:43
To: tpm2
Subject: [tpm2] Random numbers from a noisy sensor?

Up until now, I thought that the TPM2 chip got its random bits from
the noise on a internal sensor. I always thought that it had a
"genuine" hardware source for randomness.

If this were the case though, then there wouldn't be any "tpm2_stirrandom".

What's actually going on here?
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6100676008212544236==--

