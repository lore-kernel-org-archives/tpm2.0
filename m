Content-Type: multipart/mixed; boundary="===============8139815456153534535=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] tpm2-tss 2.3.0-rc0
Date: Fri, 26 Jul 2019 09:21:02 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163AF794A@exch2010c.sit.fraunhofer.de>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8139815456153534535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I just taged the release candidate for version 2.3.0-rc0
Please find it here:
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.3.0-rc0

It includes a lot of new things, most notably, two new libraries:
- tss2-tctildr: simplifying and unifying the setting of custom tctis.
  it's as simple as Tss2_TctiLdr_Initilialize(getenv("MY_TCTI", &tcti));
  so give it a try.
- tss2-rc: converts tpm and tss return codes into strings

Also, we fixed some dependency bug with the tss2-esys.pc file that
falsely reuired tss2-mu.pc. If you encounter linker errors, please consider
adding tss2-mu.pc directly in your build scripts.

Finally, this release marks the end of life for the 2.1.x series. Upgrading
is highly recommended. (Everything < 2.2.x is eol)

Please give this some thorough testing. We'll also not merge non-bugfix
PRs until 2.3.0 is finally release.

Happy testing,
Andreas
--===============8139815456153534535==--

