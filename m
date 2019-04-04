Content-Type: multipart/mixed; boundary="===============2325261472886265999=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] tpm2-totp v0.1.1
Date: Thu, 04 Apr 2019 12:24:34 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0162E8766D@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 4a7d4f88699a71729ee0db163dd2196f0320c4b3.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2325261472886265999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Just to prevent any misinterpretation, this is not about using the
TPM to do OTP on behalf of the user, but for the TPM to do OTP
to authenticate against the user. At least that was the intention
of mjg and I merely reimplemented.

I guess you could use it for this, but I'd rather try a different route.
Do you know if there already exist any OTP or Yubikey APIs that
we could hook into with a new library, so we are available on all
OTP-supporting applications ?

________________________________________
From: David Woodhouse [dwmw2(a)infradead.org]
Sent: Thursday, April 04, 2019 12:44
To: Fuchs, Andreas; tpm2(a)lists.01.org
Subject: Re: [tpm2] tpm2-totp v0.1.1

On Thu, 2019-04-04 at 10:10 +0000, Fuchs, Andreas wrote:
> Hello all,
>
> the first bugfix release for tpm2-totp 0.1.1 is out:
> https://github.com/tpm2-software/tpm2-totp/releases/tag/v0.1.1

Oooh, shiny. How do we use it?

Let's use OpenConnect as an example; we have lots of OTP support there
already including liboath and direct PC/SC support for Yubikey OTP. I'd
love to support this too.

Do I need to (and by extension, does *every* application need to) add
specific support for libtpm2-totp? Does it have pkg-config support so
that the application's build system can even detect its presence?

Or can this be done as an extension to the existing liboath? And
perhaps even an extension to the PSKC file formats to specify that it
should be used?

Can it support HOTP too?

--===============2325261472886265999==--

