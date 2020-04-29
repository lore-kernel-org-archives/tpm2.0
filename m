Content-Type: multipart/mixed; boundary="===============2546720011321421380=="
MIME-Version: 1.0
From: Michael Walz <m.walz at digitalendoscopy.de>
Subject: [tpm2] Re: PCR pre-calculation
Date: Wed, 29 Apr 2020 18:10:25 +0200
Message-ID: <86d9ecbb-81b6-7e29-43a0-1aaae16d0bd5@digitalendoscopy.de>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649ED8577@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2546720011321421380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That is perfect for me, got it.
Thanks a lot guys!


On 28.04.20 16:45, Roberts, William C wrote:
> Yeah theirs no mac, it's just a straight hash of existing + new, which is=
 exactly what
> Andrea's example is.
> =

>> -----Original Message-----
>> From: Fuchs, Andreas [mailto:andreas.fuchs(a)sit.fraunhofer.de]
>> Sent: Tuesday, April 28, 2020 7:31 AM
>> To: Michael Walz <m.walz(a)digitalendoscopy.de>; tpm2(a)lists.01.org
>> Subject: [tpm2] Re: PCR pre-calculation
>>
>> I've used this function in the past:
>>
>> pcr_extend() {
>>    ( echo -n "$1" | xxd -r -p
>>      echo -n "$2" | xxd -r -p
>>    ) | sha1sum | cut -d " " -f 1
>> }
>>
>> PCRVALUE=3D"0000000000000000000000000000000000000000"
>> PCRVALUE=3D"$(pcr_extend "$PCRVALUE"
>> "86454b08919afa1c912af74dc704b87bc08afe99")"
>>
>> Cheers,
>> Andreas
>> ________________________________________
>> From: Michael Walz [m.walz(a)digitalendoscopy.de]
>> Sent: Tuesday, April 28, 2020 12:58
>> To: tpm2(a)lists.01.org
>> Subject: [tpm2] PCR pre-calculation
>>
>> Hi there,
>> I do not know if this is the right place for this question, so please po=
int me in the
>> right direction when I am wrong here.
>> We are trying to use the TPM2.0 in embedded devices. My job is to write a
>> verification suite to test if our scripts and tools are working correctl=
y. One point
>> here is that I want to check if the resulting PCRs are as expected.
>> Microsoft provides a "TPM PCR Calculator" for this purpose. I would need
>> something similar for linux command line and I googled a lot, but I did =
not find
>> something useful. I tried openssl and commands like
>>
>> echo -n '86454b08919afa1c912af74dc704b87bc08afe99' | xxd -r -p | openssl=
 dgst -
>> sha1 -mac hmac -macopt hexkey:0000000000000000000000000000000000000000
>>
>> I tested several options and variations, but the results never match the=
 PCR
>> register I get with tpm2_pcrextend.
>> Is there some way to get a pre-calculation for the PCRs?
>>
>> Thanks in advance!!
>> Michael
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============2546720011321421380==--

