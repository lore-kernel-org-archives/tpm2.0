Content-Type: multipart/mixed; boundary="===============4184183814411610722=="
MIME-Version: 1.0
From: Litjes, Christian <christian.litjes at philips.com>
Subject: Re: [tpm2] TPM2 changing the DictionaryAttackParamaters
Date: Thu, 20 Sep 2018 07:05:40 +0000
Message-ID: <AM0P122MB00990B5BDEFC3AC020AEA15F90130@AM0P122MB0099.EURP122.PROD.OUTLOOK.COM>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649C2FCBB@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4184183814411610722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Robert,

We figured out what was wrong. Without the simulator though ^^.
tpm2_takeownership -T "device" -L "pass" was used instead of what it should=
 have been: tpm2_takeownership -T "device" -l "pass"

After this change we could use:
tpm2_dictionarylockout -s -n 32 -l 86400 -t 5 -p "pass"

And saw the values change and the stuck.

Kind Regards,
Christian Litjes


-----Original Message-----
From: Roberts, William C <william.c.roberts(a)intel.com>
Sent: woensdag 5 september 2018 21:54
To: Litjes, Christian <christian.litjes(a)philips.com>; tpm2(a)lists.01.org
Subject: RE: TPM2 changing the DictionaryAttackParamaters

Ah you're going to device directly, maybe you need to issue a tpm_startup.

Can you replicate this with the simulator and step debug the simulator, oft=
en times that's how I solve these things.

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Litjes,
> Christian
> Sent: Thursday, August 30, 2018 1:18 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] TPM2 changing the DictionaryAttackParamaters
>
> Hi everyone,
>
>
>
> I'm trying to setup a system with the cryptfs2 and tpm2-tooling which
> is currently working but I'd like to change the DictionaryAttackParamater=
 recovery time.
>
>
>
> I've tried the following (scenario 1)
>
> Reset TPM from the bios
>
> Tmp2_takeownership -T "device" -L "1234567890"
>
> Tpm2_dictionarylockout -s -n 32 -l 86400 -t 5 -p "1234567890"
>
> I get a warning: the command may require writing of NV and NV is not
> current accessible.
>
> If I check the settings with:
>
> Tpm2_getcap -c properties-variable
>
> I notice they are not changed
>
>
>
> Reset TPM from the bios
>
> Tpm2_dictionarylockout -s -n 32 -l 86400 -t 5 -p "1234567890"
>
> Tpm2_getcap -c properties-variable
>
> Values are written
>
> Tmp2_takeownership -T "device" -L "1234567890"
>
> Tpm2_getcap -c properties-variable
>
> Settings are reset to default
>
>
>
> What would I need to do to get the first scenario to work? I know I'm
> combining tools from 2.x with master. But that's because the cryptfs
> tooling is dependent on 2.x.
>
> How can I unlock the NV, I've found tpm2_release but I've got no clue
> what to release.
>
>
>
> Kind Regards,
>
> Christian Litjes
>
>
> ________________________________
>
> The information contained in this message may be confidential and
> legally protected under applicable law. The message is intended solely
> for the addressee(s). If you are not the intended recipient, you are
> hereby notified that any use, forwarding, dissemination, or
> reproduction of this message is strictly prohibited and may be
> unlawful. If you are not the intended recipient, please contact the
> sender by return e-mail and destroy all copies of the original message.


________________________________
The information contained in this message may be confidential and legally p=
rotected under applicable law. The message is intended solely for the addre=
ssee(s). If you are not the intended recipient, you are hereby notified tha=
t any use, forwarding, dissemination, or reproduction of this message is st=
rictly prohibited and may be unlawful. If you are not the intended recipien=
t, please contact the sender by return e-mail and destroy all copies of the=
 original message.

--===============4184183814411610722==--

