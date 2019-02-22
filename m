Content-Type: multipart/mixed; boundary="===============8079768920063382505=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] tpm2_encryptdecrypt : other mode than the persistent key
Date: Fri, 22 Feb 2019 09:15:40 -0800
Message-ID: <e55e1371-4662-927a-058f-b811b0c2aae7@intel.com>
In-Reply-To: VI1PR04MB5424E6EB722498DFF8B16B54DC7F0@VI1PR04MB5424.eurprd04.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8079768920063382505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/22/19 8:21 AM, Gael GUEGAN wrote:
> When using the command : **tpm2_encryptdecrypt**, should we be able to ci=
pher with a different mode than the one specified in the key ?
> =

> =C2=A0
> =

> For example, if I have created a persistent **aes256cfb** :
> =

> =C2=A0
> =

> ```shell
> =

> Tpm2_listpersistent
> =

> - handle: 0x81000001
> =

> =C2=A0 name-alg:
> =

> =C2=A0=C2=A0=C2=A0 value: sha256
> =

> =C2=A0=C2=A0=C2=A0 raw: 0xb
> =

> =C2=A0 attributes:
> =

> =C2=A0=C2=A0=C2=A0 value: fixedtpm|fixedparent|sensitivedataorigin|userwi=
thauth|decrypt|sign
> =

> =C2=A0=C2=A0=C2=A0 raw: 0x60072
> =

> =C2=A0 type:
> =

> =C2=A0=C2=A0=C2=A0 value: symcipher
> =

> =C2=A0=C2=A0=C2=A0 raw: 0x25
> =

> =C2=A0 sym-alg:
> =

> =C2=A0=C2=A0=C2=A0 value: aes
> =

> =C2=A0=C2=A0=C2=A0 raw: 0x6
> =

> =C2=A0 sym-mode:
> =

> =C2=A0=C2=A0=C2=A0 value: ctr
> =

> =C2=A0=C2=A0=C2=A0 raw: 0x40
> =

> =C2=A0 sym-keybits: 128
> =

> =C2=A0 symcipher: 873f743994e47004602011039322b108b49318c305b4f5eeace36b1=
fe634e36d=C2=A0
> =

> =C2=A0
> =

> tpm2_encryptdecrypt -c 0x81000001 -I data.txt -o enc_data.txt -G cbc
> =

> ERROR: Esys_EncryptDecrypt(0x2C9) - tpm:parameter(2):mode of operation no=
t supported
> =

> ```
> =

> =C2=A0
> =

> This does not work ...
> =

> =C2=A0
> =

> ```shell
> =

> tpm2_encryptdecrypt -c 0x8100001 -I data.txt -o enc_data.txt -G cfb
> =

> ```
> =

> =C2=A0
> =

> This works ...
> =

> =C2=A0
> =

> Why the option -G exists, if it is to specified a mode already present in=
 the key ?

That is required by the TCG specification:
"symmetric mode shall match the default mode of the key or be TPM_ALG_NULL."

See "15.2 TPM2_EncryptDecrypt" in =

https://www.trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-3=
-Commands-01.38.pdf

Thanks,
-- =

Tadeusz

--===============8079768920063382505==--

