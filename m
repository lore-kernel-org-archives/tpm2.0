Content-Type: multipart/mixed; boundary="===============8953420911971055735=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Persistent key protection
Date: Mon, 27 Jul 2020 16:19:55 +0000
Message-ID: <SN6PR11MB3437EAED19C771C2DD419DD4B8720@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: AM6PR08MB4264A44E71EB521BB5492BBB8A720@AM6PR08MB4264.eurprd08.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8953420911971055735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Imran, he might have some additional suggestions.

> -----Original Message-----
> From: Ionut Mihalcea <Ionut.Mihalcea(a)arm.com>
> Sent: Monday, July 27, 2020 6:30 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Persistent key protection
> =

> Hello all,
> =

> =

> =

> I've been trying to identify any TPM authorization features that could be=
 used in
> a user-space persistent key store with hardware backing, but it appears t=
hat
> simply storing the key context, preferably on an encrypted filesystem, is=
 the best
> solution I could come up with. Keys could have an auth value of their own=
, but
> that value must then be stored as well, and any other authorization mecha=
nism
> ends up reducing to an (indirect) "auth" value that has to be persisted.

Yes and no. Depends on how you set up the key. You would probably want to l=
ock it to a PCR
Policy, or something like policy signed. Where you can sign a policy with a=
 key on your server
And send down a PCR policy. This way if PCR's change, you just update your =
policy.

This would be fixed to measured system state.

> =

> =

> =

> The threat I'm trying to work against is simply leaking the persisted key=
 material,

You can set up attributes on the key so that it cannot be exported from the=
 TPM. You would
want fixedtpm and fixedparent in your attribute set.

> allowing the attacker to load and use the keys (assuming they're authoriz=
ed to
> use the hierarchy that the keys belong to).

You could lock It to PCR state. Hopefully a mis measure would occur causing=
 the key not
to be available. You could even store an auth value secret on the server, a=
nd require the
client to perform an attestation before sending the secret to unlock it.

> =

> =

> =

> Am I missing something, or is this due to TPM authorization features bein=
g aimed
> more at lower levels of the stack?
> =

> =

> =

> Best regards,
> =

> Ionut
> =

> =

> =

> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended reci=
pient,
> please notify the sender immediately and do not disclose the contents to =
any
> other person, use it for any purpose, or store or copy the information in=
 any
> medium. Thank you.
--===============8953420911971055735==--

