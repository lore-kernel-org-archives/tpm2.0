Content-Type: multipart/mixed; boundary="===============7618259250646103753=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: tpm2_create fails when using -c option
Date: Tue, 13 Sep 2022 08:05:55 -0700
Message-ID: <CAOCvsS=ntedg55rR15ZkN6jPJVheybjYawyMaJJvXFUm4ty9dg@mail.gmail.com>
In-Reply-To: FR0P281MB17068E5965AD9A07F0CA072AD1439@FR0P281MB1706.DEUP281.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7618259250646103753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Depending on the particular revision of the TPM 2.0 standard your TPM
implements you may not have access to the createloaded command.  In
that case you will need to separate options into a create to make -u
and -r public and private portions, and a load to turn them into a -c
context either in a handle or on a blob on disk.

On Fri, Sep 9, 2022 at 3:45 AM Gadacz, Henry
<henry.gadacz(a)sit.fraunhofer.de> wrote:
>
> Hello everyone,
>
>
>
> I=E2=80=99m trying to create a signing key protected by an NV and PCR pol=
icy. The key is child of the storage primary key, which is protected by the=
 storage hierarchy authorization (using tpm2_policysecret). In the end I wa=
nt to make the created signing key persistent.
>
>
>
> I am running it on the swtpm emulator.
>
>
>
> I know this is a very long description, but please try to understand it ;)
>
>
>
> With the following  script the storage primary key and its policy is crea=
ted
>
> # create storage primary key
>
> tpm2_startauthsession -S session.dat
>
> tpm2_policysecret -S session.dat -c o -L storage_hierarchy.plcy $ownerPW
>
> tpm2_flushcontext session.dat
>
> rm session.dat
>
> tpm2_createprimary -C o -P $ownerPW -c SPK.ctx -L storage_hierarchy.plcy
>
> tpm2_flushcontext -t
>
>
>
> For me, the output looks fine:
>
> 0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952
>
> name-alg:
>
>   value: sha256
>
>   raw: 0xb
>
> attributes:
>
>   value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricted=
|decrypt
>
>   raw: 0x30072
>
> type:
>
>   value: rsa
>
>   raw: 0x1
>
> exponent: 65537
>
> bits: 2048
>
> scheme:
>
>   value: null
>
>   raw: 0x10
>
> scheme-halg:
>
>   value: (null)
>
>   raw: 0x0
>
> sym-alg:
>
>   value: aes
>
>   raw: 0x6
>
> sym-mode:
>
>   value: cfb
>
>   raw: 0x43
>
> sym-keybits: 128
>
> rsa: bac3fa1c537e49a84780fe71df03431d78bf41bc2cbc35433d0d5f737f74cd38d499=
222ab6a551b92378099a25bbb960e185979c216a0e10e1a7eb357baba60aef6a09ea191e5fa=
d9cc060ecc9ac5bc9807cd81ac7dd7bcc2e7c0a7d1cd5649ad950178957d343a763087234e2=
294160b609ef2912d5514207867957a602ae3c005a487f8009cebce304b014da0b919d318ca=
6ea6e5aef074290debbbeabb2bfaf85356f98d445b18535725c6b4b56bb598f2c390552c2ab=
604d7bcd53105c2660101a26628387054860debe5a71ab08cc101a71581c4ab4614d9aa0985=
1c6e085e1e9364403cc519f53d825e2944cd4d6dd740449be1557118426ba03e374d3
>
> authorization policy: 0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868=
055d65394f952
>
>
>
>
>
> The following script creates the PCR and NV policy and should create the =
signing key
>
> # create policy for signing key
>
> tpm2_startauthsession -S session.dat
>
> tpm2_policypcr -S session.dat -l "sha256:$PCR_MB"
>
> echo 0x00 | tpm2_policynv -S session.dat -L A_Sig.plcy -i- $NV_Sig_Rev eq
>
> tpm2_flushcontext session.dat
>
> rm session.dat
>
>
>
>
>
> # create signing key. Start session to fulfill policy of SPK
>
> tpm2_startauthsession -S session.dat --policy-session
>
> tpm2_policysecret -S session.dat -c o $ownerPW
>
> tpm2_create -C SPK.ctx -P session:session.dat -c A_Sig.ctx -G rsa2048 -a =
"sign|sensitivedataorigin|userwithauth" -L A_Sig.plcy --creation-data A_sig=
.creationdata -d A_Sig.dgst -t A_Sig.tckt
>
> tpm2_flushcontext session.dat
>
> rm session.dat
>
>
>
> Here I receive the an error after everything seems to be created fine.
>
> c0a056f1359a7a6ee39a1616316ef306e88bf690b2531b943b649c0a405c41a6
>
> 6e8f172b71dea4db9530edfb5d347aceca5b32e23631b7efc38ab3bb96efa8cb
>
> 0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952
>
> name-alg:
>
>   value: sha256
>
>   raw: 0xb
>
> attributes:
>
>   value: sensitivedataorigin|userwithauth|sign
>
>   raw: 0x40060
>
> type:
>
>   value: rsa
>
>   raw: 0x1
>
> exponent: 65537
>
> bits: 2048
>
> scheme:
>
>   value: null
>
> raw: 0x10
>
> scheme-halg:
>
>   value: (null)
>
>   raw: 0x0
>
> sym-alg:
>
>   value: null
>
>   raw: 0x10
>
> sym-mode:
>
>   value: (null)
>
>   raw: 0x0
>
> sym-keybits: 0
>
> rsa: 9216b7fbeebb9eae7ff3fdf1664ddd6af6939f28d451692220a58f186a0ce79b56a5=
34acb3da15523136259e58cc2030d996d99982eb3a38f240a1f55d03bf4304c714dd8d4fdc1=
d4338baba330359f06d7fc0d5749fe62e2ee3310a9b6b610e74205a8cbb16e5b5c71f69681b=
00f724bf31195434b6c8839594569e5d2fdafa6ec69cd883ad374c1afb1e973114fac06fbce=
f93d99191dafcaabc1d951ddc89866c4a996686d2397868becc1cba29fe0e5f2c8eeb5e1c99=
0e17701002b3b02636ccfe6b015d989f24087693ab2451592a9a58e38f714488fa0dbb15f98=
ffbddb10b53f132469592a90bc042166daf8eb302843c7de43d03fea5853aa5cdd21f
>
> authorization policy: 6e8f172b71dea4db9530edfb5d347aceca5b32e23631b7efc38=
ab3bb96efa8cb
>
> WARNING:esys:src/tss2-esys/api/Esys_ContextSave.c:247:Esys_ContextSave_Fi=
nish() Received TPM Error
>
> ERROR:esys:src/tss2-esys/api/Esys_ContextSave.c:92:Esys_ContextSave() Esy=
s Finish ErrorCode (0x00000184)
>
> ERROR: Esys_ContextSave(0x184) - tpm:handle(1):value is out of range or i=
s not correct for the context
>
> ERROR: Unable to run tpm2_create
>
>
>
> The A_Sig.ctx file is created but is 0 bytes large. The other files seem =
to be fine (at least they are larger than 0 bytes).
>
>
>
> However, when I run tpm2_create without the -c A_Sig.ctx option it works =
fine. To work around that by storing the public and private part in a file =
using the -u and -r option and loading it later with tpm2_load is not a sol=
ution for my scenario as it exposes the private key on the hard disk. I req=
uire the context later in to make the key persistent using tpm2_evictcontro=
l.
>
>
>
> Any ideas why tpm2_create fail when using the -c option?
>
>
>
> Any thoughts on that are appreciated.
>
>
>
> Best regards,
>
> Henry
>
>
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============7618259250646103753==--

