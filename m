Content-Type: multipart/mixed; boundary="===============9182923688732197632=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Help for tpm-tools comand sequence
Date: Fri, 04 Sep 2020 16:41:26 +0000
Message-ID: <SN6PR11MB3437107E6BA2E6E4D2F8057FB82D0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CAKjtTmwowXKgNPznvkT5qVP7yPDVCSTfWJb7MPq6p-nvPrymow@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9182923688732197632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It looks like you created this issue as well:
https://github.com/tpm2-software/tpm2-tools/issues/218

The takeaway here is that your major versions of tpm2-tools
Command line options are not compatible. =


The best bet is to always use tpm2-tools 4.0 or greater, or write your scri=
pt
To handle each different version of the tools.

As of tpm2-tools 4.0, we froze the command line interface and it will always
be backwards compatible.

Thanks,
Bill

> -----Original Message-----
> From: Juncor <juncor.wu(a)gmail.com>
> Sent: Thursday, September 3, 2020 8:22 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Help for tpm-tools comand sequence
> =

> Hi Sir:
> =

> I had a embeded linux system project.
> SOC: AM3352.
> KERNEL 4.9.59 with slb9670 driver.
> =

> I can see the /dev/tpm0.
> I build the tpm-tss 1.x and tpm-tools 2.X.
> I didn't running tpm-abrmd and any resourcemgr.
> I access direct to /dev/tpm.
> =

> I export two environment.
> export TPM2TOOLS_TCTI_NAME=3Ddevice
> export TPM2TOOLS_DEVICE_FILE=3D/dev/tpm0
> =

> I want check the sign and verify.
> Here is my command.
> tpm2_createprimary -A e -g 0x000B -G 0x0001 -C primary_ctx tpm2_create -g
> 0x000B -G 0x0001 -c primary_ctx -o kry_pub -O key_priv tpm2_load -c
> primary_ctx -u kry_pub -r key_priv -n name -C eccsinging_key_ctx tpm2_sin=
g -c
> eccsigning_key_ctx -g 0x000B -m input_data -s signature
> =

> I alway got error after tpm2_sign command:
> ERROR: ContextLoad Error. TPM Error:0x902.
> =

> I have no idea which step error?
> =

> Thanks for help.
> =

> Juncor

--===============9182923688732197632==--

