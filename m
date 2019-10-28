Content-Type: multipart/mixed; boundary="===============6973468634318666349=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: sending commands to simulator
Date: Mon, 28 Oct 2019 13:28:05 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E2BEE8@ORSMSX101.amr.corp.intel.com>
In-Reply-To: a5a92112-ae79-e7c5-2064-49a8b0f7d323@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6973468634318666349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Struk, Tadeusz
> Sent: Friday, October 25, 2019 5:11 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] sending commands to simulator
> =

> On 10/25/19 12:19 PM, Roberts, William C wrote:
> >   if [ "$raw" =3D=3D "yes" ]; then
> >     echo -n "$cmd" | nc -N "$ip" "$port"
> >   else
> >     echo -n "$cmd" | xxd -p -r | nc -N "$ip" "$port"
> >   fi
> =

> Looks good. Would be even better if we make sure that the response from t=
he
> mssim (4 bytes) is 0x00 00 00 00 (success) and print an error msg otherwi=
se.

Yeah that would be nice. The simulator always returns 0 unless you give it =
a garbage
Command, at that point the simulator prints an error message so at least yo=
u know.

> =

> --
> Tadeusz

--===============6973468634318666349==--

