Content-Type: multipart/mixed; boundary="===============6900642726856573265=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] ERROR: Failed to initialize tcti context: 0x1
Date: Fri, 22 Sep 2017 19:24:37 +0200
Message-ID: <0b81de13-2764-589b-2f7c-cf1fb859d18f@redhat.com>
In-Reply-To: 16aeef58-6ac6-0309-be59-b9d168706ab8@arm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6900642726856573265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Stuart,

On 09/22/2017 05:23 PM, Stuart Yoder wrote:

[snip]

>>
>> Can you please check if configure said: "checking for TCTI_TABRMD... yes=
" and
>> if your tools binaries are dynamically linked against the TCTI tabrmd li=
brary?
>>
>> $ ldd $(which tpm2_pcrlist) | grep libtcti-tabrmd
>>          libtcti-tabrmd.so.0 =3D> /lib64/libtcti-tabrmd.so.0 (0x00007f3a=
df9a8000)
> =

> The tools were not linked against libtcti-tabrmd, after reconfiguring, do=
ing a
> clean, and rebuilding, it now is working.
>

Great, I'm glad that you solved your issue!
 =

> Thanks!

You are welcome.

> Stuart
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============6900642726856573265==--

