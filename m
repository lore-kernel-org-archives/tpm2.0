Content-Type: multipart/mixed; boundary="===============3835884337814266156=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] TPM2.0 chip access restriction
Date: Fri, 13 Jul 2018 13:12:27 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C056B6@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAMCukfUS=uxEoponKvJ==ngEvHbjpZvtgQenBr-sFD9GXzg0pw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3835884337814266156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of John Brown
> Sent: Wednesday, July 11, 2018 5:25 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] TPM2.0 chip access restriction
> =

> Hello all,
> =

> =

> =

> =

> I do not know how to approach the issue of access restriction to the tpm2=
.0 chip.
> =

> =

> =

> =

> I would like to use tpm chip to store private keys and would like to be s=
ure that
> the key can be only used by apps that I allow to do it and I think that t=
his would
> increase the security level of the whole system. In TPM2.0 chip the priva=
te key is
> hidden, but if every application is allowed to perform operations on this=
 key and
> (for example) the attacker would be able to run some malicious applicatio=
n as
> normal user, he can use it to receive from remote device some data, perfo=
rm
> operations on the private key, and send the result back. In the result th=
e remote
> device would behave as it would have the private key. And many other scen=
arios
> are possible. So what is the correct way to restrict the access to the TP=
M chip?
> =

> =

> =

> =

> - I know that every key can have a password to protect it but in that cas=
e there is
> a problem where to store this password in a secure way that only allowed =
apps
> can read it.

Why would you store the password? You could also derive it from some secret=
. The pub
And priv files used for access, if you don't use a password, access to thos=
e files means
Access to the key itself.

> =

> =

> =

> =

> - if an app use tss it talks to abrmd via d-bus and some pipes (am i righ=
t?). Can the
> d-bus be used somehow to restrict access to tpm2.0 chip? Can this pipes b=
e used
> in a malicious way?

I think SE Linux has dbus integration. Additionally, the dbus interface has=
 access controls,
but I am not fluent in them.

> =

> =

> =

> =

> - I also know that PCRs can be used during boot to allow private key acce=
ss when
> the system is not corrupted. But this does not prevent the malicous priva=
te key
> usage when the attacker put the application to already booted device with=
 key
> unlocked.

Parsing error.

> =

> =

> =

> =

> I am already lost in the dark with this. Can somebody put some light on t=
his issue?
> =

> =

> =

> =

> Best regards,
> =

> John
> =

> =

> =

> =

> =

> =

> =



--===============3835884337814266156==--

