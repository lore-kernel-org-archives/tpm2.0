Content-Type: multipart/mixed; boundary="===============0701200572532717834=="
MIME-Version: 1.0
From: Timothy Le <leti at vmware.com>
Subject: Re: [tpm2] Memory Leak stemming from Esys_Initialize
Date: Wed, 21 Aug 2019 17:08:52 +0000
Message-ID: <23296169-2F17-4F42-90D3-557623F3BE22@vmware.com>
In-Reply-To: 0136ddaa-ebf0-9ef2-c8b7-86f22ef880c0@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0701200572532717834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
Thank you for your e-mail. I have the most recent version of TSS, including=
 the changes to the test made yesterday. I still have the same leak (memory=
 allocated in CRYPTO_malloc and also CRYPTO_REALLOC) are not freed.



=EF=BB=BFOn 8/19/19, 11:19 AM, "Tadeusz Struk" <tadeusz.struk(a)intel.com> =
wrote:

    Hi Timothy,
    On 8/16/19 3:33 PM, Timothy Le wrote:
    > It seems that there is memory getting allocated in CRYPO_malloc that =
Esys_Finalize is not freeing. I have traced the code, but I don=E2=80=99t h=
ave access to EVP_add_digest and the other inner function calls. Would some=
one be able to give me advice on how to free this memory?
    =

    Could you specify what version of TSS are you using?
    There was number of fixes merged in recently to fix these leaks.
    =

    Thanks,
    -- =

    Tadeusz
    =



--===============0701200572532717834==--

