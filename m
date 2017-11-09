Content-Type: multipart/mixed; boundary="===============8249695900986682205=="
MIME-Version: 1.0
From: Patrick Ohly <patrick.ohly at intel.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Thu, 09 Nov 2017 16:10:29 +0100
Message-ID: <1510240229.22094.34.camel@intel.com>
In-Reply-To: e4f51676-5366-dc0d-86af-43014599bec4@linux.vnet.ibm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8249695900986682205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-11-09 at 09:55 -0500, Stefan Berger wrote:
> On 11/09/2017 07:53 AM, Patrick Ohly wrote:
> > I'm unsure whether this is an issue in tpm2.0-tools, in swtpm2, or
> > my
> > usage of both. Let me describe in more details what commands are
> > used.
> > =

> > The virtual TPM gets initialized with:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0swtpm_setup_oe.sh --tpm2 --tpm-state ... =
--createe
> =

> swtpm_setup.sh, which this one seems to be derived from, should only
> be=C2=A0
> run once to simulate the TPM manufacturing. It's destructive to
> existing=C2=A0
> TPM 2 state. Are you running this every time?

It's run once before the test, with a clean --tpm-state test. Then
follow the install part, the reboot, and then booting into the
installed image.

> > The commands that run as part of installation are:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpm2_takeownership -o ownerpass -e endors=
epass -l lockpass
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvdefine -x 0x1500001 -s 40 -a 0x400=
00001 -t 0x80020002
> > -P ownerpass
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvwrite -x 0x1500001 -a 0x40000001 -f
> > /dev/shm/keydir.sVrmLQ/keyfile -P ownerpass
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A052 45 46 4b 49 54 5f 30 70 e6 2b b9 ca 0c=
 1c 00 1d 6d eb 58 a1
> > 7a cf 0d 1d 71 46 bc fd 7a 80 a0 8f 8b 0a 30 fc 89 9b db
> > =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvlist
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 NV indexes defined.
> > =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00. NV Index: 0x1500001
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0Hash algorithm(n=
ameAlg):11
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=C2=A0=C2=
=A0=C2=A0=C2=A0The Index attributes(attributes):0xa0020002
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=C2=A0=C2=
=A0=C2=A0=C2=A0The size of the data area(dataSize):40
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvreadlock -x 0x1500001 -a 0x4000000=
1 -P ownerpass
> > =

> > =

> > Then the initramfs does:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvlist
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 NV indexes defined.
> > =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpm2_nvread -x 0x1500001 -a 0x40000001 -s=
 40 -o 0 -P ownerpass
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ERROR: Failed to read NVRAM area at index=
 0x1500001
> > (22020097). Error:0x28b
> =

> I did all of this with the latest versions of libtpms and swtpm and
> it=C2=A0works fine for me.

Which TPM tools (project and revision?) did you use?

-- =

Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



--===============8249695900986682205==--

