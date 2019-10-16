Content-Type: multipart/mixed; boundary="===============3159564112084677370=="
MIME-Version: 1.0
From: Oliver, Dario N <dario.n.oliver at intel.com>
Subject: [tpm2] Re: Error on TPM2 and Ubuntu 19.04 
Date: Wed, 16 Oct 2019 16:18:17 +0000
Message-ID: <20A6FE0AC912764FB8B5BC5A1A7CB92B44D194FF@FMSMSX103.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3159564112084677370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Trey,

I made Clevis work in Ubuntu 18.04 some time ago, this are my steps to get =
everything installed and working (with /dev/sdb1 as example):

	sudo apt install clevis clevis-luks clevis-tpm2
	cryptsetup -y -v luksFormat /dev/sdb1
	clevis luks bind -d /dev/sdb1 tpm2 '{"pcr_bank":"sha256","pcr_ids":"0,1,2,=
3,4,5,6,7"}'
	clevis luks unlock -d /dev/sdb1 -n c1
	mkfs.ext4 /dev/mapper/c1
	mount /dev/mapper/c1 /home/encrypted	=


you can customize the PCR Policy configuration (remove it, or select a subs=
et of the PCRS but no more than 8, otherwise you can run into this https://=
github.com/tpm2-software/tpm2-tools/issues/1632)

The clevis-tpm2 package is needed. And it will install tpm2-tools as a depe=
ndency.
You should not need the tpm2-abrmd component, given that this works with th=
e /dev/tpmrm0 resource manager.

I had some problems making this work in Ubuntu 18.04, explained here https:=
//github.com/latchset/clevis/issues/106, but should work in 19.04

You can use the tpm2_rc_decode tool to get a little more information about =
the error code 0x9a2

	tpm2_rc_decode 0x9a2
	=

	error layer
		hex: 0x0
		identifier: TSS2_TPM_RC_LAYER
		description: Error produced by the TPM
	format 1 error code
		hex: 0x22
		identifier: TPM2_RC_BAD_AUTH
		description: authorization failure without DA implications
	session:
		hex: 0x100
		identifier: TPM2_RC_1
		description: (null)

Whenever I run into this 0x9a2 issue, it is a problem with the TPM, not the=
 tools. =

My "solution" is to go into the BIOS, and clear the TPM. This will delete e=
verything stored in it. Be careful!

Hope this helps!


--===============3159564112084677370==--

