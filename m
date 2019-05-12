Content-Type: multipart/mixed; boundary="===============8766942350065426963=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Openssl 1.0.2
Date: Sun, 12 May 2019 23:01:10 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D74618@ORSMSX106.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8766942350065426963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Encase folks don't know, OpenSSL 1.0.2 will be End Of Lifed at the end of 2=
019:
https://www.openssl.org/policies/releasestrat.html

Currently, the projects support OpenSSL 1.0.2. We need to consider moving a=
way from this. I'd like to gauge people's reactions
And how many users are still on OpenSSL 1.0.2 and don't plan to upgrade? If=
 you do that, you won't get security fixes, so it seems
like a bad idea.

In tpm2-tools, since 4.0 is already quite non-api compatible, I was conside=
ring moving away from OSSL1.0.2 on that release, objections?

--===============8766942350065426963==--

