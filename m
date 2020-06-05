Content-Type: multipart/mixed; boundary="===============7811026987638161217=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] Re: how unique are primary keys ?
Date: Fri, 05 Jun 2020 13:49:48 -0700
Message-ID: <dfd4d74e-f530-e466-9628-c15969c48b61@oracle.com>
In-Reply-To: 8b015c5e-624a-ed89-903d-0621df4f4b8d@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7811026987638161217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

Doesn't this behavior kind of make PolicyDuplicationSelect meaningless?
I am thinking of the example in the tpm2_policyduplicationselect man page.

If the tpm2_readpublic output is the same for all three keys, then the =

names are the same as well as the RSA public keys.

So the policy digest created by tpm2_policyduplicationselect specifying =

prim1 as parent will be the same as created for prim2 and prim3. And =

importing a duplicated key meant for prim1 as a parent will also work =

under prim2 and prim3.

Am I missing something here?

Thanks,
-ted


On 6/4/20 4:46 PM, ted.h.kim(a)oracle.com wrote:
> Folks,
>
> How unique are primary keys ?
>
> As an example:
>
> $ tpm2_createprimary -Q -C o -c prim1.ctx
> $ tpm2_createprimary -Q -C o -c prim2.ctx
> $ tpm2_createprimary -Q -C o -u /dev/random -c prim3.ctx
> $ tpm2_readpublic -c prim1.ctx > prim1.rp
> $ tpm2_readpublic -c prim2.ctx > prim2.rp
> $ tpm2_readpublic -c prim3.ctx > prim3.rp
> $ diff prim1.rp prim2.rp
> $ diff prim1.rp prim3.rp
> $
>
> Is it supposed to be like this?
> Shouldn't they be different in some way?
> For prim3, I thought putting some -u data would make a difference, but =

> it seems not.
>
> FWIW, I am using 4.1 branch of tpm2-tools with swtpm.
>
> Thanks,
> -ted
>
-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============7811026987638161217==--

