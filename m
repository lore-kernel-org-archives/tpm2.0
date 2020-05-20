Content-Type: multipart/mixed; boundary="===============8954794824641882849=="
MIME-Version: 1.0
From: oscargomezf at gmail.com
Subject: [tpm2] Trying to decrypt a file encrypted with a TPM.
Date: Wed, 20 May 2020 09:33:54 +0000
Message-ID: <20200520093354.2843.3259@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8954794824641882849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I have encrypted a file using a TPM with the following commands:

tpm2_createprimary -c primary.ctx
tpm2_create -C primary.ctx -Grsa2048 -u key.pub -r key.priv

tpm2_flushcontext -t

tpm2_load -C primary.ctx -u key.pub -r key.priv -c key.ctx
echo "my message" > msg.dat
tpm2_rsaencrypt -c key.ctx -o msg.enc msg.dat

Therefore, I am able to encrypt the file msg.dat to msg.enc. And I have the=
 following keys:

1. primary.ctx
2. key.pub
3. key.priv
4. key.ctx

So far so good. However, I need to decrypt the file in msg.enc in another e=
mbedded system (Linux platform) without a TPM.

How can I do that? What tools do I need to use?
--===============8954794824641882849==--

