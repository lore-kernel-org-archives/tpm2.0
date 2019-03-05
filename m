Content-Type: multipart/mixed; boundary="===============8383017722865871451=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Use endorsement key for encryption and decryption
Date: Tue, 05 Mar 2019 17:29:10 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CFA6CA@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CA+tUB7B6yeHEKb5D6J9K__ZCU1L_HPr82w370SsLieA4-iQu3g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8383017722865871451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of arjun kashyap
> Sent: Sunday, March 3, 2019 12:58 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Use endorsement key for encryption and decryption
> =

> Hello all,
> =

> I am using the IBM tpm2.0 simulator. My use case is that I would like to =
encrypt
> data and send to tpm and then decrypt this at the tpm side. I would want =
to use
> the endorsement key (EK) for this purpose. Hence, I would like to encrypt=
 data
> using EK's public key and decrypt using EK's private key. I tried creatin=
g EK using
> tpm2_createek -G rsa -f pem -c - -p ek.pem. Now, I have the ek.pem( public
> portion of EK) to encrypt the data. When I load this key into the tpm and=
 invoke
> tpm2_rsadecrypt I get an error. I also tried using tpm2_createprimary to =
create
> an EK but failed in the above attempt. Could anyone please help me out so=
 that I
> can use EK to encrypt/decrypt data.
> =

> Please let me know if more information is needed.

What's the error code? You probably can't perform an rsadecrypt,
Do to object attributes. I would bet sign would work. Endorsement
usually means signing.

> =

> Thanks in advance.
> =

>  <https://www.avast.com/sig-
> email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
> email&utm_content=3Dwebmail&utm_term=3Dicon> 	 Virus-free.
> www.avast.com <https://www.avast.com/sig-
> email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
> email&utm_content=3Dwebmail&utm_term=3Dlink>


--===============8383017722865871451==--

