Content-Type: multipart/mixed; boundary="===============8460360050172769866=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] tpm2-tss-engine
Date: Thu, 11 Apr 2019 20:19:57 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0162EA1A72@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 20190411154357.4tw3ysiicdkviuxq@runtux.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8460360050172769866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

- You need to somehow tell openssl to use "keyform =3D engine"
  Unfortunately, I don't currently know how to do this using the openssl.cnf

Once we merge PR https://github.com/tpm2-software/tpm2-tss-engine/pull/89
The loading of keys should work without the "keyform =3D engine" settings.
Until then, I'm unsure how exactly this can be managed.

- The engine already support ECDSA. Have a look at the -alg parameter of tp=
m2tss-genkey

- An wrt documentation: I'd appreciate anything you seem fit. Preferably as=
 PullRequest
or as Issue on github. Emails just allways get lost.

Cheers,
Andreas
________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Ralf Schlatterbeck [r=
sc(a)runtux.com]
Sent: Thursday, April 11, 2019 17:43
To: tpm2(a)lists.01.org
Subject: Re: [tpm2] tpm2-tss-engine

On Wed, Apr 10, 2019 at 05:44:09PM +0000, Roberts, William C wrote:
> > -----Original Message-----
> > From: tpm2 On Behalf Of Ralf Schlatterbeck
> > I'm testing with a TPM-2 module for the Raspberry-Pi from Infineon runn=
ing on
> > - The key generation examples in the README.md create the private key in
> >   a file on the local filesystem. Isn't the purpose of a
> >   hw-security-module that the key stays inside the device and can't be
> >   extracted? Or am I missing something here?
>
> That blob of data that gets stored on disk is sealed to that TPM. So
> outside of DOS If someone deletes that keyblob, there's no real way to
> use it to extract the key material Directly from that blob unless they
> break the TPMs crypto mechanism used to protect it.

Thanks, the process of key generation looked too much like the normal
ssl key generation and I didn't look into the key file. It has "BEGIN
TSS2 PRIVATE KEY" which could have told me something had I looked :-)

Shouldn't that be documented in one or two sentences in the README.md?

> > - I'm not familiar with the engine concept of OpenSSL, is there a way to
> >   use the engine with a software that is not engine-aware? In my case
> >   the mosquitto message broker. Or would I have to modify the software?
>
> I think engines can be loaded via the config file or environment variable=
s.

On Wed, Apr 10, 2019 at 06:54:19PM +0000, Fuchs, Andreas wrote:
> - You can define an openssl.cnf file and env variable. See
>   https://www.openssl.org/docs/man1.1.0/man5/config.html

On Thu, Apr 11, 2019 at 11:46:30AM +0300, David Woodhouse wrote:
>
> The engine can be loaded simply by calling ENGINE_by_id("tpm2"). If
> it's installed properly you shouldn't need to mess with config files
> etc.

OK I had hoped that simply plugging an engine into the openssl config
would do the trick for me: Openssl should be smart enough to figure out
via the key file that it can/should use an engine to do the work. Oh
well. My naive approach involved configuring the TSS2 PRIVATE KEY file
as the key-file in mosquitto and setting all the engine stuff (see
below). But this only gets me the
'Error: Unable to load server key file
"/etc/mosquitto/certs/server.key". Check keyfile.'

My current /etc/ssl/openssl.cnf looks as follows, so maybe this can be a
contribution for an example file:

openssl_conf =3D default_conf

[default_conf]
ssl_conf =3D ssl_sect
engines  =3D engine_section

[engine_section]

tpm =3D tpm_section

[tpm_section]

engine_id =3D tpm2
dynamic_path =3D /usr/lib/arm-linux-gnueabihf/engines-1.1/tpm2tss.so
SET_TCTI =3D device:/dev/tpmrm0


So I'm getting correct output:
root(a)sun8i:/# openssl engine -c -vvvv -t tpm2tss
(tpm2tss) TPM2-TSS engine for OpenSSL
 [RSA, RAND]
     [ available ]
     SET_OWNERAUTH: Set the password for the owner hierarchy (default none)
          (input flags): STRING
     SET_TCTI: Set the TCTI module and options (default none)
          (input flags): STRING


Just some questions here:
- I take away from this question that I need to modify sourcecode to
  make an engine work with openssl, is this really the case?
- My TPM 2.0 module from Infineon does support elliptic curves, is there
  a way to support this with the engine? Especially in the light of
  recent ROCA vulnerabilities of Infineon modules I'd like to use EC
  instead of RSA if possible. (see soon-to-come separate posting about ROCA)

Oh, and a note on performance: My singleboard "computer" is an OrangePi
zero, 256M RAM, 100M Ethernet, 5x5cm in size (but quad-core :-) so I'm
not worried about performance here, the goal is a proof-of-concept
implementation.

Thanks
Ralf Schlatterbeck
--
Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
Open Source Consulting                  www:   http://www.runtux.com
Reichergasse 131, A-3411 Weidling       email: office(a)runtux.com
_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

--===============8460360050172769866==--

