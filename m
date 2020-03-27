Content-Type: multipart/mixed; boundary="===============6290938290025738253=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Failed to initialize tcti context: 0x1
Date: Fri, 27 Mar 2020 15:25:22 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB38F3@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 5cf18b7e-d4cd-0d82-f321-5c8f6a73bd9d@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6290938290025738253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Struk, Tadeusz
> Sent: Friday, March 27, 2020 10:17 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; sedigj(a)gmail.co=
m;
> tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: Failed to initialize tcti context: 0x1
> =

> On 3/27/20 8:07 AM, Roberts, William C wrote:
> > Im surprised theirs not some default udev rules or however they do it n=
ow
> adays.
> > @tstruk, do you know what the guidance is on permissions for /dev/tpm[0-
> 9]+?
> =

> Yes. It should be:
> =

> $ ls -l /dev/tpm*
> crw-rw---- 1 root root  10,   224 Mar 20 09:30 /dev/tpm0
> crw-rw---- 1 tss  tss  244, 65536 Mar 20 09:30 /dev/tpmrm0

So raw access to the TPM is controlled by root, but brokered access through=
 an RM
Is allowed by tss group, ok, makes sense.

If you do, you can use /dev/tpmrm0 by doing, 1 of two things:
1. as a tool argument:
tpm2_<tool> --tcti=3D"device:/dev/tpmrm0"

2. as an env variable:
export TPM2TOOLS_TCTI=3D"device:/dev/tpmrm0"

You need to modify your user so that it's in group tss, like so:
sudo usermod -a -G tss $USER

Ashok, do you have a /dev/tpmrm0, I think you need like kernel version 4.12=
+ to have that.
You could also spin up tpm2-abrmd:
https://github.com/tpm2-software/tpm2-abrmd

Which is usually picked up automatically by the tpm2_<tools> executables.



--===============6290938290025738253==--

