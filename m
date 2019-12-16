Content-Type: multipart/mixed; boundary="===============5129594337242874254=="
MIME-Version: 1.0
From: Gabriel Chabot <gabriel.chabot at qarnot-computing.com>
Subject: [tpm2] Re: [TPM2-TOOLS] tpm2_hash I/O error
Date: Mon, 16 Dec 2019 11:25:02 +0100
Message-ID: <7db9ebd5-70f7-e36d-157d-b52c3d1d81f8@qarnot-computing.com>
In-Reply-To: 19576812-ba03-2881-7642-0715b8ce9a78@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5129594337242874254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 13/12/2019 23:11, Tadeusz Struk wrote:
> Could you make sure that the device support sha256.

Well, my fTPM does support sha256:
$ tpm2_getcap algorithms | grep sha256 -A9
outputs the following:

sha256:
   value:      0xB
   asymmetric: 0
   symmetric:  0
   hash:       1
   object:     0
   reserved:   0x0
   signing:    0
   encrypting: 0
   method:     0

Also, if I run tpm2_hash on a file that is less than 1024 bytes, it does =

work. for example:
$ echo some_message > file && tpm2_hash -g sha256 file
outputs a valid sha256 (and can be output in a file with -o or with a =

redirection).

As I said before, the error happens when the file cannot be hashed in a =

single hash call (or it's size is unknown). And it does happen when =

using sha1 instead of sha256.


 > This looks like a driver or tpm device issue.
 > Do you see and TPM related problems in the system logs?

I should mention that I did encounter some issues when trying to get my =

fTPM to work.
I had the firmware/driver bug described here:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1394912
and here:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1810430

To fix it, I used this patch:
https://lore.kernel.org/linux-integrity/BCA04D5D9A3B764C9B7405BBA4D4A3C035E=
F7BC7(a)ALPMBAPA12.e2k.ad.ge.com/
(If you have time, I recommend having a look at the thread discussing =

the patch, it describes well the cause of the bug)

This could be causing the hash problem.
If I get my hands on a machine with an AMD fTPM that works without the =

need for a patch, I will see if the issue can be reproduced.

Regards,

-- =

Gabriel
--===============5129594337242874254==--

