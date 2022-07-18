Content-Type: multipart/mixed; boundary="===============5213877059041984116=="
MIME-Version: 1.0
From: Tim K <tpm2 at bitzap.e4ward.com>
Subject: [tpm2] Re: Lifecycle of handles and contexts
Date: Mon, 18 Jul 2022 17:02:45 +0000
Message-ID: <20220718170245.2549.52986@ml01.vlan13.01.org>
In-Reply-To: add83f20e790263ea0f2e7e07ced371036613fac.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5213877059041984116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> flushcontext

But when using a resource manager the context gets fushed automatically. Or=
 I can flush it manually. But still, after a flushcontext, I can just tpm2_=
unseal without loading the key again -- why does that work?
--===============5213877059041984116==--

