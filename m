Content-Type: multipart/mixed; boundary="===============5796540699265896608=="
MIME-Version: 1.0
From: Oliver, Dario N <dario.n.oliver at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 25, Issue 9
Date: Tue, 16 Jul 2019 20:33:06 +0000
Message-ID: <20A6FE0AC912764FB8B5BC5A1A7CB92B37C904E8@fmsmsx101.amr.corp.intel.com>
In-Reply-To: mailman.11.1563303602.5925.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5796540699265896608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Nick

The TPM Event Log is usually in /sys/kernel/security/tpm0/binary_boot_measu=
rements (at least in Fedora distros)

That log is in binary format, following the TCG specification for log event=
s.

It can be read in human friendly format with a parser:
	1. iml2text https://www.mankier.com/8/iml2text
	2. binary_bios_measurement_parser https://github.com/ValdikSS/binary_bios_=
measurements_parser

Both parsers are not 100% complete, but they show very useful information. =


----------------------------------------------------------------------

Message: 1
Date: Mon, 15 Jul 2019 15:04:46 -0500
From: Nick Meyer <nimeyer(a)verizonmedia.com>
To: tpm2(a)lists.01.org
Subject: [tpm2] Read event log in booted Linux
Message-ID:
	<CAO6U=3DOZu5skEEnBVX2OWA6ue=3D355jx2Xe8851-SSQxpgySBTGg(a)mail.gmail.com>
Content-Type: text/plain; charset=3D"utf-8"

Hello all,

Is there a way to read the TCG event log in the booted OS on an EFI Linux s=
ystem?

I am trying to confirm some behavior I am seeing between different vendors'
implementations and how they are handling ExitBootServices().

Thanks,

Nick Meyer
Verizon Media

--===============5796540699265896608==--

