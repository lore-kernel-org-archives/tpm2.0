Content-Type: multipart/mixed; boundary="===============5152365914215736113=="
MIME-Version: 1.0
From: Andersen, John S <john.s.andersen at intel.com>
Subject: [tpm2] Remote attestation over Bluetooth: Cool TPM1.2 Demo In Need of
 TPM2.0 Support
Date: Fri, 17 Jan 2020 16:28:22 +0000
Message-ID: <76093b625967a0c46c29604853543a7752bdd60a.camel@intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5152365914215736113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi All,

I saw something from Matthew Garrett about a cool demo he did using the
TPM for remote attestation over Bluetooth. Looks like they're not there
yet on TPM2 support (here's a relevant issue =

https://github.com/google/go-attestation/issues/98). But really cool
stuff so I thought you all would be interested.


[Matthew's] #lca2020 demo was remote attestation over Bluetooth, which
means you can gain the security benefits of remote attestation without
needing to pass data or identity to a third party. Code is at =

https://github.com/google/go-attestation/tree/bluetooth?files=3D1

There's no authentication yet, and it doesn't support TPM2, so a fair
amount of work to be done yet. Goal is to port this to phones so you
can use your phone to verify the state of your laptop before entering
any credentials.

Video of [Matthew] demoing TPM remote attestation over Bluetooth as a
privacy preserving security feature is now up: =

https://www.youtube.com/watch?v=3DFobfM9S9xSI

Source: https://twitter.com/mjg59/status/1217990920773095424


Also, I remember discussion recently on event log parsing and there
being a difference between 1.2 and 2.0 that might have been tripping
something up? Maybe I remembered incorrectly. But looks like they've
got the 1.2 event log parsing down if someone needed to use that as a
reference (Apache-2.0): =

https://github.com/google/go-attestation/pull/64/files

Thanks,
John

--===============5152365914215736113==--

