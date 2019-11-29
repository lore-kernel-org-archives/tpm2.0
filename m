Content-Type: multipart/mixed; boundary="===============2351768486292443964=="
MIME-Version: 1.0
From: Ignacio Jaureguiberry <ignaciox.jaureguiberry at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Fri, 29 Nov 2019 17:44:42 +0000
Message-ID: <20191129174442.2967.55594@new-ml01.vlan13.01.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E48961@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2351768486292443964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

1. I've used tpm2_ptool. It's detailed at the beginning of this thread, act=
ually I took it from the documentation.
2. I'll paste the dump below.
3. I could, but wpa_supplicant connects first to the AP, so in order to tes=
t it you need to have a Wifi client, an access point that supports wpa2 ent=
erprise and a RADIUS server. I think wpa_supplicant project has an eapol_te=
st program to test without actually needing the real wifi, but it isn't bun=
dled in the distribution package by default. It would need the RADIUS serve=
r anyway.
  If there is anything you want me to try, I'll do it. Otherwise I could se=
nd more detailed instructions on the setup.

dump of tobjects:
```
sqlite> .dump tobjects =

PRAGMA foreign_keys=3DOFF;
BEGIN TRANSACTION;
CREATE TABLE tobjects(
    id INTEGER PRIMARY KEY,
    tokid INTEGER NOT NULL,
    pub BLOB NOT NULL,
    priv BLOB,
    objauth TEXT NOT NULL,
    mech TEXT NOT NULL,
    attrs TEXT NOT NULL,
    FOREIGN KEY (tokid) REFERENCES tokens(id) ON DELETE CASCADE
);
INSERT INTO tobjects VALUES(1,1,X'01160001000b00060072000000100010080000000=
0000100c8a43a784b8da5ecb8832e319d25f52db6212d4ddad2581199253dada30e8364cf60=
eb8a4db507ad15348fd9d395c1b37581f7abae0e23c01fefb96cf992f9028ca827bfdf33946=
ec2c89e66ca7346cff3ab1d385c6ba81e9432759b59c065cd0f8591588238626057e2c61344=
66c0b2465c4f7a00eb06bf10ee3f6512b0ce1871ca124185d416e47c2df003db43330372f7b=
cf6437051c546ad362550073babaf913dd89b245642497b8cfe844f4130ec5260c9d53d3616=
e95adced9eb24103daa5e4aa5a98a0bf926c87c418277c5d7ad3d17e1fa75cc8e91a6d0d8fb=
7a6096568f9dad9e1f721e2659c7696156ae60bc93a9ef06c1e0b7ba060bb5d4359a9',X'00=
de0020ed7fea4ea5956e4e4037c0d46511361c8a6b2081894bc75bf806dd064b77ee8900104=
fbf9701bb6b1e85df1172f593eec06071d4bba051f5af1ae70d06ac62b2af7c5f5f36aded95=
f1bff1acd33bac6d5517d7aca34bee5050e5a86090fb04c7ba655dcf33031ca70661ad5ef30=
4b6e5e14b8dda61dd1cc2c69280eb23b762c2cf33ff4992055e6048efc46d605ffd91224b7d=
1d8c15d7e7a05d5a3bb1b0fffa0d187bf0fbc01c36680b315de79754557876361bf493844e8=
4b28a62338b2e57ab9c06973079bd25d1efc6a919436c60adb6048c46670782cae478bc','6=
1168cf1f0f93b3389a95c94:c80937f509c9f9ba2560778793d73770:e4a03ad7b42ab35a93=
ffd26ef8368e5c6139f3d9c6480736b68398bb49662eb9',replace('3=3D\n9=3Dhashalg=
=3D544,mgf=3D1\n9=3Dhashalg=3D592,mgf=3D2\n1=3D','\n',char(10)),replace('25=
6=3D0\n0=3D3\n289=3D2048\n264=3DTrue\n261=3DTrue\n265=3DFalse\n263=3DFalse\=
n528=3DFalse\n288=3Dc8a43a784b8da5ecb8832e319d25f52db6212d4ddad2581199253da=
da30e8364cf60eb8a4db507ad15348fd9d395c1b37581f7abae0e23c01fefb96cf992f9028c=
a827bfdf33946ec2c89e66ca7346cff3ab1d385c6ba81e9432759b59c065cd0f85915882386=
26057e2c6134466c0b2465c4f7a00eb06bf10ee3f6512b0ce1871ca124185d416e47c2df003=
db43330372f7bcf6437051c546ad362550073babaf913dd89b245642497b8cfe844f4130ec5=
260c9d53d3616e95adced9eb24103daa5e4aa5a98a0bf926c87c418277c5d7ad3d17e1fa75c=
c8e91a6d0d8fb7a6096568f9dad9e1f721e2659c7696156ae60bc93a9ef06c1e0b7ba060bb5=
d4359a9\n289=3D2048\n290=3D65537\n258=3D62356461333863313935373361313763\n1=
=3DTrue\n259=3DTrue\n357=3DTrue\n354=3DFalse\n356=3DTrue\n268=3DFalse\n514=
=3DFalse\n3=3D31','\n',char(10)));
INSERT INTO tobjects VALUES(2,1,X'01160001000b00060072000000100010080000000=
0000100c8a43a784b8da5ecb8832e319d25f52db6212d4ddad2581199253dada30e8364cf60=
eb8a4db507ad15348fd9d395c1b37581f7abae0e23c01fefb96cf992f9028ca827bfdf33946=
ec2c89e66ca7346cff3ab1d385c6ba81e9432759b59c065cd0f8591588238626057e2c61344=
66c0b2465c4f7a00eb06bf10ee3f6512b0ce1871ca124185d416e47c2df003db43330372f7b=
cf6437051c546ad362550073babaf913dd89b245642497b8cfe844f4130ec5260c9d53d3616=
e95adced9eb24103daa5e4aa5a98a0bf926c87c418277c5d7ad3d17e1fa75cc8e91a6d0d8fb=
7a6096568f9dad9e1f721e2659c7696156ae60bc93a9ef06c1e0b7ba060bb5d4359a9',NULL=
,'61168cf1f0f93b3389a95c94:c80937f509c9f9ba2560778793d73770:e4a03ad7b42ab35=
a93ffd26ef8368e5c6139f3d9c6480736b68398bb49662eb9',replace('3=3D\n9=3Dhasha=
lg=3D544,mgf=3D1\n9=3Dhashalg=3D592,mgf=3D2\n1=3D','\n',char(10)),replace('=
256=3D0\n0=3D2\n266=3DTrue\n260=3DTrue\n267=3DFalse\n262=3DFalse\n134=3DFal=
se\n288=3Dc8a43a784b8da5ecb8832e319d25f52db6212d4ddad2581199253dada30e8364c=
f60eb8a4db507ad15348fd9d395c1b37581f7abae0e23c01fefb96cf992f9028ca827bfdf33=
946ec2c89e66ca7346cff3ab1d385c6ba81e9432759b59c065cd0f8591588238626057e2c61=
34466c0b2465c4f7a00eb06bf10ee3f6512b0ce1871ca124185d416e47c2df003db43330372=
f7bcf6437051c546ad362550073babaf913dd89b245642497b8cfe844f4130ec5260c9d53d3=
616e95adced9eb24103daa5e4aa5a98a0bf926c87c418277c5d7ad3d17e1fa75cc8e91a6d0d=
8fb7a6096568f9dad9e1f721e2659c7696156ae60bc93a9ef06c1e0b7ba060bb5d4359a9\n2=
89=3D2048\n290=3D65537\n258=3D62356461333863313935373361313763\n268=3DFalse=
\n3=3D31','\n',char(10)));
COMMIT;
```
--===============2351768486292443964==--

