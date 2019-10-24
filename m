Content-Type: multipart/mixed; boundary="===============1726322915404203416=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Persistance Not working
Date: Thu, 24 Oct 2019 16:01:43 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E2B54B@ORSMSX101.amr.corp.intel.com>
In-Reply-To: a548eb26-42c7-4775-b3b1-834f3851ae7f@www.fastmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1726322915404203416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Trey Weaver [mailto:treyweaver(a)fastmail.net]
> Sent: Tuesday, October 22, 2019 1:30 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>; Struk, Tadeusz
> <tadeusz.struk(a)intel.com>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: Persistance Not working
> =

> This is what I got after tpm2_listpersistance before and after power cycl=
e.
> =

> // before power cycle
> persistent-handle[0]:0x81000004 key-alg:rsa hash-alg:sha256 object-
> attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|sign
> persistent-handle[1]:0x81000006 key-alg:ecc hash-alg:sha256 object-
> attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricted|dec=
rypt
> // after power cycle
> persistent-handle[0]:0x81000004 key-alg:rsa hash-alg:sha256 object-
> attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|sign
> persistent-handle[1]:0x81000006 key-alg:ecc hash-alg:sha256 object-
> attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricted|dec=
rypt
> =

> So it did keep the persistence of both and I still get this result when I=
 run the
> decrypt command after a power cycle.
> =

> **********
> jps(a)jpsadmin-TB116C-AN:~/Temp$ tpm2_rsadecrypt -k 0x81000004 -o
> msg.out.txt -I msg.enc
> ERROR: rsaDecrypt failed, error code: 0x84
> ERROR: Unable to run tpm2_rsadecrypt
> **********
> =

> Moving to version 4 of the tools is not an option for me because I need t=
o use
> Clevis for other things and it won't run on version 4 of the tpm2-tools.

The art of debugging is removing variables, we're trying to figure out wher=
e the bug is so we
can lock into it better.

If you can't reproduce with 4.X than we know the bug is the 3.X branch.
If you can't reproduce with the simulator, than we know the bug is in the T=
PM.

That's why I wanted you to try those things, because the general location b=
ug is not obvious yet.

Bill

> =

> Trey Weaver
> =

> =

> On Tue, Oct 22, 2019, at 10:20 AM, Roberts, William C wrote:
> >
> >
> > > -----Original Message-----
> > > From: Trey Weaver [mailto:treyweaver(a)fastmail.net]
> > > Sent: Monday, October 21, 2019 2:14 PM
> > > To: Struk, Tadeusz <tadeusz.struk(a)intel.com>; tpm2(a)lists.01.org
> > > Subject: [tpm2] Re: Persistance Not working
> > >
> > > Ok I tried to make the primary persistent; I am still having issues.
> >
> > I was skeptical on that, I have found in my testing that making one
> > key in the hierarchy persistent works fine even when the parent
> > objects are not persistent.
> >
> > Before reboot and after reboot, does tpm2_listpersistent show both obje=
cts?
> >
> > >
> > > I ran the following and it looked like everything went OK.
> > >
> > > ***************
> > > tpm2_createprimary -H o -g sha256 -G ecc -C primary.ctx
> > > tpm2_evictcontrol -V -A o -c primary.ctx -S 0x81000006 tpm2_create
> > > -V -c primary.ctx -g sha256 -G rsa -u key.pub -r key.priv tpm2_load
> > > -c primary.ctx -u key.pub -r key.priv -C jpskey.ctx
> > > tpm2_evictcontrol -A o -c jpskey.ctx -S 0x81000004
> > > ***************
> > >
> > > I ran encrypt and decrypt and they worked.
> > >
> > > ***************
> > > #encypt
> > > tpm2_rsaencrypt -k 0x81000004 -o msg.enc msg.in.txt #Decrypt
> > > tpm2_rsadecrypt -k 0x81000004 -o msg.out.txt -I msg.enc
> > > ****************
> >
> > I'm assuming this is some formatting error and you actually ran
> > tpm2_rsadecrypt? The Command above has it comented out with a #.
> >
> > >
> > > But after a power cycle if I run the rsadecrypt again I get this erro=
r:
> > > ****************
> > > root(a)jpsadmin-TB116C-AN:/home/jps/Temp# tpm2_rsadecrypt -k
> > > 0x81000004 - o msg.out.txt -I msg.enc
> > > ERROR: rsaDecrypt failed, error code: 0x84
> > > ****************
> > >
> > > Which means "value is out of range or is not correct for the context"
> >
> > What is weird is the decoder shows the handle as (unk):
> > tpm:handle(unk):value is out of range or is not correct for the
> > context
> >
> > >
> > > What am I doing wrong?  I am using version 3.1.3
> >
> > I'm not sure yet, can you replicate the issue with tools release 4.0.1?
> > Everyone should stop using 3.X it's
> > A train wreck. Is tpm2_listpersistent actually showing these objects
> > as persistent, perhaps its some goofy tpm bug. Does this work if you
> > use the simulator?
> >
> > >
> > > Thanks,
> > > Trey
> > >
> > >
> > >
> > >
> > > On Fri, Oct 18, 2019, at 6:10 PM, Tadeusz Struk wrote:
> > > > On 10/18/19 2:17 PM, Trey Weaver wrote:
> > > > > I can rerun the rsadecrypt line a 1000 times and it works fine.
> > > > > But if I reboot my system and run it I get this error:
> > > > >
> > > > > */ps(a)jpsadmin-TB116C-AN:~/Temp$ tpm2_rsadecrypt -V -k 0x81000004
> > > > > -o msg.out2.txt -I msg.enc/**/
> > > > > /*
> > > > > */ERROR on line: "82" in file: "tools/tpm2_rsadecrypt.c":
> > > > > rsaDecrypt failed, error code: 0x84/**/
> > > > > /*
> > > > > */ERROR on line: "168" in file: "tools/tpm2_tool.c": Unable to
> > > > > run tpm2_rsadecrypt/**/
> > > > > /*
> > > > >
> > > > > What good is persistence if it does not work over a power cycle?
> > > > >
> > > > > What am I doing wrong?
> > > >
> > > > You need to make the primary also persistent or after reboot
> > > > recreate it using exactly the same parameters.
> > > >
> > > > --
> > > > Tadeusz
> > > >
> > > _______________________________________________
> > > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email
> > > to tpm2-leave(a)lists.01.org
> > > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >

--===============1726322915404203416==--

