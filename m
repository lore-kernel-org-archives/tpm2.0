Content-Type: multipart/mixed; boundary="===============9011247534366558571=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: RSA key pairs are gone when I reboot
Date: Wed, 04 Dec 2019 14:09:06 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E4BD86@ORSMSX101.amr.corp.intel.com>
In-Reply-To: bd59db4e-54b1-1c9e-e665-e3b2307073d1@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9011247534366558571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Tadeusz Struk [mailto:tadeusz.struk(a)intel.com]
> Sent: Tuesday, December 3, 2019 10:59 AM
> To: cauldwell.thomas(a)gmail.com; tpm2(a)lists.01.org
> Subject: [tpm2] Re: RSA key pairs are gone when I reboot
> =

> On 12/3/19 7:54 AM, Frederick Gotham wrote:
> > How do I store an RSA key pair persistently/permanently inside the TPM2=
 chip?
> =

> You can use tpm2_evictcontrol tool to make the key persistent.

Generally yes, but not in this case. If you use the pkcs11 library, that
Library controls that tpm object. Rest assured your key is still available,
But not (easily) via side-channel means (ie using tpm2-tools directly.
You have to go through the library. In your case, all the tpm objects (keys)
are associated and managed with the token labelled "monkey".

If you use something like pkcs11-tool you should still see the object
You created. Information on how to do this can be found here:

https://github.com/tpm2-software/tpm2-pkcs11/blob/master/docs/PKCS11_TOOL.m=
d#listing-objects

Also, tpm2_ptool verify commandlet is essentially a list objects as well...=
 but it does some additional
things too.

Do these commands still show your key?

Internally, the key is loaded on demand into the TPM as a transient object.=
 The key blob is stored
In the sqlite3 db at path TPM2_PKCS11_STORE.

Bill

> =

> --
> Tadeusz
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============9011247534366558571==--

