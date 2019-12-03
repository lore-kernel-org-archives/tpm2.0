Content-Type: multipart/mixed; boundary="===============5731913351223973893=="
MIME-Version: 1.0
From: Ignacio Jaureguiberry <ignaciox.jaureguiberry at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Tue, 03 Dec 2019 18:29:14 +0000
Message-ID: <20191203182914.2967.21962@new-ml01.vlan13.01.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E4B50E@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5731913351223973893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I created two scripts to reproduce the bugs, using openssl s_server and s_c=
lient as recommended by David.
I forked tpm2-pkcs11 and added everything to a directory in the test/integr=
ation path in a new issue335_testcase branch.
I'm not sure what's the preferred way to share this, should I ask a pull re=
quest for it?

https://github.com/ijaureguiberry/tpm2-pkcs11/tree/issue335_testcase/test/i=
ntegration/issue335

See the README.md for more details...
--===============5731913351223973893==--

