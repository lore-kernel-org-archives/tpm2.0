Content-Type: multipart/mixed; boundary="===============1866250581132071964=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How can I prevent MITM attacks for unsealing?
Date: Fri, 21 Oct 2022 17:41:30 +0000
Message-ID: <b5be0ace5a7295e4b4727c73797f67c34c0810f0.camel@intel.com>
In-Reply-To: 20221006130719.2030.23916@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1866250581132071964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-10-06 at 13:07 +0000, joseph(a)zeronsoftn.com wrote:
> Here is the command I tested:
> https://gist.github.com/jclab-joseph/d1d6d9bbbd32c0fe200cc7725bcf0d86
> A session was established via a serialized persistent handle.
> This seems to be able to prevent MITM by default.
> =

> But wouldn't it still be vulnerable if an attacker could replace
> primary.handle?

You can think of this as the same attack as replacing your root CA
certs for your browser. If an attacker can modify or add a Root CA they
can get you to trust them (the attacker). Same here, if the metadata
your validating against changes, ie the public key, then you lost.

> Is there a way to validate between session and seal.ctx or seal.pub?

The key blobs themselves are tamper resistant using an HMAC for
integrity and AES128CFB for confidentiality. =


Assuming you seal and unseal with a session started with a trusted key,
then you're good. An attacker can only observer the traffic but cannot
modify or extract the data on the bus if encrypted sessions are used.

You could also use or add a bind key to the session where the objects
password is used in the generation of the session key. This bind key
could be the password used on the seal key if the seal key has a
password.

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============1866250581132071964==--

