Content-Type: multipart/mixed; boundary="===============1059664451195715707=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: [tpm2] Re: tpm2-tools port to windows
Date: Fri, 11 Oct 2019 14:30:44 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FF967DF672@fmsmsx104.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1059664451195715707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@Arun, Thanks for working on this. If you have a markdown along with the vc=
xproj and .sln file I can help you put it on the tools wiki.
________________________________________
From: tpm2-request(a)lists.01.org [tpm2-request(a)lists.01.org]
Sent: Friday, October 11, 2019 12:00 AM
To: tpm2(a)lists.01.org
Subject: tpm2 Digest, Vol 28, Issue 6

Send tpm2 mailing list submissions to
        tpm2(a)lists.01.org

To subscribe or unsubscribe via email, send a message with subject or
body 'help' to
        tpm2-request(a)lists.01.org

You can reach the person managing the list at
        tpm2-owner(a)lists.01.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of tpm2 digest..."

Today's Topics:

   1. tpm2-tools port to windows (Arun Sudhir)
   2. Re: tpm2-tools port to windows (Roberto Carvalho)
   3. Re: tpm2-tools port to windows (Arun Sudhir)
   4. [RELEASE] tpm2-tools 3.2.1 (Roberts, William C)
   5. list link dead (Roberts, William C)


----------------------------------------------------------------------

Date: Thu, 10 Oct 2019 13:31:31 -0700
From: Arun Sudhir <arunsudhir19(a)gmail.com>
Subject: [tpm2] tpm2-tools port to windows
To: tpm2(a)lists.01.org
Message-ID:
        <CAJLNp_X21ShovGDcRo9JKGYUAvZghn18tLL=3DoKqmWqDvUUe1+w(a)mail.gmail=
.com>
Content-Type: multipart/alternative;
        boundary=3D"0000000000000151500594944a42"

--0000000000000151500594944a42
Content-Type: text/plain; charset=3D"UTF-8"

I have been workig on porting tpm2-tools to build on windows and have got
it to build successfully and run commands like tpm2_startup,
tpm2_getrandom, tpm2_createprimary , tpm2_create, tpm2_evictcontrol ,
tpm2_makecredential etc. Is there any interest in this windows port ? I can
publish it on github if there is. I presume it would be useful... Thoughts?

--0000000000000151500594944a42
Content-Type: text/html; charset=3D"UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D3D"ltr">I have been workig on porting tpm2-tools to build on win=
do=3D
ws and have got it to build successfully and run commands like tpm2_startup=
=3D
, tpm2_getrandom, tpm2_createprimary , tpm2_create, tpm2_evictcontrol , tpm=
=3D
2_makecredential etc. Is there any interest in this windows port ? I can pu=
=3D
blish it on github if there is. I presume it would be useful... Thoughts?</=
=3D
div>

--0000000000000151500594944a42--

------------------------------

Date: Thu, 10 Oct 2019 17:36:09 -0300
From: Roberto Carvalho <roberto.nogueira.rc(a)gmail.com>
Subject: [tpm2] Re: tpm2-tools port to windows
To: Arun Sudhir <arunsudhir19(a)gmail.com>
Cc: tpm2(a)lists.01.org
Message-ID:
        <CAMCD9Mv6pq7KtV5JcX+tUvbLaOHmjQ0akey-9DgjezQBPZvwMA(a)mail.gmail.c=
om>
Content-Type: multipart/alternative;
        boundary=3D"000000000000a4e8730594945afb"

--000000000000a4e8730594945afb
Content-Type: text/plain; charset=3D"UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I'm very interested in running tpm2-tools on windows, it would be nice
to upload github and also the step by step to compile in visual studio 2017=
=3D
.



Em qui, 10 de out de 2019 =3DC3=3DA0s 17:31, Arun Sudhir <arunsudhir19(a)gm=
ail.co=3D
m>
escreveu:

> I have been workig on porting tpm2-tools to build on windows and have got
> it to build successfully and run commands like tpm2_startup,
> tpm2_getrandom, tpm2_createprimary , tpm2_create, tpm2_evictcontrol ,
> tpm2_makecredential etc. Is there any interest in this windows port ? I c=
=3D
an
> publish it on github if there is. I presume it would be useful... Thought=
=3D
s?
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--000000000000a4e8730594945afb
Content-Type: text/html; charset=3D"UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D3D"ltr">Hi, I&#39;m very interested in running tpm2-tools on win=
do=3D
ws, it would be nice to upload github and also the step by step to compile =
=3D
in visual studio 2017.<br><div><br></div><div><br></div></div><br><div clas=
=3D
s=3D3D"gmail_quote"><div dir=3D3D"ltr" class=3D3D"gmail_attr">Em qui, 10 de=
 out d=3D
e 2019 =3DC3=3DA0s 17:31, Arun Sudhir &lt;<a href=3D3D"mailto:arunsudhir19(=
a)gmail.=3D
com">arunsudhir19(a)gmail.com</a>&gt; escreveu:<br></div><blockquote class=
=3D3D=3D
"gmail_quote" style=3D3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb=
(2=3D
04,204,204);padding-left:1ex"><div dir=3D3D"ltr">I have been workig on port=
in=3D
g tpm2-tools to build on windows and have got it to build successfully and =
=3D
run commands like tpm2_startup, tpm2_getrandom, tpm2_createprimary , tpm2_c=
=3D
reate, tpm2_evictcontrol , tpm2_makecredential etc. Is there any interest i=
=3D
n this windows port ? I can publish it on github if there is. I presume it =
=3D
would be useful... Thoughts?</div>
_______________________________________________<br>
tpm2 mailing list -- <a href=3D3D"mailto:tpm2(a)lists.01.org" target=3D3D"_=
blank"=3D
>tpm2(a)lists.01.org</a><br>
To unsubscribe send an email to <a href=3D3D"mailto:tpm2-leave(a)lists.01.o=
rg" =3D
target=3D3D"_blank">tpm2-leave(a)lists.01.org</a><br>
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s</blockquote></div>

--000000000000a4e8730594945afb--

------------------------------

Date: Thu, 10 Oct 2019 14:06:48 -0700
From: Arun Sudhir <arunsudhir19(a)gmail.com>
Subject: [tpm2] Re: tpm2-tools port to windows
To: Roberto Carvalho <roberto.nogueira.rc(a)gmail.com>
Cc: tpm2(a)lists.01.org
Message-ID:
        <CAJLNp_WyKuKGbuM=3DAstEL1x=3DGqnw9TrDWaYCkwq69zOnknVZ2Q(a)mail.gma=
il.com>
Content-Type: multipart/alternative;
        boundary=3D"000000000000530496059494c82a"

--000000000000530496059494c82a
Content-Type: text/plain; charset=3D"UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good. Right now, I have it building in 2019 community. Will
definitely put it in GitHub replete with the sln and vcxproj so that things
just work out of the box.

On Thu, Oct 10, 2019, 1:36 PM Roberto Carvalho <
roberto.nogueira.rc(a)gmail.com> wrote:

> Hi, I'm very interested in running tpm2-tools on windows, it would be nic=
=3D
e
> to upload github and also the step by step to compile in visual studio 20=
=3D
17.
>
>
>
> Em qui, 10 de out de 2019 =3DC3=3DA0s 17:31, Arun Sudhir <arunsudhir19(a)=
gmail.=3D
com>
> escreveu:
>
>> I have been workig on porting tpm2-tools to build on windows and have go=
=3D
t
>> it to build successfully and run commands like tpm2_startup,
>> tpm2_getrandom, tpm2_createprimary , tpm2_create, tpm2_evictcontrol ,
>> tpm2_makecredential etc. Is there any interest in this windows port ? I =
=3D
can
>> publish it on github if there is. I presume it would be useful... Though=
=3D
ts?
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>

--000000000000530496059494c82a
Content-Type: text/html; charset=3D"UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D3D"auto">Sounds good. Right now, I have it building in 2019 comm=
un=3D
ity. Will definitely put it in GitHub replete with the sln and vcxproj so t=
=3D
hat things just work out of the box.</div><br><div class=3D3D"gmail_quote">=
<d=3D
iv dir=3D3D"ltr" class=3D3D"gmail_attr">On Thu, Oct 10, 2019, 1:36 PM Rober=
to C=3D
arvalho &lt;<a href=3D3D"mailto:roberto.nogueira.rc(a)gmail.com">roberto.no=
guei=3D
ra.rc(a)gmail.com</a>&gt; wrote:<br></div><blockquote class=3D3D"gmail_quot=
e" s=3D
tyle=3D3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv=3D
 dir=3D3D"ltr">Hi, I&#39;m very interested in running tpm2-tools on windows=
, =3D
it would be nice to upload github and also the step by step to compile in v=
=3D
isual studio 2017.<br><div><br></div><div><br></div></div><br><div class=3D=
3D=3D
"gmail_quote"><div dir=3D3D"ltr" class=3D3D"gmail_attr">Em qui, 10 de out d=
e 20=3D
19 =3DC3=3DA0s 17:31, Arun Sudhir &lt;<a href=3D3D"mailto:arunsudhir19(a)gm=
ail.com"=3D
 target=3D3D"_blank" rel=3D3D"noreferrer">arunsudhir19(a)gmail.com</a>&gt; =
escrev=3D
eu:<br></div><blockquote class=3D3D"gmail_quote" style=3D3D"margin:0px 0px =
0px =3D
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D3=
D"=3D
ltr">I have been workig on porting tpm2-tools to build on windows and have =
=3D
got it to build successfully and run commands like tpm2_startup, tpm2_getra=
=3D
ndom, tpm2_createprimary , tpm2_create, tpm2_evictcontrol , tpm2_makecreden=
=3D
tial etc. Is there any interest in this windows port ? I can publish it on =
=3D
github if there is. I presume it would be useful... Thoughts?</div>
_______________________________________________<br>
tpm2 mailing list -- <a href=3D3D"mailto:tpm2(a)lists.01.org" target=3D3D"_=
blank"=3D
 rel=3D3D"noreferrer">tpm2(a)lists.01.org</a><br>
To unsubscribe send an email to <a href=3D3D"mailto:tpm2-leave(a)lists.01.o=
rg" =3D
target=3D3D"_blank" rel=3D3D"noreferrer">tpm2-leave(a)lists.01.org</a><br>
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s</blockquote></div>
</blockquote></div>

--000000000000530496059494c82a--

------------------------------

Date: Fri, 11 Oct 2019 00:53:31 +0000
From: "Roberts, William C" <william.c.roberts(a)intel.com>
Subject: [tpm2] [RELEASE] tpm2-tools 3.2.1
To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E24616(a)ORSMSX101.amr.co
        rp.intel.com>
Content-Type: text/plain; charset=3D"us-ascii"

Hello a new 3.X series release is available:
https://github.com/tpm2-software/tpm2-tools/releases/tag/3.2.1

Thanks
Bill

------------------------------

Date: Fri, 11 Oct 2019 00:55:47 +0000
From: "Roberts, William C" <william.c.roberts(a)intel.com>
Subject: [tpm2] list link dead
To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
Cc: "Desai, Imran" <imran.desai(a)intel.com>
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E25633(a)ORSMSX101.amr.co
        rp.intel.com>
Content-Type: text/plain; charset=3D"us-ascii"

The mailing list link referenced in tpm2-tools and tpm2-tss (and likely oth=
ers) is dead.

https://lists.01.org/mailman/listinfo/tpm2

I get a Not Found response

wget https://lists.01.org/mailman/listinfo/tpm2
--2019-10-10 19:54:42--  https://lists.01.org/mailman/listinfo/tpm2
...
Proxy request sent, awaiting response... 404 Not Found
2019-10-10 19:54:44 ERROR 404: Not Found.

Can someone figure out where they moved it?

Thanks,
Bill

------------------------------

Subject: Digest Footer

_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

------------------------------

End of tpm2 Digest, Vol 28, Issue 6
***********************************

--===============1059664451195715707==--

