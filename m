Content-Type: multipart/mixed; boundary="===============8183839944931536625=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Save Hash to TPM Memory
Date: Mon, 17 Feb 2020 13:27:17 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E9178F@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200210154241.2820.92721@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8183839944931536625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: nicolasoliver03(a)gmail.com [mailto:nicolasoliver03(a)gmail.com]
> Sent: Monday, February 10, 2020 9:43 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Save Hash to TPM Memory
> =

> Hello Ben,
> =

> The Linux Kernel has a feature that do exactly that, but for the entire u=
ser space
> files.
> =

> https://sourceforge.net/p/linux-ima/wiki/Home/
> =

> The goals of the kernel integrity subsystem are to detect if files have b=
een
> accidentally or maliciously altered, both remotely and locally, appraise =
a file's
> measurement against a "good" value stored as an extended attribute, and
> enforce local file integrity. These goals are complementary to Mandatory =
Access
> Control(MAC) protections provided by LSM modules, such as SElinux and Sma=
ck,
> which, depending on policy, can attempt to protect file integrity.

I just want to clarify the role of SE Linux here. It can protect integrity =
by controlling
who has access, however any assumptions of file integrity shouldn't be made=
 by
the use of something like SE Linux; it is just access controls. A myriad of=
 attacks
and/or bugs could always alter/corrupt the file in unexpected ways.

Always assume input is untrusted when you consume it.

> =

> IMA-measurement use the TPM PCR 10 registry and the ima measurement log
> located in /sys/kernel/security/ima/ascii_runtime_measurements to record =
the
> digest of the interesting files, and then you can use those in a remote a=
ttestation
> scenario,  using a PCR Quote that contains the PCR 10 value, and using the
> ascii_runtime_measurement file to reproduce the PCR 10 measurement.
> =

> Hope this is relevant for your case!
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8183839944931536625==--

