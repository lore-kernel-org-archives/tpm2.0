Content-Type: multipart/mixed; boundary="===============1486108578406122301=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] TPM2TSS engine for OpenSSL
Date: Thu, 30 Aug 2018 08:16:50 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D014263B5CB@exch2010c.sit.fraunhofer.de>
In-Reply-To: abd61557-ac3b-cbd7-24d5-f48731bf017e@twobit.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1486108578406122301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that's interesting....

The default OpenSSL-Engines for 1.0.0 are all prefixed with a lib*
I have to admit that I never used the OPENSSL_ENGINES env but rather the LD=
_LIBRARY_PATH.

I wonder what the correct behavior is ?
Is this a weirdness of openSSL ?

Does anyone around here know OpenSSL enough to give an answer or advice ?

________________________________________
From: Philip Tricca [flihp(a)twobit.org]
Sent: Thursday, August 30, 2018 03:19
To: Joshua Lock
Cc: Fuchs, Andreas; tpm2(a)lists.01.org
Subject: Re: [tpm2] TPM2TSS engine for OpenSSL

Hi Joshua,

On 08/28/2018 08:30 AM, Joshua Lock wrote:
> On Tue, 2018-08-28 at 14:58 +0000, Fuchs, Andreas wrote:
>> Hi Joshua,
>>
>> the engine is tested against openssl 1.0.2 and 1.1.0 using travis ci,
>> see
>> https://github.com/tpm2-software/tpm2-tss-engine/blob/master/.travis.yml
>>
>> The fedora-info looks strange, since is says "No such file or
>> directory".
>> Could you check that  /usr/local/lib/openssl/engines/tpm2tss.so
>> actually exists ?
>
> It doesn't, I do have libtpm2tss.so (same on my Ubuntu 16.04.5 VM
> though).
> However, if I link the libtpm2tss.so -> tpm2tss.so the engine is picked
> up:
> $ sudo ln -s /usr/local/lib/openssl/engines/libtpm2tss.so
> /usr/local/lib/openssl/engines/tpm2tss.so
> $ OPENSSL_ENGINES=3D/usr/local/lib/openssl/engines openssl engine -t -c
> tpm2tss
> (tpm2tss) TPM2-TSS engine for OpenSSL
>  [RSA, RAND]
>      [ available ]
>
> or indeed if I use libtpm2tss as the engine name:
>
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

--===============1486108578406122301==--

