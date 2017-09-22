Content-Type: multipart/mixed; boundary="===============2824376830671001598=="
MIME-Version: 1.0
From: Stuart Yoder <stuart.yoder at arm.com>
Subject: Re: [tpm2] ERROR: Failed to initialize tcti context: 0x1
Date: Fri, 22 Sep 2017 10:23:42 -0500
Message-ID: <16aeef58-6ac6-0309-be59-b9d168706ab8@arm.com>
In-Reply-To: f24e6843-2862-ea63-5a48-3c398a07f662@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2824376830671001598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 9/22/17 4:26 AM, Javier Martinez Canillas wrote:
> On 09/22/2017 02:25 AM, Stuart Yoder wrote:
>>
>>
>> On 9/21/17 6:42 PM, Javier Martinez Canillas wrote:
>>> Hello Stuart,
>>>
>>> On 09/21/2017 11:48 PM, Stuart Yoder wrote:
>>>> I'm trying to build/test tpm2-tools and am running into an issue.  Thi=
s is on
>>>> an Ubuntu 16.04 machine and I know the tpm is alive and functioning
>>>> because the distro tpm2-tools package worked.  That's an older codebas=
e, so I
>>>> wanted to build everything from source.
>>>>
>>>> So I've successfully built:  tpm2-tss, tpm2-tools, tpm2-abrmd.
>>>>
>>>> I followed the build/install instructions here:
>>>> https://github.com/01org/tpm2-abrmd/issues/92
>>>> ...which seem to follow what is recommended in INSTALL.md.
>>>>
>>>
>>> Since your distro is Ubuntu, and you want to use the tabrmd resource ma=
nager and
>>> the simulator, I would double check your steps with the ones made by th=
e Travis
>>> CI, since it does the same that you want:
>>>
>>> https://github.com/01org/tpm2-tools/blob/master/.travis.yml#L51
>>>
>>> If you find any divergence between what's done there and the INSTALL fi=
le, please
>>> file an issue.
>>>    =

>>>> I start tpm2-abrmd like this:
>>>> sudo -u tss tpm2-abrmd --tcti=3Ddevice &
>>>>
>>>
>>> I think the problem is that you are using --tcti=3Ddevice (and so telli=
ng the RM
>>> to access the TPM device directly). But IIUC you want to use the simula=
tor, so
>>> instead need to do:
>>
>> Actually, I do want to use the physical TPM device.  As a diagnostic ste=
p I
>> built --with-simulatorbin to see what happened.  But, I would like to see
>> the hardware device work.
>>
> =

> Ah, sorry. I misunderstood your issue.
> =

> The only thing that I can think of is that your tpm2-tools were not built=
 with
> TCTI abrmd support. This may happen if you built tpm2-tools before tpm2-a=
brmd,
> since tpm2-tools' configure script check for the TCTI abrmd header and li=
bs.
> =

> Can you please check if configure said: "checking for TCTI_TABRMD... yes"=
 and
> if your tools binaries are dynamically linked against the TCTI tabrmd lib=
rary?
> =

> $ ldd $(which tpm2_pcrlist) | grep libtcti-tabrmd
>          libtcti-tabrmd.so.0 =3D> /lib64/libtcti-tabrmd.so.0 (0x00007f3ad=
f9a8000)

The tools were not linked against libtcti-tabrmd, after reconfiguring, doin=
g a
clean, and rebuilding, it now is working.

Thanks!
Stuart

--===============2824376830671001598==--

