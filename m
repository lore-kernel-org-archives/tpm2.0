Content-Type: multipart/mixed; boundary="===============1701987203447759218=="
MIME-Version: 1.0
From: Oliver, Dario N <dario.n.oliver at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 23, Issue 18
Date: Thu, 30 May 2019 20:48:02 +0000
Message-ID: <20A6FE0AC912764FB8B5BC5A1A7CB92B2FAAB3FC@fmsmsx101.amr.corp.intel.com>
In-Reply-To: mailman.11.1559242802.7757.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1701987203447759218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Bill,

is 3.2 going to be taken from current master branch?
Also, during the time that I evaluated the tpm2_checkquote, tpm2_quote, tpm=
2_createek, tpm2_createak, I noticed that several of the manpages, options =
and examples are not 100% accurate, as described in this issues:

https://github.com/tpm2-software/tpm2-tools/issues/1488 (tpm2_checkquote)
https://github.com/tpm2-software/tpm2-tools/issues/1042 (overall manpages a=
udit)

Could those manpages be fixed for this release?

Nico

-----Original Message-----
From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of tpm2-request(a=
)lists.01.org
Sent: Thursday, May 30, 2019 12:00 PM
To: tpm2(a)lists.01.org
Subject: tpm2 Digest, Vol 23, Issue 18

Send tpm2 mailing list submissions to
	tpm2(a)lists.01.org

To subscribe or unsubscribe via the World Wide Web, visit
	https://lists.01.org/mailman/listinfo/tpm2
or, via email, send a message with subject or body 'help' to
	tpm2-request(a)lists.01.org

You can reach the person managing the list at
	tpm2-owner(a)lists.01.org

When replying, please edit your Subject line so it is more specific than "R=
e: Contents of tpm2 digest..."


Today's Topics:

   1. tpm2-tools: 3.2 release (Roberts, William C)


----------------------------------------------------------------------

Message: 1
Date: Thu, 30 May 2019 15:43:33 +0000
From: "Roberts, William C" <william.c.roberts(a)intel.com>
To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
Subject: [tpm2] tpm2-tools: 3.2 release
Message-ID:
	<476DC76E7D1DF2438D32BFADF679FC5649D84425(a)ORSMSX106.amr.corp.intel.com>
	=

Content-Type: text/plain; charset=3D"us-ascii"

I am getting ready to run a 3.2 release with the following changelog:

3.2.0 - next
tpm2_changeauth: Support changing platform hierarchy auth.
tpm2_flushcontext: Introduce new tool for flushing handles from the TPM.
tpm2_checkquote: Introduce new tool for checking validity of quotes.
tpm2_quote: Add ability to output PCR values for quotes.
tpm2_makecredential: add support for executing tool off-TPM.
tpm2_pcrreset: introduce new tool for resetting PCRs.
tpm2_quote: Fix AK auth password not being used.

Does anyone else have anything they *really* need fixed before I start runn=
ing RC's?

Bill


------------------------------

Subject: Digest Footer

_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2


------------------------------

End of tpm2 Digest, Vol 23, Issue 18
************************************

--===============1701987203447759218==--

