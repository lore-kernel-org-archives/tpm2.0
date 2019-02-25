Content-Type: multipart/mixed; boundary="===============7397481670801281200=="
MIME-Version: 1.0
From: Gael GUEGAN <Gael.Guegan at non.se.com>
Subject: Re: [tpm2] tpm2_encryptdecrypt : other mode than the persistent key
Date: Mon, 25 Feb 2019 08:22:00 +0000
Message-ID: <VI1PR04MB5424E5E60803032C4E5019C6DC7A0@VI1PR04MB5424.eurprd04.prod.outlook.com>
In-Reply-To: e55e1371-4662-927a-058f-b811b0c2aae7@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7397481670801281200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for your help. I am sorry I don't know all the specification.

Gael GUEGAN


-----Message d'origine-----
De=C2=A0: Tadeusz Struk <tadeusz.struk(a)intel.com> =

Envoy=C3=A9=C2=A0: vendredi 22 f=C3=A9vrier 2019 18:16
=C3=80=C2=A0: Gael GUEGAN <Gael.Guegan(a)non.se.com>; tpm2(a)lists.01.org
Objet=C2=A0: Re: [tpm2] tpm2_encryptdecrypt : other mode than the persisten=
t key

[External email: Use caution with links and attachments]

________________________________



On 2/22/19 8:21 AM, Gael GUEGAN wrote:
> When using the command : **tpm2_encryptdecrypt**, should we be able to ci=
pher with a different mode than the one specified in the key ?
>
>
>
> For example, if I have created a persistent **aes256cfb** :
>
>
>
> ```shell
>
> Tpm2_listpersistent
>
> - handle: 0x81000001
>
>   name-alg:
>
>     value: sha256
>
>     raw: 0xb
>
>   attributes:
>
>     value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|=
sign
>
>     raw: 0x60072
>
>   type:
>
>     value: symcipher
>
>     raw: 0x25
>
>   sym-alg:
>
>     value: aes
>
>     raw: 0x6
>
>   sym-mode:
>
>     value: ctr
>
>     raw: 0x40
>
>   sym-keybits: 128
>
>   symcipher: 873f743994e47004602011039322b108b49318c305b4f5eeace36b1fe634=
e36d
>
>
>
> tpm2_encryptdecrypt -c 0x81000001 -I data.txt -o enc_data.txt -G cbc
>
> ERROR: Esys_EncryptDecrypt(0x2C9) - tpm:parameter(2):mode of operation no=
t supported
>
> ```
>
>
>
> This does not work ...
>
>
>
> ```shell
>
> tpm2_encryptdecrypt -c 0x8100001 -I data.txt -o enc_data.txt -G cfb
>
> ```
>
>
>
> This works ...
>
>
>
> Why the option -G exists, if it is to specified a mode already present in=
 the key ?

That is required by the TCG specification:
"symmetric mode shall match the default mode of the key or be TPM_ALG_NULL."

See "15.2 TPM2_EncryptDecrypt" in
https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.tr=
ustedcomputinggroup.org%2Fwp-content%2Fuploads%2FTPM-Rev-2.0-Part-3-Command=
s-01.38.pdf&amp;data=3D02%7C01%7CGael.Guegan%40non.se.com%7C6f70d3c8c29a49c=
0ed1e08d698e9618a%7C6e51e1adc54b4b39b5980ffe9ae68fef%7C0%7C0%7C636864525463=
760195&amp;sdata=3DpPDgu3TfHY544zlcDyl4%2BzM%2BM9J%2F4lvpZpLJcJU3xqM%3D&amp=
;reserved=3D0

Thanks,
--
Tadeusz

______________________________________________________________________
This email has been scanned by the Symantec Email Security.cloud service.
______________________________________________________________________

--===============7397481670801281200==--

