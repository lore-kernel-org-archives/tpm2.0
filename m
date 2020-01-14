Content-Type: multipart/mixed; boundary="===============8202859804114085961=="
MIME-Version: 1.0
From: Oliver, Dario N <dario.n.oliver at intel.com>
Subject: [tpm2] Re: Device Identity Attestation with tpm2-tools
Date: Tue, 14 Jan 2020 18:41:06 +0000
Message-ID: <20A6FE0AC912764FB8B5BC5A1A7CB92B4734A04C@fmsmsx101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8202859804114085961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you Charles for your input,

From our internal analysis, we also agreed that the EK + AK approach provid=
es more benefits than the others (EK only, EK + SRK). =

The EK + AK approach enables the server to also validate the integrity of t=
he host  based on the provided quote. And this is only possible to do with =
an AK.
The other approaches are also valid in other scenario, specially the EK onl=
y one, given that it does not require any persistence in the device, and it=
 can keep working even after the device disk and tpm is cleared.
The tpm will always derive the same EK if one provides the same parameters. =


The problem that I had to persist the AK in that approach was a bad man pag=
e, and it was solved here https://lists.01.org/hyperkitty/list/tpm2(a)lists=
.01.org/thread/DLWL7HYW4QHQEHQLRP275EOOBNL5JYAF/ =

For the other problems, I created specific issues in github

Endorsement Key created with tpm2_createek cannot be used with tpm2_activat=
ecredential: https://github.com/tpm2-software/tpm2-tools/issues/1883
Cannot create child key of an EK created with tpm2_createek: https://github=
.com/tpm2-software/tpm2-tools/issues/1884

The following script is an updated EK + AK example, without the previous pr=
oblems to persist the AK, and also with nonce validation in the server usin=
g tpm2_cehckquote

echo "Enrolling with Atestation Key"

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

Even if the server does not implements a PCR values validation, the tpm2_ch=
eckquote command can be used to verify that the device was able to decrypt =
the nonce.
A very simple quote attestation system could use this initial quote to esta=
blish the "golden values" of the device, and detect unexpected modification=
s of the components that affects the PCRs in future quotes

Regards,

Nicolas Oliver


--===============8202859804114085961==--

