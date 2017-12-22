Content-Type: multipart/mixed; boundary="===============7968651675888683194=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] [RFC] Session Handling/Policy Support in Tools
Date: Fri, 22 Dec 2017 16:14:57 +0100
Message-ID: <cdd90652-cd1e-b8e2-b8f6-286982a04b82@redhat.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FE6D774@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7968651675888683194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Bill,

On 12/19/2017 07:01 PM, Roberts, William C wrote:
> There are two main parts to the direction I see the tools policy/session =
support heading:
> =

> 1. The first is cleaning up all the code around session support and polic=
y building.  I think now that I understand the topic better, I can organize=
 this code a little better. This is rather trivial and beside the main poin=
t.

Agreed, I've seen your PR in the repo and I think it's good.

> =

> 2. Since abrmd 1.3 we have support for sessions across RM IPC connections=
 and direct tpm communications (/dev/tmp0) also has the same support. We ha=
ve tools like tpm2_createpolicy that are made up of multiple
> commands to work around session flushing on IPC RM disconnections. tpm2_c=
reatepolicy is really comprised of 3 commands: tpm2_startauthsession, tpm2_=
policypcr and tpm2_flushcontext.
>

Absolutely agree. And as a matter of fact that's exactly what's done by the=
 IBM
TSS, it has separate tools called startauthsession, policypcr and flushcont=
ext.

> I'm proposing we leave tpm2_createpolicy, for in-kernel-rm users, but add=
 tpm2_startauthsession and tpm2_policypcr for the abrmd and direct tpm usag=
es. Abrmd works by using Tss2_Sys_ContextSave as the

Agreed too.

> marker of NOT flushing a session handle. Granted you also need the sessio=
nAttributes set to continue so the TPM doesn't kill it.
>

Yes, in fact I don't know how chaining different commands with the current =
-S
option that takes a session handle is working nowadays since the tools aren=
't
setting the continueSession attribute. I guess the answer is that it doesn'=
t?

> I think the flow for using the new tools would be something like this:
>

NOTE: I haven't looked at the final tpm2-abrmd implementation, I'm assuming=
 that
      it was implemented as previously discussed in the GitHub issues so pl=
ease
      let me know if I got some assumption wrong in the following:

> 1. tpm2_createpolicy - create a pcr policy and spit out the policy digest
> 2. tpm2_create - create an object and set its policy digest as obtained i=
n step 1
> 3. tpm2_startauthsession - create a pcr policy and spit out the session h=
andle

To be precise, this tool won't sit out a session handle but a session conte=
xt
(what's returned by a TPM2_ContextSave() command), right? Otherwise the ses=
sion
will be flushed by the tpm2-abrmd since a call to Tss2_Sys_ContextSave() wo=
n't
be made.

> 4. tpm2_policypcr - satisfy policy via policy digest and pcr list obtaine=
d/used in step 1 as well as taking the session handle from step 3
> 5. tpm2_<tool> - use some tool passing the session handle from step 3

This will work for a single tool, but my understanding is that sessions that
are saved with TPM2_ContextSave() can only be loaded once to prevent replay
attacks.

So the tpm2_<tool> should both get a session context and load it using the
TPM2_ContextLoad() command and export it again using a TPM2_ContextSave().

The next command can't use the same saved session context that the previous
command since the TPM will prevent it to be loaded. Even if the TPM would
allow, the session handle would already be flushed since TPM2_ContextLoad()
wouldn't be called before closing the SAPI connection.

> 6. tpm2_flushcontext - flushes the handle from step 3
> =

> With that said, since tpm2_createpolicy is really a combination of the tp=
m2_startauthsession, tpm2_pcrlist, tpm2_policypcr and tpm2_flushcontext, al=
l that could be moved into lib, so each new tool and
> create policy are really just calling into the same code.
>

Agreed, I factored out a little bit so at least the tools that are doing
the session auth on each execute wouldn't duplicate the code. But we will
need to better split things since some functions logic are too monolithic.

> Thoughts, am I missing something here?
>

I think your plan is the correct one. One question is if we will replace the
-S option that takes a session handle and instead take a session context or
if we will want to support the 3 options:

1) Chain tools passing session handles as long as are executed in an enviro=
nment
   that doesn't close the SAPI context (and so flushes the session).
2) Allow individual tools to manage their own session and auth like is the =
case
   for tpm2_unseal and tpm2_nv{read,write}
3) Chain tools by passing saved session contexts.

In theory we currently support 1 and 2 (although as mentioned I don't know =
how
2 works if the tools don't set continueSession). So my question is if we wa=
nt
to also include 3 or replace 2 by 3.

> This is a lot of work, so I would like to start it now, as it would be th=
e major feature set going towards 4.0 release.
>
 =

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============7968651675888683194==--

