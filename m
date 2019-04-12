Content-Type: multipart/mixed; boundary="===============3760795472472166385=="
MIME-Version: 1.0
From: Ralf Schlatterbeck <rsc at runtux.com>
Subject: Re: [tpm2] tpm2-tss-engine
Date: Fri, 12 Apr 2019 09:58:28 +0200
Message-ID: <20190412075828.yzfyhkaz34s362p5@runtux.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0162EA1A72@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3760795472472166385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 08:19:57PM +0000, Fuchs, Andreas wrote:
> - You need to somehow tell openssl to use "keyform =3D engine"
>   Unfortunately, I don't currently know how to do this using the openssl.=
cnf
> =

> Once we merge PR https://github.com/tpm2-software/tpm2-tss-engine/pull/89
> The loading of keys should work without the "keyform =3D engine" settings.
> Until then, I'm unsure how exactly this can be managed.

That looks promising. So can I asume that with keyform =3D engine an
existing client can use the engine without additional code changes? I'll
try to find out if I can set the keyform parameter in the ssl config.

> - The engine already support ECDSA. Have a look at the -alg parameter
> of tpm2tss-genkey

Oh. I was irritated by

root(a)sun8i:/etc/mosquitto# openssl engine -c -vvvv -t tpm2tss
(tpm2tss) TPM2-TSS engine for OpenSSL
 [RSA, RAND]
...
which indicates it does support only RSA?

> - An wrt documentation: I'd appreciate anything you seem fit.
>   Preferably as PullRequest or as Issue on github. Emails just allways
>   get lost.

OK I'll look into this but don't know enough yet about the tpm to
describe the key protection in more detail. But I think I can come up
with a note that hopefully would prevent the questions I asked for
someone coming later :-)

Thanks
Ralf
-- =

Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
Open Source Consulting                  www:   http://www.runtux.com
Reichergasse 131, A-3411 Weidling       email: office(a)runtux.com

--===============3760795472472166385==--

