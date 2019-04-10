Content-Type: multipart/mixed; boundary="===============1141101025913295629=="
MIME-Version: 1.0
From: Ralf Schlatterbeck <rsc at runtux.com>
Subject: [tpm2] tpm2-tss-engine
Date: Wed, 10 Apr 2019 18:27:17 +0200
Message-ID: <20190410162717.svaoj3go7sh33dqu@runtux.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1141101025913295629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
-- =

Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
Open Source Consulting                  www:   http://www.runtux.com
Reichergasse 131, A-3411 Weidling       email: office(a)runtux.com

--===============1141101025913295629==--

