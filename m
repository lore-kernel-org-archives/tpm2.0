Content-Type: multipart/mixed; boundary="===============3098959485667963513=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: flush ALL transient handles or sessions in tpm2-pytss
Date: Mon, 26 Sep 2022 22:56:14 +0000
Message-ID: <b7e352a346a3b71a887102a9d5f56b663f2e327b.camel@intel.com>
In-Reply-To: FR0P281MB1706089B02CCECC42100B6DDD14C9@FR0P281MB1706.DEUP281.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3098959485667963513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-09-20 at 15:20 +0000, Gadacz, Henry wrote:
> I have another question :D
> =

> With tpm2_flushcontext it is possible to flush ALL transient objects,
> loaded sessions or saved sessions.
> How can I accomplish the same with tpm2-pytss esapi.flush_context()?
> I only found examples with flush one specific object or session.

You need to use get_cap to get all the handles and then loop through
them calling flush_context.

>  =

> Thanks in advance!
>  =

> Best Regards,
> Henry
>  =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3098959485667963513==--

