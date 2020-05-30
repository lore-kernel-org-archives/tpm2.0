Content-Type: multipart/mixed; boundary="===============6968328513609426597=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: key destruction
Date: Sat, 30 May 2020 20:38:14 +0000
Message-ID: <20200530203814.2851.99582@ml01.vlan13.01.org>
In-Reply-To: 5bcc1bd1-0adb-54da-929f-4d3eb14d1e19@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6968328513609426597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Of the many ways, you can achieve this here is a way to do it with PolicyPc=
r --> Extend a random value to debug-PCR (PCR#16) and create a key with pol=
icypcr referencing the debug PCR.

As long as no other data is extended into the debug-PCR from this point on =
the key can be used indefinitely as long as pcrpolicy is satisfied.

Extend the debug-PCR once again with another random value once ready to dum=
p the key. The only reason to use debug-PCR 16 is if you do not want to dis=
turb other PCR values potentially invalidating the authorization of other T=
PM objects.

Note: Instead of extending the debug-PCR with a random value, you can also =
achieve the same result by simply issuing tpm2_pcrreset on the debug-PCR wh=
ich will change the pcr contents to 0. This will happen anyway when the sys=
tem or TPM restarts.
--===============6968328513609426597==--

