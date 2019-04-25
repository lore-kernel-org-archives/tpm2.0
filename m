Content-Type: multipart/mixed; boundary="===============3059378078329546355=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] unsealing and evictcontrol issues
Date: Thu, 25 Apr 2019 14:07:20 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D2EFBA@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 64613f12-a912-cf87-e3f0-fd801206fa8c@twobit.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3059378078329546355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Invalid nonce-sizes I made some progress on, see:
https://github.com/tpm2-software/tpm2-tss/pull/1386

That should fix that issue. Andreas said he would do a stable backport
And release:
https://github.com/tpm2-software/tpm2-tss/issues/1387


> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Philip Tricca
> Sent: Wednesday, April 24, 2019 8:56 AM
> To: Luke Flinders <lflinders(a)ip-performance.co.uk>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] unsealing and evictcontrol issues
> =

> On 4/23/19 1:46 AM, Luke Flinders wrote:
> > Hi all,
> >
> > Sorry for digging up potentially old issues but I have run into two
> > issues that have been listed in your 2019-February archive.
> >
> > Those being;
> >
> > Invalid nonce size and during =C2=A0unsealing =C2=A0( when using the ma=
ster
> > repositories )
> =

> This is a known issue:
> https://github.com/tpm2-software/tpm2-tools/issues/1381
> =

> > Error code: 0x1c4 during tpm2_evictcontrol (when using Tools 3.1.4-rc0
> > , tss =3D 2.1.3_rc0 , abrmd =3D 2.1.1_rc0 )
> =

> Please use the tpm2_rc_decode tool to decode the hex response codes.
> This one decodes to: "tpm:parameter(1):value is out of range or is not co=
rrect for
> the context".
> =

> > For both the above I am using a physical TPM.
> =

> Do your commands succeed when executed against the simulator?
> =

> =

> > I was just wondering if any progress had been made with these issues
> > and if I could help with some testing?
> =

> Using Github to receive notifications for state changes on issues you're
> interested in is probably the best way to track progress.
> =

> Philip
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============3059378078329546355==--

