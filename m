Content-Type: multipart/mixed; boundary="===============6754720692173805236=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Design for Secrets Encryption
Date: Fri, 30 Sep 2022 17:19:10 +0000
Message-ID: <7f9c897fd4c8df050e653d27331407fe0aa2dafe.camel@intel.com>
In-Reply-To: 20220930161851.2030.62377@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6754720692173805236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-09-30 at 16:18 +0000, burnsds.accounts(a)protonmail.com
wrote:
> Thanks for the great info!  In summary I think this approach will
> work for me:
> =

> Provisioning
> - Generate a key using tss2_createkey

No, you won't be able to get that key out of the TPM [1].
Generate a key use tss2_createseal to create the sealed object.

> - Instruct TPM to unseal encrypted key using tpm_unseal
> - Encrypt secrets using unsealed key and openssl
> =

> Runtime
> - At boot, instruct TPM to unseal encrypted key using tpm_unseal
> - Decrypt secrets using unseal key and openssl
> =

> I'm still working on the correct PCR register config for auth, but
> I'll couple this with a time based policy to mitigate the attack you
> described.

Make sure you stick with FAPI API or tss2_ prefixed tools to pick up
automatic paramter and response encryption with the TPM. I see you
mixing tss2_ and tpm2_ tools. Just stuck with FAPI if you can.

[1] Not 100% true, depends on object attributes and it can be more pain
to get it back out to just then have to seal it the tpm (you always
have to run tss2_createseal).

> =

> Thanks again!
> Dan
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6754720692173805236==--

