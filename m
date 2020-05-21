Content-Type: multipart/mixed; boundary="===============1154031635932757792=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] Re: trying duplication and then rsa_en/decrypt
Date: Thu, 21 May 2020 09:18:32 -0700
Message-ID: <7fb00ec2-60eb-3027-f9d5-dda3d939f884@oracle.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EF2F07@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1154031635932757792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

William,

Thanks for your reply.

On 5/21/20 8:08 AM, Roberts, William C wrote:
>> -----Original Message-----
>> From: ted.h.kim(a)oracle.com [mailto:ted.h.kim(a)oracle.com]
>> Sent: Wednesday, May 20, 2020 7:38 PM
>> To: Desai, Imran <imran.desai(a)intel.com>
>> Cc: tpm2(a)lists.01.org
>> Subject: [tpm2] Re: trying duplication and then rsa_en/decrypt
>>
>> Imran,
>>
>> The fix worked -- Thank you.
>>
>> One other suggestion would be to add "userwithauth" to the tpm2_create
>> commands in the man page examples for tpm2_duplicate(1) and
>> tpm2_policyduplicationselect(1). This would make the duplicated keys in =
those
>> examples more useful.
> That patch I had to revert, a similar fix will come out, but we must not =
turn down userwith
> when someone:
> - doesn't provide attributes via -a
> - doesn't provide a password
> - does provide a policy
>
> If someone specifies a policy and no password without explicitly providin=
g the attributes,
> they likely want the authorization to the object to be controlled via pol=
icy, not policy and
> an empty password. So when the tool is choosing attributes that's how it =
needs to do it.
> So for your example, you'll have to specify userwithauth and then we will=
 update the
> manpage to reflect this.
>
> Note that your creating an object with no real auth value (empty password=
), so keep that in
> mind.

understand, looking forward to the final fix


>> Since I am on the 4.1.X branch, should I expect this fix to roll out wit=
h 4.1.3 ?
> Why not just bump versions? Everything on 4.X is backwards compat, nothin=
g breaks.
> You may need to bump your tss version, but again, backwards compat, shoul=
d just
> Work.

I will eventually do that.

But for the moment, I don't have the time. I know using tpm2-tools-4.2.X =

requires tpm2-tss-2.4.x which for my environment has some missing =

dependencies which I have yet to resolve.

Thanks,
-ted


>> Thanks,
>> -ted
>>
>> On 5/20/20 1:49 PM, ted.h.kim(a)oracle.com wrote:
>>> Imran,
>>>
>>> Okay, I will try it out.
>>>
>>> Also thanks for the pointer to the example on duplicating objects
>>> between TPMs.
>>>
>>> Thanks,
>>> -ted
>>>
>>> On 5/20/20 12:44 PM, Imran Desai wrote:
>>>> I have a PR fixing this issue. If you want to try your script with
>>>> this branch, it is here:
>>>> https://urldefense.com/v3/__https://github.com/tpm2-software/tpm2-too
>>>> ls/pull/2038__;!!GqivPVa7Brio!JgE6G26n2bbDPLYBuJ2jf-Buv9U53CDF_b_5y43
>>>> EAj8Q9hiybuldt1D8ZH_RPlQ$
>>>> _______________________________________________
>>>> tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email
>>>> to tpm2-leave(a)lists.01.org
>>>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>> --
>> Ted H. Kim, PhD
>> ted.h.kim(a)oracle.com
>> +1 310-258-7515
>>
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============1154031635932757792==--

