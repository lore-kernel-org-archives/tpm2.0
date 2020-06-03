Content-Type: multipart/mixed; boundary="===============2511667545839593041=="
MIME-Version: 1.0
From: =?utf-8?q?Eduardo_Falc=C3=A3o_=3Ceduardolfalcao_at_gmail=2Ecom=3E?=
Subject: [tpm2] Re: How we authorize the EK hierarchy to create AIK?
Date: Wed, 03 Jun 2020 03:37:50 +0000
Message-ID: <20200603033750.2851.3906@ml01.vlan13.01.org>
In-Reply-To: 20200602220535.2851.81976@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2511667545839593041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you, Nicolas.

It worked when I removed the password for the TPM Endorsement Hierarchy. =


So the idea is a client creating an AK and having a server recognizing  tha=
t this AK comes from an authentic TPM.

I'm thinking out loud about the steps just to confirm that I'm on the right=
 way:
1. The client sends the name (hash public part) of AK to server;
2. The server generates a nonce and creates a credential. Name of AK is pas=
sed as argument.
3. Client receives the encrypted nonce, and decrypt it with AK using tpm2_a=
ctivatecredential (if different AK is used, nonce can't be recovered, I gue=
ss...). =

4. Client quotes PCRs with freshly decrypted nonce
5. Server checks quote using previously generated nonce.

The only thing I'm not comprehending clearly is the need of a session. =

Before this attestation of AK process, on my TPM learning process, I was ru=
nning commands (e.g.: creation of keys and quote) on TPM without sessions. =
Why do I need a session to run tpm2_activatecredential?

I mean... I know sessions are meant to keep states. But why running only tp=
m2_activatecredential, which decrypts the challenge, is not enough?

I apologize for such a silly question.

Best regards
--===============2511667545839593041==--

