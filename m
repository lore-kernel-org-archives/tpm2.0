Content-Type: multipart/mixed; boundary="===============0736597406371239700=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Persistance Not working
Date: Tue, 22 Oct 2019 14:20:16 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E29EE9@ORSMSX101.amr.corp.intel.com>
In-Reply-To: a17cc91c-57f7-4c0d-8332-accfbfc1f14d@www.fastmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0736597406371239700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Trey Weaver [mailto:treyweaver(a)fastmail.net]
> Sent: Monday, October 21, 2019 2:14 PM
> To: Struk, Tadeusz <tadeusz.struk(a)intel.com>; tpm2(a)lists.01.org
> Subject: [tpm2] Re: Persistance Not working
> =

> Ok I tried to make the primary persistent; I am still having issues.

I was skeptical on that, I have found in my testing that making one key in =
the hierarchy persistent
works fine even when the parent objects are not persistent.

Before reboot and after reboot, does tpm2_listpersistent show both objects?

> =

> I ran the following and it looked like everything went OK.
> =

> ***************
> tpm2_createprimary -H o -g sha256 -G ecc -C primary.ctx tpm2_evictcontrol=
 -V -A
> o -c primary.ctx -S 0x81000006 tpm2_create -V -c primary.ctx -g sha256 -G=
 rsa -u
> key.pub -r key.priv tpm2_load -c primary.ctx -u key.pub -r key.priv -C jp=
skey.ctx
> tpm2_evictcontrol -A o -c jpskey.ctx -S 0x81000004
> ***************
> =

> I ran encrypt and decrypt and they worked.
> =

> ***************
> #encypt
> tpm2_rsaencrypt -k 0x81000004 -o msg.enc msg.in.txt #Decrypt tpm2_rsadecr=
ypt
> -k 0x81000004 -o msg.out.txt -I msg.enc
> ****************

I'm assuming this is some formatting error and you actually ran tpm2_rsadec=
rypt? The
Command above has it comented out with a #.

> =

> But after a power cycle if I run the rsadecrypt again I get this error:
> ****************
> root(a)jpsadmin-TB116C-AN:/home/jps/Temp# tpm2_rsadecrypt -k 0x81000004 -
> o msg.out.txt -I msg.enc
> ERROR: rsaDecrypt failed, error code: 0x84
> ****************
> =

> Which means "value is out of range or is not correct for the context"

What is weird is the decoder shows the handle as (unk):
tpm:handle(unk):value is out of range or is not correct for the context

> =

> What am I doing wrong?  I am using version 3.1.3

I'm not sure yet, can you replicate the issue with tools release 4.0.1? Eve=
ryone should stop using 3.X it's
A train wreck. Is tpm2_listpersistent actually showing these objects as per=
sistent, perhaps its some
goofy tpm bug. Does this work if you use the simulator?

> =

> Thanks,
> Trey
> =

> =

> =

> =

> On Fri, Oct 18, 2019, at 6:10 PM, Tadeusz Struk wrote:
> > On 10/18/19 2:17 PM, Trey Weaver wrote:
> > > I can rerun the rsadecrypt line a 1000 times and it works fine.=C2=A0=
 But
> > > if I reboot my system and run it I get this error:
> > >
> > > */ps(a)jpsadmin-TB116C-AN:~/Temp$ tpm2_rsadecrypt -V -k 0x81000004 -o
> > > msg.out2.txt -I msg.enc/**/
> > > /*
> > > */ERROR on line: "82" in file: "tools/tpm2_rsadecrypt.c": rsaDecrypt
> > > failed, error code: 0x84/**/
> > > /*
> > > */ERROR on line: "168" in file: "tools/tpm2_tool.c": Unable to run
> > > tpm2_rsadecrypt/**/
> > > /*
> > >
> > > What good is persistence if it does not work over a power cycle?
> > >
> > > What am I doing wrong?
> >
> > You need to make the primary also persistent or after reboot recreate
> > it using exactly the same parameters.
> >
> > --
> > Tadeusz
> >
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0736597406371239700==--

