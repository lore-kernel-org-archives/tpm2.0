Content-Type: multipart/mixed; boundary="===============3618758549909538931=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Question about importing keys into the tpm
Date: Tue, 16 Jul 2019 15:45:36 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DCE450@ORSMSX101.amr.corp.intel.com>
In-Reply-To: DM5PR03MB29697C1E181822CE2AFC2128E6CF0@DM5PR03MB2969.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3618758549909538931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As Andreas pointed out, hmac !=3D aes.

There are two ways to get an externally generated key into the TPM:
1. tpm2_import
2. tpm2_loadexternal

The difference is, whether or not you need/want the object to be protected =
by the TPM.
If you import it, it's protected by the parent object. This is usually what=
 people want
for keys.

Example for importing an AES128 key:
tpm2_createprimary -o primary.ctx
dd if=3D/dev/urandom of=3Drand.key bs=3D1 count=3D16
tpm2_import -C primary.ctx -G aes -u key.pub -r key.priv -i rand.key

I think there's two issues:
1. the man page needs corrections.
2. we don't support hmac keys in import.
See: https://github.com/tpm2-software/tpm2-tools/issues/1597

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Gallagher, J=
ames
> Sent: Monday, July 15, 2019 7:03 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Question about importing keys into the tpm
> =

> Hello,
> =

> I am looking to import a premade 128 bit key into a TPM with the intentio=
n of
> using it for the tpm2_hmac function. I think the tpm2_import command is w=
hat I
> am looking for, but I am having trouble getting it working. The tpm2_impo=
rt spec
> sheet has an example to follow but it failed for me. Any help would be gr=
eatly
> appreciated.
> =

> =

> =

> =

> The commands I tried to run:
> =

> sudo tpm2_createprimary -Grsa2048:aes128cfb -C o -P <password> -o parent.=
ctx
> sudo dd if=3D/dev/urandom of=3Drand.key bs=3D1 count=3D16 sudo tpm2_impor=
t -C
> parent.ctx -G aes128cfb -i rand.key
> =

> The output from running tpm2_import:
> ERROR: Unsupported key type
> =

> note: also tried " sudo tpm2_import -C parent.ctx -G aes128cfb -i rand.ke=
y -u
> key.pub -r key.priv " which returns the same error.
> =

> =

> additional information:
> =

> TPM: infineon optiga SLB 9670 tpm2.0 iridium board
> =

> PC: raspberry pi 3
> =

> OS: raspbian "buster "
> =

> =

> =

> =

> Thank you for your time,
> =

> James Gallagher


--===============3618758549909538931==--

