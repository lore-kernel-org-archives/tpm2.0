Content-Type: multipart/mixed; boundary="===============9152221998906399301=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: Release notice: tpm2-tools 4.1-rc0
Date: Mon, 11 Nov 2019 14:20:51 +0000
Message-ID: <20191111142051.2696.12744@new-ml01.vlan13.01.org>
In-Reply-To: CAOCvsS=XQH+qTVzVH+6V+PiyW-iSzpOVjvUaetTUR5akh0kGng@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9152221998906399301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Steven, there are a couple of issues with your commands.

1. The authorization chosen when defining the NV index is not the authoriza=
tion you use when generating the policyNV.

2. The data that you are piping to compare is not a problem but be aware th=
at the value you have in the NV index is hex 2 and what you are ultimately =
piping is ascii representation of hex 2.

So try this sequence for generating the policy instead.

tpm2_startauthsession -S session.ctx
echo 0x2| xxd -r -p | tpm2_policynv -S session.ctx -L policy.digest -i- 0x1=
800101 eq -C o
tpm2_flushcontext session.ctx
--===============9152221998906399301==--

