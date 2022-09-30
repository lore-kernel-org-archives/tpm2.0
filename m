Content-Type: multipart/mixed; boundary="===============0846149733785924007=="
MIME-Version: 1.0
From: burnsds.accounts at protonmail.com
Subject: [tpm2] Re: Design for Secrets Encryption
Date: Fri, 30 Sep 2022 16:18:51 +0000
Message-ID: <20220930161851.2030.62377@ml01.vlan13.01.org>
In-Reply-To: 1805d5c56015983cc4ebdee5f2f46d7ed206ecef.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0846149733785924007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the great info!  In summary I think this approach will work for =
me:

Provisioning
- Generate a key using tss2_createkey
- Instruct TPM to unseal encrypted key using tpm_unseal
- Encrypt secrets using unsealed key and openssl

Runtime
- At boot, instruct TPM to unseal encrypted key using tpm_unseal
- Decrypt secrets using unseal key and openssl

I'm still working on the correct PCR register config for auth, but I'll cou=
ple this with a time based policy to mitigate the attack you described.

Thanks again!
Dan
--===============0846149733785924007==--

