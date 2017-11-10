Content-Type: multipart/mixed; boundary="===============3009339663635837799=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Fri, 10 Nov 2017 06:53:45 -0500
Message-ID: <49a9b739-63be-3b12-2eae-54e6af0daa20@linux.vnet.ibm.com>
In-Reply-To: 1510260016.22094.42.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3009339663635837799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/09/2017 03:40 PM, Patrick Ohly wrote:
> On Thu, 2017-11-09 at 10:17 -0500, Stefan Berger wrote:
>> On 11/09/2017 10:10 AM, Patrick Ohly wrote:
>>> On Thu, 2017-11-09 at 09:55 -0500, Stefan Berger wrote:
>>>> I did all of this with the latest versions of libtpms and swtpm
>>>> and
>>>> it works fine for me.
>>> Which TPM tools (project and revision?) did you use?
>>>
>> I used the tpm2-tools and tpm2-tss available from Fedora 26.
> That's 2.1.1, which is a bit more recent than the 2.1.0 that I am
> currently building with meta-measured. But that difference is minor.
>
> How did you connect to swtpm from inside QEMU? Did your test involve
> restarting swtpm?

Yes.

My swtpm command line looks like this:

#> ls -l /tmp/mytpm1
total 16
-rw-rw-r--. 1 stefanb stefanb 16384 Nov 10 06:26 tpm2-00.permall
#> swtpm socket --tpmstate dir=3D/tmp/mytpm1 --ctrl =

type=3Dunixio,path=3D/tmp/mytpm1/ctrl.sock --tpm2


The QEMU command line looks like this:

# sudo ./x86_64-softmmu/qemu-system-x86_64 -vnc :10 -enable-kvm -m 1024 =

-boot d -L /usr/share/seabios -bios bios-256k.bin -boot menu=3Don =

--chardev socket,id=3Dchrtpm,path=3D/tmp/mytpm1/ctrl.sock -tpmdev =

emulator,id=3Dtpm0,chardev=3Dchrtpm -device tpm-tis,tpmdev=3Dtpm0 -monitor =

stdio -chardev file,id=3Dpts2,path=3D/tmp/seabios.log -device =

isa-serial,chardev=3Dpts2 /var/lib/libvirt/images/FC26


>
> When I reboot the virtual machine without restarting QEMU and swtpm,
> then NVRAM survives the reboot.

A possibility could be that the TPM 2's state file was not written. If I =

was to try to use a tpm2-00.permall file that swtpm doesn't have access =

to, because it's being owned by another user, then that could happen. =

But I see errors being logged that the file cannot be written to. There =

isn't anything that would issue a TPM2_Clear(), right?

Other possibilities, you have an old libtpms library that's being picked =

up that may have had a bug? 'ldconfig -v' only shows one libtpms, =

right?And it's the one you compiled from recent code...

I have test cases in the swtpm test suite that create NVRAM areas (with =

counters) and shut the TPM 2 down and resume it and also resume from =

previously stored state. So, there is coverage for NVRAM to a certain =

extent. 'make check' on swtpm succeeds for you, right?

>
> But when I stop QEMU and swtpm and then boot up again, swtpm modifies
> the tpm2-00.permall data file when QEMU connects and the previously
> defined NVRAM entry is gone. This can already be reproduced with just
> "tpm2_nvdefine".
>
> Here's roughly what I ran:
>
>      swtpm socket --ctrl type=3Dunixio,path=3D/tmp/swtpm.sock --tpmstate =
dir=3Dtpm --log file=3Dswtpm.log --tpm2 &
>
>      qemu ... -chardev 'socket,id=3Dchrtpm0,path=3D/tmp/swtpm.sock' -tpmd=
ev emulator,id=3Dtpm0,chardev=3Dchrtpm0 -device tpm-tis,tpmdev=3Dtpm0 ...
>
>      # export TPM2TOOLS_TCTI_NAME=3Ddevice
>      # tpm2_nvdefine -x 0x1500001 -s 40 -a 0x40000001 -t 0x80020002
>      ^ac
>      (qemu) q
>
> swtpm terminates now and one can take a copy of the current state:
>
>      cp tpm/tpm2-00.permall /tmp
>
> Then start both swtpm and qemu again as above, without any TPM
> operations from userspace, and check:
>
>      cmp tpm/tpm2-00.permall /tmp/tpm2-00.permall
>      tpm/tpm2-00.permall /tmp/tpm2-00.permall differ: byte 313, line 1
>
> BTW, should the swtpm instance above really terminate when qemu
> disconnects? It currently does, although -terminate is not given.

It is terminated by QEMU issuing a shutdown on it. I think it's better =

than leaving stale swtpm processes running.

>
> How can I enable more debug logging inside swtpm? Increasing the level
> does not really provide much useful information.
>

There's not much debugging output inside the TPM 2 code. Some fatal =

errors, such as not swtpm not being able to write the TPM2 state file =

should show up, though.

    Stefan



--===============3009339663635837799==--

