Content-Type: multipart/mixed; boundary="===============6689088026555001218=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: TPM2 provider stuck during handshake
Date: Wed, 08 Jun 2022 14:47:33 +0000
Message-ID: <d834126aaf05947ecebfe91f7ea9e5608595fca3.camel@intel.com>
In-Reply-To: a2a22769-f6cb-7e5a-8db1-db1dd9f6e6e9@haproxy.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6689088026555001218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-06-08 at 16:16 +0200, Remi Tricot-Le Breton wrote:
> Hello,
> =

> I've been trying to make the TPM2 provider work in my environment =

> (Ubuntu 20.04) for quite some time and I did not succeed yet.

Interesting so you must have OpenSSL version 3.0 or greater installed
becuase it defaults to OpenSSL 1.1.1f. Below it seems provider
options work, so that must be the case.

> =

> I tried using the commands suggested in docs/certificates.md to
> create a =

> self signed certificate which I then used in an "openssl s_server" =

> instance but when I try to connect to this SSL server, the handshake =

> fails to complete.
> The three commands I used are the following:
>      openssl req -provider tpm2 -x509 -subj "/C=3DGB/CN=3Dfoo" -keyout =

> testkey.pem -out testcert.pem
>      openssl s_server -provider tpm2 -provider default -propquery =

> ?provider=3Dtpm2 -accept 4443 -www -key testkey.pem -cert testcert.pem
>      curl --cacert testcert.pem https://localhost:4443/
> =

> The curl command ends in a timeout and the server remains stuck
> (without =

> raising errors).
> =

> I rebuilt the tpm2 provider with the enable-debug=3Dyes option added
> in =

> order to understand what was happening and I noticed that the server
> was =

> stuck when trying to duplicate a context ("DIGEST DUP" was dumped on
> the =

> server's standard output), and more specifically in the =

> Tss2_Sys_ExecuteFinish function which in turn calls tctildr_receive
> with =

> a -1 timeout (out of which we apparently never get out).
> =

> Do any of you know if I missed something or if it is a bug ?
> I could provide the full standard output log or a complete backtrace
> of =

> the stuck server if needed but they might end up being unnecessary
> noise =

> if the bug comes from my wrong use of the provider.
> =


So if it is stuck in OSSL_FUNC_DIGEST_DUPCTX, which is a call to
tpm2_digest_dupctx, which calls tpm2_hash_sequence_dup and has two TPM
functions within it, Esys_ContextSave and Esys_ContextLoad do you know
which one it's hanging in?

are your running against a real TPM or the simulator and have you tried
it with the simulator? If you are running against a real TPM what is
your TCTI, is it using /dev/tpm0 or /dev/tpmrm0 or tpm2-abrmd?


> Thanks
> =

> R=C3=A9mi LB
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6689088026555001218==--

