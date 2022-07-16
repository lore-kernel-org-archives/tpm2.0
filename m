Content-Type: multipart/mixed; boundary="===============5629005519020989099=="
MIME-Version: 1.0
From: Tim K <tpm2 at bitzap.e4ward.com>
Subject: [tpm2] Lifecycle of handles and contexts
Date: Sat, 16 Jul 2022 14:20:45 +0000
Message-ID: <20220716142045.2570.9096@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5629005519020989099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Is there a good resource that describes the lifecycle of handles and contex=
ts, in easy to understand terms?

For example, if I create a primary key and then create a key and seal some =
data, I can keep unsealing the data without reloading the key. But if I reb=
oot the computer, I have to create the primary key again and reload the key=
 then I can unseal multiple times. So these keys get stored in the TPM unti=
l reboot it seems.

Is there a way to flush them out of the TPM or even list what's stored? =


Is there a way to list what's stored, what keys are loaded? What about flus=
hing them out without rebooting?

Thanks!
--===============5629005519020989099==--

