Content-Type: multipart/mixed; boundary="===============1655433387415203842=="
MIME-Version: 1.0
From: kuba.michal.n at gmail.com
Subject: [tpm2] Re: Calculating name of created AK- server side
Date: Fri, 29 Jan 2021 18:44:44 +0000
Message-ID: <20210129184444.2975.25320@ml01.vlan13.01.org>
In-Reply-To: 20210129161232.2975.41007@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1655433387415203842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Imran! Thank You for your response =


I have read this tutorial before writing my question. It's just amazing :D
My question relates to this command:

tpm2_makecredential \
--tcti none \
--encryption-key rsa_ek.pub \
--secret file_input.data \
--name $loaded_key_name \ # this line :)
--credential-blob cred.out

Anonymity is not our concern. We want to ensure that only those computers w=
hich were handed by us to our employees can access internal resources. My i=
dea was to generate EK and AK just like in tutorial, and then send EK certi=
ficate and public part of AK to some auth server. Then server would calcula=
te the name and make use of tpm2_makecredential.

I have probably overlooked something really important.

Thank you in advance :D
--===============1655433387415203842==--

