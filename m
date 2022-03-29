Content-Type: multipart/mixed; boundary="===============2385412705568613849=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Tue, 29 Mar 2022 20:01:47 +0000
Message-ID: <3275a6d45a2d6a68b97eb829f681a7af8e96393a.camel@intel.com>
In-Reply-To: fd666b8d-9bfe-89e5-d75d-e22a9bc9afdd@gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2385412705568613849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-03-24 at 12:08 -0700, Tadeusz Struk wrote:
> On 12/20/21 14:06, Juergen Repp wrote:
> > When /dev/tpmrm0 was used with kernel 5.10.
> > After sending the command read public:
> > 0x80 0x01 0x00 0x00 0x00 0x0e 0x00 0x00 0x01 0x73 0x80 0x00 0x00
> > 0x00
> > the write worked but the poll call in  tcti_device_receive did
> > stuck.
> > With kernel 4.19 write for this command did return -1
> =

> It took awhile, but the fix is now queued for 5.10.109 and above.

Do you have a link to the patch so it's archived in this thread for
those searching for a fix?

> --
> Thanks,
> Tadeusz
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============2385412705568613849==--

