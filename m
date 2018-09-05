Content-Type: multipart/mixed; boundary="===============3553315205198318318=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] TPM2 changing the DictionaryAttackParamaters
Date: Wed, 05 Sep 2018 19:53:31 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C2FCBB@ORSMSX101.amr.corp.intel.com>
In-Reply-To: AM0P122MB0099DF527C97B556303949BA90080@AM0P122MB0099.EURP122.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3553315205198318318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ah you're going to device directly, maybe you need to issue a tpm_startup.

Can you replicate this with the simulator and step debug the simulator, oft=
en times
that's how I solve these things.

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Litjes, Chri=
stian
> Sent: Thursday, August 30, 2018 1:18 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] TPM2 changing the DictionaryAttackParamaters
> =

> Hi everyone,
> =

> =

> =

> I'm trying to setup a system with the cryptfs2 and tpm2-tooling which is =
currently
> working but I'd like to change the DictionaryAttackParamater recovery tim=
e.
> =

> =

> =

> I've tried the following (scenario 1)
> =

> Reset TPM from the bios
> =

> Tmp2_takeownership -T "device" -L "1234567890"
> =

> Tpm2_dictionarylockout -s -n 32 -l 86400 -t 5 -p "1234567890"
> =

> I get a warning: the command may require writing of NV and NV is not curr=
ent
> accessible.
> =

> If I check the settings with:
> =

> Tpm2_getcap -c properties-variable
> =

> I notice they are not changed
> =

> =

> =

> Reset TPM from the bios
> =

> Tpm2_dictionarylockout -s -n 32 -l 86400 -t 5 -p "1234567890"
> =

> Tpm2_getcap -c properties-variable
> =

> Values are written
> =

> Tmp2_takeownership -T "device" -L "1234567890"
> =

> Tpm2_getcap -c properties-variable
> =

> Settings are reset to default
> =

> =

> =

> What would I need to do to get the first scenario to work? I know I'm com=
bining
> tools from 2.x with master. But that's because the cryptfs tooling is dep=
endent on
> 2.x.
> =

> How can I unlock the NV, I've found tpm2_release but I've got no clue wha=
t to
> release.
> =

> =

> =

> Kind Regards,
> =

> Christian Litjes
> =

> =

> ________________________________
> =

> The information contained in this message may be confidential and legally
> protected under applicable law. The message is intended solely for the
> addressee(s). If you are not the intended recipient, you are hereby notif=
ied that
> any use, forwarding, dissemination, or reproduction of this message is st=
rictly
> prohibited and may be unlawful. If you are not the intended recipient, pl=
ease
> contact the sender by return e-mail and destroy all copies of the original
> message.


--===============3553315205198318318==--

