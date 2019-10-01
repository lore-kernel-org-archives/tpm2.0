Content-Type: multipart/mixed; boundary="===============3455531322117634332=="
MIME-Version: 1.0
From: Arun Sudhir <arunsudhir19 at gmail.com>
Subject: [tpm2] Re: Error running tpm2_create: magic does not match!
Date: Tue, 01 Oct 2019 16:16:29 -0700
Message-ID: <CAJLNp_V7MX=nrsSeCPt0stf-bGBrwLH94_5RECdFw+f8X9ZxXA@mail.gmail.com>
In-Reply-To: CAJLNp_VZQ0Lqjwareg93O63PtqNUh3vb7SN_ayQ95UC_weQ89w@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3455531322117634332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

wait.. i should be doing "negmagic" and not -negmagic in the function call!
Maybe that the cause of the bug!

On Tue, Oct 1, 2019 at 4:02 PM Arun Sudhir <arunsudhir19(a)gmail.com> wrote:

> I found the issue:
>
> Its with the part i have highlighted in bold below in the check_magic()
> function in files.c:
>
>
>
> * long negmagic =3D 0 - sizeof(magic);    if (seek_reset) {        int rc=
 =3D
> fseek(fstream, -negmagic, SEEK_CUR);*
>
> Initially, the code does a check_magic with seek_reset =3D true. So it tr=
ies
> to do an fseek backwards by 4 bytes . I remember i had to modify this code
> to port to windows as clang on windows would not compile with a  unary
> minus on an unsigned int in windows. That seems to be the issue.  It
> instead goes forward by 4  bytes ! and the next check_magic fails which is
> called again from *files_read_header *function (Also in files.c).
>
> I skipped over the fseek and the second check_magic call and everything
> worked fine.
>
> I someone knows how to fix this (by properly fixing fseek) , please let me
> know. For now, I have introduced a boolean flag that skips the second
> check_magic and gets rid of the fseek altogether.
>
> Thanks Tadeusz (again)  for your help!
>
> Arun
>
> On Tue, Oct 1, 2019 at 2:30 PM Arun Sudhir <arunsudhir19(a)gmail.com> wro=
te:
>
>> I will try that.
>>
>> On Tue, Oct 1, 2019, 2:25 PM Tadeusz Struk <tadeusz.struk(a)intel.com>
>> wrote:
>>
>>> On 10/1/19 11:50 AM, Arun Sudhir wrote:
>>> > HEre are the commands i used:
>>> >
>>> > |tpm2_createprimary -c primary.ctx (works)
>>> |tpm2_create -C primary.ctx -u obj.pub -r obj.priv (fails)
>>> >
>>> > ||
>>> >
>>> >
>>> > This is the error i get:
>>> >
>>> > ERROR: Found magic 0x40000001 did not match expected magic of
>>> 0xbadcc0de!
>>> > WARN: The loaded tpm context does not appear to be in the proper
>>> format, assuming old format, this will be converted on the next save.
>>> > ERROR: Could not load tpm context file
>>> > ERROR: Failed to load_tpm_context_file()
>>> > ERROR: Unable to run
>>> C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\x64\Debug\tpm2-crea=
te.exe
>>>
>>> You can try to hex dump the primary.ctx after tpm2_createprimary() to
>>> see what's in it.
>>> The format should be:
>>>
>>> U32 magic (0xBADCC0DE)
>>> U32 ctx version (0x00000001)
>>> U32 savedHandle
>>> U64 sequence
>>> U16 contextBlobLength
>>> BYTE[] contextBlob
>>>
>>> The 0x40000001 looks like the owner handle.
>>>
>>> --
>>> Tadeusz
>>>
>>

--===============3455531322117634332==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+d2FpdC4uIGkgc2hvdWxkIGJlIGRvaW5nICZxdW90O25lZ21hZ2ljJnF1
b3Q7IGFuZCBub3QgLW5lZ21hZ2ljIGluIHRoZSBmdW5jdGlvbsKgY2FsbCEgTWF5YmUgdGhhdCB0
aGUgY2F1c2Ugb2YgdGhlIGJ1ZyE8L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxk
aXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIE9jdCAxLCAyMDE5IGF0IDQ6
MDIgUE0gQXJ1biBTdWRoaXIgJmx0OzxhIGhyZWY9Im1haWx0bzphcnVuc3VkaGlyMTlAZ21haWwu
Y29tIj5hcnVuc3VkaGlyMTlAZ21haWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9j
a3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhl
eDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4
Ij48ZGl2IGRpcj0ibHRyIj5JIGZvdW5kIHRoZSBpc3N1ZTo8ZGl2Pjxicj48L2Rpdj48ZGl2Pkl0
cyB3aXRoIHRoZSBwYXJ0IGkgaGF2ZSBoaWdobGlnaHRlZCBpbiBib2xkIGJlbG93IGluIHRoZSBj
aGVja19tYWdpYygpIGZ1bmN0aW9uIGluIGZpbGVzLmM6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj48Yj7CoGxvbmcgbmVnbWFnaWMgPSAwIC0gc2l6ZW9mKG1hZ2ljKTs8YnI+wqAgwqAgaWYgKHNl
ZWtfcmVzZXQpIHs8YnI+wqAgwqAgwqAgwqAgaW50IHJjID0gZnNlZWsoZnN0cmVhbSwgLW5lZ21h
Z2ljLCBTRUVLX0NVUik7PC9iPjxicj48L2Rpdj48ZGl2PjxiPjxicj48L2I+PC9kaXY+PGRpdj5J
bml0aWFsbHksIHRoZSBjb2RlIGRvZXMgYSBjaGVja19tYWdpYyB3aXRoIHNlZWtfcmVzZXQgPSB0
cnVlLiBTbyBpdCB0cmllcyB0byBkbyBhbiBmc2VlayBiYWNrd2FyZHMgYnkgNCBieXRlcyAuIEkg
cmVtZW1iZXIgaSBoYWQgdG8gbW9kaWZ5IHRoaXMgY29kZSB0byBwb3J0IHRvIHdpbmRvd3MgYXMg
Y2xhbmcgb24gd2luZG93cyB3b3VsZCBub3QgY29tcGlsZSB3aXRoIGHCoCB1bmFyeSBtaW51cyBv
biBhbiB1bnNpZ25lZCBpbnQgaW4gd2luZG93cy4gVGhhdCBzZWVtcyB0byBiZSB0aGUgaXNzdWUu
wqAgSXQgaW5zdGVhZCBnb2VzIGZvcndhcmQgYnkgNMKgIGJ5dGVzICEgYW5kIHRoZSBuZXh0IGNo
ZWNrX21hZ2ljIGZhaWxzIHdoaWNoIGlzIGNhbGxlZCBhZ2FpbiBmcm9twqA8Yj5maWxlc19yZWFk
X2hlYWRlciA8L2I+ZnVuY3Rpb24gKEFsc28gaW4gZmlsZXMuYykuwqA8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2Pkkgc2tpcHBlZCBvdmVyIHRoZSBmc2VlayBhbmQgdGhlIHNlY29uZCBjaGVja19t
YWdpYyBjYWxsIGFuZCBldmVyeXRoaW5nIHdvcmtlZCBmaW5lLsKgwqA8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2Pkkgc29tZW9uZSBrbm93cyBob3cgdG8gZml4IHRoaXMgKGJ5IHByb3Blcmx5IGZp
eGluZyBmc2VlaykgLCBwbGVhc2UgbGV0IG1lIGtub3cuIEZvciBub3csIEkgaGF2ZSBpbnRyb2R1
Y2VkIGEgYm9vbGVhbiBmbGFnIHRoYXQgc2tpcHMgdGhlIHNlY29uZCBjaGVja19tYWdpYyBhbmQg
Z2V0cyByaWQgb2YgdGhlIGZzZWVrIGFsdG9nZXRoZXIuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5UaGFua3MgVGFkZXVzeiAoYWdhaW4pwqAgZm9yIHlvdXIgaGVscCE8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PkFydW48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxk
aXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIE9jdCAxLCAyMDE5IGF0IDI6
MzAgUE0gQXJ1biBTdWRoaXIgJmx0OzxhIGhyZWY9Im1haWx0bzphcnVuc3VkaGlyMTlAZ21haWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+YXJ1bnN1ZGhpcjE5QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3Rl
Ojxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7
cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9ImF1dG8iPkkgd2lsbCB0cnkgdGhhdC7CoDwvZGl2
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWls
X2F0dHIiPk9uIFR1ZSwgT2N0IDEsIDIwMTksIDI6MjUgUE0gVGFkZXVzeiBTdHJ1ayAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnRhZGV1c3ouc3RydWtAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+dGFk
ZXVzei5zdHJ1a0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUg
Y2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRl
ci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIDEw
LzEvMTkgMTE6NTAgQU0sIEFydW4gU3VkaGlyIHdyb3RlOjxicj4KJmd0OyBIRXJlIGFyZSB0aGUg
Y29tbWFuZHMgaSB1c2VkOjxicj4KJmd0OyA8YnI+CiZndDsgfHRwbTJfY3JlYXRlcHJpbWFyecKg
LWPCoHByaW1hcnkuY3R4ICh3b3JrcykgfHRwbTJfY3JlYXRlwqAtQ8KgcHJpbWFyeS5jdHjCoC11
wqBvYmoucHViwqAtcsKgb2JqLnByaXYgKGZhaWxzKTxicj4KJmd0OyA8YnI+CiZndDsgfHw8YnI+
CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGlzIGlzIHRoZSBlcnJvciBpIGdldDrCoDxicj4K
Jmd0OyA8YnI+CiZndDsgRVJST1I6IEZvdW5kIG1hZ2ljIDB4NDAwMDAwMDEgZGlkIG5vdCBtYXRj
aCBleHBlY3RlZCBtYWdpYyBvZiAweGJhZGNjMGRlITxicj4KJmd0OyBXQVJOOiBUaGUgbG9hZGVk
IHRwbSBjb250ZXh0IGRvZXMgbm90IGFwcGVhciB0byBiZSBpbiB0aGUgcHJvcGVyIGZvcm1hdCwg
YXNzdW1pbmcgb2xkIGZvcm1hdCwgdGhpcyB3aWxsIGJlIGNvbnZlcnRlZCBvbiB0aGUgbmV4dCBz
YXZlLjxicj4KJmd0OyBFUlJPUjogQ291bGQgbm90IGxvYWQgdHBtIGNvbnRleHQgZmlsZTxicj4K
Jmd0OyBFUlJPUjogRmFpbGVkIHRvIGxvYWRfdHBtX2NvbnRleHRfZmlsZSgpPGJyPgomZ3Q7IEVS
Uk9SOiBVbmFibGUgdG8gcnVuIEM6XFVzZXJzXGFydW5zdVxzb3VyY2VccmVwb3NcdHBtMi10b29s
cy00LjBcdnN0dWRpb1x4NjRcRGVidWdcdHBtMi1jcmVhdGUuZXhlPGJyPgo8YnI+CllvdSBjYW4g
dHJ5IHRvIGhleCBkdW1wIHRoZSBwcmltYXJ5LmN0eCBhZnRlciB0cG0yX2NyZWF0ZXByaW1hcnko
KSB0byBzZWUgd2hhdCYjMzk7cyBpbiBpdC48YnI+ClRoZSBmb3JtYXQgc2hvdWxkIGJlOjxicj4K
PGJyPgpVMzIgbWFnaWMgKDB4QkFEQ0MwREUpPGJyPgpVMzIgY3R4IHZlcnNpb24gKDB4MDAwMDAw
MDEpPGJyPgpVMzIgc2F2ZWRIYW5kbGU8YnI+ClU2NCBzZXF1ZW5jZTxicj4KVTE2IGNvbnRleHRC
bG9iTGVuZ3RoPGJyPgpCWVRFW10gY29udGV4dEJsb2I8YnI+Cjxicj4KVGhlIDB4NDAwMDAwMDEg
bG9va3MgbGlrZSB0aGUgb3duZXIgaGFuZGxlLjxicj4KPGJyPgotLSA8YnI+ClRhZGV1c3o8YnI+
CjwvYmxvY2txdW90ZT48L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9k
aXY+Cg==

--===============3455531322117634332==--

