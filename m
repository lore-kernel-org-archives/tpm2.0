Content-Type: multipart/mixed; boundary="===============2972844368829815636=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 26, Issue 12
Date: Fri, 23 Aug 2019 17:47:05 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEE57B@ORSMSX101.amr.corp.intel.com>
In-Reply-To: EE093A26-F925-4C85-BDE9-649B0F77BC04@vmware.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2972844368829815636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I haven't seen that one, however it's well described here:
https://wiki.openssl.org/index.php/Library_Initialization

I'm not seeing any calls to ENGINE_cleanup() or other OSSL teardowns,
So on program exit you may see these.

I can say with ASAN, I don't see them when running the tools. All the tests
are run asan enabled and run cleanly and the tools use ESYS.

Bill

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Timothy Le
> Sent: Friday, August 23, 2019 12:38 PM
> To: tpm2(a)lists.01.org
> Subject: Re: [tpm2] tpm2 Digest, Vol 26, Issue 12
> =

> Hi,
> Sorry to bother, but just following up if anyone has encountered this mem=
ory
> leak. For reference, the valgrind output is:
> =

> =3D=3D14825=3D=3D 24 bytes in 1 blocks are still reachable in loss record=
 518 of 545
> =3D=3D14825=3D=3D    at 0x4C2DB8F: malloc (in /usr/lib/valgrind/vgpreload=
_memcheck-
> amd64-linux.so)
> =3D=3D14825=3D=3D    by 0x5969E77: CRYPTO_malloc (in /lib/x86_64-linux-
> gnu/libcrypto.so.1.0.0)
> =3D=3D14825=3D=3D    by 0x5A21F85: lh_insert (in /lib/x86_64-linux-gnu/li=
bcrypto.so.1.0.0)
> =3D=3D14825=3D=3D    by 0x596CC54: OBJ_NAME_add (in /lib/x86_64-linux-
> gnu/libcrypto.so.1.0.0)
> =3D=3D14825=3D=3D    by 0x5A2C565: EVP_add_digest (in /lib/x86_64-linux-
> gnu/libcrypto.so.1.0.0)
> =3D=3D14825=3D=3D    by 0x5A30F4A: OpenSSL_add_all_digests (in /lib/x86_6=
4-linux-
> gnu/libcrypto.so.1.0.0)
> =3D=3D14825=3D=3D    by 0x50CC9FE: iesys_cryptossl_init (esys_crypto_ossl=
.c:1118)
> =3D=3D14825=3D=3D    by 0x50BDE5B: iesys_initialize_crypto (esys_crypto.c=
:537)
> =3D=3D14825=3D=3D    by 0x50BB474: Esys_Initialize (esys_context.c:81)
> =

> Thank you
> =

> =EF=BB=BFOn 8/21/19, 2:58 PM, "tpm2 on behalf of tpm2-request(a)lists.01.=
org" <tpm2-
> bounces(a)lists.01.org on behalf of tpm2-request(a)lists.01.org> wrote:
> =

>     Send tpm2 mailing list submissions to
>     	tpm2(a)lists.01.org
> =

>     To subscribe or unsubscribe via the World Wide Web, visit
> =

> 	https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli
> sts.01.org%2Fmailman%2Flistinfo%2Ftpm2&amp;data=3D02%7C01%7Cleti%40vmwa
> re.com%7C9cb480a4de6e4c05043208d726699d5e%7Cb39138ca3cee4b4aa4d6cd83
> d9dd62f0%7C0%7C0%7C637020107371945259&amp;sdata=3DqYKbiICh35iXw%2FLFlT
> DebE0csVwZEJ9CaibN0VBCMRI%3D&amp;reserved=3D0
>     or, via email, send a message with subject or body 'help' to
>     	tpm2-request(a)lists.01.org
> =

>     You can reach the person managing the list at
>     	tpm2-owner(a)lists.01.org
> =

>     When replying, please edit your Subject line so it is more specific
>     than "Re: Contents of tpm2 digest..."
> =

> =

>     Today's Topics:
> =

>        1. Re: Memory Leak stemming from Esys_Initialize (Timothy Le)
> =

> =

>     ----------------------------------------------------------------------
> =

>     Message: 1
>     Date: Wed, 21 Aug 2019 17:08:52 +0000
>     From: Timothy Le <leti(a)vmware.com>
>     To: Tadeusz Struk <tadeusz.struk(a)intel.com>, "tpm2(a)lists.01.org"
>     	<tpm2(a)lists.01.org>
>     Subject: Re: [tpm2] Memory Leak stemming from Esys_Initialize
>     Message-ID: <23296169-2F17-4F42-90D3-557623F3BE22(a)vmware.com>
>     Content-Type: text/plain; charset=3D"utf-8"
> =

>     Hi,
>     Thank you for your e-mail. I have the most recent version of TSS, inc=
luding the
> changes to the test made yesterday. I still have the same leak (memory al=
located
> in CRYPTO_malloc and also CRYPTO_REALLOC) are not freed.
> =

> =

> =

>     ?On 8/19/19, 11:19 AM, "Tadeusz Struk" <tadeusz.struk(a)intel.com> wr=
ote:
> =

>         Hi Timothy,
>         On 8/16/19 3:33 PM, Timothy Le wrote:
>         > It seems that there is memory getting allocated in CRYPO_malloc=
 that
> Esys_Finalize is not freeing. I have traced the code, but I don?t have ac=
cess to
> EVP_add_digest and the other inner function calls. Would someone be able =
to
> give me advice on how to free this memory?
> =

>         Could you specify what version of TSS are you using?
>         There was number of fixes merged in recently to fix these leaks.
> =

>         Thanks,
>         --
>         Tadeusz
> =

> =

> =

>     ------------------------------
> =

>     Subject: Digest Footer
> =

>     _______________________________________________
>     tpm2 mailing list
>     tpm2(a)lists.01.org
> =

> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.01.o
> rg%2Fmailman%2Flistinfo%2Ftpm2&amp;data=3D02%7C01%7Cleti%40vmware.com
> %7C9cb480a4de6e4c05043208d726699d5e%7Cb39138ca3cee4b4aa4d6cd83d9dd6
> 2f0%7C0%7C0%7C637020107371945259&amp;sdata=3DqYKbiICh35iXw%2FLFlTDebE0
> csVwZEJ9CaibN0VBCMRI%3D&amp;reserved=3D0
> =

> =

>     ------------------------------
> =

>     End of tpm2 Digest, Vol 26, Issue 12
>     ************************************
> =

> =

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============2972844368829815636==--

