Content-Type: multipart/mixed; boundary="===============4052500526467874677=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: Use PCR10 of sha256 PCR bank
Date: Fri, 08 May 2020 15:54:40 +0000
Message-ID: <20200508155440.2843.22202@ml01.vlan13.01.org>
In-Reply-To: 20200508015349.2843.24020@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4052500526467874677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As today, IMA is harcoded to make the boot_aggregate entry in SHA1

https://github.com/torvalds/linux/blob/ac438771ccb4479528594c7e19f2c39cf181=
4a86/security/integrity/ima/ima_init.c#L59

So the ima_hash=3Dsha256 option is activated after the boot_aggregate. It i=
s the same for me in Fedora 31. It would be nice if somebody contributed to=
 the kernel and fixes this, or at least harcode it to sha256 :)

What I can see from you initial message is that you get all the digest from=
 the measured boot process (PCR 0 to 7) in both SHA1 and SHA256 PCRs, which=
 means that your BIOS to TPM interaction is working fine. In Fedora, you wo=
uld see additional measurements in the PCR 8 and 9 corresponding to the dig=
ests of the components that grub2 reads (config, kernel and kernel config, =
and initiramfs).

But when IMA is measuring stuff, you get only PCR SHA1 digests. I think thi=
s is related to the 4.4 kernel version. The oldest kernel I used to validat=
e IMA was a 4.17, and I am currently using 5.6. I believe there is no optio=
n to control which PCR banks IMA uses, it should measure in all the availab=
le PCR 10s by default. Is upgrading to Ubuntu 18.04 or 20.04 possible for y=
ou? Also, Ubuntu 16.04 is EOL since April 2019, so you have other good reas=
ons to upgrade :)
--===============4052500526467874677==--

