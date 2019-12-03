Content-Type: multipart/mixed; boundary="===============5808469411901410083=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: RSA key pairs are gone when I reboot
Date: Tue, 03 Dec 2019 08:59:21 -0800
Message-ID: <bd59db4e-54b1-1c9e-e665-e3b2307073d1@intel.com>
In-Reply-To: CALtZhhN1mypXuHrt1ydFS0c1aL5zmO3FnOqWQt74-pg6h+5ghQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5808469411901410083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/3/19 7:54 AM, Frederick Gotham wrote:
> How do I store an RSA key pair persistently/permanently inside the TPM2 c=
hip?

You can use tpm2_evictcontrol tool to make the key persistent.

--
Tadeusz
--===============5808469411901410083==--

