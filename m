Content-Type: multipart/mixed; boundary="===============4314679140187849069=="
MIME-Version: 1.0
From: Dafna Hirschfeld <dafna.hirschfeld at collabora.com>
Subject: [tpm2] question: how to test a case where the selftest command fails
Date: Fri, 27 Nov 2020 14:45:12 +0100
Message-ID: <63cc0593-732b-5423-922d-cf5b16c8c958@collabora.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4314679140187849069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
I am working for Collabora on a list of patches in the Chromeos kernel.
I want to check if I can upstream those patches to the mainline kernel.
There is one patch [1] to ignore the case that the 'selftest' command failed
when adding the '/dev/tpm' device. The idea is that userspace could still i=
nteract with the
device to some extent event if it fails.
I was wandering how do I test such a case.
I thought that I can test it with a tpm emulator and change the emulator co=
de
to fail on 'selftest'.
I am new to TPM and still know little about it so I thought maybe
some of the people here have better ideas?

[1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/1065c=
2fe54d6%5E%21/

Thanks a lot,
Dafna Hirschfeld.
--===============4314679140187849069==--

