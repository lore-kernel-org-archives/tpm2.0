Content-Type: multipart/mixed; boundary="===============5124436020572076451=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_certify signature verification
Date: Wed, 11 Mar 2020 15:15:25 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E996BB@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAGW41X47Yz3MDeu2Z3qvbc0wCvrOKJiLOE9J5qf_65mTZd+Mrg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5124436020572076451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Andrew Featherstone [mailto:andrew.featherstone(a)gmail.com]
> Sent: Tuesday, March 10, 2020 5:29 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org; Desai, Imran <imran.desai(a)intel.com>
> Subject: Re: [tpm2] tpm2_certify signature verification
> =

> I think I've made some progress here. I think the signature is over a dig=
est of the
> entire attestation structure. Here's an example of certifying a primary k=
ey under
> the endorsement hierarchy. I think this could do with a little polish, bu=
t I think it's
> a useful example. The eventual aim is to use this as part of the SKAE Ext=
ension in
> X.509 certificates.
> =

> =

> tpm2_createprimary -Q -C e -g sha256 -G rsa -c primary.ctx tpm2_create -Q=
 -g
> sha256 -G rsa -u certify.pub -r certify.priv -C primary.ctx # Generate a =
PEM file
> suitable for use with OpenSSL containing the public key used to certify t=
he
> primary key.
> tpm2_readpublic -Q -c certify.ctx -f pem -o certify.pem tpm2_certify -Q -c
> primary.ctx -C certify.ctx -g sha256 -o attest.out -s sig.out # We're onl=
y interested
> in the raw SHA-256 signature, not the TPMT_SIGNATURE's
> TPMI_ALG_SIG_SCHEME, so extract the raw signature from the last 256 bytes.
> tail -c 256 sig.out > sig.out.raw

tpm2_certify has -f or --format option where you can get the output without=
 the algorithm
and thus avoiding the use of tail and peering into TSS structures blindly.


> # Verify the signature across a SHA-256 digest of the TPM2B_ATTEST struct=
ure
> using OpenSSL.
> $ openssl dgst -verify certify.pem -keyform pem -sha256 -signature sig.ou=
t.raw
> attest.out Verified OK
> =

> On Tue, 10 Mar 2020 at 16:56, Roberts, William C <william.c.roberts(a)int=
el.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	Imran could you weigh in on this?
> =

> 	Thanks,
> 	Bill
> =

> 	> -----Original Message-----
> 	> From: andrew.featherstone(a)gmail.com
> <mailto:andrew.featherstone(a)gmail.com>
> 	> [mailto:andrew.featherstone(a)gmail.com
> <mailto:andrew.featherstone(a)gmail.com> ]
> 	> Sent: Saturday, March 7, 2020 7:12 AM
> 	> To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> Subject: [tpm2] tpm2_certify signature verification
> 	>
> 	> Hi there,
> 	>
> 	> I'm trying to use the output of tpm2_certify to construt the Subject K=
ey
> 	> Attestation Evidence Extension (SKAE Extension)[1] for a X.509
> Certificate
> 	> Request. I've followed the example at https://github.com/tpm2-
> software/tpm2-
> 	> tools/blob/master/man/tpm2_certify.1.md
> <http://tpm2_certify.1.md>  , but I'm struggling to work out how
> 	> to use the tpm2-tools to check the signature over the attestation
> structure.
> 	> Looking at https://github.com/tpm2-software/tpm2-
> 	> tools/blob/master/man/tpm2_verifysignature.1.md
> <http://tpm2_verifysignature.1.md>  I expected to perform
> 	> something like the following (unfortunately I'm not able to retrieve t=
he
> complete
> 	> command history right now):
> 	>
> 	> tpm2_create -G rsa -u rsa.pub -r rsa.priv -C primary.ctx tpm2_load -C
> primary.ctx
> 	> -u rsa.pub -r rsa.priv -c rsa.ctx tpm2_certify -c rsa.ctx -C certify.c=
tx -g
> sha256 -o
> 	> attest.out -s sig.out tpm2_verifysignature -c rsa.ctx -g sha256 -m
> attest.out -s
> 	> sig.out
> 	> WARNING:esys:../tpm2-tss-2.3.2/src/tss2-
> 	> esys/api/Esys_VerifySignature.c:302:Esys_VerifySignature_Finish()
> Received
> 	> TPM Error
> 	> ERROR:esys:../tpm2-tss-2.3.2/src/tss2-
> 	> esys/api/Esys_VerifySignature.c:103:Esys_VerifySignature() Esys Finish
> ErrorCode
> 	> (0x000002db)
> 	> ERROR: Esys_VerifySignature(0x2DB) - tpm:parameter(2):the signature
> is not
> 	> valid
> 	> ERROR: Verify signature failed!
> 	> ERROR: Unable to run tpm2_verifysignature
> 	>
> 	> Is anyone able to post a complete example to show how the output of
> 	> tpm2_certify is verified, based on the attestation key used?
> 	>
> 	> [1] https://trustedcomputinggroup.org/wp-
> 	> content/uploads/IWG_SKAE_Extension_1-00.pdf
> 	> _______________________________________________
> 	> tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>
> 	> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =



--===============5124436020572076451==--

