Content-Type: multipart/mixed; boundary="===============6359206763798329185=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: how unique are primary keys ?
Date: Mon, 08 Jun 2020 14:42:50 +0000
Message-ID: <SN6PR11MB3437DB5C94E6F8B873F3BD8CB8850@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 8b015c5e-624a-ed89-903d-0621df4f4b8d@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6359206763798329185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: ted.h.kim(a)oracle.com <ted.h.kim(a)oracle.com>
> Sent: Thursday, June 4, 2020 6:47 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] how unique are primary keys ?
> =

> Folks,
> =

> How unique are primary keys ?
> =

> As an example:
> =

> $ tpm2_createprimary -Q -C o -c prim1.ctx $ tpm2_createprimary -Q -C o -c
> prim2.ctx $ tpm2_createprimary -Q -C o -u /dev/random -c prim3.ctx $
> tpm2_readpublic -c prim1.ctx > prim1.rp $ tpm2_readpublic -c prim2.ctx >
> prim2.rp $ tpm2_readpublic -c prim3.ctx > prim3.rp $ diff prim1.rp prim2.=
rp $ diff
> prim1.rp prim3.rp $

You got that to work? The -u data needs to be formatted as a binary TPMU_PU=
BLIC_ID
Union (which is utterly terrible).

See:
- https://github.com/tpm2-software/tpm2-tools/commit/6c9377faf056b6700e19ce=
aa11fb6425342daa49
- https://github.com/tpm2-software/tpm2-tools/blob/master/lib/tpm2_alg_util=
.c#L957

I filed a bug against the project for this unique data format.

I tried getting it to work, briefly and failed. I'm not even sure if this f=
eature works, especially without tests
around it.

> =

> Is it supposed to be like this?
> Shouldn't they be different in some way?
> For prim3, I thought putting some -u data would make a difference, but it=
 seems
> not.
> =

> FWIW, I am using 4.1 branch of tpm2-tools with swtpm.
> =

> Thanks,
> -ted
> =

> --
> Ted H. Kim, PhD
> ted.h.kim(a)oracle.com
> +1 310-258-7515
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6359206763798329185==--

