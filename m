Content-Type: multipart/mixed; boundary="===============3650162608302507422=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: tpm2_eventlog ERROR: SpecID eventType must be EV_NO_ACTION
Date: Thu, 15 Apr 2021 15:37:23 -0400
Message-ID: <OF390046DF.F4A70955-ON002586B8.006B4F6E-852586B8.006BCB08@notes.na.collabserv.com>
In-Reply-To: 20210415182554.2848.69001@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3650162608302507422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


In theory, the BIOS event log is constructed pre-OS, and certainly the
beginning part should not be affected.

If you're booting two different kernels and the first event changes, my
first guess is that something in the kernel is affecting the pseudo-file
and skipping or deleting the first measurement.  "Customized Linux kernel"
sounds suspicious.

I think you might have a better audience on the Linux security mailing
list.

--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)




From:	nicolasoliver03(a)gmail.com
To:	tpm2(a)lists.01.org
Date:	04/15/2021 02:26 PM
Subject:	[EXTERNAL] [tpm2] Re: tpm2_eventlog ERROR: SpecID eventType
            must be EV_NO_ACTION



Hello again,

I have been debugging this issue with the manufacturer for a couple of
days, and found something very interesting.
Initially, I thought it was a System Firmware (BIOS) problem, that it was
misbehaving and reporting an invalid log.
But it seems to be a Kernel related problem.

If the system is booted with a customized Linux Kernel 4.19, the TPM Event
Log present in sysfs is invalid: tools fails to parse it, and there are no
SHA256 measurements.
If the system is booted with a vanilla Linux Kernel 5.8.15 (Fedora
Workstation 33 Live), the TPM Event Log is valid, tools can parse it, there
are both SHA1 and SHA256 measurements, and the reconstruction matches
perfectly with the state of the TPM PCRs

This is more evident by comparing the binary_bios_measurements files taken
from both executions. I can see the good one starting with "Spec ID Ev..",
and the bad one directly with "Secure Boot" related info

The git history of the kernel source related to TPM Event Log is available
here
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/driv=
ers/char/tpm/eventlog
 .
I will look there to see if something shed some light to this issue.

Any hints are appreciated,

Thank you for your help so far!
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s




--===============3650162608302507422==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+SW4gdGhlb3J5LCB0aGUgQklPUyBldmVudCBs
b2cgaXMgY29uc3RydWN0ZWQgcHJlLU9TLCBhbmQgY2VydGFpbmx5IHRoZSBiZWdpbm5pbmcgcGFy
dCBzaG91bGQgbm90IGJlIGFmZmVjdGVkLjwvZm9udD48YnI+PGJyPjxmb250IHNpemU9IjIiPklm
IHlvdSdyZSBib290aW5nIHR3byBkaWZmZXJlbnQga2VybmVscyBhbmQgdGhlIGZpcnN0IGV2ZW50
IGNoYW5nZXMsIG15IGZpcnN0IGd1ZXNzIGlzIHRoYXQgc29tZXRoaW5nIGluIHRoZSBrZXJuZWwg
aXMgYWZmZWN0aW5nIHRoZSBwc2V1ZG8tZmlsZSBhbmQgc2tpcHBpbmcgb3IgZGVsZXRpbmcgdGhl
IGZpcnN0IG1lYXN1cmVtZW50LiAgJnF1b3Q7Q3VzdG9taXplZCBMaW51eCBrZXJuZWwmcXVvdDsg
c291bmRzIHN1c3BpY2lvdXMuICA8L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPSIyIj5JIHRoaW5r
IHlvdSBtaWdodCBoYXZlIGEgYmV0dGVyIGF1ZGllbmNlIG9uIHRoZSBMaW51eCBzZWN1cml0eSBt
YWlsaW5nIGxpc3QuPGJyPjxicj4tLTxicj5LZW4gR29sZG1hbiAgIGtnb2xkbWFuQHVzLmlibS5j
b20gICA8YnI+OTE0LTk0NS0yNDE1ICg4NjItMjQxNSk8YnI+PC9mb250Pjxicj48YnI+PGltZyB3
aWR0aD0iMTYiIGhlaWdodD0iMTYiIHNyYz0iY2lkOjFfXz04RkJCMEMyQkRGRjhDOUZFOGY5ZThh
OTNkZjkzODY5MDkxOGM4RkJAIiBib3JkZXI9IjAiIGFsdD0iSW5hY3RpdmUgaGlkZSBkZXRhaWxz
IGZvciBuaWNvbGFzb2xpdmVyMDMtLS0wNC8xNS8yMDIxIDAyOjI2OjAwIFBNLS0tSGVsbG8gYWdh
aW4sIEkgaGF2ZSBiZWVuIGRlYnVnZ2luZyB0aGlzIGlzc3VlIHdpdGggdGhlIG1hbiI+PGZvbnQg
c2l6ZT0iMiIgY29sb3I9IiM0MjQyODIiPm5pY29sYXNvbGl2ZXIwMy0tLTA0LzE1LzIwMjEgMDI6
MjY6MDAgUE0tLS1IZWxsbyBhZ2FpbiwgSSBoYXZlIGJlZW4gZGVidWdnaW5nIHRoaXMgaXNzdWUg
d2l0aCB0aGUgbWFudWZhY3R1cmVyIGZvciBhIGNvdXBsZSBvZiBkYXlzLCBhbmQgZm91bmQ8L2Zv
bnQ+PGJyPjxicj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+RnJvbTogICAgICAgIDwv
Zm9udD48Zm9udCBzaXplPSIyIj5uaWNvbGFzb2xpdmVyMDNAZ21haWwuY29tPC9mb250Pjxicj48
Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+VG86ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6
ZT0iMiI+dHBtMkBsaXN0cy4wMS5vcmc8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGNvbG9yPSIj
NUY1RjVGIj5EYXRlOiAgICAgICAgPC9mb250Pjxmb250IHNpemU9IjIiPjA0LzE1LzIwMjEgMDI6
MjYgUE08L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGNvbG9yPSIjNUY1RjVGIj5TdWJqZWN0OiAg
ICAgICAgPC9mb250Pjxmb250IHNpemU9IjIiPltFWFRFUk5BTF0gW3RwbTJdIFJlOiB0cG0yX2V2
ZW50bG9nIEVSUk9SOiBTcGVjSUQgZXZlbnRUeXBlIG11c3QgYmUgRVZfTk9fQUNUSU9OPC9mb250
Pjxicj48aHIgd2lkdGg9IjEwMCUiIHNpemU9IjIiIGFsaWduPSJsZWZ0IiBub3NoYWRlIHN0eWxl
PSJjb2xvcjojODA5MUE1OyAiPjxicj48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5IZWxsbyBh
Z2Fpbiw8YnI+PGJyPkkgaGF2ZSBiZWVuIGRlYnVnZ2luZyB0aGlzIGlzc3VlIHdpdGggdGhlIG1h
bnVmYWN0dXJlciBmb3IgYSBjb3VwbGUgb2YgZGF5cywgYW5kIGZvdW5kIHNvbWV0aGluZyB2ZXJ5
IGludGVyZXN0aW5nLjxicj5Jbml0aWFsbHksIEkgdGhvdWdodCBpdCB3YXMgYSBTeXN0ZW0gRmly
bXdhcmUgKEJJT1MpIHByb2JsZW0sIHRoYXQgaXQgd2FzIG1pc2JlaGF2aW5nIGFuZCByZXBvcnRp
bmcgYW4gaW52YWxpZCBsb2cuPGJyPkJ1dCBpdCBzZWVtcyB0byBiZSBhIEtlcm5lbCByZWxhdGVk
IHByb2JsZW0uPGJyPjxicj5JZiB0aGUgc3lzdGVtIGlzIGJvb3RlZCB3aXRoIGEgY3VzdG9taXpl
ZCBMaW51eCBLZXJuZWwgNC4xOSwgdGhlIFRQTSBFdmVudCBMb2cgcHJlc2VudCBpbiBzeXNmcyBp
cyBpbnZhbGlkOiB0b29scyBmYWlscyB0byBwYXJzZSBpdCwgYW5kIHRoZXJlIGFyZSBubyBTSEEy
NTYgbWVhc3VyZW1lbnRzLjxicj5JZiB0aGUgc3lzdGVtIGlzIGJvb3RlZCB3aXRoIGEgdmFuaWxs
YSBMaW51eCBLZXJuZWwgNS44LjE1IChGZWRvcmEgV29ya3N0YXRpb24gMzMgTGl2ZSksIHRoZSBU
UE0gRXZlbnQgTG9nIGlzIHZhbGlkLCB0b29scyBjYW4gcGFyc2UgaXQsIHRoZXJlIGFyZSBib3Ro
IFNIQTEgYW5kIFNIQTI1NiBtZWFzdXJlbWVudHMsIGFuZCB0aGUgcmVjb25zdHJ1Y3Rpb24gbWF0
Y2hlcyBwZXJmZWN0bHkgd2l0aCB0aGUgc3RhdGUgb2YgdGhlIFRQTSBQQ1JzPGJyPjxicj5UaGlz
IGlzIG1vcmUgZXZpZGVudCBieSBjb21wYXJpbmcgdGhlIGJpbmFyeV9iaW9zX21lYXN1cmVtZW50
cyBmaWxlcyB0YWtlbiBmcm9tIGJvdGggZXhlY3V0aW9ucy4gSSBjYW4gc2VlIHRoZSBnb29kIG9u
ZSBzdGFydGluZyB3aXRoICZxdW90O1NwZWMgSUQgRXYuLiZxdW90OywgYW5kIHRoZSBiYWQgb25l
IGRpcmVjdGx5IHdpdGggJnF1b3Q7U2VjdXJlIEJvb3QmcXVvdDsgcmVsYXRlZCBpbmZvPGJyPjxi
cj5UaGUgZ2l0IGhpc3Rvcnkgb2YgdGhlIGtlcm5lbCBzb3VyY2UgcmVsYXRlZCB0byBUUE0gRXZl
bnQgTG9nIGlzIGF2YWlsYWJsZSBoZXJlIDwvZm9udD48L3R0Pjx0dD48Zm9udCBzaXplPSIyIj48
YSBocmVmPSJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvbG9nL2RyaXZlcnMvY2hhci90cG0vZXZlbnRsb2ciPmh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC9sb2cvZHJpdmVycy9jaGFyL3RwbS9ldmVudGxvZzwvYT48L2ZvbnQ+PC90dD48dHQ+PGZvbnQg
c2l6ZT0iMiI+Jm5ic3A7LiA8YnI+SSB3aWxsIGxvb2sgdGhlcmUgdG8gc2VlIGlmIHNvbWV0aGlu
ZyBzaGVkIHNvbWUgbGlnaHQgdG8gdGhpcyBpc3N1ZS48YnI+PGJyPkFueSBoaW50cyBhcmUgYXBw
cmVjaWF0ZWQsPGJyPjxicj5UaGFuayB5b3UgZm9yIHlvdXIgaGVscCBzbyBmYXIhPGJyPl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPnRwbTIgbWFpbGlu
ZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPlRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1h
aWwgdG8gdHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8YnI+JSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZv
JShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+PGJyPjwvZm9udD48L3R0Pjxicj48YnI+
PEJSPgo8L2JvZHk+PC9odG1sPgo=

--===============3650162608302507422==
Content-Type: image/gif
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="graycol.gif"

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--===============3650162608302507422==--

