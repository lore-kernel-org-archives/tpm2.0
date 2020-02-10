Content-Type: multipart/mixed; boundary="===============2787080496409916731=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: Save Hash to TPM Memory
Date: Mon, 10 Feb 2020 15:42:41 +0000
Message-ID: <20200210154241.2820.92721@ml01.vlan13.01.org>
In-Reply-To: CAGkJ=LH0rnTyjXvkT_hhKs_ZAoz1baD71Q6PhS=yjLFubWDaLA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2787080496409916731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Ben,

The Linux Kernel has a feature that do exactly that, but for the entire use=
r space files.

https://sourceforge.net/p/linux-ima/wiki/Home/

The goals of the kernel integrity subsystem are to detect if files have bee=
n accidentally or maliciously altered, both remotely and locally,
appraise a file's measurement against a "good" value stored as an extended =
attribute, and enforce local file integrity. These goals are
complementary to Mandatory Access Control(MAC) protections provided by LSM =
modules, such as SElinux and Smack, which, =

depending on policy, can attempt to protect file integrity.

IMA-measurement use the TPM PCR 10 registry and the ima measurement log loc=
ated in /sys/kernel/security/ima/ascii_runtime_measurements to record the d=
igest of the interesting files, and then you can use those in a remote atte=
station scenario,  using a PCR Quote that contains the PCR 10 value, and us=
ing the ascii_runtime_measurement file to reproduce the PCR 10 measurement.

Hope this is relevant for your case!
--===============2787080496409916731==--

