Content-Type: multipart/mixed; boundary="===============7350848788372520120=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] [RFC] Session Handling/Policy Support in Tools
Date: Wed, 27 Dec 2017 16:49:14 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FE719A6@ORSMSX106.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FE716BD@ORSMSX106.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7350848788372520120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Roberts, William C
> Sent: Tuesday, December 26, 2017 9:40 AM
> To: Javier Martinez Canillas <javierm(a)redhat.com>; tpm2(a)lists.01.org
> Subject: RE: [tpm2] [RFC] Session Handling/Policy Support in Tools
> =

> =

> =

> > -----Original Message-----
> > From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
> > Sent: Friday, December 22, 2017 7:15 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>;
> > tpm2(a)lists.01.org
> > Subject: Re: [tpm2] [RFC] Session Handling/Policy Support in Tools
> >
> > Hello Bill,
> >
> > On 12/19/2017 07:01 PM, Roberts, William C wrote:
> > > There are two main parts to the direction I see the tools
> > > policy/session support
> > heading:
> > >
> > > 1. The first is cleaning up all the code around session support and
> > > policy
> > building.  I think now that I understand the topic better, I can
> > organize this code a little better. This is rather trivial and beside t=
he main point.
> >
> > Agreed, I've seen your PR in the repo and I think it's good.
> >
> > >
> > > 2. Since abrmd 1.3 we have support for sessions across RM IPC
> > > connections and direct tpm communications (/dev/tmp0) also has the
> > > same
> > support. We have tools like tpm2_createpolicy that are made up of
> > multiple commands to work around session flushing on IPC RM disconnecti=
ons.
> > tpm2_createpolicy is really comprised of 3 commands:
> > tpm2_startauthsession, tpm2_policypcr and tpm2_flushcontext.
> > >
> >
> > Absolutely agree. And as a matter of fact that's exactly what's done
> > by the IBM TSS, it has separate tools called startauthsession, policypc=
r and
> flushcontext.
> >
> > > I'm proposing we leave tpm2_createpolicy, for in-kernel-rm users,
> > > but add tpm2_startauthsession and tpm2_policypcr for the abrmd and
> > > direct tpm usages. Abrmd works by using Tss2_Sys_ContextSave as the
> >
> > Agreed too.
> >
> > > marker of NOT flushing a session handle. Granted you also need the
> > sessionAttributes set to continue so the TPM doesn't kill it.
> > >
> >
> > Yes, in fact I don't know how chaining different commands with the
> > current -S option that takes a session handle is working nowadays
> > since the tools aren't setting the continueSession attribute. I guess t=
he answer
> is that it doesn't?
> >
> > > I think the flow for using the new tools would be something like this:
> > >
> >
> > NOTE: I haven't looked at the final tpm2-abrmd implementation, I'm
> > assuming that
> >       it was implemented as previously discussed in the GitHub issues s=
o please
> >       let me know if I got some assumption wrong in the following:
> >
> > > 1. tpm2_createpolicy - create a pcr policy and spit out the policy
> > > digest 2. tpm2_create - create an object and set its policy digest
> > > as obtained in step 1 3. tpm2_startauthsession - create a pcr policy
> > > and spit out the session handle
> >
> > To be precise, this tool won't sit out a session handle but a session
> > context (what's returned by a TPM2_ContextSave() command), right?
> > Otherwise the session will be flushed by the tpm2-abrmd since a call
> > to Tss2_Sys_ContextSave() won't be made.
> =

> Correct. It needs to call ContextSave() for abrmd to mark it as not to be=
 flushed.
> It also need the continue bits set on the session IIUC.
> =

> >
> > > 4. tpm2_policypcr - satisfy policy via policy digest and pcr list
> > > obtained/used in step 1 as well as taking the session handle from
> > > step
> > > 3 5. tpm2_<tool> - use some tool passing the session handle from
> > > step
> > > 3
> >
> > This will work for a single tool, but my understanding is that
> > sessions that are saved with TPM2_ContextSave() can only be loaded
> > once to prevent replay attacks.
> >
> > So the tpm2_<tool> should both get a session context and load it using
> > the
> > TPM2_ContextLoad() command and export it again using a
> TPM2_ContextSave().
> >
> > The next command can't use the same saved session context that the
> > previous command since the TPM will prevent it to be loaded. Even if
> > the TPM would allow, the session handle would already be flushed since
> > TPM2_ContextLoad() wouldn't be called before closing the SAPI connectio=
n.

Hmm I missed some of this yesterday in my reply. I guess a lot of this depe=
nds
on what the RM is doing, if ContextSave() on the session handle
actually hits the TPM with abrmd, and if abrmd requires a ContextSave() on =
every
client that uses the session handle to keep it alive. Maybe something like

# calls context save but just deletes the file...
$ tpm2_startauthsession
handle: 0x1234

# abrmd keeps this handle alive until flush
tpm2_policypcr -S 0x1234 =


$ tpm2_tool1 -S 0x1234

$ tpm2_tool2 -S 0x1234 =


$ tpm2_flush 0x12334 =


This really depends on abrmd, but I'd like whatever works with abrmd to work
against a raw device directly as well.

This seems to be getting wonky.

> >
> > > 6. tpm2_flushcontext - flushes the handle from step 3
> > >
> > > With that said, since tpm2_createpolicy is really a combination of
> > > the tpm2_startauthsession, tpm2_pcrlist, tpm2_policypcr and
> > > tpm2_flushcontext,
> > all that could be moved into lib, so each new tool and create policy
> > are really just calling into the same code.
> > >
> >
> > Agreed, I factored out a little bit so at least the tools that are
> > doing the session auth on each execute wouldn't duplicate the code.
> > But we will need to better split things since some functions logic are =
too
> monolithic.
> >
> > > Thoughts, am I missing something here?
> > >
> >
> > I think your plan is the correct one. One question is if we will
> > replace the -S option that takes a session handle and instead take a
> > session context or if we will want to support the 3 options:
> =

> I don't think I made that clear, but I plan on -S to support:
> 1. a hex handle
> 2. a file path.
> =

> In the case of a file path, it would call context load/save every-call, s=
o essentially -
> S is both an input and output parameter via a file and that would get us =
around
> the 1 load per handle IIUC. Whenever -S is specified, the continueSession=
 bit will
> get set so the TPM itself doesn't flush it.
> =

> >
> > 1) Chain tools passing session handles as long as are executed in an
> environment
> >    that doesn't close the SAPI context (and so flushes the session).
> > 2) Allow individual tools to manage their own session and auth like is =
the case
> >    for tpm2_unseal and tpm2_nv{read,write}
> > 3) Chain tools by passing saved session contexts.
> >
> > In theory we currently support 1 and 2 (although as mentioned I don't
> > know how
> > 2 works if the tools don't set continueSession). So my question is if
> > we want to also include 3 or replace 2 by 3.
> >
> > > This is a lot of work, so I would like to start it now, as it would
> > > be the major
> > feature set going towards 4.0 release.
> > >
> >
> > Best regards,
> > --
> > Javier Martinez Canillas
> > Software Engineer - Desktop Hardware Enablement Red Hat

--===============7350848788372520120==--

