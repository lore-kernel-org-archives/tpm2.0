Content-Type: multipart/mixed; boundary="===============0782351547890740316=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Hello from a small community of TPM enthusiasts
Date: Thu, 07 May 2020 16:21:54 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDB3B4@ORSMSX101.amr.corp.intel.com>
In-Reply-To: VI1PR08MB265305D83D4C377D2243CF54B5A50@VI1PR08MB2653.eurprd08.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0782351547890740316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dimitar Tomov [mailto:dimi(a)designfirst.ee]
> Sent: Thursday, May 7, 2020 5:46 AM
> To: David Woodhouse <dwmw2(a)infradead.org>; tpm2(a)lists.01.org
> Subject: [tpm2] Re: Hello from a small community of TPM enthusiasts
> =

> Hi David,
> =

> May be outdated, but your page is also a resource, so please feel free to=
 share it
> with the community developers.tpm.dev ;-)
> =

> For the other topics you rise I will reply inline below
> =

> On Wed, 2020-05-07 at 13:16, David Woodhouse wrote:
> > I'll see if I can join.
> =

> We are doing them every week, so even if you miss next week's call, just =
join us
> in next one. Same time, Wednesday 8am PDT/5pm CEST
> =

> >
> > With respect to documentation I'd strongly recommend taking the
> > approach of "if it needs documenting, fix it first. Then document
> > what's left".
> =

> I could not agree more. We are not the ones developing tpm2-tools, rather=
 trying
> to make use of them. But we can provide valuable feedback.
> =

> > We should make software as trivial and intuitive as possible for
> > users, not *just* provide a twisty maze of documentation in the hope
> > that some of the most persistent will eventually navigate their way thr=
ough it.
> =

> Spot on. I have one such example from yesterday, where we were wondering
> why generating a symmetric key with tpm2-tools now produces private and
> public part. Eventually, a clean slide would be the only viable option le=
ft. I
> personally am a fan of the minimalistic approach.
> We can discuss this further on our calls. I do not want to go offtopic he=
re.
> =


Why "now produces"tpm2_create has always produced a public and private port=
ion.
Did something change that I am not aware of?

As Andreas mentioned, those blobs are for the TPM, and contain a lot of met=
adata outside
Of what one typically things of as a public portion of a key. For example R=
SA would contain
At a minimum the exponent and the modulus. The public portion of a tpm file=
 contains
attributes and for a symmetric key, which can be viewed with tpm2_readpubli=
c, and
some of them are output on tpm2_create as well (stdout output).

$ tpm2_readpublic -c aes.key =

name: 000b530cfa588448c802f23b06707ae1a140fec0d5b2d4dfc6de114094f4cbca8b9b
qualified name: 000ba07ee113cee302967a859956e4351b966d3216a3949702e919248c3=
54876d432
name-alg:
  value: sha256
  raw: 0xb
attributes:
  value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|sign
  raw: 0x60072
type:
  value: symcipher
  raw: 0x25
sym-alg:
  value: aes
  raw: 0x6
sym-mode:
  value: null
  raw: 0x10
sym-keybits: 256
symcipher: b916f79cc7984287fee3632df1dbf061594e01c4c01401f379a8e08867bfee7a

All those fields have meaning, for instance that name of the object, is the=
 hash of type sha256.
Names are unique, and how we make sure we're getting what we expect when us=
ing them for
Things like encrypted sessions.

The attributes describe how that object can be used, it can't be reparented=
 within the TPM, its fixed to the TPM
And cannot be extracted, and is authorized by the user with a password. It =
can be used for both encryption (sign)
and decryption.

Type, syme-alg and sym-mode all describe the associated algorithm of the ob=
ject, it's a symmetric cipher of type
AES and since mode is null, it can be used with any supported AES mode, ie =
CBC, ECB, etc. You could set this to
a single mode at tpm2_create time, and then the key would be restricted to =
a single mode.

It tells you the keybits, and the symcipher field is a fingerprint of the k=
ey. For AES offhand I think it's the name-alg
Hash (sha256) of the key bytes. For RSA this would be the modulus, and the =
field name would be rsa. Rsa would also
Contain the exponent, so you could actual use it like a public key. In fact=
 readpublic can output the public
as a pem for asymmetric keypairs.

Additionally, the public and private are bound cryptograhically, so the TPM=
 knows what public corresponds with the
private key (in this case the AES secret key) and thus can trust the public=
 portion in making policy decisions, like
don't allow it to be reparented or be extracted from the TPM.

The private portion is encrypted and integrity checked by the TPM, so (hope=
fully) only the TPM can view the actual
key material.

Hopefully this helps, we try and distill stuff down in the tpm2-tools manpa=
ges the best we can and work on other
Supporting documentation as well. We need to start making things like, divi=
ng into objects. Because these details
I just shared are only in the spec....which is not exactly fun to read at t=
imes, albeit thorough.

> /Dimi
> =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============0782351547890740316==--

