Content-Type: multipart/mixed; boundary="===============5098936167518585087=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Relating tpm2_createprimary, Primary Seeds, and tpm2_clear
Date: Tue, 31 Mar 2020 17:46:56 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB6701@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 3FB5AADC-1A54-49FB-8191-9721A5BA649B@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5098936167518585087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Rowan Moul [mailto:lists(a)rowan.moul.ca]
> Sent: Tuesday, March 31, 2020 12:40 PM
> To: John S <sedigj(a)gmail.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Relating tpm2_createprimary, Primary Seeds, and tpm2_=
clear
> =

> Hi John,
> =

> There=E2=80=99s a mention in that book, in the Key management Chapter in =
the Key
> generation section that a TPM_CLEAR command will reset the seeds. I=E2=80=
=99m not sure

Not seeds (plural), tpm2_clear only resets the Owner seed aka Storage Prima=
ry Seed (SPS).

> if it is mentioned elsewhere. Of course it is also in the spec sheets if =
you can find
> it.
> The man page for tpm2_clear alludes to it too, but could probably stand t=
o be
> more explicit (it says all objects under hierarchies will be lost).

That sounds like it should be upfront, bolded, and corrected that it rolls =
the SPS.
So only Owner Hierarchy objects are lost.

> =

> So no, the seeds are not permanent forever. Just until cleared.

Platform and Endorsement seeds generally are stable, but the command set
Does allow for ChangeEPS and ChangeSPS commands. But I don't think I have
ever seen a production TPM support this, but be aware that it exists.

> tpm2_clear can be authorized in one of two ways: the Platform Hierarchy
> authorization value, or the Dictionary Attack lockout reset authorization=
 value.
> The platform authorization should be set by the BIOS/Firmware on each boo=
t (as
> it is cleared on every shutdown of the TPM) so you don=E2=80=99t have acc=
ess to this
> normally, though most BIOS interfaces should have a menu option to invoke=
 a
> clear using this value. The dictionary attack lockout defaults to an empt=
y string
> authorization value, so functionally anyone can clear until you set this.=
 As such, it
> is a good idea to set this authorization value if you want to rely on bei=
ng able to
> re-generate primary keys. If you forget what you set it to later, invokin=
g clear
> (with the platform auth via BIOS menu) will reset it.

You can even disable it with tpm2_clearcontrol.

> Also on the note of re-generating primary keys, you may find my previous =
thread
> about the unique data option in tpm2_createprimary helpful if you want to=
 use
> unique data in addition to the seed.
> =

> =

> Rowan
> =

> > On Mar 31, 2020, at 09:56, John S <sedigj(a)gmail.com> wrote:
> >
> > =EF=BB=BFHi, have been playing around with tpm2 tools and tss engine fo=
r openssl for
> awhile.
> > Also reading Practical Guide to TPM 2.0.
> >
> > I have found all the resources in the tpm2-tools readme and wiki and be=
yond
> quite helping in getting started.
> >
> > The book (chapter 10) talks about the primary seeds for the hierarchy, =
and how
> any amount of key hierarchies can be extended from the primary keys. Prim=
ary
> keys are derived from the primary seeds. My understanding is that the see=
ds are
> unique and permanent in the tpm hardware.
> >
> > I was anticipating that tpm2_createprimary could be used to get back to=
 the
> primary key (given the same inputs/template) no matter what data is clear=
ed or
> erased.
> >
> > Running tpm2_createprimary twice yields same result as evidence by the =
rsa
> value, as expected.
> >
> > But running:
> > tpm2_createprimary
> > tpm2_clear
> > tpm2_createprimary
> >
> > yields a totally different key, as can be seen from the resulting rsa v=
alue.
> > This is also consistent with the manpage of tpm2_clear:
> > "Clears lockout, endorsement and owner hierarchy authorization values."=
 and
> "NOTE: All objects created under the respective hierarchies are lost."
> >
> > This makes tpm2_clear seem like an exceptionally dangerous command, if =
I run
> it once (inadvertently perhaps), I've now destroyed all use of all keys e=
ver
> created on the system. Yet, based on what I thought I understood about the
> primary seeds, I'd always be able to derive back to a key value.
> >
> > So, what I am I missing?
> > Feel free to link in references.
> >
> > A side question:
> > I am unable to create a primary Platform key (owner, endorsement, and n=
ull
> work). Looks like authorization is expected.
> > Is this an expected result based on how the TPM is configured from the
> > chip vendor? In this case Infineon Here is the output:
> > $ tpm2_createprimary -C p -c platform_primary.ctx
> > WARNING:esys:src/tss2-esys/api/Esys_CreatePrimary.c:393:Esys_CreatePri
> > mary_Finish() Received TPM Error
> > ERROR:esys:src/tss2-esys/api/Esys_CreatePrimary.c:135:Esys_CreatePrima
> > ry() Esys Finish ErrorCode (0x000009a2)
> > ERROR: Esys_CreatePrimary(0x9A2) - tpm:session(1):authorization
> > failure without DA implications
> > ERROR: Unable to run tpm2_createprimary
> >
> > Thanks,
> > -John
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============5098936167518585087==--

