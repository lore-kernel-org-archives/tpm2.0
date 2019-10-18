Content-Type: multipart/mixed; boundary="===============8231300353106375994=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Persistance Not working
Date: Fri, 18 Oct 2019 15:10:43 -0700
Message-ID: <50769586-7ac4-73de-22e9-7eea2bbb5b3a@intel.com>
In-Reply-To: 67ae3571-0e90-459a-9172-47cd298874c9@www.fastmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8231300353106375994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/18/19 2:17 PM, Trey Weaver wrote:
> I can rerun the rsadecrypt line a 1000 times and it works fine.=C2=A0 But=
 if
> I reboot my system and run it I get this error:
> =

> */ps(a)jpsadmin-TB116C-AN:~/Temp$ tpm2_rsadecrypt -V -k 0x81000004 -o
> msg.out2.txt -I msg.enc/**/
> /*
> */ERROR on line: "82" in file: "tools/tpm2_rsadecrypt.c": rsaDecrypt
> failed, error code: 0x84/**/
> /*
> */ERROR on line: "168" in file: "tools/tpm2_tool.c": Unable to run
> tpm2_rsadecrypt/**/
> /*
> =

> What good is persistence if it does not work over a power cycle?
> =

> What am I doing wrong?

You need to make the primary also persistent or after reboot recreate it
using exactly the same parameters.

--
Tadeusz
--===============8231300353106375994==--

