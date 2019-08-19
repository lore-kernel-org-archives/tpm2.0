Content-Type: multipart/mixed; boundary="===============8846315369725986767=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] Memory Leak stemming from Esys_Initialize
Date: Mon, 19 Aug 2019 11:19:44 -0700
Message-ID: <0136ddaa-ebf0-9ef2-c8b7-86f22ef880c0@intel.com>
In-Reply-To: 4F12017E-B957-4DB4-A070-EFC4182B6A3B@vmware.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8846315369725986767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Timothy,
On 8/16/19 3:33 PM, Timothy Le wrote:
> It seems that there is memory getting allocated in CRYPO_malloc that Esys=
_Finalize is not freeing. I have traced the code, but I don=E2=80=99t have =
access to EVP_add_digest and the other inner function calls. Would someone =
be able to give me advice on how to free this memory?

Could you specify what version of TSS are you using?
There was number of fixes merged in recently to fix these leaks.

Thanks,
-- =

Tadeusz

--===============8846315369725986767==--

