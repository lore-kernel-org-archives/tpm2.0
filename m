Content-Type: multipart/mixed; boundary="===============3756101873736696016=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How can I prevent MITM attacks for unsealing?
Date: Mon, 03 Oct 2022 15:56:10 +0000
Message-ID: <587e9568640f16258a970e2f3c5f369cde83a029.camel@intel.com>
In-Reply-To: 3d12759fa0272161dceb21c01026e94d6560fe3b.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3756101873736696016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-10-03 at 15:54 +0000, Roberts, William C wrote:
> On Mon, 2022-10-03 at 18:01 +0300, joseph(a)zeronsoftn.com wrote:
> > Hello,
> > =

> > Does anyone know about this issue?
> > =

> > https://github.com/jc-lab/securekit/blob/466abe16bfe4f28ef86db6bc726492=
14ab2e4b51/pkg/securekit-disk/opt/securekit/sbin/disk-init#L82-L86
> > =

> > Here's one example of sealing and unsealing.
> > This method seems (probably?) to prevent the sniffing attack, which
> > was a vulnerability of Bitlocker in the past.
> > =

> > But isn't a MITM attack possible in the process of creating an
> > encrypted session?
> =

> So just to unpack the commands here for discussion I copied that code
> block:
> =

> tpm2_createprimary -Q -C o -c tpm-primary.ctx
> tpm2_load -Q -C tpm-primary.ctx -u ${p1_dir}/seal.pub -r
> ${p1_dir}/seal.priv -c tpm-seal.ctx
> tpm2_startauthsession -Q --hmac-session -c tpm-primary.ctx -S
> session.ctx
> tpm2_unseal -Q -p pcr:${tpm_seal_pcr_policy} -c tpm-seal.ctx -o
> ${output}
> cleanupSession
> =

> The issue here is that the key created by the tpm2_createprimary
> command doesn't have provenance, so it's just be trusted implicitly
> even through it could be attacker controlled. If the attacker was
> controlling the primary object, they could just forward the commands
> unencrypted to the TPM and get the unseal to release them the key in
> the clear.
> =

> > I am not familiar with the process of establishing a session,
> > However, it seems that MITM can be prevented only by using a
> > session
> > key encrypted with the EK of the TPM, or by signing the asymmetric
> > key with the EK to derive the key, when creating a session.
> =

> You just need a way to ensure provenance. Another way is to load an
> established key to the TPM and start the authsession with that. If
> you're using a persistent key you need to verify the name after
> establishing the session or use something like a serialized ESYS_TR
> which will do the name checking automatically. If you load a key blob
> to the TPM that you control, ESAPI will have the checks in place to
> make sure you don't get duped.
> =

> > Is MITM not considered in TPM? Or is there another way?
> =

> It is considered in the TPM and is discussed in the architecture
> document. Theirs a few ways you can securely set up an encrypted
> session, either with EK and associated Certificate or through other
> keys like the SRK. The big thing is, you have to do it in a way where
> the attacker can not MiTM the session establishment, which boils down
> to using a known key.

Actually the seem to be aware of this in their README:
https://github.com/jc-lab/securekit#do-not-use-yet

> =

> > Regards,
> > =

> > =

> > =

> > =

> > =

> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3756101873736696016==--

