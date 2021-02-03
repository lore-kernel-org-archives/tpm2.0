Content-Type: multipart/mixed; boundary="===============0316725641316701128=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: Calculating name of created AK- server side
Date: Wed, 03 Feb 2021 18:28:34 +0000
Message-ID: <20210203182834.2958.36571@ml01.vlan13.01.org>
In-Reply-To: 20210129184444.2975.25320@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0316725641316701128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I see. A quick explainer :)

So AKname is not a secret. Neither is it possible to fake one. And so can b=
e handed from the client to the server anytime. (tpm2_readpublic -c ak.ctx =
-n ak.name)

The credential challenge posed by the server (makecredential) wraps and enc=
rypts a plaintext-credential using the EKpublic and AKname.

Only a client with access to the respective sensitive(private) portions of =
the EK and AK will have to load the keys on the TPM and it is then able to =
unwrap/decrypt the credentialBlob with credential-activation.
--===============0316725641316701128==--

