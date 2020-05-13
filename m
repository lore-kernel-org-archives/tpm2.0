Content-Type: multipart/mixed; boundary="===============8500741292506869272=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: configure of tpm2-tss looking for json-c
Date: Tue, 12 May 2020 18:28:06 -0700
Message-ID: <8f6fc06a-d91e-9697-321b-213891e18424@intel.com>
In-Reply-To: 2d271cf0-95aa-16d7-92c5-8779dccefc9f@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8500741292506869272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/12/20 4:23 PM, ted.h.kim(a)oracle.com wrote:
> =

> When running ./configure for tpm2-tss (2.4.x branch),
> pkg-config complains about not finding "json-c".
> =

> What is it looking for?
> I do have a /usr/lib64/libjson-c.so.4.0.0.
> =

> What is it supposed to be finding?

It needs the dev package of it.
On ubuntu type distro make sure that libjson-c-dev is installed, or
json-c-devel on fedora.

Thanks,
-- =

Tadeusz
--===============8500741292506869272==--

