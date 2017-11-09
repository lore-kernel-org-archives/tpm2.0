Content-Type: multipart/mixed; boundary="===============5020876617365451580=="
MIME-Version: 1.0
From: Patrick Ohly <patrick.ohly at intel.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Thu, 09 Nov 2017 21:40:16 +0100
Message-ID: <1510260016.22094.42.camel@intel.com>
In-Reply-To: daad79b4-05ac-1e08-0f06-abd7d7bbe940@linux.vnet.ibm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5020876617365451580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-11-09 at 10:17 -0500, Stefan Berger wrote:
> On 11/09/2017 10:10 AM, Patrick Ohly wrote:
> > On Thu, 2017-11-09 at 09:55 -0500, Stefan Berger wrote:
> > > I did all of this with the latest versions of libtpms and swtpm
> > > and
> > > it works fine for me.
> > =

> > Which TPM tools (project and revision?) did you use?
> > =

> =

> I used the tpm2-tools and tpm2-tss available from Fedora 26.

That's 2.1.1, which is a bit more recent than the 2.1.0 that I am
currently building with meta-measured. But that difference is minor.

How did you connect to swtpm from inside QEMU? Did your test involve
restarting swtpm?

When I reboot the virtual machine without restarting QEMU and swtpm,
then NVRAM survives the reboot.

But when I stop QEMU and swtpm and then boot up again, swtpm modifies
the tpm2-00.permall data file when QEMU connects and the previously
defined NVRAM entry is gone. This can already be reproduced with just
"tpm2_nvdefine".

Here's roughly what I ran:

    swtpm socket --ctrl type=3Dunixio,path=3D/tmp/swtpm.sock --tpmstate dir=
=3Dtpm --log file=3Dswtpm.log --tpm2 &

    qemu ... -chardev 'socket,id=3Dchrtpm0,path=3D/tmp/swtpm.sock' -tpmdev =
emulator,id=3Dtpm0,chardev=3Dchrtpm0 -device tpm-tis,tpmdev=3Dtpm0 ...

    # export TPM2TOOLS_TCTI_NAME=3Ddevice
    # tpm2_nvdefine -x 0x1500001 -s 40 -a 0x40000001 -t 0x80020002
    ^ac
    (qemu) q

swtpm terminates now and one can take a copy of the current state:

    cp tpm/tpm2-00.permall /tmp

Then start both swtpm and qemu again as above, without any TPM
operations from userspace, and check:

    cmp tpm/tpm2-00.permall /tmp/tpm2-00.permall =

    tpm/tpm2-00.permall /tmp/tpm2-00.permall differ: byte 313, line 1

BTW, should the swtpm instance above really terminate when qemu
disconnects? It currently does, although -terminate is not given.

How can I enable more debug logging inside swtpm? Increasing the level
does not really provide much useful information.

-- =

Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



--===============5020876617365451580==--

