Content-Type: multipart/mixed; boundary="===============8551733871045501057=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Thu, 09 Nov 2017 10:17:57 -0500
Message-ID: <daad79b4-05ac-1e08-0f06-abd7d7bbe940@linux.vnet.ibm.com>
In-Reply-To: 1510240229.22094.34.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8551733871045501057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/09/2017 10:10 AM, Patrick Ohly wrote:
> On Thu, 2017-11-09 at 09:55 -0500, Stefan Berger wrote:
>> On 11/09/2017 07:53 AM, Patrick Ohly wrote:
>>> I'm unsure whether this is an issue in tpm2.0-tools, in swtpm2, or
>>> my
>>> usage of both. Let me describe in more details what commands are
>>> used.
>>>
>>> The virtual TPM gets initialized with:
>>>       swtpm_setup_oe.sh --tpm2 --tpm-state ... --createe
>> swtpm_setup.sh, which this one seems to be derived from, should only
>> be
>> run once to simulate the TPM manufacturing. It's destructive to
>> existing
>> TPM 2 state. Are you running this every time?
> It's run once before the test, with a clean --tpm-state test. Then
> follow the install part, the reboot, and then booting into the
> installed image.

Nevertheless I'll extend swtpm_setup with --overwrite and =

--not-overwrite options to allow overwriting of existing state or to not =

allow it, and error out if state is found but the options are omitted.


>
>>> The commands that run as part of installation are:
>>>       tpm2_takeownership -o ownerpass -e endorsepass -l lockpass
>>>       tpm2_nvdefine -x 0x1500001 -s 40 -a 0x40000001 -t 0x80020002
>>> -P ownerpass
>>>       tpm2_nvwrite -x 0x1500001 -a 0x40000001 -f
>>> /dev/shm/keydir.sVrmLQ/keyfile -P ownerpass
>>>       52 45 46 4b 49 54 5f 30 70 e6 2b b9 ca 0c 1c 00 1d 6d eb 58 a1
>>> 7a cf 0d 1d 71 46 bc fd 7a 80 a0 8f 8b 0a 30 fc 89 9b db
>>>
>>>       tpm2_nvlist
>>>       1 NV indexes defined.
>>>
>>>         0. NV Index: 0x1500001
>>>         {
>>>       	    Hash algorithm(nameAlg):11
>>>            	    The Index attributes(attributes):0xa0020002
>>>            	    The size of the data area(dataSize):40
>>>          }
>>>
>>>       tpm2_nvreadlock -x 0x1500001 -a 0x40000001 -P ownerpass
>>>
>>>
>>> Then the initramfs does:
>>>       tpm2_nvlist
>>>       0 NV indexes defined.
>>>
>>>       tpm2_nvread -x 0x1500001 -a 0x40000001 -s 40 -o 0 -P ownerpass
>>>       ERROR: Failed to read NVRAM area at index 0x1500001
>>> (22020097). Error:0x28b
>> I did all of this with the latest versions of libtpms and swtpm and
>> it works fine for me.
> Which TPM tools (project and revision?) did you use?
>
I used the tpm2-tools and tpm2-tss available from Fedora 26.

    Stefan



--===============8551733871045501057==--

