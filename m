Content-Type: multipart/mixed; boundary="===============3379325029126422716=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] PCR Policy enforcement when using nvram
Date: Mon, 29 Jul 2019 21:37:21 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DD3F4A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DD3F13@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3379325029126422716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Roberts, Wil=
liam C
> Sent: Monday, July 29, 2019 3:59 PM
> To: Garrett Fields <ghfields(a)gmail.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] PCR Policy enforcement when using nvram
> =

> =

> =

> > -----Original Message-----
> > From: Garrett Fields [mailto:ghfields(a)gmail.com]
> > Sent: Monday, July 29, 2019 11:18 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: tpm2(a)lists.01.org; Javier Martinez Canillas <javierm(a)redhat.com>
> > Subject: Re: [tpm2] PCR Policy enforcement when using nvram
> >
> >
> >
> > On Mon, Jul 29, 2019 at 10:42 AM Roberts, William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com> >=
 wrote:
> >
> >
> >
> > 	Can't you do tpm2_nvreadlock?
> >
> >
> >
> > Indeed.  That's the TPM 2.0 way I got this to work.  Set
> > "read_stclear" attribute and run tpm2_nvreadlock.
> >
> >
> > 	Per section 37.2.5 of https://trustedcomputinggroup.org/wp-
> > content/uploads/TPM-Rev-2.0-Part-1-Architecture-01.38.pdf
> > 	TPMA_NV_AUTHREAD allows the Index to be read using the authValue
> of
> > the Index; and
> > 	TPMA_NV_POLICYREAD allows the Index to be read if the authPolicy of
> > the Index is satisfied.
> > 	---
> >
> > 	I think you're ending up in an OR situation, AUTH value OR policy.
> > IIRC, Javier hit this issue too, I
> > 	added him to see if he can enlighten us.
> >
> > 	FYI you should use tpm2_policyauthorize, locking to PCR values is brit=
tle.
> > If anything changes, you
> > 	can lock yourself out of the object. This way you lock it to a signed
> > policy and that policy can
> > 	change. Ie PCR values change on update.
> >
> >
> >
> > I was trying to avoid the authValue OR authPolicy situation.  I
> > thought that only specifying the authValue to unlock and having a
> > policy present would do an authValue AND authPolicy.  Otherwise it
> > seems pointless to be able to attach a policy without any policy
> > related attributes.  Since this is autounlock of drive encryption, I
> > was hoping to make any system twitch fail the TPM assisted autounlock
> > and require the user to directly enter the passphrase in a non-tpm
> =

> In the nvread command fon't specify the authvalue and specify the policy =
and
> you Will get that behavior.
> =

> This snippet of the spec (37.2.5) is important:
> =

> Read access to an NV Index is provided with TPM2_NV_Read(),
> TPM2_NV_Certify(), and TPM2_PolicyNV(). For all of these commands, read
> authorization is required. The attributes of the Index determine what
> authorizations are allowed. TPMA_NV_PPREAD allows the Index to be read us=
ing
> Platform Authorization; TPMA_NV_OWNERREAD allows the Index to be read
> using Owner Authorization; TPMA_NV_AUTHREAD allows the Index to be read
> using the authValue of the Index; and TPMA_NV_POLICYREAD allows the Index
> to be read if the authPolicy of the Index is satisfied.
> At least one of TPMA_NV_PPREAD, TPMA_NV_OWNERREAD,
> TPMA_NV_AUTHREAD or TPMA_NV_POLICYREAD needs to be SET or the TPM
> will not allocate the Index.
> =

> -- end --
> =

> This is all an OR proposition. So you would try satisfying via a PCR poli=
cy and if That
> fails, prompt for authorization value, which could be set up for owner hi=
erarchy
> passphrase or the index authorization value.
> =

> > prompt.  In order to re-enable the autounlock, the nvram region would
> > be deleted and recreated.  The authPolicy would check the PCRs while
> > the authValue, since it is the filesystem's GUID, verifies it was
> > created for the correct filesystem and in the event someone is playing
> > around with disposed equipment with drives removed, recovery of the
> > stored password in a non-cleared TPM would not be possible.  Later,
> > instead of a GUID, I could use a usb device or a connection to a
> > server to be present to retrieve the NVRAM authValue, that unlocks the
> region.
> >
> >
> > 	>
> > 	> ------
> > 	>
> > 	> I would really like to incorporate the pcr system check also (kinda
> > the whole
> > 	> point).  I tried:
> > 	> -----------
> > 	> tpm2_listpcrs --tcti=3Ddevice    #To see current values
> > 	> tpm2_createpolicy -L sha1:0,1,2,3,4,5,6,7 -o ./0-7policy.pol --polic=
y-pcr
> > 	>
> > 	> tpm2_nvdefine -x 0x1000000 -a o -P ownerpass -p indexsecret -L ./0-
> > 7policy.pol -
> > 	> b "authread|authwrite|read_stclear" -s 11
> > 	>
> > 	> echo "hdpassword" | tpm2_nvwrite  -x 0x1000000 -a 0x1000000 -P
> > indexsecret
> > 	>
> > 	> tpm2_nvlist   # Verfiied that 0x1000000 has a "authorization policy"
> > 	> tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret   #Expected to
> > work since
> > 	> PCRs are the same as policy creation
> > 	> tpm2_pcrextend 4:sha1=3Df1d2d2f924e986ac86fdf7b36c94bcdf32beec15
> > 	>
> > 	> tpm2_listpcrs    #Verify pcr4 is different
> > 	> tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret   #Expected to
> > fail
> > 	> -----------
> > 	> The last line I would expect to fail, because of the PCR4 change,
> > but it still
> > 	> produces the password.  Am I missing something on the nvdefine to
> > enable
> > 	> policy enforcement?
> =

> That snippet of spec I think clarifies it, let me know if it doesn't.
> =

> >
> > 	I think if you dropped that password it would fail on both commands.
> > You need
> > 	To ensure that TPMA_NV_POLICYREAD is in there. Looking at 3.X and
> > master
> > 	branch, I don't see us checking if -L is specified and adding
> > TPMA_NV_POLICYREAD
> > 	so it's something you would have to do via attributes.
> >
> >
> >
> > I believe your right.  If I used policyRead only and gave up on
> > policyAuth (and the -P switch), it would have succeeded and failed as
> > expected.  I'm just hoping I can get it to get both working simultaneou=
sly.
> >
> > I really appreciate your response.  I'll play around with object
> > workflow.  If anyone has tips on making authValue AND authPolicy apply
> > to nvram or have a comparable method with objects, I'd love to hear the=
m.


I misunderstood...you want BOTH.. then you need to create a policy to do wh=
at
you desire and only enable policy authorization. Which means you would need
policyand, which we don't have on master yet, just policyor.

It's be a mix of tpm2_startauthsession, tpm2_policypassword/tpm2_policysecr=
et
tpm2_policypcr and tpm2_policyand, which will give you some policy digest. =
Then
create an nvspace with that policy digest and only policycread|policywrite.

Imran can probably give you a full example with policyor, then when we have
policyand, you can just swap it out or you could write policyand and upstre=
am
it to us.

@imran, can you give him an end-to-end example? I tried w/policypassword
and failed.

Bill









> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============3379325029126422716==--

