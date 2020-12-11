Content-Type: multipart/mixed; boundary="===============5001653915032786394=="
MIME-Version: 1.0
From: mingyic4 at uci.edu
Subject: [tpm2] Ways to implement setLocality in tabrmd
Date: Fri, 11 Dec 2020 00:55:33 +0000
Message-ID: <20201211005533.2885.3319@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5001653915032786394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm trying to implement the setLocality in tabrmd.
The comment says "Set the locality for the Connection object."

I've found in the command_source_on_new_connection functions,
it sets a callback for the istream in the Connection object.

So I retrieved the ostream from the Connection,
and tried to write sth. to trigger this callback.

But nothing happens.
I wonder is the thoughts right or there's sth. more need to do.

Any comments or advice would be appreciated, thanks!
--===============5001653915032786394==--

