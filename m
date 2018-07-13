Content-Type: multipart/mixed; boundary="===============4570700506978979854=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: Re: [tpm2] OE recipe for tpm2-tss works with 1.4.0 but not 2.0.0
Date: Thu, 12 Jul 2018 20:34:09 -0400
Message-ID: <20180713003409.GA16423@linux-uys3>
In-Reply-To: 73e5e9a53c6f43089d7b50b46024bca9@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4570700506978979854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu 2018-07-12 @ 06:25:52 PM, Scheie, Peter M wrote:
> I'm trying to get the tpm2-tss package in our WindRiver 8 build system
> (bitbake) upgraded from 1.4.0 to 2.0.0. I'm using the tpm2-tss recipe from
> OpenEmbedded which I think was originally written for 1.x (1.3?) and it's
> been working fine with the tpm2-tss_1.4.0.tar.gz file.

Do you know which layers, and which branches of these layers, you're using =
in
your build? Neither OpenEmbedded core itself nor meta-openembedded include =
any
TPM2 recipes, they are provided by other, added-on layers. There are at lea=
st
3 different layers of which I'm aware that provide the TPM2 recipes:

	meta-secure-core: https://github.com/jiazhang0/meta-secure-core.git
	meta-security:    https://git.yoctoproject.org/cgit/cgit.cgi/meta-security
	meta-measured:    https://github.com/flihp/meta-measured

If you could provide the "Build Configuration:" (that is printed at the sta=
rt
of every build) for your specific build, that might help.

--===============4570700506978979854==--

