Content-Type: multipart/mixed; boundary="===============8251580761832985579=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Need help in understanding tpm2_makecredential command
Date: Tue, 15 Jan 2019 19:47:27 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CD9916@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 719ABFC3E12B42478A54CF74AFDB16B04C60A6@BGSMSX105.gar.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8251580761832985579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have no idea.

> -----Original Message-----
> From: Dhawale, Dinkar
> Sent: Tuesday, January 8, 2019 1:56 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; Rawat, Arvind
> <arvind.rawat(a)intel.com>; tpm2(a)lists.01.org
> Cc: Ghosh, Arijit <arijit.ghosh(a)intel.com>
> Subject: RE: Need help in understanding tpm2_makecredential command
> =

> + Adding alias
> =

> _____________________________________________
> From: Dhawale, Dinkar
> Sent: Tuesday, January 8, 2019 12:13 AM
> To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >; Rawat, Arvind <arvind.rawat(a)i=
ntel.com
> <mailto:arvind.rawat(a)intel.com> >
> Cc: Ghosh, Arijit <arijit.ghosh(a)intel.com <mailto:arijit.ghosh(a)intel.=
com> >
> Subject: RE: Need help in understanding tpm2_makecredential command
> =

> =

> Hi William,
> =

> We fixed following after parsing last 256 bytes for Endorsement Key Modul=
us
> from tpm2_readpublic. However, we have landed in strange issue. We have j=
ava
> implementation of tpm2_makecredentials in our code as it is done on Attes=
tation
> Server (which can be installed on VM).
> =

> This implementation needed few output formatting changes as per new format
> of tpm2_activatecredentials. We did those changes and these were working =
fine
> on Purley server. However, same changes are not working on Simics server.
> Simics server crashes while activating credentials and we get following e=
xception
> on console,
> 		ASSERTION ERROR: Key is too large.
> 		D:\mp\builds\4653165\simics-base\src\extensions\crypto-
> engine\backends/openssl-wrap.c:599:
> 		Simics core build 5189
> 		Module: Fri Nov 09 13:14:08 2018
> 		Please report this.
> 		#0 0x000000006a87fad0
> (C:\PROGRA~1\Simics\SIMICS~1\SIMICS~1.165\win64\bin\libsimics-common.dll
> + 0x3fad0)
> 		The simulation state has been corrupted. Simulation cannot
> continue.
> 		Please restart Simics.
> =

> Surprisingly, we did not face this issue when we used tpm2_makecredentials
> commands itself. Could you please review our attached implementation (from
> line no 100)? and let us know if we need to make any changes with upgraded
> tpm2 tools.
>  << File: Tpm2.java >>
> Thanks,
> -Dinkar
> =

> -----Original Message-----
> From: Roberts, William C
> Sent: Monday, December 31, 2018 9:01 PM
> To: Rawat, Arvind <arvind.rawat(a)intel.com <mailto:arvind.rawat(a)intel.=
com> >
> Cc: Dhawale, Dinkar <dinkar.dhawale(a)intel.com
> <mailto:dinkar.dhawale(a)intel.com> >; Ghosh, Arijit <arijit.ghosh(a)inte=
l.com
> <mailto:arijit.ghosh(a)intel.com> >
> Subject: RE: Need help in understanding tpm2_makecredential command
> =

> From what I understand, this TPM2_MakeCredential is a convenience function
> that can be done externally from the TPM as described in section 24 of:
> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-
> Architecture-01.38.pdf
> =

> The only other thing I could think of making something end up at size 256=
 is:
> 1. The key length of an RSA2048 key (as you pointed out, modulus size) 2.=
 The
> name-algorithm as part of the KDFa routine to generate the symmetric key.
> =

> We use sha256 as the default name algorithm in all places (if we don't th=
at's a
> bug).
> =

> Bill
> =

> > -----Original Message-----
> > From: Rawat, Arvind
> > Sent: Friday, December 28, 2018 8:21 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> > Cc: Dhawale, Dinkar <dinkar.dhawale(a)intel.com
> <mailto:dinkar.dhawale(a)intel.com> >; Ghosh, Arijit
> > <arijit.ghosh(a)intel.com <mailto:arijit.ghosh(a)intel.com> >
> > Subject: Need help in understanding tpm2_makecredential command
> >
> > Hi William,
> >
> >
> >
> > I was trying to code a software implementation of tpm2_makecredential
> > command. From what I understood by looking at the tpm2_makecredential
> > code under tpm2-tools, I think that the command is performing RSA
> > encryption on random data and generating an encrypted secret along
> > with a credential blob with a 8 byte header appended at the beginning.
> > I tried to do the same in my software implementation as well. I am
> > using the same set of input in my implementation as used by
> tpm2_makecredentail command from tpm2-tools.
> >
> >
> >
> > However, I found that the output generated from my implementation and
> > tpm2- tools implementation are different. I tried comparing the hex
> > bytes of the two output blobs and I found that the encrypted secret
> > part is different in the two blobs. With tpm2-tools implementation, I
> > am getting encrypted secret of size 256 bytes, whereas with my
> > implementation, the encrypted secret size is coming as
> > 316 bytes. I did some research on the RSA encryption and found that
> > the encrypted secret size depends on the modulus size. If a key
> > modulus is 256 bytes in size, then it will generate 256 bytes
> > encrypted secret no matter what the input data size is.
> >
> >
> >
> > Based on the above research, I tried to found the modulus size of EK
> > public key which is passed as an input to tpm2_makecredential command,
> > and found that the modulus size is 316 bytes. Hence, I am getting
> > encrypted secret of size 316 bytes with my implementation. But my
> > question is, since I am passing same EK public key to tpm2-tools
> > implementation as well, then how come there the encrypted secret is
> > getting generated of size 256 bytes. Ideally it should also be of
> > 316 bytes. Can you tell me what additional thing the tpm2-tools
> > implementation of tpm2_makecredential command is doing other than RSA
> > encryption that is causing the encrypted secret size to be of 256 bytes=
 instead
> of 316 bytes.
> >
> >
> >
> > I am using tpm2-tools version 3.0.4 with tpm2-abrmd service.
> >
> >
> >
> > Thanks,
> >
> > Arvind


--===============8251580761832985579==--

