Content-Type: multipart/mixed; boundary="===============3235488316085030590=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] Re: tpm2_createak fails. Error code: 0x184. Reboot doesn't
 help!
Date: Wed, 08 Jul 2020 06:39:06 +0000
Message-ID: <20200708063906.2823.15430@ml01.vlan13.01.org>
In-Reply-To: 20200707172756.2823.148@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3235488316085030590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Imran for the suggestions.
1. I am facing the problem on a TPM chip.
2. could you guide me what the exact commands are that I can run to clear t=
he tpm and flush persistent handle?
    Should I use the command below? is it enough to clear it and flush pers=
istent handle?
   tpm2_clear <TPM2_PWD>
3. I believe it works on simulator. We have multiple hosts (tpm chips), not=
 all have the issue. only a few have the issue. I am not sure if it is hard=
ware issue or software issue.

Thanks,
Chenxi
--===============3235488316085030590==--

