Content-Type: multipart/mixed; boundary="===============2474899973653649337=="
MIME-Version: 1.0
From: Matthew Dempsky <matthew at dempsky.org>
Subject: Re: [tpm2] Incomplete TPM event log on Linux?
Date: Wed, 18 Sep 2019 10:20:53 -0700
Message-ID: <CANKkrzH5Amhgp+J=xAuMMye+FGLmWPVqCvzXTiQzR2+i21YM7w@mail.gmail.com>
In-Reply-To: CAKrSGQTKxgGJv_Cc6w7dL_sgGpj85-8sFrVvmzT5McbDZnCvBg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2474899973653649337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 4:21 AM Luke Hinds <lhinds(a)redhat.com> wrote:

> PCR 7 is various components of secure boo in the context of the shim:
>
>
> https://github.com/rhboot/shim/blob/a4a1fbe728c9545fc5647129df0cf1593b953=
bec/README.tpm#L9-L20
>

Thanks, I'm aware of that. I pointed out in my email, there's an event log
entry from Shim within binary_bios_measurements (seemingly originating from
here
<https://github.com/rhboot/shim/blob/a4a1fbe728c9545fc5647129df0cf1593b953b=
ec/shim.c#L1114>
).

Also, as far as I can tell, Shim's tpm_log_event_raw function
<https://github.com/rhboot/shim/blob/a4a1fbe728c9545fc5647129df0cf1593b953b=
ec/tpm.c#L111>
is the choke point for all PCR extend operations, and it's a combined
extend+log command. So I would expect that if Shim is performing multiple
extend operations, then either all of them or none of them would appear in
the log.


However, that confidence is a little weakened now that I've just discovered
these two commits:

https://github.com/rhboot/shim/commit/fd7c3bd920ba39082cb7c619afb7203d150a4=
cd3
https://github.com/torvalds/linux/commit/166a2809d65b282272c474835ec22c882a=
39ca1b

Apparently there's both a "boot services event log" and a "final event
log", and the kernel is responsible for deduplicating them? That makes me
wonder if the Linux kernel I'm using is trying to deduplicate entries and
accidentally throwing away some non-duplicates.


Finally, after sending my email last night, I tried booting into single
user mode, and confirmed that tpm2_pcrread reports the same value for PCR 7
as for normal boot. So the discrepancy doesn't seem to be from userspace.
Or at least, if it is, then it's from something very early in boot.

>

--===============2474899973653649337==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgNDoy
MSBBTSBMdWtlIEhpbmRzICZsdDs8YSBocmVmPSJtYWlsdG86bGhpbmRzQHJlZGhhdC5jb20iIHRh
cmdldD0iX2JsYW5rIj5saGluZHNAcmVkaGF0LmNvbTwvYT4mZ3Q7IHdyb3RlOjwvZGl2PjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdj5QQ1IgNyBpcyB2
YXJpb3VzIGNvbXBvbmVudHMgb2Ygc2VjdXJlIGJvbyBpbiB0aGUgY29udGV4dCBvZiB0aGUgc2hp
bTo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9y
aGJvb3Qvc2hpbS9ibG9iL2E0YTFmYmU3MjhjOTU0NWZjNTY0NzEyOWRmMGNmMTU5M2I5NTNiZWMv
UkVBRE1FLnRwbSNMOS1MMjAiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vcmhi
b290L3NoaW0vYmxvYi9hNGExZmJlNzI4Yzk1NDVmYzU2NDcxMjlkZjBjZjE1OTNiOTUzYmVjL1JF
QURNRS50cG0jTDktTDIwPC9hPjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rp
dj48ZGl2PlRoYW5rcywgSSYjMzk7bSBhd2FyZSBvZiB0aGF0LiBJIHBvaW50ZWQgb3V0IGluIG15
IGVtYWlsLCB0aGVyZSYjMzk7cyBhbiBldmVudCBsb2cgZW50cnkgZnJvbSBTaGltIHdpdGhpbiBi
aW5hcnlfYmlvc19tZWFzdXJlbWVudHMgKHNlZW1pbmdseSBvcmlnaW5hdGluZyBmcm9tIDxhIGhy
ZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9yaGJvb3Qvc2hpbS9ibG9iL2E0YTFmYmU3MjhjOTU0NWZj
NTY0NzEyOWRmMGNmMTU5M2I5NTNiZWMvc2hpbS5jI0wxMTE0Ij5oZXJlPC9hPikuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5BbHNvLCBhcyBmYXIgYXMgSSBjYW4gdGVsbCwgU2hpbSYjMzk7cyA8
YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmhib290L3NoaW0vYmxvYi9hNGExZmJlNzI4Yzk1
NDVmYzU2NDcxMjlkZjBjZjE1OTNiOTUzYmVjL3RwbS5jI0wxMTEiPnRwbV9sb2dfZXZlbnRfcmF3
IGZ1bmN0aW9uPC9hPiBpcyB0aGUgY2hva2UgcG9pbnQgZm9yIGFsbCBQQ1IgZXh0ZW5kIG9wZXJh
dGlvbnMsIGFuZCBpdCYjMzk7cyBhIGNvbWJpbmVkIGV4dGVuZCtsb2cgY29tbWFuZC4gU28gSSB3
b3VsZCBleHBlY3QgdGhhdCBpZiBTaGltIGlzIHBlcmZvcm1pbmcgbXVsdGlwbGUgZXh0ZW5kIG9w
ZXJhdGlvbnMsIHRoZW4gZWl0aGVyIGFsbCBvZiB0aGVtIG9yIG5vbmUgb2YgdGhlbSB3b3VsZCBh
cHBlYXIgaW4gdGhlIGxvZy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
Pkhvd2V2ZXIsIHRoYXQgY29uZmlkZW5jZSBpcyBhIGxpdHRsZSB3ZWFrZW5lZCBub3cgdGhhdCBJ
JiMzOTt2ZSBqdXN0IGRpc2NvdmVyZWQgdGhlc2UgdHdvIGNvbW1pdHM6PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmhib290L3NoaW0vY29tbWl0
L2ZkN2MzYmQ5MjBiYTM5MDgyY2I3YzYxOWFmYjcyMDNkMTUwYTRjZDMiPmh0dHBzOi8vZ2l0aHVi
LmNvbS9yaGJvb3Qvc2hpbS9jb21taXQvZmQ3YzNiZDkyMGJhMzkwODJjYjdjNjE5YWZiNzIwM2Qx
NTBhNGNkMzwvYT48YnI+PC9kaXY+PGRpdj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvY29tbWl0LzE2NmEyODA5ZDY1YjI4MjI3MmM0NzQ4MzVlYzIyYzg4MmEzOWNh
MWIiPmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvMTY2YTI4MDlkNjVi
MjgyMjcyYzQ3NDgzNWVjMjJjODgyYTM5Y2ExYjwvYT48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5BcHBhcmVudGx5IHRoZXJlJiMzOTtzIGJvdGggYSAmcXVvdDtib290IHNlcnZpY2VzIGV2
ZW50IGxvZyZxdW90OyBhbmQgYSAmcXVvdDtmaW5hbCBldmVudCBsb2cmcXVvdDssIGFuZCB0aGUg
a2VybmVsIGlzIHJlc3BvbnNpYmxlIGZvciBkZWR1cGxpY2F0aW5nIHRoZW0/IFRoYXQgbWFrZXMg
bWUgd29uZGVyIGlmIHRoZSBMaW51eCBrZXJuZWwgSSYjMzk7bSB1c2luZyBpcyB0cnlpbmcgdG8g
ZGVkdXBsaWNhdGUgZW50cmllcyBhbmQgYWNjaWRlbnRhbGx5IHRocm93aW5nIGF3YXkgc29tZSBu
b24tZHVwbGljYXRlcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkZp
bmFsbHksIGFmdGVyIHNlbmRpbmcgbXkgZW1haWwgbGFzdCBuaWdodCwgSSB0cmllZCBib290aW5n
IGludG8gc2luZ2xlIHVzZXIgbW9kZSwgYW5kIGNvbmZpcm1lZCB0aGF0IHRwbTJfcGNycmVhZCBy
ZXBvcnRzIHRoZSBzYW1lIHZhbHVlIGZvciBQQ1IgNyBhcyBmb3Igbm9ybWFsIGJvb3QuIFNvIHRo
ZSBkaXNjcmVwYW5jeSBkb2VzbiYjMzk7dCBzZWVtIHRvIGJlIGZyb20gdXNlcnNwYWNlLiBPciBh
dCBsZWFzdCwgaWYgaXQgaXMsIHRoZW4gaXQmIzM5O3MgZnJvbSBzb21ldGhpbmcgdmVyeSBlYXJs
eSBpbiBib290LjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pgo=

--===============2474899973653649337==--

