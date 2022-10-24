Content-Type: multipart/mixed; boundary="===============6918935371638491171=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How can I prevent MITM attacks for unsealing?
Date: Mon, 24 Oct 2022 17:36:57 +0000
Message-ID: <ad9e3a52f01151e9918c29c7f91da4ffb23b1bd8.camel@intel.com>
In-Reply-To: SN6PR11MB343793B30F914D1C4D11D625B82E9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6918935371638491171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-10-24 at 17:32 +0000, Roberts, William C wrote:
> The TPM2_Cerify command can certify that another key is the TPM based
> on a key you trust, like the EK.

But bear in mind that again your verifying to something so the threat
is always the attacker changes to what your verifying to. If your
verification data is as tamper-able as your store you didn't gain
anything. If your verification data is on some RO partition that is
checked for tampering, then that would be better.

> =

> Bill
> From: joseph(a)zeronsoftn.com <joseph(a)zeronsoftn.com>
> Sent: Friday, October 21, 2022 11:23 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> Subject: Re[5]: [tpm2] How can I prevent MITM attacks for unsealing?
>  =

> Serialized primary.handle has a Public Key.
> Is there a way to verify whether this public key is a key created by
> the TPM through the TPM's EK?
> If this is possible, it will not be possible to protect against MITM
> in general, but if you have the CA of specific TPM manufacturers
> safely or remotely verify it, can be defend against MITM.
> =ED=86=A0=EC=9A=94=EC=9D=BC, 22 10=EC=9B=94 2022, 02:43=EC=98=A4=EC=A0=84=
 +09:00 =EB=B0=9C=EC=8B=A0 "Roberts, William C" =

> william.c.roberts(a)intel.com:
> =

> > On Mon, 2022-10-10 at 18:07 +0300, joseph(a)zeronsoftn.com wrote:
> > > =

> > > Here is the commands I tried:
> > > =

> > https://gist.github.com/jclab-joseph/d1d6d9bbbd32c0fe200cc7725bcf0d86
> > > A session was established via a serialized persistent handle.
> > > This seems to be able to prevent MITM in the session connection
> > > process.
> > > =

> > > But, assume that an attacker can modify the filesystem.
> > > If the primary.handle can be replaced with the attacker's key,
> > the
> > > session will be successfully established.
> > > And I suspect that plaintext can be exposed if unsealed through
> > the
> > > session.
> > > =

> > > Wouldn't validation be needed between the connected session and
> > > seal.ctx?
> > If the attacker can modify the primary.handle, which is verifying
> > the
> > encrypted session, then yes you need something else. You could add
> > a
> > bind key with a password and have the user enter the password and
> > thus
> > nothing for the attacker to attack that is stored on disk.
> > =

> > > =

> > > =ED=99=94=EC=9A=94=EC=9D=BC, 04 10=EC=9B=94 2022, 00:54=EC=98=A4=EC=
=A0=84 +09:00 =EB=B0=9C=EC=8B=A0 "Roberts, William C" =

> > > william.c.roberts(a)intel.com:
> > > =

> > > > On Mon, 2022-10-03 at 18:01 +0300, joseph(a)zeronsoftn.com wrote:
> > > > > Hello,
> > > > > =

> > > > > Does anyone know about this issue?
> > > > > =

> > > > > =

> > > > =

> > https://github.com/jc-lab/securekit/blob/466abe16bfe4f28ef86db6bc726492=
14ab2e4b51/pkg/securekit-disk/opt/securekit/sbin/disk-init#L82-L86
> > > > > =

> > > > > Here's one example of sealing and unsealing.
> > > > > This method seems (probably?) to prevent the sniffing attack,
> > > > which
> > > > > was a vulnerability of Bitlocker in the past.
> > > > > =

> > > > > But isn't a MITM attack possible in the process of creating
> > an
> > > > > encrypted session?
> > > > So just to unpack the commands here for discussion I copied
> > that
> > > > code
> > > > block:
> > > > =

> > > > tpm2_createprimary -Q -C o -c tpm-primary.ctx
> > > > tpm2_load -Q -C tpm-primary.ctx -u ${p1_dir}/seal.pub -r
> > > > ${p1_dir}/seal.priv -c tpm-seal.ctx
> > > > tpm2_startauthsession -Q --hmac-session -c tpm-primary.ctx -S
> > > > session.ctx
> > > > tpm2_unseal -Q -p pcr:${tpm_seal_pcr_policy} -c tpm-seal.ctx -o
> > > > ${output}
> > > > cleanupSession
> > > > =

> > > > The issue here is that the key created by the
> > tpm2_createprimary
> > > > command doesn't have provenance, so it's just be trusted
> > implicitly
> > > > even through it could be attacker controlled. If the attacker
> > was
> > > > controlling the primary object, they could just forward the
> > > > commands
> > > > unencrypted to the TPM and get the unseal to release them the
> > key
> > > > in
> > > > the clear.
> > > > =

> > > > > =

> > > > > I am not familiar with the process of establishing a session,
> > > > > However, it seems that MITM can be prevented only by using a
> > > > session
> > > > > key encrypted with the EK of the TPM, or by signing the
> > > > asymmetric
> > > > > key with the EK to derive the key, when creating a session.
> > > > =

> > > > You just need a way to ensure provenance. Another way is to
> > load an
> > > > established key to the TPM and start the authsession with that.
> > If
> > > > you're using a persistent key you need to verify the name after
> > > > establishing the session or use something like a serialized
> > ESYS_TR
> > > > which will do the name checking automatically. If you load a
> > key
> > > > blob
> > > > to the TPM that you control, ESAPI will have the checks in
> > place to
> > > > make sure you don't get duped.
> > > > =

> > > > > =

> > > > > Is MITM not considered in TPM? Or is there another way?
> > > > =

> > > > It is considered in the TPM and is discussed in the
> > architecture
> > > > document. Theirs a few ways you can securely set up an
> > encrypted
> > > > session, either with EK and associated Certificate or through
> > other
> > > > keys like the SRK. The big thing is, you have to do it in a way
> > > > where
> > > > the attacker can not MiTM the session establishment, which
> > boils
> > > > down
> > > > to using a known key.
> > > > =

> > > > > =

> > > > > Regards,
> > > > > =

> > > > > =

> > > > > =

> > > > > =

> > > > > =

> > > > > _______________________________________________
> > > > > tpm2 mailing list -- tpm2(a)lists.01.org
> > > > > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > > > > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > > =

> > > =

> > > =

> =

> =

> =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6918935371638491171==--

