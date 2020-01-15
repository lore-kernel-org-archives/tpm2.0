Content-Type: multipart/mixed; boundary="===============7897333417849305473=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: some questions about Identity
Date: Wed, 15 Jan 2020 14:34:25 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E66B9F@ORSMSX101.amr.corp.intel.com>
In-Reply-To: fec9ef06-827c-8451-cfb3-4bd79a04e682@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7897333417849305473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Steffen [mailto:s.schwebel(a)uvensys.de]
> Sent: Wednesday, January 15, 2020 2:37 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: some questions about Identity
> =

> Actually, I have a follow up question.
> =

> If I understand the documentation correctly, I should always be able to g=
enerate
> the EK via tpm2_createek. That should (can?) never change.

Generally yes, see my other email about the changeeps command.

> =

> So, upon initial deployment, first check and store EK.
> =

> tpm2_createek -G rsa -u ek.pub -c key.ctx

The tool is hardcoded to the EK template, most manufacturers store the temp=
late in an NV index as well:
https://trustedcomputinggroup.org/wp-content/uploads/TCG_IWG_Credential_Pro=
file_EK_V2.1_R13.pdf

The -t switch for tpm2_createek will interrogate those NV indices. I think =
the man page is wrong, it shows
It also taking a FILE argument, but the code is written that way.

Bug:
https://github.com/tpm2-software/tpm2-tools/issues/1886


> =

> tpm2_getekcertificate -X -o ECcert.bin -u ek.pub \
> https://tpm.manufacturer.com/ekcertserver/

Not all manufacturers store EK certificates online, and that tool is set fo=
r the intel method of
URL retrieval AFAICT. We had a conversation about this before with mdemsky =
but I am not
Sure what the end result was. I think it was that we need to make the tool =
better and handle
Non URL EK Cert retrieval. =


The spec https://trustedcomputinggroup.org/wp-content/uploads/TCG_IWG_Crede=
ntial_Profile_EK_V2.1_R13.pdf
Section 2.2.1.9 show that certain NV indices are reserved for EK Cert stora=
ge, so it could be lurking in there.

Bug:
https://github.com/tpm2-software/tpm2-tools/issues/1885


> =

> =

> Right?

Pretty much.  But remember that the EK is policy bound to the Endorsement H=
ierarchy password, so
To use it you need to authenticate via a policy session using the policy se=
cret command. Examples
Of how to use the policy secret command are in the manpage for the tool:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policysecr=
et.1.md

Dan Oliver actually posted a ticket on this, I have more detail in that:
https://github.com/tpm2-software/tpm2-tools/issues/1884



--===============7897333417849305473==--

