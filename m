Content-Type: multipart/mixed; boundary="===============3595771444360782556=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: OpenSSL 3 and tpm2 provider...
Date: Tue, 26 Apr 2022 13:41:54 +0200
Message-ID: <20220426134154.91627B4E@centrum.cz>
In-Reply-To: DS7PR03MB5576F012EB9AAE6CBBA10C919AFB9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3595771444360782556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
you may be missing "-provider default", please try

$ openssl x509 -provider tpm2 -provider default -in handle:0x01000013 -noou=
t -text


Some explanation why is that is here:
https://github.com/tpm2-software/tpm2-openssl/blob/master/docs/initializati=
on.md#loading-multiple-providers

Petr

______________________________________________________________
> Od: "Sievert, James" <james.sievert(a)bsci.com>
> Komu: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
> Datum: 26.04.2022 13:32
> P=C5=99edm=C4=9Bt: [tpm2] OpenSSL 3 and tpm2 provider...
>
>Hi,
>
>I'm using the following OpenSSL version under Ubuntu 22.04:  OpenSSL 3.0.2=
 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022).
>
>I have an EC public key certificate held persistently in a TPM 2.0, handle=
 0x01000013.  I'm attempting the following:
>
>$ openssl x509 -provider tpm2 -in handle:0x01000013 -noout -text
>
>and finding that OpenSSL x509 is unable to load the public key:
>
>Certificate:
>    Data:
>        Version: 3 (0x2)
>        Serial Number: 9177472452311271732 (0x7f5cee922ff24934)
>        Signature Algorithm: ecdsa-with-SHA256
>        Issuer: CN =3D aaaa, OU =3D yyyy, O =3D zzzz
>        Validity
>            Not Before: Apr 25 16:43:35 2022 GMT
>            Not After : Dec 31 12:00:00 2045 GMT
>        Subject: CN =3D xxxx, OU =3D yyyy, O =3D zzzz
>        Subject Public Key Info:
>            Public Key Algorithm: id-ecPublicKey
>            Unable to load Public Key
>402C48BB567F0000:error:03000072:digital envelope routines:X509_PUBKEY_get0=
:decode error:../crypto/x509/x_pubkey.c:458:
>402C48BB567F0000:error:03000072:digital envelope routines:X509_PUBKEY_get0=
:decode error:../crypto/x509/x_pubkey.c:458:
>        X509v3 extensions:
>            X509v3 Basic Constraints: critical
>                CA:FALSE
>            X509v3 Authority Key Identifier:
>                B0:06:08:77:FC:C0:3B:0A:F5:8E:0C:B8:F1:DE:A9:55:8B:E5:F1:79
>            X509v3 Extended Key Usage:
>                TLS Web Client Authentication, Code Signing, E-mail Protec=
tion, TLS Web Server Authentication
>            X509v3 Subject Key Identifier:
>                4D:5D:71:84:B5:D9:7B:B1:11:52:58:BC:5E:BE:A8:0D:8C:AE:17:63
>            X509v3 Key Usage: critical
>                Digital Signature, Non Repudiation, Key Encipherment
>    Signature Algorithm: ecdsa-with-SHA256
>    Signature Value:
>        30:44:02:20:5b:ce:5e:3f:67:85:11:42:d5:5f:2a:ba:cd:12:
>        f2:e7:bd:0e:f5:9e:ae:d1:65:8d:9c:d3:dc:7c:8d:63:ec:07:
>        02:20:33:3f:b6:22:39:62:ff:3b:9f:21:eb:43:e1:9e:40:31:
>        39:fb:14:a8:1f:c9:33:48:18:99:33:dd:03:86:2c:0e
>
>I am able to do this:
>
>$ openssl x509 -provider tpm2 -in handle:0x01000013 | openssl x509 -in /de=
v/stdin -noout -text
>Certificate:
>    Data:
>        Version: 3 (0x2)
>        Serial Number: 9177472452311271732 (0x7f5cee922ff24934)
>        Signature Algorithm: ecdsa-with-SHA256
>        Issuer: CN =3D aaaa, OU =3D yyyy, O =3D zzzz
>        Validity
>            Not Before: Apr 25 16:43:35 2022 GMT
>            Not After : Dec 31 12:00:00 2045 GMT
>        Subject: CN =3D xxxx, OU =3D yyyy, O =3D zzzz
>        Subject Public Key Info:
>            Public Key Algorithm: id-ecPublicKey
>                Public-Key: (256 bit)
>                pub:
>                    04:eb:d3:da:02:5a:43:4e:5c:1a:b5:09:e7:6a:8e:
>                    1e:65:9f:eb:ab:35:d5:33:f9:1f:16:bf:d8:0d:c6:
>                    f0:09:ae:10:60:3d:82:cf:46:29:a0:a9:24:47:dd:
>                    e2:5a:ea:97:b6:c1:6a:fa:b2:8a:7c:30:36:36:1a:
>                    8a:e2:91:62:4b
>                ASN1 OID: prime256v1
>                NIST CURVE: P-256
>        X509v3 extensions:
>            X509v3 Basic Constraints: critical
>                CA:FALSE
>            X509v3 Authority Key Identifier:
>                B0:06:08:77:FC:C0:3B:0A:F5:8E:0C:B8:F1:DE:A9:55:8B:E5:F1:79
>            X509v3 Extended Key Usage:
>                TLS Web Client Authentication, Code Signing, E-mail Protec=
tion, TLS Web Server Authentication
>            X509v3 Subject Key Identifier:
>                4D:5D:71:84:B5:D9:7B:B1:11:52:58:BC:5E:BE:A8:0D:8C:AE:17:63
>            X509v3 Key Usage: critical
>                Digital Signature, Non Repudiation, Key Encipherment
>    Signature Algorithm: ecdsa-with-SHA256
>    Signature Value:
>        30:44:02:20:5b:ce:5e:3f:67:85:11:42:d5:5f:2a:ba:cd:12:
>        f2:e7:bd:0e:f5:9e:ae:d1:65:8d:9c:d3:dc:7c:8d:63:ec:07:
>        02:20:33:3f:b6:22:39:62:ff:3b:9f:21:eb:43:e1:9e:40:31:
>        39:fb:14:a8:1f:c9:33:48:18:99:33:dd:03:86:2c:0e
>
>Any help would be appreciated.
>Thanks.
>
>
>----------
>
>_______________________________________________
>tpm2 mailing list -- tpm2(a)lists.01.org
>To unsubscribe send an email to tpm2-leave(a)lists.01.org
>%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
--===============3595771444360782556==--

