Content-Type: multipart/mixed; boundary="===============4050683583882085620=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: tpm2_createprimary command
Date: Mon, 14 Oct 2019 10:52:52 -0700
Message-ID: <d5d5b92f-2f7a-7efe-7ee4-8aa31051ae23@intel.com>
In-Reply-To: 20191014090543.2603.52642@new-ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4050683583882085620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/14/19 2:05 AM, mohammed.aitbendaoud(a)gmail.com wrote:
>      tpm2_create -H 0x80000000 -g sha256 -G aes -u key.pub -r AESkey.priv =

> =

> when I put aes in parameter it returns me an error : type algorithm not s=
upport 0x6
> =

>  2- Why the tpm2-tools does not support aes while the hardware chip of th=
e TPM supports it ?

The create tool does support aes algorithm. The error code doesn't look rig=
ht.
To create a symmetric aes key please follow the example on:

https://github.com/tpm2-software/tpm2-tools/wiki/Creating-Objects

Thanks,
-- =

Tadeusz
--===============4050683583882085620==--

