Content-Type: multipart/mixed; boundary="===============6893629817821178799=="
MIME-Version: 1.0
From: Paul Moore <paul at paul-moore.com>
Subject: [tpm2] Help combining multiple policy assertions (logical AND)
Date: Thu, 03 Dec 2020 16:42:22 -0500
Message-ID: <CAHC9VhR14+w9422gQMd=8FTWqunTEQKDuJn79H2VPbAwH0Fdcg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6893629817821178799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'm currently attempting to combine multiple policy assertions
together using a logical AND into a single signed policy that can be
used to control access to a TPM2 nvindex.  I currently have a working
simple example with a single policy assertion based on PCR values, but
I'm struggling trying to add an additional policy assertion (I would
like to control access both based on PCR values and a second nvindex
value).

My current, single assertion example is shown below, any help you can
provide on how to add a tpm2_policynv assertion would be greatly appreciate=
d.


*** locking/sealing the nvindex


tpm2_pcrread $PCRS -o /tmp/pcr.bin

tpm2_startauthsession -S /tmp/session.ctx
tpm2_policypcr -S /tmp/session.ctx \
  -l $PCRS -f /tmp/pcr.bin -L /tmp/pcr.policy
tpm2_policyauthorize -S /tmp/session.ctx \
  -L /tmp/nvindex.policy -n signing_key.name
tpm2_nvdefine -a "ownerwrite|ownerread|policyread" \
  -P $PASSWD -L /tmp/nvindex.policy $NVINDEX
tpm2_flushcontext /tmp/session.ctx

openssl dgst -sha256 --sign signing_key_private.pem \
  -out pcr.signature /tmp/pcr.policy

echo "storedsecret" | tpm2_nvwrite -C o -P $PASSWD \
  -i- $NVINDEX


*** reading the nvindex using the signed policy


tpm2_loadexternal -C o -G rsa -u signing_key_public.pem \
  -c /tmp/key.ctx -n /tmp/key.name

tpm2_startauthsession -S /tmp/session.ctx --policy-session
tpm2_policypcr -S /tmp/session.ctx \
  -l $PCRS -L /tmp/pcr.policy
tpm2_verifysignature -c /tmp/key.ctx \
  -f rsassa -g sha256 \
  -m /tmp/pcr.policy -s pcr.signature -t /tmp/sigverify.tkt
tpm2_policyauthorize -S /tmp/session.ctx \
  -i /tmp/pcr.policy -n /tmp/key.name -t /tmp/sigverify.tkt
tpm2_nvread -P "session:/tmp/session.ctx" -s 64 $NVINDEX
tpm2_flushcontext /tmp/session.ctx
rm -f /tmp/sigverify.tkt


--
paul moore
www.paul-moore.com
--===============6893629817821178799==--

