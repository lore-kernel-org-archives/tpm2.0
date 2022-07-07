Content-Type: multipart/mixed; boundary="===============1794312343240523059=="
MIME-Version: 1.0
From: Sergey 'Jin' Bostandzhyan <jin at mediatomb.cc>
Subject: [tpm2] Re: Selecting a key which was created via Fapi in the OpenSSL
 "engine"
Date: Thu, 07 Jul 2022 16:51:23 +0200
Message-ID: <20220707145123.GD26089@xn--80adja5bqm.su>
In-Reply-To: SN6PR11MB3437D11A247D968F3197D14DB8839@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1794312343240523059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bill,

On Thu, Jul 07, 2022 at 02:19:00PM +0000, Roberts, William C wrote:
> Offhand you could use Fapi_GetTpmBlobs which will return the TPM2B_PUBLIC=
 and TPM2B_PRIVATE blobs
> for the TPM and then encode it into a PEM file using tpm2-tools tpm2_enco=
deobject command.
> =

> So lets say you had the public as key.pub and private as key.priv, someth=
ing like:
> =

> tpm2_encodeobject -u key.pub -r key.priv -C 0x81000001 -o key.pem
> =

> Then you can use key.pem with the engine commands.

I read up on it and there's one thing not quite clear to me, so it says:

"Encode both the private and public portions of an object into a combined P=
EM =

format used by tpm2-tss-engine."

Is this resulting PEM file only usable in combination with the original key
stored in hardware TPM, i.e. no big deal if someone "steals" that PEM file,=
 or
is this file something that should be considered criticial in terms of
security?

> Note that the 0x81000001 is the default address for the SRK, but if you h=
ave something
> configured differently you may need to tweak the paramters. A call to tpm=
2_getcap handles-persistent
> should show you where your SRK is at hopefully.
> =

> I don't know FAPI well or use FAPI much, so their may be an API I am over=
looking that does this.

Thank you, I think I get the overall idea, i.e. the engine always needs to =
go
via this additional file and once I have it, the command line from the exam=
ples
will work as described, so will libmosquitto.

If you could clarify the security aspect, then it looks like the solution w=
hich
I have been seeking.

Kind regards,
Jin



> ________________________________
> From: Sergey 'Jin' Bostandzhyan <jin(a)mediatomb.cc>
> Sent: Thursday, July 7, 2022 8:59 AM
> To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> Subject: [tpm2] Selecting a key which was created via Fapi in the OpenSSL=
 "engine"
> =

> Hi,
> =

> I am struggling to figure out how the following scenario could work:
> =

> let's say I have a C application where I created a persistent key pair
> via Fapi_CreateKey(), the key can be identified by its path,
> typically something like "HS/SRK/mykey".
> =

> Now, let's assume I need to use that key from OpenSSL as well, via the en=
gine
> option, i.e. "-engine tpm2tss", what I am failing to understand is - how =
do
> I pass the path/key identifier, to tell OpenSSL which key to use?
> =

> All examples in the tpm2-tss-engine README somehow assume that you first
> used tpm2tss-genkey which produces an actual key file in the fs, and then
> this file is being used in OpenSSL?
> =

> >From https://github.com/tpm2-software/tpm2-tss-engine
> tpm2tss-genkey -a rsa -s 2048 mykey
> openssl rsa -engine tpm2tss -inform engine -in mykey -pubout -outform pem=
 -out mykey.pub
> openssl pkeyutl -pubin -inkey mykey.pub -in mydata -encrypt -out mycipher
> openssl pkeyutl -engine tpm2tss -keyform engine -inkey mykey -decrypt -in=
 mycipher -out mydata
> =

> I naively tried passing "-in HS/SRK/mykey", but of course it did not work.
> =

> So what is the correct way to do it, if the key has not been generated us=
ing
> tpm2tss-genkey, but if the key has been created via the Fapi_CreateKey()
> function?
> =

> My actual scenario is, that my application is using libmosquitto which in
> turn needs to use the private key which I have in TPM. The library uses O=
penSSL
> and allows to pass equivalents of "-engine" and "-keyform" parameters to =
the
> OpenSSL library. The question however remains the same as with the above
> command line example - how do I select the key, if "mykey" is not a file,=
 but
> something that is stored in TPM?
> =

> I am not an expert in any of those TPM or security related questions, so =
I may
> very well misunderstand how this is supposed to work overall, so far I wa=
s not
> able to figure it out by studying the docs, I hope someone has a hint for=
 me.
> =

> Kind regards,
> Jin
> =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============1794312343240523059==--

