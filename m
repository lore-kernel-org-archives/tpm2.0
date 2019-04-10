Content-Type: multipart/mixed; boundary="===============3241118640319987298=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] tpm2-tss-engine
Date: Wed, 10 Apr 2019 18:54:19 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0162E973D6@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 20190410162717.svaoj3go7sh33dqu@runtux.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3241118640319987298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As Bill already said:
- The keys are only known to the TPM and will never be known outside, so th=
ey cannot be "stolen" or copied.
   Think of heartbleed or any other hacker break into your system
- You can define an openssl.cnf file and env variable. See https://www.open=
ssl.org/docs/man1.1.0/man5/config.html

P.S. The TPM is much slower than software. So it's not suited for high-load=
 servers, but low-load servers or clients.
(yes, works with client authentication as well)

I now remember that I wanted to provide a openssl.cnf.sample file.
Will add a bug for this.

Cheers,
Andreas
________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Ralf Schlatterbeck [r=
sc(a)runtux.com]
Sent: Wednesday, April 10, 2019 18:27
To: tpm2(a)lists.01.org
Subject: [tpm2] tpm2-tss-engine

I'm testing with a TPM-2 module for the Raspberry-Pi from Infineon
running on an Orange-Pi zero (also a single-board computer a little
smaller than the raspi).
I've successfully built tpm2-tss-engine and have the following questions:
- The key generation examples in the README.md create the private key in
  a file on the local filesystem. Isn't the purpose of a
  hw-security-module that the key stays inside the device and can't be
  extracted? Or am I missing something here? Is there a way to create a
  protected key inside the device in a way that it cannot be extracted?
- I'm not familiar with the engine concept of OpenSSL, is there a way to
  use the engine with a software that is not engine-aware? In my case
  the mosquitto message broker. Or would I have to modify the software?

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

--===============3241118640319987298==--

