Content-Type: multipart/mixed; boundary="===============2148428473386232808=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] b06688: tpm2_alg_util: new function
 tpm2_extract_plain_sig...
Date: Fri, 13 Oct 2017 10:11:32 -0700
Message-ID: <59e0f3c4a8d36_5eb83ff5cb009c30606e6@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2148428473386232808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: b066884868a9e04cd43fe6a16962b2f5f9e788e9
      https://github.com/01org/tpm2-tools/commit/b066884868a9e04cd43fe6a169=
62b2f5f9e788e9
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M lib/tpm2_alg_util.c
    M lib/tpm2_alg_util.h

  Log Message:
  -----------
  tpm2_alg_util: new function tpm2_extract_plain_signature


  Commit: d884d5b0d072a1a786da5653aa726a65ad001c44
      https://github.com/01org/tpm2-tools/commit/d884d5b0d072a1a786da5653aa=
726a65ad001c44
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M Makefile.am
    A lib/conversion.c
    A lib/conversion.h

  Log Message:
  -----------
  conversion: added new library compilation unit that deals with output for=
mats

These routines support output of signature data and public key data in
different formats that can be selected from the command line (in the
future).

This is currently only used for getting OpenSSL compatible format of
public keys (PEM, DER) and plain signature data without TSS specific
headers.


  Commit: 378153b68ea513764bad7376330a0bdfda399a03
      https://github.com/01org/tpm2-tools/commit/378153b68ea513764bad737633=
0a0bdfda399a03
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_readpublic.c

  Log Message:
  -----------
  tpm2_readpublic: support for output of public key in different formats


  Commit: 0903c5981e045194c158f1d5d01e2cb079455f37
      https://github.com/01org/tpm2-tools/commit/0903c5981e045194c158f1d5d0=
1e2cb079455f37
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: support output of signature data in different formats


  Commit: 6be8b28ff17d312fe399f761f355000dc626acf0
      https://github.com/01org/tpm2-tools/commit/6be8b28ff17d312fe399f761f3=
55000dc626acf0
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: whitespace fix


  Commit: 077b877a00014f1b98be5aabf0d4b67d4523a47d
      https://github.com/01org/tpm2-tools/commit/077b877a00014f1b98be5aabf0=
d4b67d4523a47d
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: refactored code for writing the output file

- use library file functions for writing
- output errno string on error
- moved code into a separated function
- previously "required_argument" was passed to fwrite() for nmemb, which
  only worked by coincidence


  Commit: edc3e02252c09adeecac8e221731c23be895d4aa
      https://github.com/01org/tpm2-tools/commit/edc3e02252c09adeecac8e2217=
31c23be895d4aa
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: support separate output of signature and quote message

New switches:

- `-s` writes the quote signature in the target format specified via `-f`
  to the given location
- `-m` writes the plain quote message to the given location

Combining these and tpm2_readpublic with PEM/DER output we can now
verify the quote message using openssl like so:

  tpm2_readpublic -H <KEY> -o /tmp/ak.pem -f PEM
  tpm2_quote -k <KEY> -L <PCRS> -o /tmp/quote.tss -q <nonce> -m /tmp/quote.=
plain -s /tmp/quote.sig -f plain
  openssl dgst -verify /tmp/ak.pem -keyform PEM -sha256 -signature /tmp/quo=
te.sig /tmp/quote.plain


  Commit: 9c14b01ed07d55b51be0bc2f23bf6f5346b28019
      https://github.com/01org/tpm2-tools/commit/9c14b01ed07d55b51be0bc2f23=
bf6f5346b28019
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M Makefile.am
    A man/common/pubkey.md
    A man/common/signature.md
    M man/tpm2_quote.1.md
    M man/tpm2_readpublic.1.md
    M man/tpm2_sign.1.md

  Log Message:
  -----------
  man pages: added documentation for new output and format switches


  Commit: 972211fe442af42636da0d32f385a1d1bdb8867c
      https://github.com/01org/tpm2-tools/commit/972211fe442af42636da0d32f3=
85a1d1bdb8867c
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M test/system/test.sh
    A test/system/test_output_formats.sh

  Log Message:
  -----------
  added system test for new output format options

this currently covers:

tpm2_readpublic -f pem|der|tss ...
tpm2_sign -f plain|tss ...
tpm2_quote -f plain|tss ...


  Commit: d24810cc9159cb4dd5f54b7a1f7cbf19eadaba8f
      https://github.com/01org/tpm2-tools/commit/d24810cc9159cb4dd5f54b7a1f=
7cbf19eadaba8f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M man/tpm2_quote.1.md

  Log Message:
  -----------
  Update tpm2_quote.1.md

Fix up the bad merge.


Compare: https://github.com/01org/tpm2-tools/compare/9d0705c99289...d24810c=
c9159

--===============2148428473386232808==--

