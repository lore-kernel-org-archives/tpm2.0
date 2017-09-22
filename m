Content-Type: multipart/mixed; boundary="===============4062470291840122736=="
MIME-Version: 1.0
From: Stuart Yoder <stuart.yoder at arm.com>
Subject: Re: [tpm2] ERROR: Failed to initialize tcti context: 0x1
Date: Thu, 21 Sep 2017 19:25:17 -0500
Message-ID: <fb29679e-7c67-b5ed-16e0-955157dd622c@arm.com>
In-Reply-To: 06aae075-939c-2b4a-30a3-9be820356860@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4062470291840122736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 9/21/17 6:42 PM, Javier Martinez Canillas wrote:
> Hello Stuart,
> =

> On 09/21/2017 11:48 PM, Stuart Yoder wrote:
>> I'm trying to build/test tpm2-tools and am running into an issue.  This =
is on
>> an Ubuntu 16.04 machine and I know the tpm is alive and functioning
>> because the distro tpm2-tools package worked.  That's an older codebase,=
 so I
>> wanted to build everything from source.
>>
>> So I've successfully built:  tpm2-tss, tpm2-tools, tpm2-abrmd.
>>
>> I followed the build/install instructions here:
>> https://github.com/01org/tpm2-abrmd/issues/92
>> ...which seem to follow what is recommended in INSTALL.md.
>>
> =

> Since your distro is Ubuntu, and you want to use the tabrmd resource mana=
ger and
> the simulator, I would double check your steps with the ones made by the =
Travis
> CI, since it does the same that you want:
> =

> https://github.com/01org/tpm2-tools/blob/master/.travis.yml#L51
> =

> If you find any divergence between what's done there and the INSTALL file=
, please
> file an issue.
>   =

>> I start tpm2-abrmd like this:
>> sudo -u tss tpm2-abrmd --tcti=3Ddevice &
>>
> =

> I think the problem is that you are using --tcti=3Ddevice (and so telling=
 the RM
> to access the TPM device directly). But IIUC you want to use the simulato=
r, so
> instead need to do:

Actually, I do want to use the physical TPM device.  As a diagnostic step I
built --with-simulatorbin to see what happened.  But, I would like to see
the hardware device work.

Stuart

--===============4062470291840122736==--

