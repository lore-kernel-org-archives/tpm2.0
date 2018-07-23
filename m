Content-Type: multipart/mixed; boundary="===============1966943815898213144=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.org>
Subject: Re: [tpm2] getting segfaults with tss-2.0.0, abrmd-2.0.0, tools-3.1.0
Date: Mon, 23 Jul 2018 08:23:37 -0700
Message-ID: <55e7a77d-2de2-06ae-e4e8-9f57ebdf76f2@twobit.org>
In-Reply-To: 13c845abdf2e4e0f80e8d9714130e27d@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1966943815898213144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/20/2018 06:33 AM, Scheie, Peter M wrote:
> -----Original Message-----
> From: Joshua Lock [mailto:joshua.g.lock(a)linux.intel.com] =

> Sent: Friday, July 20, 2018 6:00 AM
> To: Scheie, Peter M; tpm2(a)lists.01.org
> Subject: Re: [tpm2] getting segfaults with tss-2.0.0, abrmd-2.0.0, tools-=
3.1.0
> =

> On 19/07/2018 17:08, Scheie, Peter M wrote:
>>
>> -----Original Message-----
>> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Joshua Lock
>> Sent: Thursday, July 19, 2018 5:24 AM
>> To: tpm2(a)lists.01.org
>> Subject: Re: [tpm2] getting segfaults with tss-2.0.0, abrmd-2.0.0, tools=
-3.1.0
>>
>>
>>
>> On 18/07/2018 22:17, Scheie, Peter M wrote:
>>> By the way, does abrmd default to trying to connect to /dev/tpm0?=C2=A0=
 When
>>> working with the emulator on my laptop, I have to start abrmd with
>>> '--tcti=3Dlibtss2-tcti-mssim.so' but I assume that's just for when there
>>> is no TPM device, right?
>>
>> Correct, if no --tcti value is passed abrmd defaults to using the device
>> tcti:
>> https://github.com/tpm2-software/tpm2-abrmd/blob/2296d48a1004aff5f93d6ec=
23a50819f2a5c5584/src/tcti-dynamic.c#L138
>>
>> At line 142 you can see where the default value of the TCTI library file
>> property is set to "libtss2-tcti-device.so".
>>
>>> So, with tpm2-abrmd running, if I call, say, tpm2_pcrlist or
>>> tpm2_nvlist, to just query the TPM, it will display the PCRs or the NV
>>> indexes but then follow that with a "Segmentation fault", and syslog
>>> shows things like this:
>>>
>>> Jun 27 22:32:42 localhost audit[1432]: ANOM_ABEND auid=3D1000 uid=3D1000
>>> gid=3D1000 ses=3D1 pid=3D1432 comm=3D"gdbus" exe=3D"/usr/bin/tpm2_pcrli=
st" sig=3D11
>>>
>>> Jun 27 22:32:42 localhost kernel: gdbus[1432]: segfault at 7f8327acc750
>>> ip 00007f8327acc750 sp 00007f8326ab2c38 error 14 in
>>> libtss2-mu.so.0.0.0[7f8328284000+3f000]
>>>
>>> Jun 27 22:32:42 localhost kernel[363]: gdbus[1432]: segfault at
>>> 7f8327acc750 ip 00007f8327acc750 sp 00007f8326ab2c38 error 14 in
>>> libtss2-mu.so.0.0.0[7f8328284000+3f000]
>>>
>>> Trying to write to the TPM, e.g., take ownership, doesn't work at all:
>>>
>>> localhost:~$ tpm2_takeownership -o ownerpass -e endorsepass -l lockpass
>>>
>>> ERROR: Could not change hierarchy for Owner. TPM Error:0x9a2
>>
>> I just recently learned about tpm2_rc_decode[1], it tells me:
>>
>> $ ./tools/aux/tpm2_rc_decode 0x9a2
>> tpm:session(1):authorization failure without DA implications
>>
>> Is this TPM already configured? Have you replicated on more than one sys=
tem?
>>
>> Joshua
>>
>> ***********************************************************
>> Oops, you are correct: I had already taken ownership of the TPM previous=
ly, but was not supplying the owner password when trying to write to it.   =
With that in mind, I can write/configure the TPM as expected.  However, I'm=
 still getting a segfault message after each operation.
>>
> =

> Glad to hear, though the segfault is worrying. Could you install debug =

> packages and find out more about the segfault?
> =

> Thanks,
> Joshua
> =

> ************************************************************
> Wind River has suggested that since it appears the segfaults are appearin=
g on the "gdbus" process, it may be dbus related.  One possibility is that =
the dbus version in WRL8 is not in sync with the newer tpm2 utilities.

Does WRL9 ship with SELinux or some other security policy enforced?

Philip

--===============1966943815898213144==--

