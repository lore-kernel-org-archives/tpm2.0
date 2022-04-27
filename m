Content-Type: multipart/mixed; boundary="===============5544345824598015456=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Wed, 27 Apr 2022 19:37:32 +0200
Message-ID: <20220427193732.704789D2@centrum.cz>
In-Reply-To: DS7PR03MB557663142DFF081829F097179AFA9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5544345824598015456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>CMS encryption fails as follows:
>
>$ openssl cms -encrypt -provider tpm2 -provider base -in file.txt -recip h=
andle:0x01000013
>WARNING:esys:src/tss2-esys/api/Esys_CreateLoaded.c:368:Esys_CreateLoaded_F=
inish() Received TPM Error
>ERROR:esys:src/tss2-esys/api/Esys_CreateLoaded.c:129:Esys_CreateLoaded() E=
sys Finish ErrorCode (0x000b0143)
>40FCFCC0017F0000:error:4000000B:tpm2::cannot create key::-1:721219 rmt:err=
or(2.0): command code not supported
>
>This looks like https://github.com/tpm2-software/tpm2-openssl/issues/29.
> For my use case, support for TPMs without the CreateLoaded command will b=
e essential.  My machines have an OPTIGA TPM2.

The CreateLoaded issue should be fixed now (in the latest master branch).


Petr
--===============5544345824598015456==--

