Content-Type: multipart/mixed; boundary="===============4790279854912203360=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] [Release] tpm2-tools v4.3.1
Date: Thu, 20 May 2021 16:11:01 +0000
Message-ID: <20210520161101.2973.12507@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4790279854912203360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all, =


Pleased to announce the release of tpm2-tools version 4.3.1.
You can find it here: https://github.com/tpm2-software/tpm2-tools/releases/=
tag/4.3.1

1. tpm2_dictionarylockout: Fix issue where setting value reset other parame=
ters.
2. tpm2_create.c: Fix an issue where userwithauth attr cleared if policy sp=
ecified. =

3. tss2_quote: Tool now correctly supports to quote against a list of passe=
d PCR registers. =

4. Fix fapi-branch-select integration test to correctly use the PolicyRef p=
arameter (triggered by recent bug-fix in tpm2-tss). =

5. Fix an outdated parameter in the fapi-provision integration test. 6. tpm=
2_getekcertificate: Fix tool failing to return error/non-zero for HTTP 404.=
  We'd appreciate your feedback.  =


Thanks and regards,  =


Imran Desai
--===============4790279854912203360==--

