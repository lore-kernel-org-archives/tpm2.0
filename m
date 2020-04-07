Content-Type: multipart/mixed; boundary="===============7306273105767908571=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: [Release] tpm2-tools v4.2-rc1
Date: Tue, 07 Apr 2020 21:21:05 +0000
Message-ID: <20200407212105.3063.83203@ml01.vlan13.01.org>
In-Reply-To: 20200402003208.2692.7047@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7306273105767908571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Imran,

I gave a try to the tpm2_eventlog tool.

If I try to read the binary_bios_measurements log directly, it fails.

[root(a)localhost misc]# ./tpm2_eventlog /sys/kernel/security/tpm0/binary_b=
ios_measurements =

---
ERROR: insufficient size for SpecID event header
ERROR: failed to parse tpm2 eventlog
ERROR: Unable to run ./tpm2_eventlog

But if I copy the event log to a local file, it works :)

[root(a)localhost misc]# cp /sys/kernel/security/tpm0/binary_bios_measureme=
nts .
[root(a)localhost misc]# ./tpm2_eventlog binary_bios_measurements =


I understand that the /sys/kernel/security/tpm0/binary_bios_measurements is=
 not a regular file, but is this expected?

Thank you
--===============7306273105767908571==--

