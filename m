Content-Type: multipart/mixed; boundary="===============2173393580935539650=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Check to see if signature is okay, then reboot
Date: Thu, 05 Dec 2019 22:34:09 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E4C7F7@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CALtZhhPDzuOtMY45JbacHpUe+4rribj5pOxE0rUBnS-R1Krs6A@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2173393580935539650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Frederick Gotham [mailto:cauldwell.thomas(a)gmail.com]
> Sent: Thursday, December 5, 2019 12:14 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2 <tpm2(a)list=
s.01.org>
> Subject: Re: Check to see if signature is okay, then reboot
> =

> > But anyways, you can use nvram to store it, and then use the key
> > externally with openssl or call tpm2_loadexternal again.
> =

> =

> =

> =

> First I will try to load a keypair into the TMP2, such that the private p=
art is garbage
> but the public part is correct.

That only works for the null hierarchy, which get you back to tpm2_evictcon=
trol error.
Per spec of tpm2_loadexternal:
Load of a public external object area allows the object be associated with =
a hierarchy so that the correct
algorithms may be used when creating tickets. The hierarchy parameter provi=
des this association. If the
public and sensitive portions of the object are loaded, hierarchy is requir=
ed to be TPM_RH_NULL.

I would also be surprised if the tpm2_loadexternal tool's interface would b=
e flexible enough to allow this easily.

Even if you got this to work, you bump back into the evictcontrol issue:
If objectHandle references a Transient Object:
The TPM shall return TPM_RC_ATTRIBUTES if
1) it is in the hierarchy of TPM_RH_NULL,
2) only the public portion of the object is loaded, or
3) the stClear is SET in the object or in an ancestor key.


> =

> =

> To achieve this, I will first try to zero out parts of the private key be=
fore I load it in.
> I'm not sure if this will work. (It works with openssl anyway).

--===============2173393580935539650==--

