Content-Type: multipart/mixed; boundary="===============5903134556462314356=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] Advice on Building tpm-tools
Date: Tue, 16 Oct 2018 21:18:19 +0100
Message-ID: <8d27e349081b941abfcf9ed2c34ee21d8722e98a.camel@linux.intel.com>
In-Reply-To: CY4PR18MB098126C0197707B3224C7561FDFD0@CY4PR18MB0981.namprd18.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5903134556462314356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-10-15 at 17:16 +0000, Bryan Diehl wrote:
> Per =

> https://github.com/tpm2-software/tpm2-tools/blob/master/INSTALL.md
> I should be using:
> tpm2-tools          version 3.1.0
> tpm2-tss              version 2.0.0
> tpm2-abrmd      version 2.0.0

The most recent release minor version increment for each of those would
be:
https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.3
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.1.0
https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.0.2

AIUI the version matrix only documents major release numbers.
 =

> tpm-server (tpm emulator)
> https://sourceforge.net/projects/ibmswtpm2

This is the correct homepage for the IBM TPM simulator

> ibmtss1331.tar.gz
> Is 1331 the correct version to be using with the above tools, tss,
> and abrmd?

But this appears to be the filename for the IBM TSS implementation
(equivalent to tpm2-tss).

Our CI are using ibmtpm974.tar.gz release of the simulator:

https://sourceforge.net/projects/ibmswtpm2/files/ibmtpm974.tar.gz/download

I don't know whether there are any incompatible changes in the newer
simulator releases, but you may have a better chance of success using
that version of the simulator.

Let us know what errors the builds are producing (perhaps put logs on
pastebin or similar service of your choice) and we can try to help.

Regards,
Joshua


--===============5903134556462314356==--

