Content-Type: multipart/mixed; boundary="===============0190342396861605719=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RFC] Session Handling/Policy Support in Tools
Date: Tue, 19 Dec 2017 18:01:38 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FE6D774@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0190342396861605719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There are two main parts to the direction I see the tools policy/session su=
pport heading:

1. The first is cleaning up all the code around session support and policy =
building.  I think now that I understand the topic better, I can organize t=
his code a little better. This is rather trivial and beside the main point.

2. Since abrmd 1.3 we have support for sessions across RM IPC connections a=
nd direct tpm communications (/dev/tmp0) also has the same support. We have=
 tools like tpm2_createpolicy that are made up of multiple
commands to work around session flushing on IPC RM disconnections. tpm2_cre=
atepolicy is really comprised of 3 commands: tpm2_startauthsession, tpm2_po=
licypcr and tpm2_flushcontext.

I'm proposing we leave tpm2_createpolicy, for in-kernel-rm users, but add t=
pm2_startauthsession and tpm2_policypcr for the abrmd and direct tpm usages=
. Abrmd works by using Tss2_Sys_ContextSave as the
marker of NOT flushing a session handle. Granted you also need the sessionA=
ttributes set to continue so the TPM doesn't kill it.

I think the flow for using the new tools would be something like this:

1. tpm2_createpolicy - create a pcr policy and spit out the policy digest
2. tpm2_create - create an object and set its policy digest as obtained in =
step 1
3. tpm2_startauthsession - create a pcr policy and spit out the session han=
dle
4. tpm2_policypcr - satisfy policy via policy digest and pcr list obtained/=
used in step 1 as well as taking the session handle from step 3
5. tpm2_<tool> - use some tool passing the session handle from step 3
6. tpm2_flushcontext - flushes the handle from step 3

With that said, since tpm2_createpolicy is really a combination of the tpm2=
_startauthsession, tpm2_pcrlist, tpm2_policypcr and tpm2_flushcontext, all =
that could be moved into lib, so each new tool and
create policy are really just calling into the same code.

Thoughts, am I missing something here?

This is a lot of work, so I would like to start it now, as it would be the =
major feature set going towards 4.0 release.

Bill

--===============0190342396861605719==--

