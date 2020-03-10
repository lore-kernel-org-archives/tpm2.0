Content-Type: multipart/mixed; boundary="===============2720441770771150745=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_certify signature verification
Date: Tue, 10 Mar 2020 16:56:50 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E9937A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200307131229.2908.93567@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2720441770771150745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Imran could you weigh in on this?

Thanks,
Bill

> -----Original Message-----
> From: andrew.featherstone(a)gmail.com
> [mailto:andrew.featherstone(a)gmail.com]
> Sent: Saturday, March 7, 2020 7:12 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2_certify signature verification
> =

> Hi there,
> =

> I'm trying to use the output of tpm2_certify to construt the Subject Key
> Attestation Evidence Extension (SKAE Extension)[1] for a X.509 Certificate
> Request. I've followed the example at https://github.com/tpm2-software/tp=
m2-
> tools/blob/master/man/tpm2_certify.1.md , but I'm struggling to work out =
how
> to use the tpm2-tools to check the signature over the attestation structu=
re.
> Looking at https://github.com/tpm2-software/tpm2-
> tools/blob/master/man/tpm2_verifysignature.1.md I expected to perform
> something like the following (unfortunately I'm not able to retrieve the =
complete
> command history right now):
> =

> tpm2_create -G rsa -u rsa.pub -r rsa.priv -C primary.ctx tpm2_load -C pri=
mary.ctx
> -u rsa.pub -r rsa.priv -c rsa.ctx tpm2_certify -c rsa.ctx -C certify.ctx =
-g sha256 -o
> attest.out -s sig.out tpm2_verifysignature -c rsa.ctx -g sha256 -m attest=
.out -s
> sig.out
> WARNING:esys:../tpm2-tss-2.3.2/src/tss2-
> esys/api/Esys_VerifySignature.c:302:Esys_VerifySignature_Finish() Received
> TPM Error
> ERROR:esys:../tpm2-tss-2.3.2/src/tss2-
> esys/api/Esys_VerifySignature.c:103:Esys_VerifySignature() Esys Finish Er=
rorCode
> (0x000002db)
> ERROR: Esys_VerifySignature(0x2DB) - tpm:parameter(2):the signature is not
> valid
> ERROR: Verify signature failed!
> ERROR: Unable to run tpm2_verifysignature
> =

> Is anyone able to post a complete example to show how the output of
> tpm2_certify is verified, based on the attestation key used?
> =

> [1] https://trustedcomputinggroup.org/wp-
> content/uploads/IWG_SKAE_Extension_1-00.pdf
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============2720441770771150745==--

