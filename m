Content-Type: multipart/mixed; boundary="===============3468526365083321443=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] Re: key destruction
Date: Mon, 01 Jun 2020 12:46:56 -0700
Message-ID: <bc09d129-82a9-3702-c9a4-ab348856ecdd@oracle.com>
In-Reply-To: 20200530203814.2851.99582@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3468526365083321443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Imran,

Thanks for your response. Some questions and maybe some bigger issues:

So imagine we have hundreds or thousands of users/accounts. Each has =

their own little tree of a primary key and the children underneath. Does =

your suggestion scale to that level? I may be showing my ignorance, but =

are there enough of those debug-PCRs?

Also if I get you correctly, the debug-PCRs are transient things in that =

a system/TPM restart resets them.

Plus it sort of has what I feel is a not so good thing. When we get rid =

of a key, we still need to keep the PCR around to block people from =

using the deleted item. I feel like when we delete, intuitively we =

should be getting rid of state.


Architecturally, I feel like some how we should be able to kill off the =

primary key and thereby invalidate everything in its tree of objects. =

And also, we should be able to prevent the exact same primary key from =

being recreated. I guess I am not sure how to do this.

 From trying the commands, it seems if we make the key persistent and =

give the user a serialized handle (tpm2_evictcontrol -o), evicting the =

key seems to be enough to invalidate the handle. But if the user has the =

context file, we can't really prevent them from using the key. And so =

how do we prevent them from getting a context file in the first place. =

It looks like the way tpm2_create and tpm2_load work, you can't really =

stop them from getting the context file. Well I have probably gone too =

far down this line of thinking already.

But I am open whatever suggestions people have about how to destroy key =

without having to do tpm2_clear.


Thanks,
-ted





On 5/30/20 1:38 PM, Imran Desai wrote:
> Of the many ways, you can achieve this here is a way to do it with Policy=
Pcr --> Extend a random value to debug-PCR (PCR#16) and create a key with p=
olicypcr referencing the debug PCR.
>
> As long as no other data is extended into the debug-PCR from this point o=
n the key can be used indefinitely as long as pcrpolicy is satisfied.
>
> Extend the debug-PCR once again with another random value once ready to d=
ump the key. The only reason to use debug-PCR 16 is if you do not want to d=
isturb other PCR values potentially invalidating the authorization of other=
 TPM objects.
>
> Note: Instead of extending the debug-PCR with a random value, you can als=
o achieve the same result by simply issuing tpm2_pcrreset on the debug-PCR =
which will change the pcr contents to 0. This will happen anyway when the s=
ystem or TPM restarts.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============3468526365083321443==--

