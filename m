Content-Type: multipart/mixed; boundary="===============8524737859928016816=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Help combining multiple policy assertions (logical AND)
Date: Fri, 04 Dec 2020 15:06:00 +0000
Message-ID: <SN6PR11MB3437FB37A028568C0553C4A7B8F10@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CAHC9VhR14+w9422gQMd=8FTWqunTEQKDuJn79H2VPbAwH0Fdcg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8524737859928016816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Paul Moore <paul(a)paul-moore.com>
> Sent: Thursday, December 3, 2020 3:42 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Help combining multiple policy assertions (logical AND)
> =

> Hello,
> =

> I'm currently attempting to combine multiple policy assertions together u=
sing a
> logical AND into a single signed policy that can be used to control acces=
s to a TPM2
> nvindex.  I currently have a working simple example with a single policy =
assertion
> based on PCR values, but I'm struggling trying to add an additional polic=
y assertion
> (I would like to control access both based on PCR values and a second nvi=
ndex
> value).
> =

> My current, single assertion example is shown below, any help you can pro=
vide
> on how to add a tpm2_policynv assertion would be greatly appreciated.

For logical AND you just extend the current policy hash by calling tpm2_pol=
icynv. So
After calling tpm2_policypcr, just call tpm2_policynv with the NV index, an=
d the operand,
like eq for equal. See this for more details on the operands and operators:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policynv.1=
.md

Then to access the NV index, run the policy commands in the same order and =
pass the
session like normal, as you do below via the 'tpm2_nvread -P "session:/tmp/=
session.ctx" ...'
command.

Is their another question I'm missing here, I usually am missing something =
obvious
people ask :-p

Another thing to consider, can you use tss2_ tools? They have a policy lang=
uage that manages
this all for you with a WYSIWIG policy builder:
https://tpm2-software.github.io/fapipolicies/


> =

> =

> *** locking/sealing the nvindex
> =

> =

> tpm2_pcrread $PCRS -o /tmp/pcr.bin
> =

> tpm2_startauthsession -S /tmp/session.ctx tpm2_policypcr -S /tmp/session.=
ctx \
>   -l $PCRS -f /tmp/pcr.bin -L /tmp/pcr.policy tpm2_policyauthorize -S
> /tmp/session.ctx \
>   -L /tmp/nvindex.policy -n signing_key.name tpm2_nvdefine -a
> "ownerwrite|ownerread|policyread" \
>   -P $PASSWD -L /tmp/nvindex.policy $NVINDEX tpm2_flushcontext
> /tmp/session.ctx
> =

> openssl dgst -sha256 --sign signing_key_private.pem \
>   -out pcr.signature /tmp/pcr.policy
> =

> echo "storedsecret" | tpm2_nvwrite -C o -P $PASSWD \
>   -i- $NVINDEX
> =

> =

> *** reading the nvindex using the signed policy
> =

> =

> tpm2_loadexternal -C o -G rsa -u signing_key_public.pem \
>   -c /tmp/key.ctx -n /tmp/key.name
> =

> tpm2_startauthsession -S /tmp/session.ctx --policy-session tpm2_policypcr=
 -S
> /tmp/session.ctx \
>   -l $PCRS -L /tmp/pcr.policy
> tpm2_verifysignature -c /tmp/key.ctx \
>   -f rsassa -g sha256 \
>   -m /tmp/pcr.policy -s pcr.signature -t /tmp/sigverify.tkt tpm2_policyau=
thorize -S
> /tmp/session.ctx \
>   -i /tmp/pcr.policy -n /tmp/key.name -t /tmp/sigverify.tkt tpm2_nvread -P
> "session:/tmp/session.ctx" -s 64 $NVINDEX tpm2_flushcontext /tmp/session.=
ctx
> rm -f /tmp/sigverify.tkt
> =

> =

> --
> paul moore
> www.paul-moore.com
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8524737859928016816==--

