Content-Type: multipart/mixed; boundary="===============5532856860081269378=="
MIME-Version: 1.0
From: Trey Weaver <treyweaver at fastmail.net>
Subject: [tpm2] Re: Persistance Not working
Date: Mon, 21 Oct 2019 15:14:24 -0400
Message-ID: <a17cc91c-57f7-4c0d-8332-accfbfc1f14d@www.fastmail.com>
In-Reply-To: 50769586-7ac4-73de-22e9-7eea2bbb5b3a@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5532856860081269378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ok I tried to make the primary persistent; I am still having issues.

I ran the following and it looked like everything went OK.

***************
tpm2_createprimary -H o -g sha256 -G ecc -C primary.ctx
tpm2_evictcontrol -V -A o -c primary.ctx -S 0x81000006
tpm2_create -V -c primary.ctx -g sha256 -G rsa -u key.pub -r key.priv
tpm2_load -c primary.ctx -u key.pub -r key.priv -C jpskey.ctx
tpm2_evictcontrol -A o -c jpskey.ctx -S 0x81000004
***************

I ran encrypt and decrypt and they worked.

***************
#encypt
tpm2_rsaencrypt -k 0x81000004 -o msg.enc msg.in.txt
#Decrypt
tpm2_rsadecrypt -k 0x81000004 -o msg.out.txt -I msg.enc
****************

But after a power cycle if I run the rsadecrypt again I get this error:
****************
root(a)jpsadmin-TB116C-AN:/home/jps/Temp# tpm2_rsadecrypt -k 0x81000004 -o =
msg.out.txt -I msg.enc
ERROR: rsaDecrypt failed, error code: 0x84
****************

Which means "value is out of range or is not correct for the context"

What am I doing wrong?  I am using version 3.1.3

Thanks,
Trey




On Fri, Oct 18, 2019, at 6:10 PM, Tadeusz Struk wrote:
> On 10/18/19 2:17 PM, Trey Weaver wrote:
> > I can rerun the rsadecrypt line a 1000 times and it works fine.=C2=A0 B=
ut if
> > I reboot my system and run it I get this error:
> > =

> > */ps(a)jpsadmin-TB116C-AN:~/Temp$ tpm2_rsadecrypt -V -k 0x81000004 -o
> > msg.out2.txt -I msg.enc/**/
> > /*
> > */ERROR on line: "82" in file: "tools/tpm2_rsadecrypt.c": rsaDecrypt
> > failed, error code: 0x84/**/
> > /*
> > */ERROR on line: "168" in file: "tools/tpm2_tool.c": Unable to run
> > tpm2_rsadecrypt/**/
> > /*
> > =

> > What good is persistence if it does not work over a power cycle?
> > =

> > What am I doing wrong?
> =

> You need to make the primary also persistent or after reboot recreate it
> using exactly the same parameters.
> =

> --
> Tadeusz
>
--===============5532856860081269378==--

