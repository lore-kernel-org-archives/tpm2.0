Content-Type: multipart/mixed; boundary="===============6470881111440562679=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: tpm2_createak fails. Error code: 0x184. Reboot doesn't
 help!
Date: Tue, 07 Jul 2020 17:27:56 +0000
Message-ID: <20200707172756.2823.148@ml01.vlan13.01.org>
In-Reply-To: 20200707060746.2823.61568@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6470881111440562679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@Chenxi,

I am unable to replicate this issue.

1. Are you facing this problem on a simulator or a TPM chip?
2. If it is on a TPM chip and you cannot afford to clear the TPM, can you f=
lush the persistent handle and start all over?
3. Can you try the same set of commands on an instance of the simulator and=
 reproduce the problem?

Thanks and Regards,

Imran Desai
--===============6470881111440562679==--

