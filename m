Content-Type: multipart/mixed; boundary="===============3816408249401143976=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] Re: trying duplication and then rsa_en/decrypt
Date: Wed, 20 May 2020 17:37:31 -0700
Message-ID: <5cd7f791-30cd-c08f-7de4-9f9efb0383d7@oracle.com>
In-Reply-To: 70f6a728-131b-06b5-ab9f-a36503f71794@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3816408249401143976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Imran,

The fix worked -- Thank you.

One other suggestion would be to add "userwithauth" to the tpm2_create =

commands in the man page examples for tpm2_duplicate(1) and =

tpm2_policyduplicationselect(1). This would make the duplicated keys in =

those examples more useful.

Since I am on the 4.1.X branch, should I expect this fix to roll out =

with 4.1.3 ?

Thanks,
-ted

On 5/20/20 1:49 PM, ted.h.kim(a)oracle.com wrote:
> Imran,
>
> Okay, I will try it out.
>
> Also thanks for the pointer to the example on duplicating objects =

> between TPMs.
>
> Thanks,
> -ted
>
> On 5/20/20 12:44 PM, Imran Desai wrote:
>> I have a PR fixing this issue. If you want to try your script with =

>> this branch, it is here: =

>> https://urldefense.com/v3/__https://github.com/tpm2-software/tpm2-tools/=
pull/2038__;!!GqivPVa7Brio!JgE6G26n2bbDPLYBuJ2jf-Buv9U53CDF_b_5y43EAj8Q9hiy=
buldt1D8ZH_RPlQ$
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============3816408249401143976==--

