Content-Type: multipart/mixed; boundary="===============5781234095551605350=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Loading keys
Date: Wed, 10 Jul 2019 19:16:27 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DCC012@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CA+M7zR13GB7iLXO=9EK4ocJ97JARx6pF-soi3G-kaOX_XnXJng@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5781234095551605350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of ramyasnair
> ramyasnair
> Sent: Wednesday, July 10, 2019 2:22 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Loading keys
> =

> Hi,
> When I try to load keys,the files are getting stored as .pub and .priv. W=
hy is the
> private key getting stored in the disk?Even after I load the files also r=
emains in
> the disk. The TPM is supposed to store it in the chip itself as far as I =
understand it.
> Thanks and regards
> Ramya

The TPM has two different types of memory, volatile and non-volatile. By de=
fault, when you
create an object, it's in the non-volatile memory as a "transient object". =
That object goes
away on generally two conditions:
1. Tpm reboot
2. evicted from the tpm via tpm2_evictcotrol.

Those pub and priv files are sealed to your TPM. Internally, the TPM encryp=
ts and integrity
protects those blobs. So in theory, the worst thing an attacker can do if t=
hey get ahold of
those blobs is DoS via delete (requires fs permissions). Key use attacks sh=
ould be thwarted
by strong policies and DA lockout Protections. You should still protect tho=
se files with good
DAC and MAC controls.

When you call tpm2_load with the .pub and .priv files, that command loads t=
he object into
Non-volatile memory and gives you back a context file to reference that obj=
ect from. However,
You can use tpm2_evictcontrol to persist the object at a non-volatile locat=
ion and reference
That object via a raw tpm handle (think of it like a pointer address in C) =
or an ESYS_TR blob file
Which provides mechanisms against MITM attacks. It ensures that the object =
you want to get to
Via an index into non-volatile memory is the object you expect it to be.

After you have an object loaded and have its context file, which is only go=
od for that boot of the TPM,
You can persist it like so:

tpm2_evictcontrol -a o -c key.ctx -o key.handle

You can use the -p command to indicate a specific index to persist the obje=
ct/key at, or you can just
Not use -p and it will pick the first open slot. The tool outputs in YAML w=
hat happened and the
Index it persisted it at.

Bill



--===============5781234095551605350==--

