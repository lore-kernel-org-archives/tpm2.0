Content-Type: multipart/mixed; boundary="===============8848506527634680265=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] [tpm2-software/tpm2-tools] NV write/read with authorized
 policy (#1281)
Date: Wed, 16 Jan 2019 16:15:56 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CDA6EB@ORSMSX101.amr.corp.intel.com>
In-Reply-To: tpm2-software/tpm2-tools/issues/1281@github.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8848506527634680265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+tpm2 mailing list. In the future direct questions there.

> -----Original Message-----
> From: Kai Che [mailto:notifications(a)github.com]
> Sent: Wednesday, January 16, 2019 8:00 AM
> To: tpm2-software/tpm2-tools <tpm2-tools(a)noreply.github.com>
> Cc: Subscribed <subscribed(a)noreply.github.com>
> Subject: [tpm2-software/tpm2-tools] NV write/read with authorized policy
> (#1281)
> =

> Hello everyone,
> =

> I'm trying to write/read a NV area which was defined with a policy output=
 from
> tpm2_policyauthorize:

I'm assuming you're setup steps would be here and you're just showing the a=
ttempt
To define a new space with the policy.

> tpm2_policyauthorize -S session.ctx -o authorized.policy -f pcr.policy -n=
 signing_key.name
> tpm2_nvdefine -x 0x1500001 -a 0x40000001 -s 32 -t "policyread|policywrite=
" -L authorized.policy
> tpm2_nvread -x 0x1500001 -s 32 -L sha256:8 -o 0 =


On master, I am seeing no way to pass the authorizing session context to tp=
m2_nvread. The options to
NV read for PCR policy satisfaction are all internal, and quite limited in =
support.

You really would want something like:
tpm2_nvread -p session=3Dsession.ctx <args|opts>

This way the first handle of the sessions array can be specified.

You also need tpm2-abrmd and not /dev/tpm0 or /dev/tpmrm0 as extended sessi=
ons (ie
Session blobs between tool invocations) is an abrmd only feature.

Sorry this support is not there currently, but it's on the roadmap for 2019=
. My major goal for the 2019
Release is to have:
1. proper session/password support. Each part of the session array should b=
e specifiable. =

2. HMAC passwords
3. Consistent options (command line interface will freeze at 4.0)

> ERROR: Failed to read NVRAM area at index 0x1500001
> ERROR: Tss2_Sys_NV_Read(0x99D) - tpm:session(1):a policy check failed
> ERROR: Unable to run tpm2_nvread
> =

> Write/read with a "normal" PCR policy is working fine with the proper PCR=
 values:
> tpm2_nvdefine -x 0x1500001 -a 0x40000001 -s 32 -t "policyread|policywrite=
" -L
> pcr.policy
> =

> How can I access the NV area with an authorized policy?
> =

> Thanks and best regards,
> =

> Kai
> =

> =E2=80=94
> You are receiving this because you are subscribed to this thread.
> Reply to this email directly, view it on GitHub <https://github.com/tpm2-
> software/tpm2-tools/issues/1281> , or mute the thread
> <https://github.com/notifications/unsubscribe-
> auth/AQ7bB6hC0v0CWNUvFQmwwZ6D4feE2w_Fks5vD0yEgaJpZM4aDY32> .
> <https://github.com/notifications/beacon/AQ7bB_1Kg32-
> 17tEQAoXM8S8E0yOROGeks5vD0yEgaJpZM4aDY32.gif>


--===============8848506527634680265==--

