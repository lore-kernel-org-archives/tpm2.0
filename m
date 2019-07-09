Content-Type: multipart/mixed; boundary="===============4469253424320348484=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Generating a key
Date: Tue, 09 Jul 2019 20:12:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DCBCD1@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DCBC99@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4469253424320348484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Roberts, Wil=
liam C
> Sent: Tuesday, July 9, 2019 3:06 PM
> To: ramyasnair ramyasnair <ramyasnair1996(a)gmail.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] Generating a key
> =

> You need to create the primary key and mark it persistent if you want tha=
t key to
> be available after reboot Without having to re-create the primary key. Pr=
imary
> keys are unique in their behavior. Their like a transient Object that alw=
ays has to
> be re-created in the same fashion to get the same key.
> =

> # create a primary key and generate a context file ./tools/tpm2_createpri=
mary -o
> primary.ctx
> =

> # make the primary key persistent so it's available after reboot without =
recreating
> it ./tools/tpm2_evictcontrol -a o -c primary.ctx
> persistent-handle: 0x81000000
> action: persisted

You can also do this:
./tools/tpm2_evictcontrol -a o -c primary.ctx -o primary.handle

Which gives you a ESYS_TR serialized to disk. Rather than using the raw han=
dle to reference
Your object, which allows for a MITM attack, you can just use that primary.=
handle file to
Reference it, and it verifies the object is what you expected thus preventi=
ng MITM.

> =

> You can control what address the key is persisted at via the -p option to
> evictcontrol, else It will find the first available slot and use that.
> =

> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of ramyasnair
> > ramyasnair
> > Sent: Monday, July 8, 2019 11:10 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Generating a key
> >
> > Hi,
> > I tried generating a key using tpm2tss-genkey under owner authority.
> > But the key generated is written to the disk.I want to load the key to
> > the tpm.I used tpm2_createprimary and tpm2_load commands as well.How
> > do I verify if I have successfully loaded the key into the TPM and
> > store it there?I need help since I'm a beginner.
> >
> > Thanks and regards
> > Ramya Nair
> =

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============4469253424320348484==--

