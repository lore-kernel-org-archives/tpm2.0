Content-Type: multipart/mixed; boundary="===============5003631276790464617=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: How we authorize the EK hierarchy to create AIK?
Date: Tue, 26 May 2020 16:56:47 +0000
Message-ID: <20200526165647.2859.93394@ml01.vlan13.01.org>
In-Reply-To: <VI1PR08MB265382226043323834F5B31FB5B40@VI1PR08MB2653.eurprd08.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5003631276790464617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Dimitar!

I have a gist with an script on how to create EK and AK here https://gist.g=
ithub.com/dnoliver/04364e72d8b81368f72ad4e6896f688d/#file-enrollment-sh-L88

# Clear the TPM
tpm2_clear

# Create Endorsment Key
tpm2_createek -c ek.ctx -G rsa -u ek.pub

# Create Attestation Key
tpm2_createak -C ek.ctx -c ak.ctx -G rsa -g sha256 -s rsassa
tpm2_evictcontrol -C o -c ak.ctx 0x81010002
tpm2_readpublic -c ak.ctx -f pem -o ak.pem > ak.yaml
cat ak.yaml | grep '^name:' | awk '{ print $2 }' > ak.name

# Generate the nonce and credential for challenge
openssl rand -hex 6 > nonce.plain
tpm2_makecredential -e ek.pub -s nonce.plain -n $(cat ak.name) -o nonce.enc=
rypted

# Decrypt nonce with Endorsement Key
tpm2_startauthsession --policy-session -S session.ctx
TPM2_RH_ENDORSEMENT=3D0x4000000B
tpm2_policysecret -S session.ctx -c ${TPM2_RH_ENDORSEMENT}
tpm2_activatecredential -c 0x81010002 -C ek.ctx -i nonce.encrypted -o nonce=
.decrypted -P "session:session.ctx"
tpm2_flushcontext session.ctx

# Generate Attestation Quote
tpm2_quote -c 0x81010002 -l sha256:0,1,2,3,4,5,6,7,8,9 -q $(cat nonce.decry=
pted) -m quote.message -s quote.signature -o quote.pcrs -g sha256

# Validate Attestation Quote in the server
tpm2_checkquote -u ak.pem -m quote.message -s quote.signature -f quote.pcrs=
 -g sha256 -q $(cat nonce.plain)

The code for tpm2_createek and tpm2_createak is at:

https://github.com/tpm2-software/tpm2-tools/blob/master/tools/tpm2_createek=
.c
https://github.com/tpm2-software/tpm2-tools/blob/master/tools/tpm2_createak=
.c
--===============5003631276790464617==--

