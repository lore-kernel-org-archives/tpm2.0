Content-Type: multipart/mixed; boundary="===============5445016087369745367=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Relating tpm2_createprimary, Primary Seeds, and tpm2_clear
Date: Fri, 03 Apr 2020 15:18:27 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB715E@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 7169F4BB-61AF-47A4-A76C-13BC3A571822@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5445016087369745367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Rowan Moul [mailto:lists(a)rowan.moul.ca]
> Sent: Wednesday, April 1, 2020 7:17 PM
> To: John S <sedigj(a)gmail.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Relating tpm2_createprimary, Primary Seeds, and tpm2_=
clear
> =

> =EF=BB=BF
> Your quotes look fine to me.
> =

> =

> 	This appears to be confirmation that these commands are Not present on
> my TPM:
> 	$ tpm2_getcap commands|grep eps
> 	$ tpm2_getcap commands|grep pps
> =

> I=E2=80=99m not sure of the exact implementation that tpm2-tools uses. It=
=E2=80=99s possible that
> the tool name doesn=E2=80=99t match the internal command used, but this o=
ne is best left
> to the experts.

You should be able to add -I to that grep, it will be output as:
TPM2_CC_ChangeEPS
TPM2_CC_ChangePPS

> =

> =

> 	Thanks, do you have a link? I could not find this thread yet after
> searching. Also, is there a good reason to use the unique data in additio=
n to being
> extra cautious? Maybe this is addressed in the thread.
> =

> As for the unique field. I can=E2=80=99t say if it=E2=80=99s better or wo=
rse to use it or not. However
> if you don=E2=80=99t use it, anyone with access to your TPM can re-genera=
te your primary
> key (assuming they know what other options you chose). Once they have your
> Primary Key, they have everything under it too.

Anything that's input to the CreatePrimary command, will control the genera=
ted key. So any input
that varies changes the key.

If you set the auth value, that will also provide uniqueness. The policy va=
lue will too, but that can
be read out by anyone. You can assume that your template for key generation=
 is known, with the
exception of:
1. secrets used to auth via policy
2. password (private portion of the object anyways)

If someone creates a primary key, they will be able to load objects under t=
he primary object
IFF they have auth. So even if they know your full template and policy hash=
 (all public info)
The policy controls whether or not they can load subordinate objects. As lo=
ad requires parent
object authorization. So they won't be able to load them if they don't know=
 the authorization to
the object.

The unique field shouldn't be considered a security feature. It's merely so=
 you could create
different primary keys with *almost* the same template/input parameters. Yo=
u would vary
the unique field.

To protect a primary key from unauthorized use, set proper authorization (p=
eriod).

> The thread I referred to is mostly about some awkward formatting required=
. It
> got split into two because I didn=E2=80=99t reply all correctly The conte=
xt:
> https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/thread/B5HVVKDH4=
PVGOU
> CT6WPCHRYHB35LMDBW/
> <https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/thread/B5HVVKDH=
4PVGO
> UCT6WPCHRYHB35LMDBW/>
> The useful part:
> https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/thread/5YDZRV63L=
CGX6BZ
> QXRW6S6F77PSS5JU5/
> =

> =

> =

> =

> 	Regarding Platform authorization value - should I expect this is control=
led
> by BIOS or OS?
> 	Sounds like I can at least clear it via the BIOS, I'll check.
> =

> See section on startup initialization (and read the stuff before that for=
 context)
> https://link.springer.com/chapter/10.1007/978-1-4302-6584-9_19
> =

> You cannot clear the platform auth as it is set on each boot, so clearing=
 it is
> minimally useful. You can=E2=80=99t do anything with it unless the one wh=
o set it gives you
> this option (the bios/platform manufacturer). This can be frustrating if =
like me
> you have a TPM 2.0 with only sha1 PCR=E2=80=99s allocated despite support=
ing sha256.
> (If this is incorrect, someone please tell me how so I can re-allocate my=
 PCRs!)
> =

> Rowan
> =

> =

> 	On Apr 1, 2020, at 15:59, John S <sedigj(a)gmail.com> wrote:
> =

> =

> =

> 	=EF=BB=BFThank you both for a prompt reply yesterday.
> =

> 	From what you contributed yesterday, I understand tpm2_clear will clear
> the Owner seed/hierarchy, and that the functionality to perform the clear=
 on the
> Owner hierarchy can be disabled.
> =

> =

> =

> 		Platform and Endorsement seeds generally are stable, but the
> command set
> =

> =

> 		Does allow for ChangeEPS and ChangeSPS commands. But I don't
> think I have
> =

> =

> 		ever seen a production TPM support this, but be aware that it
> exists.
> =

> =

> 	This appears to be confirmation that these commands are Not present on
> my TPM:
> 	$ tpm2_getcap commands|grep eps
> 	$ tpm2_getcap commands|grep pps
> =

> 	I read in another discussion that it sounds like this means that platform
> and endorsement seeds would effectively be unchangeable in my case.
> 	https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/thread/5KE3W6QLY
> H3N76K753VNQSX6CPJMH7KJ/
> =

> =

> =

> =

> 		Also on the note of re-generating primary keys, you may find my
> previous thread about the
> =

> =

> 		unique data option in tpm2_createprimary helpful if you want to
> use unique data in
> =

> =

> 		addition to the seed.
> =

> =

> 	Thanks, do you have a link? I could not find this thread yet after
> searching. Also, is there a good reason to use the unique data in additio=
n to being
> extra cautious? Maybe this is addressed in the thread.
> =

> 	Regarding Platform authorization value - should I expect this is control=
led
> by BIOS or OS?
> 	Sounds like I can at least clear it via the BIOS, I'll check.
> 	_______________________________________________
> 	tpm2 mailing list -- tpm2(a)lists.01.org
> 	To unsubscribe send an email to tpm2-leave(a)lists.01.org
> 	%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =



--===============5445016087369745367==--

