Content-Type: multipart/mixed; boundary="===============9041660332991515908=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Re: Approaching 100 hours of troubleshooting
Date: Mon, 25 Nov 2019 10:20:47 +0000
Message-ID: <CALtZhhNA5bgQxa3+zZBpYBnh0bX0Q7s29gQ+pHf8P+1g6Bzu=w@mail.gmail.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0163C08E9E@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9041660332991515908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You said 99% of TPM2 chips can't do symmetric bulk encryption.

With regard to the other 1%, can those chips do symmetric bulk
encryption whereby I can load a 128-Bit AES key and IV into the chip?

On 11/25/19, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de> wrote:
> No, the TPM will not do AES encryption on a key you load in with
> a custom mode.
>
> You can store up to 100 bytes into such a "KeyedHash" object, which
> is basically an object for arbitrary data, that the TPM will AES encrypt
> using the parent key.
> With TPM2_Unseal this data gets decrypted.
>
> The cipher mode used is CFP I think, but not sure.
> ________________________________________
> From: Frederick Gotham [cauldwell.thomas(a)gmail.com]
> Sent: Monday, November 25, 2019 11:12
> To: Fuchs, Andreas
> Cc: Zhu, Bing; tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: Approaching 100 hours of troubleshooting
>
> Thank you for this, Andreas.
>
> You wrote at the end "Or you can create a KeyedHash object and call
> Unseal, but that's limited to approx 100 bytes. So you can use a key
> from there."
>
> 100 bytes is adequate for my needs. Is it possible to load a 128-bit
> AES key into the TPM2 hardware in order to encrypt or decrypt
> approximately 35 bytes of data ? By the way I also need to load the
> 128-Bit IV.
>
> My chip is the TPM 2.0 Infineon SLB96XX 1.2 / 2.0. My BIOS tells me
> that the Vendor is IFX, and the firmware is 5.62.
>
>
> On 11/25/19, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de> wrote:
>> Yes, 99% of TPM2 chips do not support the TPM2_EncryptDecrypt function,
>> i.e. they do not support symmetric "bulk" encryption.
>>
>> The reason for this is political (import export customs etc).
>>
>> You can either use asymmetric encryption/decryption using RSA_En/Decrypt
>> or ECC with ECC_KeyGen or ECC_ZGen.
>> Or you can create a KeyedHash object and call Unseal, but that's limited
>> to
>> approx 100 bytes. So you can use a key from there.
>>
>>
>> ________________________________
>> From: Frederick Gotham [cauldwell.thomas(a)gmail.com]
>> Sent: Monday, November 25, 2019 10:39
>> To: Zhu, Bing
>> Cc: tpm2(a)lists.01.org
>> Subject: [tpm2] Re: Approaching 100 hours of troubleshooting
>>
>> When I try to run the test script "encryptdecrypt.sh", I get the followi=
ng
>> output:
>>
>> WARN: Command EncryptDecrypt is not supported by your device,
>> skipping...
>>
>> Anyone got any idea what would cause this?
>>
>>
>> On Sun, Nov 24, 2019 at 3:11 PM Zhu, Bing
>> <bing.zhu(a)intel.com<mailto:bing.zhu(a)intel.com>> wrote:
>>>>> I see one about fTPM but I'm not sure what it does.
>> Firmware-based TPM, google Intel Platform Trust Technology (PTT) to know
>> more details.
>>
>> From: Frederick Gotham
>> <cauldwell.thomas(a)gmail.com<mailto:cauldwell.thomas(a)gmail.com>>
>> Sent: Sunday, November 24, 2019 02:07 AM
>> To: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
>> Subject: [tpm2] Approaching 100 hours of troubleshooting
>>
>> Hi
>>
>> I'm trying to get the TPM2 working in embedded Linux, and I've been
>> troubleshooting for nearly two weeks now.
>>
>> I thought it would be a good idea to get the latest releases of the
>> following packages:
>>
>>     tpm2-tss
>>     tpm2-tools
>>     tpm2-tss-engine
>>
>> And also the latest commit of: tpm2-pkcs11
>>
>> All I have succeeded in doing so far is getting random numbers from the
>> TPM2
>> chip. I haven't be able to store (or retrieve) keys, nor have I been able
>> to
>> encrypt or decrypt data.
>>
>> The first problem I'm having is that the command line options for the
>> tools
>> (and also scripts) have been changed several times. Every time I try to
>> follow an example I find on the web, I get "unrecognised option -C".
>>
>> In order to try follow examples I find online, I have repeatedly upgraded
>> and downgraded my versions of the packages, sometimes even mixing old
>> tools
>> with new tools (sometimes even rewinding to an historical commit in Gith=
ub
>> between official releases).
>>
>> Can someone please suggest what are the best stable versions of these
>> packages for working with embedded Linux?
>>
>> Another thing:
>> When my device boots up, I can go into the BIOS where I see a lot of
>> options
>> for Trusted Platform. I'm not exactly sure what these options actually d=
o.
>> Can someone advise me which settings in particular to watch out for? I s=
ee
>> one about fTPM but I'm not sure what it does.
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
>> To unsubscribe send an email to
>> tpm2-leave(a)lists.01.org<mailto:tpm2-leave(a)lists.01.org>
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>
>
--===============9041660332991515908==--

