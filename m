Content-Type: multipart/mixed; boundary="===============6260439160881913079=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] hardware TPM2 performance data
Date: Mon, 04 Sep 2017 22:14:51 +0200
Message-ID: <112ae3c4-18e7-5f8e-9e33-cb55c6c1f954@redhat.com>
In-Reply-To: 44da64eb7bb84825a47e7e75d0233427@MUCSE603.infineon.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6260439160881913079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Alexander,

Thanks a lot for your feedback.

On 09/04/2017 07:56 PM, Alexander.Steffen(a)infineon.com wrote:
>> Hello folks,
>>
>> I was wondering if you have any hardware TPM2 performance data.
>>
>> The only system I've access with a TPM2 for now, is a Lenovo Thinkpad X1
>> Carbon (4th generation) that has a Intel PTT firmware based TPM2.
>>
>> Executing the test/system/test_tpm2_unseal.sh takes ~6.5 seconds on my
>> machine.
>>
>> But my colleague Russell (please keep him on cc since I don't think he's=
 in the
>> list) has a machine with an Asus TPM-L R2.0 TTPM Module and it's painful=
ly
>> slow.
>>
>> The same test takes more than 1 minute on his system. Are really hardware
>> TPM2s this slow? I understand that they are slow by design but is unseal=
ing
>> some data really expected to take several seconds?
> =

> Unsealing itself (i.e. the execution of TPM2_Unseal) should be rather fas=
t. But if you look at test_tpm2_unseal.sh, it does far more than just unsea=
l some data. It creates several keys, which I'd expect to take up most of t=
he time, since that is an expensive operation, especially in the case of pr=
imary keys.
>

I see, for some reasons I (probably mis-)understood in the TCG spec that th=
e KDF
shouldn't be that expensive, since I thought that a nice feature of the TPM=
2 was
that it did not require to make the primary keys persistent, due being able=
 to
generate them deterministic using the seeds.
 =

>> I would like to know what TPM2 chips are you using and how long the
>> tpm2_unseal test takes to run on your system, to know if Russell's hw TP=
M2
>> perf is the norm.
> =

> Primary keys are derived from a seed value, so key generation basically m=
eans generating an endless pseudo-random stream from the seed, looking for =
suitable keys (e.g. prime numbers in the case of RSA) in there. Given the s=
ame input, this allows the TPM to always generate the exact same key, witho=
ut storing anything besides the small seed value that is shared between all=
 keys (in a hierarchy). But at the same time it prevents you from directly =
comparing the performance of two TPMs for a TPM2_CreatePrimary call. Even i=
f both TPMs run the same firmware, one TPM might use a seed so that for you=
r particular call it needs to generate 1MB of pseudo-random data before it =
has found acceptable keys, whereas the other TPM might use a seed that lead=
s to a valid key after generating only 10kB of pseudo-random data. And for =
other seeds/inputs this might look completely different again.
>

Your explanation makes a lot of sense. I'm not making the primary key persi=
stent
in the TPM2 since I thought it would be simpler than having to manage them =
as a
persistent object in the TPM2. But I'll explore this approach now.

> So for key generation you can only statistically compare a large number o=
f key generations with different inputs. Or if you are interested in the un=
seal performance, I'd suggest to remove the key generation entirely from yo=
ur benchmark, working with pre-existing keys only.
>

More than the unseal performance, I was interested in the performance of al=
l the
operations needed to seal and unseal data with the TPM2 (create primary key=
, PCR
policy creation for authentication, create and load object to seal, etc).

Hopefully I should have access to systems with a hardware TPM2 soon, so I s=
hould
be able to test the performance implications of all these operations.

> Kind regards
> Alexander
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============6260439160881913079==--

