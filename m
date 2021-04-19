Content-Type: multipart/mixed; boundary="===============7428259144595298531=="
MIME-Version: 1.0
From: Ted Kim <ted.h.kim at oracle.com>
Subject: [tpm2] Re: does -p (password) work with tpm2_import ?
Date: Mon, 19 Apr 2021 14:24:13 -0700
Message-ID: <0a7359ab-4d4b-aa5d-bb6e-0d92da9bd364@oracle.com>
In-Reply-To: d6043ca8-d5bb-a96e-fb21-f021989aa30d@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7428259144595298531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 4/16/21 11:28 AM, Ted Kim wrote:
> Folks,
>
> I tried tpm2_import with the -p option with a password, and it doesn't =

> seem to work for me.
>
> Subsequent tpm2_rsadecrypt commands using the key from the import seem =

> to work fine without any -p option.
>
> * Does import work with -p ?=C2=A0 Is there something I have overlooked i=
n =

> this?

Further, if you actually supply the correct password to tpm2_rsadecrypt =

command with the -p option, you get an auth error:

WARNING:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:305:Esys_RSA_Decrypt_Fini=
sh() =

Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_RSA_Decrypt.c:102:Esys_RSA_Decrypt() =

Esys Finish ErrorCode (0x0000098e)
ERROR: Esys_RSA_Decrypt(0x98E) - tpm:session(1):the authorization HMAC =

check failed and DA counter incremented
ERROR: Unable to run tpm2_rsadecrypt


Trying this same sequence with a key created with tpm2_create works =

fine, so am thinking there is something wrong with tpm2_import not =

processing the -p properly.

Can the maintainers look into this?

Thanks,
-ted



>
>
>
> I understand that tpm2_rsaencrypt does not take the -p option in line =

> with the idea of using a "public" key.
>
> * Is it correct to say that if I want to have authorization on =

> encryption, I have to use tpm2_encryptdecrypt (i.e. use symmetric keys) ?
>
>
>
> Thanks,
>
> -ted
>
>
--===============7428259144595298531==--

