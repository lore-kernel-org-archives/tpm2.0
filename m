Content-Type: multipart/mixed; boundary="===============8473338403094135829=="
MIME-Version: 1.0
From: =?utf-8?q?Max_Halld=C3=A9n_=3Cmax=2Ehallden_at_wisi=2Ese=3E?=
Subject: [tpm2] Re: Protecting TPM objects
Date: Mon, 21 Oct 2019 08:50:03 +0000
Message-ID: <2508f54d-84d6-3a79-88f3-d51cf7ef5906@wisi.se>
In-Reply-To: A3DEEEBB19900C48B49572CB9C2891C9879C9928@SHSMSX108.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8473338403094135829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for the answer! It sounds like it behaves how I expect, but
I have one follow-up question:

When you say you can delete and re-create it, if this is a primary key
will this result in the same key as before?

Regards,
Max

On 2019-10-21 04:43, Zhu, Bing wrote:
> Each authorization Hierarchy has its own authvalue, by default, the authv=
alue is empty. But you can change this authvalue to a high entropy secret.
>
> For platform authorization, its authvalue will be reset to empty after ea=
ch power cycle. typically BIOS/FW should change it to a high entropy secret=
 after using at boot time, then discard this secret or disable platform aut=
horization before handoff to bootloader/OS. So that nobody else in OS can u=
se platform authorization.
>
> Take TPM NV storage as example, you can configure different policy to gat=
e access control to the secret stored in NV storage. e.g. you can configure=
 a password-only access so that even if you have owner hierarchy authvalue,=
 you cannot even access it. (but you can delete it and re-create it with yo=
ur owner hierarchy authvalue).
>
> Bing =

>
>> -----Original Message-----
>> From: Max Halld=C3=A9n <max.hallden(a)wisi.se>
>> Sent: Friday, October 18, 2019 18:28 PM
>> To: tpm2(a)lists.01.org
>> Subject: [tpm2] Protecting TPM objects
>>
>> Hi all,
>>
>> I'm a bit confused about the different authorizations and if anyone coul=
d help me
>> clear some things up that would be a great help.
>>
>> The platform authorization seems to be reset on each reboot which makes =
sense
>> in a way that it is up for grabs by whatever boots first.
>>
>> But if I create an object under the owner or endorsement hierarchies, do=
es this
>> mean it can never be accessed without the password for those hierarchies=
? Even
>> by someone with platform authorization?
>>
>> If I also create it with a password or any other kind of authorization, =
can it also
>> not be accessed by someone with authorization for that hierarchy? For ex=
ample,
>> is a primary key created with password protection unique to that passwor=
d or
>> can it be recreated by someone with access to that hierarchy?
>>
>> To be a bit more specific, I'm trying to figure out in what cases a pass=
word
>> protected decryption key can't be accessed by anyone without access to t=
he
>> password (but could otherwise have full access to the TPM hardware).
>>
>> Regards,
>> Max
>>
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-
>> leave(a)lists.01.org %(web_page_url)slistinfo%(cgiext)s/%(_internal_name=
)s



--===============8473338403094135829==--

