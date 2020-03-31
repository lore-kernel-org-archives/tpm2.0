Content-Type: multipart/mixed; boundary="===============2944374450050670655=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] Re: Relating tpm2_createprimary, Primary Seeds, and tpm2_clear
Date: Tue, 31 Mar 2020 11:40:10 -0600
Message-ID: <3FB5AADC-1A54-49FB-8191-9721A5BA649B@rowan.moul.ca>
In-Reply-To: 20200331155736.2692.99393@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2944374450050670655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi John,

There=E2=80=99s a mention in that book, in the Key management Chapter in th=
e Key generation section that a TPM_CLEAR command will reset the seeds. I=
=E2=80=99m not sure if it is mentioned elsewhere. Of course it is also in t=
he spec sheets if you can find it.
The man page for tpm2_clear alludes to it too, but could probably stand to =
be more explicit (it says all objects under hierarchies will be lost).

So no, the seeds are not permanent forever. Just until cleared.
tpm2_clear can be authorized in one of two ways: the Platform Hierarchy aut=
horization value, or the Dictionary Attack lockout reset authorization valu=
e. The platform authorization should be set by the BIOS/Firmware on each bo=
ot (as it is cleared on every shutdown of the TPM) so you don=E2=80=99t hav=
e access to this normally, though most BIOS interfaces should have a menu o=
ption to invoke a clear using this value. The dictionary attack lockout def=
aults to an empty string authorization value, so functionally anyone can cl=
ear until you set this. As such, it is a good idea to set this authorizatio=
n value if you want to rely on being able to re-generate primary keys. If y=
ou forget what you set it to later, invoking clear (with the platform auth =
via BIOS menu) will reset it.
Also on the note of re-generating primary keys, you may find my previous th=
read about the unique data option in tpm2_createprimary helpful if you want=
 to use unique data in addition to the seed.


Rowan

> On Mar 31, 2020, at 09:56, John S <sedigj(a)gmail.com> wrote:
> =

> =EF=BB=BFHi, have been playing around with tpm2 tools and tss engine for =
openssl for awhile.
> Also reading Practical Guide to TPM 2.0.
> =

> I have found all the resources in the tpm2-tools readme and wiki and beyo=
nd quite helping in getting started.
> =

> The book (chapter 10) talks about the primary seeds for the hierarchy, an=
d how any amount of key hierarchies can be extended from the primary keys. =
Primary keys are derived from the primary seeds. My understanding is that t=
he seeds are unique and permanent in the tpm hardware.
> =

> I was anticipating that tpm2_createprimary could be used to get back to t=
he primary key (given the same inputs/template) no matter what data is clea=
red or erased. =

> =

> Running tpm2_createprimary twice yields same result as evidence by the rs=
a value, as expected.
> =

> But running:
> tpm2_createprimary
> tpm2_clear
> tpm2_createprimary
> =

> yields a totally different key, as can be seen from the resulting rsa val=
ue.
> This is also consistent with the manpage of tpm2_clear:
> "Clears lockout, endorsement and owner hierarchy authorization values." a=
nd "NOTE: All objects created under the respective hierarchies are lost."
> =

> This makes tpm2_clear seem like an exceptionally dangerous command, if I =
run it once (inadvertently perhaps), I've now destroyed all use of all keys=
 ever created on the system. Yet, based on what I thought I understood abou=
t the primary seeds, I'd always be able to derive back to a key value.
> =

> So, what I am I missing?
> Feel free to link in references.
> =

> A side question:
> I am unable to create a primary Platform key (owner, endorsement, and nul=
l work). Looks like authorization is expected.
> Is this an expected result based on how the TPM is configured from the ch=
ip vendor? In this case Infineon
> Here is the output:
> $ tpm2_createprimary -C p -c platform_primary.ctx
> WARNING:esys:src/tss2-esys/api/Esys_CreatePrimary.c:393:Esys_CreatePrimar=
y_Finish() Received TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_CreatePrimary.c:135:Esys_CreatePrimary(=
) Esys Finish ErrorCode (0x000009a2)
> ERROR: Esys_CreatePrimary(0x9A2) - tpm:session(1):authorization failure w=
ithout DA implications
> ERROR: Unable to run tpm2_createprimary
> =

> Thanks,
> -John
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============2944374450050670655==--

