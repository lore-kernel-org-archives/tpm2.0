Content-Type: multipart/mixed; boundary="===============3792010668734935044=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 26, Issue 12
Date: Mon, 26 Aug 2019 21:56:04 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEED8B@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 2C563F0B-739B-4117-AF81-BA5548F2695D@vmware.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3792010668734935044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Hi Robert,
> Thank you for the link, as calling those functions resolved my leaks.

+ list the question here is if the ESAPI Esys_Finalize() call should
be doing this?

I would say yes, what do you say Andreas?

> =

> Timothy
> =

> =EF=BB=BFOn 8/23/19, 10:47 AM, "Roberts, William C" <william.c.roberts(a)=
intel.com> wrote:
> =

>     I haven't seen that one, however it's well described here:
> =

> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwiki.=
ope
> nssl.org%2Findex.php%2FLibrary_Initialization&amp;data=3D02%7C01%7Cleti%4=
0v
> mware.com%7Cabe28bc870f24e301f0808d727f1eaec%7Cb39138ca3cee4b4aa4d6
> cd83d9dd62f0%7C0%7C0%7C637021792310174248&amp;sdata=3D00apxqzEEjUKrov
> mkRcS3gzQmnBcmJAIeCmxDKgT2zQ%3D&amp;reserved=3D0
> =

>     I'm not seeing any calls to ENGINE_cleanup() or other OSSL teardowns,
>     So on program exit you may see these.
> =

>     I can say with ASAN, I don't see them when running the tools. All the=
 tests
>     are run asan enabled and run cleanly and the tools use ESYS.
> =

>     Bill
> =

>     > -----Original Message-----
>     > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Timoth=
y Le
>     > Sent: Friday, August 23, 2019 12:38 PM
>     > To: tpm2(a)lists.01.org
>     > Subject: Re: [tpm2] tpm2 Digest, Vol 26, Issue 12
>     >
>     > Hi,
>     > Sorry to bother, but just following up if anyone has encountered th=
is memory
>     > leak. For reference, the valgrind output is:
>     >
>     > =3D=3D14825=3D=3D 24 bytes in 1 blocks are still reachable in loss =
record 518 of 545
>     > =3D=3D14825=3D=3D    at 0x4C2DB8F: malloc (in
> /usr/lib/valgrind/vgpreload_memcheck-
>     > amd64-linux.so)
>     > =3D=3D14825=3D=3D    by 0x5969E77: CRYPTO_malloc (in /lib/x86_64-li=
nux-
>     > gnu/libcrypto.so.1.0.0)
>     > =3D=3D14825=3D=3D    by 0x5A21F85: lh_insert (in /lib/x86_64-linux-
> gnu/libcrypto.so.1.0.0)
>     > =3D=3D14825=3D=3D    by 0x596CC54: OBJ_NAME_add (in /lib/x86_64-lin=
ux-
>     > gnu/libcrypto.so.1.0.0)
>     > =3D=3D14825=3D=3D    by 0x5A2C565: EVP_add_digest (in /lib/x86_64-l=
inux-
>     > gnu/libcrypto.so.1.0.0)
>     > =3D=3D14825=3D=3D    by 0x5A30F4A: OpenSSL_add_all_digests (in /lib=
/x86_64-linux-
>     > gnu/libcrypto.so.1.0.0)
>     > =3D=3D14825=3D=3D    by 0x50CC9FE: iesys_cryptossl_init (esys_crypt=
o_ossl.c:1118)
>     > =3D=3D14825=3D=3D    by 0x50BDE5B: iesys_initialize_crypto (esys_cr=
ypto.c:537)
>     > =3D=3D14825=3D=3D    by 0x50BB474: Esys_Initialize (esys_context.c:=
81)
>     >
>     > Thank you
>     >
>     > On 8/21/19, 2:58 PM, "tpm2 on behalf of tpm2-request(a)lists.01.org=
" <tpm2-
>     > bounces(a)lists.01.org on behalf of tpm2-request(a)lists.01.org> wr=
ote:
>     >
>     >     Send tpm2 mailing list submissions to
>     >     	tpm2(a)lists.01.org
>     >
>     >     To subscribe or unsubscribe via the World Wide Web, visit
>     >
>     > 	https://li
>     >
> sts.01.org%2Fmailman%2Flistinfo%2Ftpm2&amp;data=3D02%7C01%7Cleti%40vmwa
>     >
> re.com%7C9cb480a4de6e4c05043208d726699d5e%7Cb39138ca3cee4b4aa4d6cd83
>     >
> d9dd62f0%7C0%7C0%7C637020107371945259&amp;sdata=3DqYKbiICh35iXw%2FLFlT
>     > DebE0csVwZEJ9CaibN0VBCMRI%3D&amp;reserved=3D0
>     >     or, via email, send a message with subject or body 'help' to
>     >     	tpm2-request(a)lists.01.org
>     >
>     >     You can reach the person managing the list at
>     >     	tpm2-owner(a)lists.01.org
>     >
>     >     When replying, please edit your Subject line so it is more spec=
ific
>     >     than "Re: Contents of tpm2 digest..."
>     >
>     >
>     >     Today's Topics:
>     >
>     >        1. Re: Memory Leak stemming from Esys_Initialize (Timothy Le)
>     >
>     >
>     >     ---------------------------------------------------------------=
-------
>     >
>     >     Message: 1
>     >     Date: Wed, 21 Aug 2019 17:08:52 +0000
>     >     From: Timothy Le <leti(a)vmware.com>
>     >     To: Tadeusz Struk <tadeusz.struk(a)intel.com>, "tpm2(a)lists.01=
.org"
>     >     	<tpm2(a)lists.01.org>
>     >     Subject: Re: [tpm2] Memory Leak stemming from Esys_Initialize
>     >     Message-ID: <23296169-2F17-4F42-90D3-557623F3BE22(a)vmware.com>
>     >     Content-Type: text/plain; charset=3D"utf-8"
>     >
>     >     Hi,
>     >     Thank you for your e-mail. I have the most recent version of TS=
S, including
> the
>     > changes to the test made yesterday. I still have the same leak (mem=
ory
> allocated
>     > in CRYPTO_malloc and also CRYPTO_REALLOC) are not freed.
>     >
>     >
>     >
>     >     ?On 8/19/19, 11:19 AM, "Tadeusz Struk" <tadeusz.struk(a)intel.c=
om> wrote:
>     >
>     >         Hi Timothy,
>     >         On 8/16/19 3:33 PM, Timothy Le wrote:
>     >         > It seems that there is memory getting allocated in CRYPO_=
malloc that
>     > Esys_Finalize is not freeing. I have traced the code, but I don?t h=
ave access to
>     > EVP_add_digest and the other inner function calls. Would someone be=
 able
> to
>     > give me advice on how to free this memory?
>     >
>     >         Could you specify what version of TSS are you using?
>     >         There was number of fixes merged in recently to fix these l=
eaks.
>     >
>     >         Thanks,
>     >         --
>     >         Tadeusz
>     >
>     >
>     >
>     >     ------------------------------
>     >
>     >     Subject: Digest Footer
>     >
>     >     _______________________________________________
>     >     tpm2 mailing list
>     >     tpm2(a)lists.01.org
>     >
>     > https://lists.01.o
>     >
> rg%2Fmailman%2Flistinfo%2Ftpm2&amp;data=3D02%7C01%7Cleti%40vmware.com
>     >
> %7C9cb480a4de6e4c05043208d726699d5e%7Cb39138ca3cee4b4aa4d6cd83d9dd6
>     >
> 2f0%7C0%7C0%7C637020107371945259&amp;sdata=3DqYKbiICh35iXw%2FLFlTDebE0
>     > csVwZEJ9CaibN0VBCMRI%3D&amp;reserved=3D0
>     >
>     >
>     >     ------------------------------
>     >
>     >     End of tpm2 Digest, Vol 26, Issue 12
>     >     ************************************
>     >
>     >
>     > _______________________________________________
>     > tpm2 mailing list
>     > tpm2(a)lists.01.org
>     >
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.01.o
> rg%2Fmailman%2Flistinfo%2Ftpm2&amp;data=3D02%7C01%7Cleti%40vmware.com
> %7Cabe28bc870f24e301f0808d727f1eaec%7Cb39138ca3cee4b4aa4d6cd83d9dd62f
> 0%7C0%7C0%7C637021792310174248&amp;sdata=3Dn41btLwOcpu7wQGZXbgY8veX
> zx0I78lIjFnoDs%2FS72U%3D&amp;reserved=3D0
> =



--===============3792010668734935044==--

