Content-Type: multipart/mixed; boundary="===============3139296812468229620=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Failed to initialize tcti context: 0x1
Date: Fri, 27 Mar 2020 08:16:59 -0700
Message-ID: <5cf18b7e-d4cd-0d82-f321-5c8f6a73bd9d@intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EB38A6@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3139296812468229620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/27/20 8:07 AM, Roberts, William C wrote:
> Im surprised theirs not some default udev rules or however they do it now=
 adays.
> @tstruk, do you know what the guidance is on permissions for /dev/tpm[0-9=
]+?

Yes. It should be:

$ ls -l /dev/tpm*
crw-rw---- 1 root root  10,   224 Mar 20 09:30 /dev/tpm0
crw-rw---- 1 tss  tss  244, 65536 Mar 20 09:30 /dev/tpmrm0

-- =

Tadeusz
--===============3139296812468229620==--

