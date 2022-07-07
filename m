Content-Type: multipart/mixed; boundary="===============8960637671170853713=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Selecting a key which was created via Fapi in the OpenSSL
 "engine"
Date: Thu, 07 Jul 2022 15:26:09 +0000
Message-ID: <3b079da362d5427be8a3c6bf56471f254892cfc9.camel@intel.com>
In-Reply-To: 20220707145123.GD26089@xn--80adja5bqm.su
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8960637671170853713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-07-07 at 16:51 +0200, Sergey 'Jin' Bostandzhyan wrote:
> Hi Bill,
> =

> On Thu, Jul 07, 2022 at 02:19:00PM +0000, Roberts, William C wrote:
> > Offhand you could use Fapi_GetTpmBlobs which will return the
> > TPM2B_PUBLIC and TPM2B_PRIVATE blobs
> > for the TPM and then encode it into a PEM file using tpm2-tools
> > tpm2_encodeobject command.
> > =

> > So lets say you had the public as key.pub and private as key.priv,
> > something like:
> > =

> > tpm2_encodeobject -u key.pub -r key.priv -C 0x81000001 -o key.pem
> > =

> > Then you can use key.pem with the engine commands.
> =

> I read up on it and there's one thing not quite clear to me, so it
> says:
> =

> "Encode both the private and public portions of an object into a
> combined PEM =

> format used by tpm2-tss-engine."
> =

> Is this resulting PEM file only usable in combination with the
> original key
> stored in hardware TPM, i.e. no big deal if someone "steals" that PEM
> file, or
> is this file something that should be considered criticial in terms
> of
> security?

TL;DR No, don't worry about it.

Too Long want to read it:

No, the way the TPM works that FAPI hides from you is that their
is a public and private portion to a key. They public is clear text
that is cryptographically bound to the private which is an ancrypted
blob only the TPM can see and use. The architecture document specifies
this in Section 22 of =

https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_Part1_A=
rchitecture_pub.pdf

> =

> > Note that the 0x81000001 is the default address for the SRK, but if
> > you have something
> > configured differently you may need to tweak the paramters. A call
> > to tpm2_getcap handles-persistent
> > should show you where your SRK is at hopefully.
> > =

> > I don't know FAPI well or use FAPI much, so their may be an API I
> > am overlooking that does this.
> =

> Thank you, I think I get the overall idea, i.e. the engine always
> needs to go
> via this additional file and once I have it, the command line from
> the examples
> will work as described, so will libmosquitto.
> =

> If you could clarify the security aspect, then it looks like the
> solution which
> I have been seeking.
> =

> Kind regards,
> Jin
> =

> =

> =

> > ________________________________
> > From: Sergey 'Jin' Bostandzhyan <jin(a)mediatomb.cc>
> > Sent: Thursday, July 7, 2022 8:59 AM
> > To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> > Subject: [tpm2] Selecting a key which was created via Fapi in the
> > OpenSSL "engine"
> > =

> > Hi,
> > =

> > I am struggling to figure out how the following scenario could
> > work:
> > =

> > let's say I have a C application where I created a persistent key
> > pair
> > via Fapi_CreateKey(), the key can be identified by its path,
> > typically something like "HS/SRK/mykey".
> > =

> > Now, let's assume I need to use that key from OpenSSL as well, via
> > the engine
> > option, i.e. "-engine tpm2tss", what I am failing to understand is
> > - how do
> > I pass the path/key identifier, to tell OpenSSL which key to use?
> > =

> > All examples in the tpm2-tss-engine README somehow assume that you
> > first
> > used tpm2tss-genkey which produces an actual key file in the fs,
> > and then
> > this file is being used in OpenSSL?
> > =

> > > From https://github.com/tpm2-software/tpm2-tss-engine
> > tpm2tss-genkey -a rsa -s 2048 mykey
> > openssl rsa -engine tpm2tss -inform engine -in mykey -pubout
> > -outform pem -out mykey.pub
> > openssl pkeyutl -pubin -inkey mykey.pub -in mydata -encrypt -out
> > mycipher
> > openssl pkeyutl -engine tpm2tss -keyform engine -inkey mykey
> > -decrypt -in mycipher -out mydata
> > =

> > I naively tried passing "-in HS/SRK/mykey", but of course it did
> > not work.
> > =

> > So what is the correct way to do it, if the key has not been
> > generated using
> > tpm2tss-genkey, but if the key has been created via the
> > Fapi_CreateKey()
> > function?
> > =

> > My actual scenario is, that my application is using libmosquitto
> > which in
> > turn needs to use the private key which I have in TPM. The library
> > uses OpenSSL
> > and allows to pass equivalents of "-engine" and "-keyform"
> > parameters to the
> > OpenSSL library. The question however remains the same as with the
> > above
> > command line example - how do I select the key, if "mykey" is not a
> > file, but
> > something that is stored in TPM?
> > =

> > I am not an expert in any of those TPM or security related
> > questions, so I may
> > very well misunderstand how this is supposed to work overall, so
> > far I was not
> > able to figure it out by studying the docs, I hope someone has a
> > hint for me.
> > =

> > Kind regards,
> > Jin
> > =

> > =

> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8960637671170853713==--

