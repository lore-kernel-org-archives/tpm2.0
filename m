Content-Type: multipart/mixed; boundary="===============0732818337209657232=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.org>
Subject: Re: [tpm2] unsealing and evictcontrol issues
Date: Wed, 24 Apr 2019 08:56:14 -0700
Message-ID: <64613f12-a912-cf87-e3f0-fd801206fa8c@twobit.org>
In-Reply-To: AM5PR0701MB22899F8DB27ED7204E288FE2C5230@AM5PR0701MB2289.eurprd07.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0732818337209657232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/23/19 1:46 AM, Luke Flinders wrote:
> Hi all,
> =

> Sorry for digging up potentially old issues but I have run into two
> issues that have been listed in your 2019-February archive.
> =

> Those being;
> =

> Invalid nonce size and during =C2=A0unsealing =C2=A0( when using the mast=
er
> repositories )

This is a known issue:
https://github.com/tpm2-software/tpm2-tools/issues/1381

> Error code: 0x1c4 during tpm2_evictcontrol (when using Tools 3.1.4-rc0 ,
> tss =3D 2.1.3_rc0 , abrmd =3D 2.1.1_rc0 )

Please use the tpm2_rc_decode tool to decode the hex response codes.
This one decodes to: "tpm:parameter(1):value is out of range or is not
correct for the context".

> For both the above I am using a physical TPM.

Do your commands succeed when executed against the simulator?


> I was just wondering if any progress had been made with these issues and
> if I could help with some testing?

Using Github to receive notifications for state changes on issues you're
interested in is probably the best way to track progress.

Philip

--===============0732818337209657232==--

