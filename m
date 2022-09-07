Content-Type: multipart/mixed; boundary="===============7043492242591843960=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Can an unauthorized key be verified with activatecredential.
Date: Wed, 07 Sep 2022 17:14:16 +0000
Message-ID: <20220907171416.6482.13937@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7043492242591843960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've been using a copy of tpm2_tools 4.0.x (and 5.x something) and I create=
d a key just for parameter encryption that specifically has decrypt but adm=
inwithpolicy and no userwithauth with the blank policy.  The idea was that =
there was no way the key could be used to decrypt a session later as there'=
s no valid way to authorize it.  This seems to work just fine in Tools and =
the ESAPI so I figured nothing was wrong with it.

I'm now trying to add verification via endorsement key to the process.  I c=
an run an activatecredential on essentially any key except this session key=
.  Does the activatecredential command require authorization for all object=
s and that's why it's failing?

If so what's the recommended replacement?  Can I just make a restricted enc=
ryption key and use that for establishing and encrypting/decrypting session?
--===============7043492242591843960==--

