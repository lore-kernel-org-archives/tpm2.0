Content-Type: multipart/mixed; boundary="===============2065383920444926798=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] dfe4ee: tpm2_getmanufec:
 RetrieveEndorsementCredentials():...
Date: Thu, 07 Sep 2017 09:00:26 -0700
Message-ID: <59b16d1a57d67_1ba0c3fbb8ee7fc3c30036@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2065383920444926798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: dfe4ee3bd4b9e0bf6b4ed79da7470cbfad3c0acc
      https://github.com/01org/tpm2-tools/commit/dfe4ee3bd4b9e0bf6b4ed79da7=
470cbfad3c0acc
  Author: Marc Kleine-Budde <mkl(a)blackshift.org>
  Date:   2017-09-07 (Thu, 07 Sep 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: RetrieveEndorsementCredentials(): fix curl_easy_setopt()=
 call

curl_easy_setopt() expects the 3rd parameter to be a long, but it's a bool =
here and fails with:

| tools/tpm2_getmanufec.c: In function 'RetrieveEndorsementCredentials':
| tools/tpm2_getmanufec.c:451:944: error: call to '_curl_easy_setopt_err_lo=
ng' declared with attribute warning: curl_easy_setopt expects a long | argu=
ment for this option [-Werror]
| cc1: all warnings being treated as errors

This patch fixes the problem by casting the parameter to long.



--===============2065383920444926798==--

