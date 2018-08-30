Content-Type: multipart/mixed; boundary="===============4454164431182112482=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.org>
Subject: Re: [tpm2] TPM2TSS engine for OpenSSL
Date: Wed, 29 Aug 2018 18:19:03 -0700
Message-ID: <abd61557-ac3b-cbd7-24d5-f48731bf017e@twobit.org>
In-Reply-To: 830ea19fdb26bb76cc12f8ff585baafb1dffb9fb.camel@linux.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4454164431182112482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Joshua,

On 08/28/2018 08:30 AM, Joshua Lock wrote:
> On Tue, 2018-08-28 at 14:58 +0000, Fuchs, Andreas wrote:
>> Hi Joshua,
>>
>> the engine is tested against openssl 1.0.2 and 1.1.0 using travis ci,
>> see =

>> https://github.com/tpm2-software/tpm2-tss-engine/blob/master/.travis.yml
>>
>> The fedora-info looks strange, since is says "No such file or
>> directory".
>> Could you check that  /usr/local/lib/openssl/engines/tpm2tss.so
>> actually exists ?
> =

> It doesn't, I do have libtpm2tss.so (same on my Ubuntu 16.04.5 VM
> though).
> However, if I link the libtpm2tss.so -> tpm2tss.so the engine is picked
> up:
> $ sudo ln -s /usr/local/lib/openssl/engines/libtpm2tss.so
> /usr/local/lib/openssl/engines/tpm2tss.so
> $ OPENSSL_ENGINES=3D/usr/local/lib/openssl/engines openssl engine -t -c =

> tpm2tss
> (tpm2tss) TPM2-TSS engine for OpenSSL
>  [RSA, RAND]
>      [ available ]
> =

> or indeed if I use libtpm2tss as the engine name:
> =

> $ OPENSSL_ENGINES=3D/usr/local/lib/openssl/engines openssl engine -t -c
> libtpm2tss
> (libtpm2tss) TPM2-TSS engine for OpenSSL
> Loaded: (tpm2tss) TPM2-TSS engine for OpenSSL
>  [RSA, RAND]
>      [ available ]

I had to reverse engineer this behavior as part of doing my LSS talk. I
found `strace` was the most useful tool in debugging it. Try adding
'/usr/local/lib/openssl/engines' to your library load path
(LD_LIBRARY_PATH).

That said I have no idea if this is the right way to achieve this goal
but I can say it will allow you to omit the 'lib' prefix from the engine
name w/o having to rename the installed so.

Philip

--===============4454164431182112482==--

