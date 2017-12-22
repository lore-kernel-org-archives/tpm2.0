Content-Type: multipart/mixed; boundary="===============3366784790636980214=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] [RFC] Session Handling/Policy Support in Tools
Date: Fri, 22 Dec 2017 16:47:25 +0100
Message-ID: <91b8c5ea-3dac-6251-2e3a-70217222d173@redhat.com>
In-Reply-To: CAAxBZJuE6ftmtc=2tSWs3LDbPZMToSY0fM_T+JVoZdzfzvGcPg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3366784790636980214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Ian,

On 12/20/2017 03:35 PM, Ian Oliver wrote:
> Forgive me if this is obvious to you :-) but I'd like to understand and
> clarify the above a bit more. In the procedure you've presented above does
> step #4 change the state of the session to one that can be used?
> =

> Is then the procedure then something like:
> =

> 1. tpm2_createpolicy - create a pcr policy and spit out the policy digest
> =

> eg: I create a policy based upon the current state of (eg) sha1:0,1,2,3 a=
nd
> save this as  0123.policy
> =

> 2. tpm2_create - create an object containing the policy created in #1 (+
> keys?)
> =

> eg: I create an object which is sealed (???) against 0123.policy
> =

> Question: is there a need to perform a tpm2_load here or is it sufficient
> that this exists temporarily?
>

You always need to do a TPM2_Load if you want to use an object created by t=
he
TPM. The TPM2_Create commands just returns the public and private parts of =
an
object but doesn't keep anything in the TPM memory after is completed.
 =

> 3. tpm2_startauthsession - create a session handle for a given pcr policy
> =

> eg: I generate a session handle for a given policy, eg: 0123.policy and
> return this as, say   session.bin
>

No, here Bill weren't precise in the wording AFAICT. He said "creates a ses=
sion
handle for a given pcr policy" but he should had said "creates a session ha=
ndle
for a given session policy".

In other words, you are just creating an authentication session but still d=
idn't
do any authentication based on the PCR state.

> 4. tpm2_policypcr, given #1 and #3, check if either a supplied set of PCR
> values or the current state of the PCR registers are specified in #1 matc=
h,
> if so then the session handle is marked as being valid until step #6
>

Yes, this tool will send a TPM2_PolicyPCR() command to the TPM with the PCR
digest and so the session is changed from policySession to policyDigest.

About the session handle being valid until #6, this really depends if the
command sets TPM_ST_SESSIONS in the header tag field or TPM_ST_NO_SESSIONS?

If the latter, the provided session is flushed after the command completes
unless the policySession continueSession attribute is SET.

> 5. tpm2_* with -S taking the output of #3 as input as required
> =

> Question: what happens if I issue a tpm2_* command without -S during this
> time?
>

If you are not provided a session that could satisfy the authentication
policy for your object, then the TPM will refuse the command to succeed
returning a TPM2_RC_BAD_AUTH response code as an error.

> 6. tpm2_flushcontext   taking the session handle and/or  object from #2 as
> input.  Any further attempts to use the session handle with tpm2_* -S
> fails.
>

Yes. After the session handle has been flushed from the TPM, any attempts
to authenticate using it will fail (in fact the session context won't even
load AFAICT).

> =

> So an example session might proceed
> =

> $tpm2_createpolicy -P -f 0123.policy -g sha256 -L sha1:0,1,2
> $ls
> 0123.policy
> $tpm2_create -H 0x81010001 -g sha256 -G rsa -L 0123.policy
> 0x810100ff         <- output handle, also assume 0x81010001 exists in the
> above
> $tpm2_startauthsession -L 0123.policy -s session.bin
> $ls
> session.bin
> =

> Now this is pure guesswork here
> =

> $tpm2_decrypt -k 0x81010001 -I secret.enc -o plain.txt -S session.bin
> FAIL
> =

> $tpm2_policypcr -k 0x81010001 -s session.bin -L
> 0123.policy                    <- reads sha1:0,1,2,3 from the TPM
> OK
> =

> $tpm2_decrypt -k 0x81010001 -I secret.enc -o plain.txt -S session.bin
> $cat plain.txt
> "This is a secret message"
> =

> $tpm2_flushcontext -H 0x810100ff            <- our object from above
> =

> $tpm2_decrypt -k 0x81010001 -I secret.enc -o plain.txt -S session.bin
> FAIL
> =


Yes, this is mostly correct. Please read my previous emails regardless
some of the details, but in general it will work as you said.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============3366784790636980214==--

