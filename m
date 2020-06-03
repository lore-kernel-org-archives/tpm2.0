Content-Type: multipart/mixed; boundary="===============0747235551713725069=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How we authorize the EK hierarchy to create AIK?
Date: Wed, 03 Jun 2020 19:25:07 +0000
Message-ID: <SN6PR11MB343787A71A1ADE29F9918C99B8880@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20200603033750.2851.3906@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0747235551713725069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Eduardo Falc=C3=A3o <eduardolfalcao(a)gmail.com>
> Sent: Tuesday, June 2, 2020 10:38 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: How we authorize the EK hierarchy to create AIK?
> =

> Thank you, Nicolas.
> =

> It worked when I removed the password for the TPM Endorsement Hierarchy.
> =

> So the idea is a client creating an AK and having a server recognizing  t=
hat this AK
> comes from an authentic TPM.
> =

> I'm thinking out loud about the steps just to confirm that I'm on the rig=
ht way:
> 1. The client sends the name (hash public part) of AK to server; 2. The s=
erver
> generates a nonce and creates a credential. Name of AK is passed as argum=
ent.
> 3. Client receives the encrypted nonce, and decrypt it with AK using
> tpm2_activatecredential (if different AK is used, nonce can't be recovere=
d, I
> guess...).
> 4. Client quotes PCRs with freshly decrypted nonce 5. Server checks quote=
 using
> previously generated nonce.
> =

> The only thing I'm not comprehending clearly is the need of a session.
> Before this attestation of AK process, on my TPM learning process, I was =
running
> commands (e.g.: creation of keys and quote) on TPM without sessions. Why =
do I
> need a session to run tpm2_activatecredential?
> =

> I mean... I know sessions are meant to keep states. But why running only
> tpm2_activatecredential, which decrypts the challenge, is not enough?

Sessions are state, but in this case, they are state with authorization dat=
a.
tpm2_activatecredential, you give it the credentialed key. Which is the
EK. Which means you need authorization to the EK for the command.
The EK created by tpm2_createek, sets the authorization to a policy
satisfied by a tpm2_policysecret policy event with the
Endorsement Hierarchy password (per the spec). So the only way
To use the EK in the ActivateCredential flow, is to authorize to it via the
policy.


> =

> I apologize for such a silly question.
> =

> Best regards
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============0747235551713725069==--

