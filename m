Content-Type: multipart/mixed; boundary="===============6296948526902808818=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How to initialize a used TPM2 module and thoughts on clevis
Date: Wed, 13 Jul 2022 14:53:57 +0000
Message-ID: <741ff3ee9707c1f3502d48e97496e1a47edfbb6d.camel@intel.com>
In-Reply-To: 20220712222548.2570.88870@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6296948526902808818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Javier

On Tue, 2022-07-12 at 22:25 +0000, Tim K wrote:
> Very useful, thank you!
> =

> > and YES. This is required to keep someone from wiping all the keys
> > in
> > the owner hierarchy which would include your disk encryption keys.
> > You also want to set the lockoutauth as well.
> =

> It appears clevis uses the owner hierarchy by default. If I set an
> owner password, what are the implications, does clevis need to know
> the owner password when it creates its own key and then
> encrypts/decrypts its own key?
> =

> This is how I'm trying to use it to encrypt a single file on disk
> (not the entire disk/LUKS):
> https://manpages.ubuntu.com/manpages/focal/man1/clevis-encrypt-tpm2.1.html


Looking at the source[1,2], it appears they call tpm2_createprimary on
encrypt which would require owner auth, call tpm2_create save the key
and then on decrypt call tpm2_createprimary which requires owner auth
and then call tpm2_load to load the key under that primary object.

I don't see an option to use the SRK, this looks like an oversight or I
am missing something. Javier, do you know?


[1] =

https://github.com/latchset/clevis/blob/master/src/pins/tpm2/clevis-encrypt=
-tpm2
[2] =

https://github.com/latchset/clevis/blob/master/src/pins/tpm2/clevis-decrypt=
-tpm2
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6296948526902808818==--

