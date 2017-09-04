Content-Type: multipart/mixed; boundary="===============5465203053294600639=="
MIME-Version: 1.0
From: Alexander.Steffen at infineon.com
Subject: Re: [tpm2] hardware TPM2 performance data
Date: Mon, 04 Sep 2017 17:56:59 +0000
Message-ID: <44da64eb7bb84825a47e7e75d0233427@MUCSE603.infineon.com>
In-Reply-To: 401a10e0-0d19-c70b-173e-bac612d06df7@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5465203053294600639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Hello folks,
> =

> I was wondering if you have any hardware TPM2 performance data.
> =

> The only system I've access with a TPM2 for now, is a Lenovo Thinkpad X1
> Carbon (4th generation) that has a Intel PTT firmware based TPM2.
> =

> Executing the test/system/test_tpm2_unseal.sh takes ~6.5 seconds on my
> machine.
> =

> But my colleague Russell (please keep him on cc since I don't think he's =
in the
> list) has a machine with an Asus TPM-L R2.0 TTPM Module and it's painfully
> slow.
> =

> The same test takes more than 1 minute on his system. Are really hardware
> TPM2s this slow? I understand that they are slow by design but is unseali=
ng
> some data really expected to take several seconds?

Unsealing itself (i.e. the execution of TPM2_Unseal) should be rather fast.=
 But if you look at test_tpm2_unseal.sh, it does far more than just unseal =
some data. It creates several keys, which I'd expect to take up most of the=
 time, since that is an expensive operation, especially in the case of prim=
ary keys.

> I would like to know what TPM2 chips are you using and how long the
> tpm2_unseal test takes to run on your system, to know if Russell's hw TPM2
> perf is the norm.

Primary keys are derived from a seed value, so key generation basically mea=
ns generating an endless pseudo-random stream from the seed, looking for su=
itable keys (e.g. prime numbers in the case of RSA) in there. Given the sam=
e input, this allows the TPM to always generate the exact same key, without=
 storing anything besides the small seed value that is shared between all k=
eys (in a hierarchy). But at the same time it prevents you from directly co=
mparing the performance of two TPMs for a TPM2_CreatePrimary call. Even if =
both TPMs run the same firmware, one TPM might use a seed so that for your =
particular call it needs to generate 1MB of pseudo-random data before it ha=
s found acceptable keys, whereas the other TPM might use a seed that leads =
to a valid key after generating only 10kB of pseudo-random data. And for ot=
her seeds/inputs this might look completely different again.

So for key generation you can only statistically compare a large number of =
key generations with different inputs. Or if you are interested in the unse=
al performance, I'd suggest to remove the key generation entirely from your=
 benchmark, working with pre-existing keys only.

Kind regards
Alexander

--===============5465203053294600639==--

