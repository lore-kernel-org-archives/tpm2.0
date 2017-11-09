Content-Type: multipart/mixed; boundary="===============5109270898206653133=="
MIME-Version: 1.0
From: Patrick Ohly <patrick.ohly at intel.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Thu, 09 Nov 2017 20:51:14 +0100
Message-ID: <1510257074.22094.40.camel@intel.com>
In-Reply-To: 1510232036.22094.29.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5109270898206653133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-11-09 at 13:53 +0100, Patrick Ohly wrote:
> The commands that run as part of installation are:
> =C2=A0=C2=A0=C2=A0=C2=A0tpm2_takeownership -o ownerpass -e endorsepass -l=
 lockpass
> =C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvdefine -x 0x1500001 -s 40 -a 0x40000001 -t=
 0x80020002 -P
> ownerpass
> =C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvwrite -x 0x1500001 -a 0x40000001 -f
> /dev/shm/keydir.sVrmLQ/keyfile -P ownerpass
> =C2=A0=C2=A0=C2=A0=C2=A052 45 46 4b 49 54 5f 30 70 e6 2b b9 ca 0c 1c 00 1=
d 6d eb 58 a1 7a
> cf 0d 1d 71 46 bc fd 7a 80 a0 8f 8b 0a 30 fc 89 9b db=C2=A0
> =

> =C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvlist
> =C2=A0=C2=A0=C2=A0=C2=A01 NV indexes defined.
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0. NV Index: 0x1500001
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0Hash algorithm(nameAlg):=
11
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0=
=C2=A0The Index attributes(attributes):0xa0020002
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0=
=C2=A0The size of the data area(dataSize):40
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =

> =C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvreadlock -x 0x1500001 -a 0x40000001 -P own=
erpass
> =

> =

> Then the initramfs does:
> =C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvlist
> =C2=A0=C2=A0=C2=A0=C2=A00 NV indexes defined.
> =

> =C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvread -x 0x1500001 -a 0x40000001 -s 40 -o 0=
 -P ownerpass
> =C2=A0=C2=A0=C2=A0=C2=A0ERROR: Failed to read NVRAM area at index 0x15000=
01 (22020097).
> Error:0x28b
> =

> I tried also without tpm2_nvreadlock and without tpm2_takeownership,
> but neither of that made a difference.

I forgot to ask one conceptual question: in the proposed usage
scenario, does it make sense to take ownership of the TPM? All
passwords would have to be well-known, because there is no user or
other form of input available which could provide them. So taking
ownership doesn't really change much from a security perspective.

https://github.com/intel/tpm2-tools/wiki/How-to-use-tpm2-tools shows
that all NVRAM operations also work without taking ownership, but
doesn't go into the pros and cons of that.

-- =

Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



--===============5109270898206653133==--

