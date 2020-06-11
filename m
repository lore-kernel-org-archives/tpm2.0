Content-Type: multipart/mixed; boundary="===============2536621290207047031=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] Re: tpm2-tools next release version 5.0
Date: Thu, 11 Jun 2020 15:26:54 -0600
Message-ID: <69871084-C22B-42F6-A3F9-D0235E613BFD@rowan.moul.ca>
In-Reply-To: 5da823c5-f4fb-2a10-f289-b9ad95303eb9@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2536621290207047031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Based on my limited knowledge of the TCG spec, RSA 3072 is not a required a=
lgorithm and as such is not necessarily supported on all TPM 2.0=E2=80=99s.
I know that the fTPM in my personal machine does not support that bit stren=
gth for RSA keys for example.

Rowan

> On Jun 11, 2020, at 14:40, ted.h.kim(a)oracle.com wrote:
> =

> =EF=BB=BFWilliam,
> =

> w.r.t. RSA I think the default is 2048 bits
> =

> But I think recent RHEL releases have ssh-keygen defaulting now to 3072 b=
its.
> So I am thinking perhaps 2048 is or will soon be too weak.
> =

> Any chance that could be bumped up to 3072 bits?
> =

> Thanks,
> -ted
> =

>> On 6/11/20 9:11 AM, Roberts, William C wrote:
>> Hello,
>> =

>> As you likely already know, we follow semver.org versioning guidelines. =
For tpm2-tools next release from master, we are labelling it 5.0. I want to=
 make
>> sure that everyone understands the changes around this. Unlike major ver=
sion bumps 1, 2,3 and 4 command line options are staying the same in a
>> backwards compatible fashion (hooray). But there are some small changes =
coming, that I will highlight in the Changelog:
>>   - https://urldefense.com/v3/__https://github.com/tpm2-software/tpm2-to=
ols/blob/master/doc/CHANGELOG.md__;!!GqivPVa7Brio!MAEkAxKtVEge4_pZuFEF63r7m=
zwUX-wx7Fc8lDSnfslQFoad-SZnE0cENxUttTs$
>> =

>> The big takeaways are that the default algorithm for hashing is SHA256. =
Before, the man pages claimed SHA1, but this wasn't the case. The tools, ho=
pefully
>> are all on SHA256 now as the default. Selecting SHA1 for the default was=
n't optimal, as TPM2's whole purpose was algorithm agility to move away fro=
m SHA1.
>> Additionally the documentation did not match the code. SHA256 seems like=
 a good choice, as all TPM's support it. The best bet, is to **always** spe=
cify the
>> hash algorithm, so you will never be surprised. If you do that, you wont=
 have any backwards compat issues between 4.X and 5.X.
>> =

>> The other change is the busybox style commandlet. This will help reduce =
overall size and make some environments more convenient. To maintain
>> Backwards compat, make install provides symlinks to the new commandlet t=
pm2 from the old tool names. So something like tpm2_getrandom will be
>> symlinked to tpm2, and the commandlet will use argv[0] to figure it out.=
 Thus, if you make install, or use a distro package, nothing should change.=
 If you
>> run from a local build without installing, you can make install and set =
DESTDIR and just update your PATH entry if you need backwards compat.
>> =

>> I urge folks to start running master occasionally and let me know if som=
ething breaks between versions that isn't hightlighted in the CHANGELOG as
>> this could be a bug. I'd like to stomp these out sooner than later.
>> =

>> Thanks,
>> Bill
>> =

>> =

>> =

>> =

>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =

> -- =

> Ted H. Kim, PhD
> ted.h.kim(a)oracle.com
> +1 310-258-7515
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============2536621290207047031==--

