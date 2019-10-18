Content-Type: multipart/mixed; boundary="===============2236535954544265751=="
MIME-Version: 1.0
From: =?utf-8?q?Max_Halld=C3=A9n_=3Cmax=2Ehallden_at_wisi=2Ese=3E?=
Subject: [tpm2] Protecting TPM objects
Date: Fri, 18 Oct 2019 10:27:37 +0000
Message-ID: <4b287a95-ace4-836c-4d51-42510e8e4980@wisi.se>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2236535954544265751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm a bit confused about the different authorizations and if anyone
could help me clear some things up that would be a great help.

The platform authorization seems to be reset on each reboot which
makes sense in a way that it is up for grabs by whatever boots first.

But if I create an object under the owner or endorsement hierarchies,
does this mean it can never be accessed without the password for those
hierarchies? Even by someone with platform authorization?

If I also create it with a password or any other kind of
authorization, can it also not be accessed by someone with
authorization for that hierarchy? For example, is a primary key
created with password protection unique to that password or can it be
recreated by someone with access to that hierarchy?

To be a bit more specific, I'm trying to figure out in what cases a
password protected decryption key can't be accessed by anyone without
access to the password (but could otherwise have full access to the
TPM hardware).

Regards,
Max


--===============2236535954544265751==--

