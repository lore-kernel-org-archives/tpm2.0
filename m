Content-Type: multipart/mixed; boundary="===============1401661413783763592=="
MIME-Version: 1.0
From: Paul Moore <paul at paul-moore.com>
Subject: [tpm2] Proper way to create a owner-write, any-read TPM2 nvindex?
Date: Tue, 08 Dec 2020 12:48:03 -0500
Message-ID: <CAHC9VhQhO+QX0BoVmEVprH7rnxpo5biUR26XCgeS0Bx+C9_Ruw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1401661413783763592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm trying to define a TPM2 nvindex that is only writable when
authenticated with the owner password, but is readable by anyone,
regardless of authentication.  Through a combination of looking at the
docs and some trial-and-error I've arrived at the following:

% tpm2_nvdefine -a "ownerwrite|ownerread|authread" -P $PASSWD $NVINDEX

... which leaves me with two questions:

* Is this the recommended way to define an owner-write, any-read TPM2 nvind=
ex?

* Why do I need to specify "authread", and is this correct?  Quickly
skimming the TPM2 specs, I'm still a bit puzzled by the meaning of
"authread"/TPMA_NV_AUTHREAD.

Any comments, advice, etc. would be appreciated - thanks!

-- =

paul moore
www.paul-moore.com
--===============1401661413783763592==--

