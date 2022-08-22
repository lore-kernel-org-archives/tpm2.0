Content-Type: multipart/mixed; boundary="===============0394719576129528048=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: System design question
Date: Mon, 22 Aug 2022 13:09:31 +0000
Message-ID: <f05d55633d2abcf9521b3ee586a93c2018cb8717.camel@intel.com>
In-Reply-To: 4206872.ejJDZkT8p0@polaris
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0394719576129528048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2022-08-21 at 14:05 +0200, Felix Rubio Dalmau wrote:
> My apologies, I have not played with TPM for long time: I had
> forgotten I =

> could tpm2_nvdefine, and then tpm2_nvwrite/nvread.
> =


The best rule of thumb is to do everything you can to not use NV
Indices. This is a very small and finite amount of space. I don't think
you need to use these if you just "hardcode" the hash values.

> Regards!
> Felix
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0394719576129528048==--

