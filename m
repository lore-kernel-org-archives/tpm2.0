Content-Type: multipart/mixed; boundary="===============7087777811275372772=="
MIME-Version: 1.0
From: =?utf-8?q?Eduardo_Falc=C3=A3o_=3Ceduardolfalcao_at_gmail=2Ecom=3E?=
Subject: [tpm2] IMA determinism
Date: Tue, 09 Jun 2020 15:45:28 +0000
Message-ID: <20200609154528.2851.72508@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7087777811275372772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi folks

I know this is not a TPM doubt, but it's related and some people may have h=
ad this issue.

Is there some form to make the digest collected through IMA deterministic? =
I rebooted my system several times, and on the very beginning of system ini=
tialization I've noticed the hash in PCR 10 of TPM is changing. The number =
of lines initializes equally, but it seems that the order the programs are =
ran always changes.

Any ideas for overcoming this issue?

[]'s
--===============7087777811275372772==--

