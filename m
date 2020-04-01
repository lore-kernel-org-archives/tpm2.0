Content-Type: multipart/mixed; boundary="===============4102073997189444442=="
MIME-Version: 1.0
From: ray at 3econtrols.com
Subject: [tpm2] Re: curl TLS session using tpm encoded keyfile.
Date: Wed, 01 Apr 2020 19:25:34 +0000
Message-ID: <20200401192534.2692.70063@ml01.vlan13.01.org>
In-Reply-To: 20200401191432.2692.3511@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4102073997189444442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Also, here is the openssl read for my SSL cert:
pi(a)raspberrypi:~/tssSetup/tpm2-tss $ openssl x509 -in /home/pi/certs/clie=
nt.crt -noout -text
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            36:4c:2c:a2:56:04:c2:54:4c:b9:c1:af:7c:ec:ed:c2:cf:7e:3a:8e
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C =3D AU, ST =3D Some-State, O =3D Internet Widgits Pty Ltd
        Validity
            Not Before: Mar 31 16:12:49 2020 GMT
            Not After : Apr 30 16:12:49 2020 GMT
        Subject: C =3D AU, ST =3D Some-State, O =3D Internet Widgits Pty Ltd
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:
                    00:dc:0b:6f:0f:6b:4e:f7:62:5d:50:63:3d:ab:1f:
                    cc:43:24:18:89:42:dc:7e:17:71:9f:d4:ef:2b:5a:
                    39:53:16:9e:3b:b0:f7:e1:49:37:7a:c3:36:ba:9e:
                    e2:32:09:71:68:0e:46:91:15:f0:cf:d7:09:4e:3f:
                    7d:14:92:06:13:f5:ec:ea:5a:e1:b0:58:ca:32:b1:
                    0c:0b:b9:75:f9:c1:5a:e5:c6:71:5f:92:53:3d:c2:
                    32:b8:3c:ea:02:3b:9b:7a:bb:83:6f:c8:57:e6:4a:
                    13:b6:e2:2e:08:43:4f:93:83:6c:4f:b6:49:85:57:
                    d4:7d:7d:49:1e:8e:27:c4:04:80:3e:74:14:2e:76:
                    6d:fc:87:14:f9:1b:4e:3b:05:ba:ca:b9:6e:90:a1:
                    a3:c5:e2:4e:5a:90:a8:ca:28:27:54:7e:1c:8f:a9:
                    3a:ee:8f:fa:14:a9:2c:f4:b4:5a:29:37:b8:69:5c:
                    32:1c:e0:f6:b6:36:41:54:c8:8e:e2:3f:52:d2:c1:
                    08:85:87:77:ba:33:9a:51:1e:89:1f:f5:fa:7d:12:
                    1a:3f:67:b3:82:6a:aa:fa:ca:8f:8c:08:ab:60:db:
                    40:ae:96:db:4c:ae:78:64:82:fe:de:aa:3b:1e:b3:
                    08:ac:f2:df:ea:8b:eb:62:6e:20:0a:04:7b:3c:80:
                    4e:e9
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Key Identifier:
                C8:9C:72:1A:96:21:99:EC:CB:67:FE:D4:1C:03:7D:0C:60:EE:1C:A2
            X509v3 Authority Key Identifier:
                keyid:C8:9C:72:1A:96:21:99:EC:CB:67:FE:D4:1C:03:7D:0C:60:EE=
:1C:A2

            X509v3 Basic Constraints: critical
                CA:TRUE
    Signature Algorithm: sha256WithRSAEncryption
         0b:29:d6:16:92:00:98:1c:53:16:d0:aa:29:72:ac:75:04:99:
         90:c0:1e:4e:f5:98:2d:7e:f9:7a:47:b4:18:d4:73:98:8b:43:
         ef:7f:9f:5f:4d:db:e6:f8:45:cc:c0:50:d8:83:b3:0d:83:f7:
         6d:cc:c1:ec:5b:a9:9e:3f:d9:a6:51:e3:f9:81:cb:6e:63:60:
         c3:bd:45:45:e9:46:91:13:d0:40:00:95:1b:e7:3e:02:dc:b0:
         be:9a:73:30:c9:9c:26:86:b0:e7:bf:54:82:db:d3:a1:11:03:
         97:f0:1f:98:20:10:51:01:77:78:6b:d1:2c:6d:8d:b7:9a:10:
         38:36:6f:52:8a:19:c0:ce:23:43:8f:d6:1b:0c:e9:d0:d2:9c:
         58:7a:13:73:ef:92:65:6c:9a:fb:6a:49:bf:48:4b:0f:a2:aa:
         01:9e:e5:2e:4e:68:60:6d:74:73:5a:cf:6e:b7:90:83:ba:d8:
         e9:b7:40:f5:f2:b1:a2:5a:60:05:70:31:99:9b:d2:a5:a7:f9:
         84:71:15:73:04:f9:44:02:89:60:4e:3e:db:d6:55:47:ed:82:
         2d:ec:fc:92:6d:9c:bc:27:f1:41:37:f6:da:28:09:c0:5e:66:
         e6:e8:fe:c9:70:6a:98:39:b0:03:18:77:c7:b6:81:4a:5a:64:
         cb:72:0f:3a
--===============4102073997189444442==--

