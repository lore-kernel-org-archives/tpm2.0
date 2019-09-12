Content-Type: multipart/mixed; boundary="===============9041866316475529147=="
MIME-Version: 1.0
From: David Woodhouse <dwmw2 at infradead.org>
Subject: Re: [tpm2] Using TPM to protect private key
Date: Thu, 12 Sep 2019 11:48:14 +0000
Message-ID: <c9187c543d0313ac1107160acf514058.squirrel@twosheds.infradead.org>
In-Reply-To: CAE8e83Tjevi1Vcm81FUr3oiUEU_z128XQ6oziuzUAm=Nen753g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9041866316475529147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> We intent to use this certificate in IPSec VPN.

I see. What application or tools will you use with this VPN? Do you
already have it working with software certificates (not in the TPM)?

>> There is about one "well-behaved" application in the world according to
>> this definition, and I wrote it. But we're working on fixing the rest,
>> and fixing the crypto libraries like OpenSSL and GnuTLS to make it easy
>> for applications to get it right.
>>
>> [ashoka]
> Can you please provide a pointer to your application (if  that is publicly
> available)?

http://www.infradead.org/openconnect/tpm.html

It does IPsec :)

-- =

dwmw2


--===============9041866316475529147==--

