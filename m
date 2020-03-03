Content-Type: multipart/mixed; boundary="===============1498325974688633371=="
MIME-Version: 1.0
From: Martin Townsend <mtownsend1973 at gmail.com>
Subject: [tpm2] Re: tpm2_createek and transient EK problem
Date: Tue, 03 Mar 2020 09:30:37 +0000
Message-ID: <CABatt_yYom=29SYJqdMnuz6eNLZ-b9AmbEqGqKi_qu1sM5Feew@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E9749C@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1498325974688633371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2020 at 4:51 PM Roberts, William C
<william.c.roberts(a)intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Tadeusz Struk [mailto:tadeusz.struk(a)intel.com]
> > Sent: Friday, February 28, 2020 10:51 AM
> > To: Martin Townsend <mtownsend1973(a)gmail.com>; Rowan Moul
> > <lists(a)rowan.moul.ca>
> > Cc: tpm2(a)lists.01.org
> > Subject: [tpm2] Re: tpm2_createek and transient EK problem
> >
> > On 2/28/20 8:06 AM, Martin Townsend wrote:
> > > So if you want to use transient objects with tpm2-tools don't use the
> > > resource manager.  Out of interest what is the advantages of the
>
> That's not really true. You can use a resource manager, with transient ob=
jects just fine.
> The transient context file is saved and restored by the tools. So you jus=
t pass the ctx file whenever
> you need to use the object.
>
> You won't be able to run tpm2_getcap between tool invocations and see the=
 transient
> handle loaded in the TPM, because the RM flushes it. But you can still us=
e your context
> file for the life of the TPM boot. If you restart the TPM,  then you need=
 to call tpm2_load
> and get the context file again.
>

Got it. I've read up some more on context management and I think I now
understand.  I didn't appreciate the context file is only valid for
the life of the TPM boot though so thank you for the info.

> > > Resource Manager? Is there some documentation for it that I could
> > > read?
> > Here is the spec:
> > https://trustedcomputinggroup.org/wp-content/uploads/TSS-TAB-and-
> > Resource-Manager-ver1.0-rev16_Public_Review.pdf
> >
> > --
> > Tadeusz
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============1498325974688633371==--

