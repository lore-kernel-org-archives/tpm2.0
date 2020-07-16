Content-Type: multipart/mixed; boundary="===============2449442030751973121=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-pkcs11 interoperability
Date: Thu, 16 Jul 2020 19:18:57 +0000
Message-ID: <SN6PR11MB34376EECBD6E06BE9292CB90B87F0@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2449442030751973121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to point out some new features that have landed to the pkcs11 libr=
ary, that will hopefully be a welcome addition, and that is
The ability to link existing tss2-engine and tpm2-tools keys into a token. =
Also, the ability to use all transient objects in the tpm2-pkcs11
Library (requires owner auth). Linking in new objects is accomplished using=
 the tpm2_ptool utility.

This is the last PR I had in mind:
https://github.com/tpm2-software/tpm2-pkcs11/pull/545

But I wanted to collect some feedback from the community as it's the last m=
ajor feature for the upcoming tpm2-pkcs11 2.0 release.

Also, tss2-engine has a PR to be able to pull in tpm2-tools blobs as well:
https://github.com/tpm2-software/tpm2-tss-engine/pull/140

Thanks,
Bill

--===============2449442030751973121==--

