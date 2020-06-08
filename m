Content-Type: multipart/mixed; boundary="===============6752582974831880991=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: how unique are primary keys ?
Date: Mon, 08 Jun 2020 14:20:09 +0000
Message-ID: <SN6PR11MB343776EB5ACD98A999D3EA20B8850@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 59A9AD1C-02D6-46DD-9166-600F05D99445@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6752582974831880991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Rowan Moul <lists(a)rowan.moul.ca>
> Sent: Friday, June 5, 2020 6:29 PM
> To: ted.h.kim(a)oracle.com
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: how unique are primary keys ?
> =

> The derivation function is effectively stateless as it uses the hierarchy=
 seed which
> doesn=E2=80=99t change unless you call tpm2_clear.

That depends on the hierarchy. Each seed can change under the following con=
ditions:
NULL - Reboot
OWNER - tpm2_clear
ENDORSEMENT - ChangeEPS command if supported
PLATFORN - ChangePPS command if supported

So depending on what you use for the tpm2_createprimary -C (capital C optio=
n)
Controls your hierarchy. The tools default to owner.


> This open access book explains it better than me:
> https://link.springer.com/book/10.1007%2F978-1-4302-6584-9
> A short quote from Chapter 10: Keys
> =

> =

> The key-derivation function is fixed and repeatable. For the same seed, t=
he same
> template always produces the same key. By varying the unique data in the
> template, the caller can create an unlimited number of primary keys.
> =

> The book mentions different internal TPM commands but their names don=E2=
=80=99t
> always correlate directly to the user-space tools found in tpm-tools
> =

> Rowan
> =

> =

> 	On Jun 5, 2020, at 17:02, ted.h.kim(a)oracle.com wrote:
> =

> =

> =

> 	=

> =

> 	Rowan,
> =

> 	I think I understand your point.
> =

> 	But are these KDFs "stateless"? I would think they would be like random
> number generators, where you can set the initial seed, but from then on e=
ach
> invocation updates the state. That way there is a deterministic sequence =
for a
> given starting seed, but still there is a sequence. But of course, I am n=
o expert
> about any of this.
> =

> 	Sorry I am not able clear things up on your thread.
> =

> 	Thanks,
> 	-ted
> =

> =

> 	On 6/5/20 3:34 PM, Rowan Moul wrote:
> =

> =

> 		Primary Keys are created using a deterministic key derivation
> function, the seed value of the selected hierarchy, and the key =E2=80=9C=
template=E2=80=9D
> (effectively the options you pass to tpm2_createprimary). This is the int=
ended
> functionality.
> =

> 		Your first two calls are identical, and so they will indeed produce
> the same key. The third one passes in unique data from /dev/random which =
in
> theory should make it unique, but in practice I=E2=80=99m not sure how th=
at is
> implemented (eg how much data will it actually read in?). I=E2=80=99m act=
ually surprised it
> didn=E2=80=99t fail based on my experience here:
> =

> 	https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/message/5YDZRV63
> LCGX6BZQXRW6S6F77PSS5JU5/
> <https://urldefense.com/v3/__https://lists.01.org/hyperkitty/list/tpm2(a)=
lists.01.
> org/message/5YDZRV63LCGX6BZQXRW6S6F77PSS5JU5/__;!!GqivPVa7Brio!MfGi
> We1M5tPIE6MeSRiB3WpC1xS4FOvRzXt4cLDDXmSjrARG9I7nv-UffpZC-cs$>
> 		I=E2=80=99m honesty not even convinced that what I did in that thread w=
as
> actually correct. Perhaps someone more knowledgeable will answer here and
> clear that up.
> 		Another way to make a key unique is to set an authorization
> value or policy, but you would have to have a different value for every k=
ey, which
> is where the unique data is supposed to come in if you want multiple keys=
 with
> the same authorization value.
> =

> =

> 		Rowan
> =

> =

> =

> 			On Jun 4, 2020, at 17:48, ted.h.kim(a)oracle.com
> <mailto:ted.h.kim(a)oracle.com>  wrote:
> =

> =

> =

> =

> =

> 			=EF=BB=BFFolks,
> =

> =

> =

> =

> =

> 			How unique are primary keys ?
> =

> =

> =

> =

> =

> 			As an example:
> =

> =

> =

> =

> =

> 			$ tpm2_createprimary -Q -C o -c prim1.ctx
> =

> =

> 			$ tpm2_createprimary -Q -C o -c prim2.ctx
> =

> =

> 			$ tpm2_createprimary -Q -C o -u /dev/random -c
> prim3.ctx
> =

> =

> 			$ tpm2_readpublic -c prim1.ctx > prim1.rp
> =

> =

> 			$ tpm2_readpublic -c prim2.ctx > prim2.rp
> =

> =

> 			$ tpm2_readpublic -c prim3.ctx > prim3.rp
> =

> =

> 			$ diff prim1.rp prim2.rp
> =

> =

> 			$ diff prim1.rp prim3.rp
> =

> =

> 			$
> =

> =

> =

> =

> =

> 			Is it supposed to be like this?
> =

> =

> 			Shouldn't they be different in some way?
> =

> =

> 			For prim3, I thought putting some -u data would make a
> difference, but it seems not.
> =

> =

> =

> =

> =

> 			FWIW, I am using 4.1 branch of tpm2-tools with swtpm.
> =

> =

> =

> =

> =

> 			Thanks,
> =

> =

> 			-ted
> =

> =

> =

> =

> =

> 			--
> =

> =

> 			Ted H. Kim, PhD
> =

> =

> 			ted.h.kim(a)oracle.com <mailto:ted.h.kim(a)oracle.com>
> =

> =

> 			+1 310-258-7515
> =

> =

> =

> =

> =

> =

> 	_______________________________________________
> =

> =

> 			tpm2 mailing list -- tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> =

> =

> 			To unsubscribe send an email to tpm2-leave(a)lists.01.org
> <mailto:tpm2-leave(a)lists.01.org>
> =

> =

> 			%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =

> =

> 	--
> 	Ted H. Kim, PhD
> 	ted.h.kim(a)oracle.com <mailto:ted.h.kim(a)oracle.com>
> 	+1 310-258-7515
> =

> =

> 	_______________________________________________
> 	tpm2 mailing list -- tpm2(a)lists.01.org
> 	To unsubscribe send an email to tpm2-leave(a)lists.01.org
> 	%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


--===============6752582974831880991==--

