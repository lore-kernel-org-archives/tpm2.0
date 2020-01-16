Content-Type: multipart/mixed; boundary="===============2773936442472253216=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: ActivateCredential not working
Date: Thu, 16 Jan 2020 18:37:30 +0000
Message-ID: <20200116183730.2574.6943@ml01.vlan13.01.org>
In-Reply-To: 971515fe33260d9ed2a1f2f1a766383be8646a09.camel@cnackers.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2773936442472253216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Erick,

This worked for me

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
  tpm2_makecredential -e ek.pub -s nonce.plain -n $(cat ak.name) -o nonce.e=
ncrypted

  # Decrypt nonce with Endorsement Key
  tpm2_startauthsession --policy-session -S session.ctx
  TPM2_RH_ENDORSEMENT=3D0x4000000B
  tpm2_policysecret -S session.ctx -c ${TPM2_RH_ENDORSEMENT}
  tpm2_activatecredential -c 0x81010002 -C ek.ctx -i nonce.encrypted -o non=
ce.decrypted -P "session:session.ctx"
  tpm2_flushcontext session.ctx

  # Generate Attestation Quote
  tpm2_quote -c 0x81010002 -l sha256:0,1,2,3,4,5,6,7,8,9 -q $(cat nonce.dec=
rypted) -m quote.message -s quote.signature -o quote.pcrs -g sha256

  # Validate Attestation Quote in the server
  tpm2_checkquote -u ak.pem -m quote.message -s quote.signature -f quote.pc=
rs -g sha256 -q $(cat nonce.plain)


I have a gist that you can use to test here https://gist.github.com/dnolive=
r/04364e72d8b81368f72ad4e6896f688d (bash enrollment.sh ak)
--===============2773936442472253216==--

