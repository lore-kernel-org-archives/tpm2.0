Content-Type: multipart/mixed; boundary="===============0463586388402938135=="
MIME-Version: 1.0
From: accounts <burnsds.accounts at protonmail.com>
Subject: [tpm2] Re: Design for Secrets Encryption
Date: Wed, 05 Oct 2022 16:44:06 +0000
Message-ID: <curYvbu_1IG7qsmdP-fV9b_FKx4QGSXGJzWsDqSQAfR6J83t0XjVXnShaNPA_Wg_J6ttOGQ2c2XfsHnkYvpkb5sM_v6AYzEmgFmRqmlikOM=@protonmail.com>
In-Reply-To: 7f9c897fd4c8df050e653d27331407fe0aa2dafe.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0463586388402938135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable






------- Original Message -------
On Friday, September 30th, 2022 at 1:19 PM, Roberts, William C <william.c.r=
oberts(a)intel.com> wrote:


> =

> =

> On Fri, 2022-09-30 at 16:18 +0000, burnsds.accounts(a)protonmail.com
> wrote:
> =

> > Thanks for the great info! In summary I think this approach will
> > work for me:
> > =

> > Provisioning
> > - Generate a key using tss2_createkey
> =

> =

> No, you won't be able to get that key out of the TPM [1].
> Generate a key use tss2_createseal to create the sealed object.

I'm still having trouble understand how this is supposed to work.  I genera=
ted a key pair and am trying to seal my private key to the TPM.
The private key file is ~1500 bytes.  When I attempt to seal it, I receive =
the following error:

user(a)guest-vm:~/tpm_demo$ sudo tss2_createseal --path=3DHS/SRK/secrets_ke=
y --authValue=3D --type=3D"noDa" --data=3D"my-key.priv"
ERROR:fapi:src/tss2-fapi/fapi_util.c:3137:ifapi_key_create_prepare_sensitiv=
e() Data too big or equal zero. ErrorCode (0x0006000b)
ERROR:fapi:src/tss2-fapi/api/Fapi_CreateSeal.c:198:Fapi_CreateSeal_Async() =
Key create. ErrorCode (0x0006000b)
ERROR:fapi:src/tss2-fapi/api/Fapi_CreateSeal.c:106:Fapi_CreateSeal() ErrorC=
ode (0x0006000b) CreateSeal
Fapi_CreateSeal(0x6000B) - fapi:A parameter has a bad value

Is there a limit on the file size for sealing?

> =

> > - Instruct TPM to unseal encrypted key using tpm_unseal
> > - Encrypt secrets using unsealed key and openssl
> > =

> > Runtime
> > - At boot, instruct TPM to unseal encrypted key using tpm_unseal
> > - Decrypt secrets using unseal key and openssl
> > =

> > I'm still working on the correct PCR register config for auth, but
> > I'll couple this with a time based policy to mitigate the attack you
> > described.
> =

> =

> Make sure you stick with FAPI API or tss2_ prefixed tools to pick up
> automatic paramter and response encryption with the TPM. I see you
> mixing tss2_ and tpm2_ tools. Just stuck with FAPI if you can.

Understood.

> =

> [1] Not 100% true, depends on object attributes and it can be more pain
> to get it back out to just then have to seal it the tpm (you always
> have to run tss2_createseal).
> =

> > Thanks again!
> > Dan
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============0463586388402938135==--

