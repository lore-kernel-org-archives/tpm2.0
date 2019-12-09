Content-Type: multipart/mixed; boundary="===============6652152355667533135=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Verifying signature with "-d" instead of "-g -m"
Date: Mon, 09 Dec 2019 15:40:44 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E5711B@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CALtZhhMR8O-c6dVZPvtcdh=+KhTb=9TcXFixqFi=acSK1KyDHQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6652152355667533135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Frederick Gotham [mailto:cauldwell.thomas(a)gmail.com]
> Sent: Monday, December 9, 2019 7:03 AM
> To: tpm2 <tpm2(a)lists.01.org>
> Subject: [tpm2] Verifying signature with "-d" instead of "-g -m"
> =

> Up until now, I've been able to verify signatures with a one-liner as fol=
lows:
> =

>     tpm2_verifysignature -g sha256 -f rsassa -c 0x81000000 -m ./rootfs.ta=
r -s
> ./signature_file
> =

> This failed to work today though on a file that's over 300 MB. I need it =
to work on
> files up to about 500 MB.
> =

> So it looks like I'll have to create a hash file first, and then use the =
"-d" option
> when verifying, as follows:
> =

>     # This first line creates a sum file in raw binary format
>     sha256sum rootfs.tar | cut -c -64 | sed 's/\([0-9A-F]\{2\}\)/\\\\\\x\=
1/gI' | xargs
> -n1 printf > digesthash.sum
> =

>     tpm2_verifysignature -c 0x81000000 -d digesthash.sum -s signature_file
> =

> Here is the error I get when I try to do this:
> =

>     ERROR: Esys_VerifySignature(0x2D2) - tpm:parameter(2):unsupported or
> incompatible scheme
> =

> This is strange because it works fine when I verify with options "-m -g".=
 Also, I
> have checked to make sure that the output from "tpm2_hash" is the same as=
 the
> format I use above. I don't know why it's rejecting it saying it's unsupp=
orted.

Im not sure 100% offhand, whats going on. I'd have to try and reproduce... =
but in the test code, =

we specify the ticket when doing the detached hashing. Internally to the to=
ol, we don't even use
a ticket which is silly. However, we never test an externally provided hash=
 and externally provided
signature file.

I also see what I think is a bug in tpm2_verify. I am not sure why we're pa=
ssing ctx.halg (the hashing alg)
When loading the signature from disk. In the TSS format, it's just ignored,=
 but when it's an external
Signature format, the signature shcheme is used in a switch to figure out h=
ow to load the external
Signature file and no hashing algorithm is a valid signature scheme so it s=
hould throw an error. In
your case, you're not even specifying the signature scheme used....

IIRC. there are some checks where the requested signing scheme and the obje=
cts signature scheme have to match =

when the key's scheme is not TPM2_ALG_NULL. Also, additional checks requiri=
ng a ticket to be present when the
key is restricted.

This smells like a bug in the tools, can you create a bug report in the tpm=
2-tools issue tracker?

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6652152355667533135==--

