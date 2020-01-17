Content-Type: multipart/mixed; boundary="===============2855540885764161270=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Remote attestation over Bluetooth: Cool TPM1.2 Demo In
 Need of TPM2.0 Support
Date: Fri, 17 Jan 2020 19:33:37 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E6780A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 76093b625967a0c46c29604853543a7752bdd60a.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2855540885764161270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Andersen, John S [mailto:john.s.andersen(a)intel.com]
> Sent: Friday, January 17, 2020 10:28 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Remote attestation over Bluetooth: Cool TPM1.2 Demo In Ne=
ed
> of TPM2.0 Support
> =

> Hi All,
> =

> I saw something from Matthew Garrett about a cool demo he did using the T=
PM
> for remote attestation over Bluetooth. Looks like they're not there yet o=
n TPM2
> support (here's a relevant issue https://github.com/google/go-
> attestation/issues/98). But really cool stuff so I thought you all would =
be
> interested.
> =

> =

> [Matthew's] #lca2020 demo was remote attestation over Bluetooth, which
> means you can gain the security benefits of remote attestation without
> needing to pass data or identity to a third party. Code is at
> https://github.com/google/go-attestation/tree/bluetooth?files=3D1
> =

> There's no authentication yet, and it doesn't support TPM2, so a fair
> amount of work to be done yet. Goal is to port this to phones so you
> can use your phone to verify the state of your laptop before entering
> any credentials.

Interesting. I did something similar with a virtual trust zone backed PIV c=
ard:
https://youtu.be/1WG4mJ1HXQw?t=3D2017

The nice part of PIV is Linux and Windows ship with support, so all you nee=
ded
Was a virtual IFD (card reader driver) to expose BT. NFC CCID compliant rea=
ders
Worked out of the box. =


> =

> Video of [Matthew] demoing TPM remote attestation over Bluetooth as a
> privacy preserving security feature is now up:
> https://www.youtube.com/watch?v=3DFobfM9S9xSI
> =

> Source: https://twitter.com/mjg59/status/1217990920773095424

I haven't gotten through this yet, but it would be nice if they just made
It PIV compatible so it works in existing card edges.

> =

> =

> Also, I remember discussion recently on event log parsing and there
> being a difference between 1.2 and 2.0 that might have been tripping
> something up? Maybe I remembered incorrectly. But looks like they've
> got the 1.2 event log parsing down if someone needed to use that as a
> reference (Apache-2.0):
> https://github.com/google/go-attestation/pull/64/files
> =

> Thanks,
> John
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============2855540885764161270==--

