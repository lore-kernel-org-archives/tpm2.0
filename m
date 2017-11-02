Content-Type: multipart/mixed; boundary="===============2022199245533499759=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] c1d1c5: tpm2_getcap: correct option names
Date: Thu, 02 Nov 2017 16:11:34 -0700
Message-ID: <59fba6263f749_e7053ff101931c3c1210d2@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2022199245533499759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: c1d1c5bebfcccf557fee7f09250e8254e0602df6
      https://github.com/01org/tpm2-tools/commit/c1d1c5bebfcccf557fee7f0925=
0e8254e0602df6
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-11-02 (Thu, 02 Nov 2017)

  Changed paths:
    M man/tpm2_getcap.1.md
    M tools/tpm2_getcap.c

  Log Message:
  -----------
  tpm2_getcap: correct option names

handles-hmac-session and handles-policy-session should be replaced by
handles-loaded-session and handles-saved-session. According to the
spec, TPM_HT_LOADED_SESSION and TPM_HT_HMAC_SESSION have the same
value, as do TPM_HT_SAVED_SESSION and TPM_HT_POLICY_SESSION, but they
are used in different context.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>



--===============2022199245533499759==--

