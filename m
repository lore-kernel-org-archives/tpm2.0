Content-Type: multipart/mixed; boundary="===============6485294172528365885=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: OpenSSL TLS using tpm2-pkcs11 doesn't work on newer
 versions
Date: Fri, 24 Jan 2020 15:52:10 +0000
Message-ID: <20200124155210.2993.13868@ml01.vlan13.01.org>
In-Reply-To: 5e20e86f-d193-c57d-2c70-e67efef9a51d@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6485294172528365885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Will definitively take a look at it once the tpm2-pkcs11 approach works!

Are you talking about this commit in master branch of wpa_supplicant? https=
://w1.fi/cgit/hostap/commit/?id=3D18780c6d6706ee90c98eb5f27454c1bcf7b4e1bc

The reason why we moved forward with the pkcs11 approach is mostly because =
it has the PKCS standard in the package name, (..."The PKCS #11 standard de=
fines a platform-independent API to cryptographic tokens, such as hardware =
security modules (HSM) and smart cards"..).

Our assumption is that, if we make the PKCS#11 module work for wpa_supplica=
nt, we will also enable any software that wants to use the TPM by just usin=
g the PKCS#11 standard, which is much more easier than implementing specifi=
c logic to talk with the TPM in specific platforms (standards are good =


Additionally, to have this widely available, we need to make this packages =
available in the target distros (Fedora and Ubuntu for now).
There is a tpm2-pkcs11 package available in Fedora as today: https://pkgs.o=
rg/download/tpm2-pkcs11. =

I just found that there is a tpm2-pk11 package in Ubuntu as well, that also=
 uses tpm2-tss here https://zoomadmin.com/HowToInstall/UbuntuPackage/tpm2-p=
k11. =

As regards the tpm2-tss-engine, there is no package for Ubuntu. There is an=
 rpm for Fedora being assembled here https://bugzilla.redhat.com/show_bug.c=
gi?id=3D1773855 though.

So I hope that all this exercise makes the process more stable for everybod=
y!
--===============6485294172528365885==--

