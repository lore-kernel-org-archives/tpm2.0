Content-Type: multipart/mixed; boundary="===============7795519303471185909=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: tpm2-tss fapi tests failing with new openssl
Date: Mon, 28 Jun 2021 10:44:00 +0000
Message-ID: <AM8P194MB16751C4988C832F96173DA22A6039@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: 20210628115527.14115CA3@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7795519303471185909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The EK-CA for the test harness is built right here:
https://github.com/tpm2-software/tpm2-tss/tree/master/script/ekca

I hope this helps with debugging.
If not just ask me more...

________________________________________
Von: Petr Gotthard <petr.gotthard(a)centrum.cz>
Gesendet: Montag, 28. Juni 2021 11:55
An: tpm2(a)lists.01.org
Betreff: [tpm2] tpm2-tss fapi tests failing with new openssl

Hello,

I have troubles debugging the FAPI tests. I am seeing error messages "Could=
 not open file or uri for loading certificate", but I have no idea where th=
ese are coming from. For example, in "tpm2-tss/test/integration/fapi-data-c=
rypt-rsa.log" I see

Could not open file or uri for loading certificate from /home/petr/projects=
/tpm2-tss/test/integration/fapi-data-crypt-rsa.fint_ekcert.crt
C05DA65E427F0000:error:80000002:system library:file_open:No such file or di=
rectory::0:calling stat(/home/petr/projects/tpm2-tss/test/integration/fapi-=
data-crypt-rsa.fint_ekcert.crt)
Unable to load certificate
Could not open file or uri for loading certificate from /home/petr/projects=
/tpm2-tss/test/integration/fapi-data-crypt-rsa.fint_ekecccert.crt
C08D22FEE77F0000:error:80000002:system library:file_open:No such file or di=
rectory::0:calling stat(/home/petr/projects/tpm2-tss/test/integration/fapi-=
data-crypt-rsa.fint_ekecccert.crt)
Unable to load certificate
cat: /home/petr/projects/tpm2-tss/test/integration/fapi-data-crypt-rsa.fint=
_ekcert.crt: No such file or directory
WARNING:test:test/helper/tpm_writeekcert.c:92:main() Cert input size is 0
WARNING:test:test/helper/tpm_writeekcert.c:95:main() Define NV cert with nv=
 index: 1c00002
cat: /home/petr/projects/tpm2-tss/test/integration/fapi-data-crypt-rsa.fint=
_ekecccert.crt: No such file or directory
WARNING:test:test/helper/tpm_writeekcert.c:92:main() Cert input size is 0
WARNING:test:test/helper/tpm_writeekcert.c:95:main() Define NV cert with nv=
 index: 1c0000a
Execute the test script


The "tpm2-tss/test/integration/fapi-data-crypt-rsa.fint_ca.log" indicates(?=
) these files should(?) have been created:

Creating ekcert for /home/petr/projects/tpm2-tss/test/integration/fapi-data=
-crypt-rsa.fint_ekpub.pem =3D> /home/petr/projects/tpm2-tss/test/integratio=
n/fapi-data-crypt-rsa.fint_ekcert.crt
Creating ekcert for /home/petr/projects/tpm2-tss/test/integration/fapi-data=
-crypt-rsa.fint_ekeccpub.pem =3D> /home/petr/projects/tpm2-tss/test/integra=
tion/fapi-data-crypt-rsa.fint_ekecccert.crt

But the certificates are not there. The PEM keys yes, the CRT files no.

I tried to find which openssl(?) command does this certificate creation, bu=
t it is somewhere well hidden.


This is not a bug in the tpm2-tss. I am using the new OpenSSL 3.0 and my he=
avily modified tpm2-tss code. The bug is in one of these two-- I have just =
serious troubles finding it.

Could you please give me some hint where should I look? Where is the comman=
d generating these certificates, please?



Kind Regards,
Petr

_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============7795519303471185909==--

