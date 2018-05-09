Content-Type: multipart/mixed; boundary="===============3122429068909272144=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: Re: [tpm2] tpm support on Intel NUCs
Date: Wed, 09 May 2018 13:26:35 +0000
Message-ID: <CANtcRX4-=h0jtZR2gn+BGNZd8yXyi_0guftjAWRQyMOGMjGWuw@mail.gmail.com>
In-Reply-To: CAAxBZJtt+a0izPiPS3B2qvpuOy9L93-FBcB0R+xz3rMO+qOQ1Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3122429068909272144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

thanks, tboot started working on legacy boot without any tpm2_tools action
necessary.

is tboot hanging in EFI boot a known issue? (the ubuntu tboot scripts seems
to be written with EFI in mind, so I presumed it was supported)
On Tue, May 8, 2018 at 6:24 PM Ian Oliver <ian.justin.oliver(a)gmail.com>
wrote:

> Fedora 27, Ubuntu 18.04  both with 4.15 kernels work on the NUCs with the
current release version of TPM tools.  Legacy boot is enabled, otherwise
tboot hands during the DRTM measurement.   We have SELinux+IMA/EMA working
on Fedora and correctly writing to the TPM only with Fedora - Ubuntu has
AppArmor unfortunately.

> The patch for the TPM BUFFER size is required otherwise nv_write/read do
not work (this has now been pushed into the tools code base as I
understand).

> Ian



> On 8 May 2018 at 18:56, Peter Magnusson <blaufish.public.email(a)gmail.co=
m>
wrote:

>> 1/
>> For the record, the combo of tpm2-tools 3.0.4, tpm2-tss 1.4.0, tpm2-abrmd
>> 1.3.1 works excellently on NUC.

>> 2/
>> Regarding Boot hang on Ubuntu, I see this on Ubuntu 18 as well. I'm
>> planning to install in BIOS legacy mode to get tboot logs on screen
unless
>> this is resolved otherwise (ubuntu grub scripts disables VGA log for efi
>> tboot).

>> The following blog posts suggests that tboot should not be working on
Intel
>> NUC out of the box, but the commands are tpm_tools based.
>> https://blog.twobit.us/2015/01/02/txt-and-tboot-on-the-ivb-nuc/
>> I tried to follow the advice on the blog but get error 0x9a2
>> TPM_RC_BAD_AUTH... do I need to take ownership before executing command?

>> tpm2_nvdefine -T device:/dev/tpmrm0 --index=3D0xffffffff --size=3D0
>> WARN: Defining an index with size 0
>> ERROR: Failed to define NV area at index 0xffffffff (-1).Error:0x9a2
>> tpm2_rc_decode 0x9a2
>> error layer
>>     hex: 0x0
>>     identifier: TSS2_TPM_ERROR_LEVEL
>>     description: Error produced by the TPM
>> format 1 error code
>>     hex: 0x22
>>     identifier: TPM_RC_BAD_AUTH
>>     description: authorization failure without DA implications
>> session
>>     hex: 0x100
>>     identifier: TPM_RC_1
>>     description:  (null)
>> On Fri, Apr 27, 2018 at 6:59 AM Ian Oliver <ian.justin.oliver(a)gmail.co=
m>
>> wrote:

>> > Hello Duncan,

>> > we've three NUC7i5DNKE - two running Fedora (latest) and one with
Ubuntu
>> 17.04.  Worked for us out of the box: had to enable TXT in the BIOS but
>> that set everything else necessary automatically.  SRTM measures work,
DRTM
>> with tboot does not - tboot just hangs - still debugging this one - the
ACM
>> module seems to be correct.

>> > Fedora requires a kernel recompile to get SELinux and IMA/EMA running;
>>    Ubuntu does not support IMA policies an AppArmor kernel panics.

>> > tss/abrmd/tpm2-tools all compile with the latest releases, "master"
does
>> not without some hacking - old libraries etc (CentOS was nigh on
impossible
>> in this respect)

>> > I'll check the kernel versions and tpm drivers when I get into the
>> office, but 4.13 (at least) for the kernal has worked for us on more or
>> less everything (NUC, Nokia AirFrame, Lenovo laptops).

>> > t.

>> > Ian

>> > On 27 April 2018 at 01:20, <Duncan.Palmer(a)data61.csiro.au> wrote:

>> >> Apologies if this is slightly OT for this list...


>> >> We're running the tpm2 tools in Intel NUCs (a NUC5i7RYH to be exact),
>> using Linux kernel 4.4.59 (shipped by Ubuntu as 4.4.0-77). The tpm
drivers
>> on this kernel don't work out of the box, and I had to put in a fairly
>> nasty hack to make them work. The same driver now does not work on a
newer
>> NUC7i7 model. Are other people using NUCs, and if so, are you having
>> similar issues?


>> >> Cheers,

>> >> Dunk


>> >> Duncan Palmer
>> >> Senior Software Engineer | Autonomous Systems
>> >> Data61 | CSIRO

>> >> E duncan.palmer(a)csiro.au

>> >> Queensland Centre for Advanced Technologies (QCAT),

>> >> 1 Technology Court, Pullenvale QLD, 4069

>> >> www.data61.csiro.au


>> >> CSIRO=E2=80=99s Digital Productivity business unit and NICTA have joi=
ned
forces
>> to create digital powerhouse Data61




>> > --
>> > Dr. Ian Oliver
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> > Privacy Engineering:  via Amazon
>> > Twitter: @i_j_oliver
>> > _______________________________________________
>> > tpm2 mailing list
>> > tpm2(a)lists.01.org
>> > https://lists.01.org/mailman/listinfo/tpm2




> --
> Dr. Ian Oliver
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> Privacy Engineering:  via Amazon
> Twitter: @i_j_oliver

--===============3122429068909272144==--

