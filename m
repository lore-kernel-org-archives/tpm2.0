Content-Type: multipart/mixed; boundary="===============9197714899946308843=="
MIME-Version: 1.0
From: Arun Sudhir <arunsudhir19 at gmail.com>
Subject: [tpm2] Re: Error running tpm2_create: magic does not match!
Date: Tue, 01 Oct 2019 16:02:54 -0700
Message-ID: <CAJLNp_VZQ0Lqjwareg93O63PtqNUh3vb7SN_ayQ95UC_weQ89w@mail.gmail.com>
In-Reply-To: CAJLNp_X6eT5ubkYBxE30b_HgFgUFDrM42zt7B1jvY7kbbvO2UA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9197714899946308843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I found the issue:

Its with the part i have highlighted in bold below in the check_magic()
function in files.c:



* long negmagic =3D 0 - sizeof(magic);    if (seek_reset) {        int rc =
=3D
fseek(fstream, -negmagic, SEEK_CUR);*

Initially, the code does a check_magic with seek_reset =3D true. So it tries
to do an fseek backwards by 4 bytes . I remember i had to modify this code
to port to windows as clang on windows would not compile with a  unary
minus on an unsigned int in windows. That seems to be the issue.  It
instead goes forward by 4  bytes ! and the next check_magic fails which is
called again from *files_read_header *function (Also in files.c).

I skipped over the fseek and the second check_magic call and everything
worked fine.

I someone knows how to fix this (by properly fixing fseek) , please let me
know. For now, I have introduced a boolean flag that skips the second
check_magic and gets rid of the fseek altogether.

Thanks Tadeusz (again)  for your help!

Arun

On Tue, Oct 1, 2019 at 2:30 PM Arun Sudhir <arunsudhir19(a)gmail.com> wrote:

> I will try that.
>
> On Tue, Oct 1, 2019, 2:25 PM Tadeusz Struk <tadeusz.struk(a)intel.com>
> wrote:
>
>> On 10/1/19 11:50 AM, Arun Sudhir wrote:
>> > HEre are the commands i used:
>> >
>> > |tpm2_createprimary -c primary.ctx (works)
>> |tpm2_create -C primary.ctx -u obj.pub -r obj.priv (fails)
>> >
>> > ||
>> >
>> >
>> > This is the error i get:
>> >
>> > ERROR: Found magic 0x40000001 did not match expected magic of
>> 0xbadcc0de!
>> > WARN: The loaded tpm context does not appear to be in the proper
>> format, assuming old format, this will be converted on the next save.
>> > ERROR: Could not load tpm context file
>> > ERROR: Failed to load_tpm_context_file()
>> > ERROR: Unable to run
>> C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\x64\Debug\tpm2-creat=
e.exe
>>
>> You can try to hex dump the primary.ctx after tpm2_createprimary() to see
>> what's in it.
>> The format should be:
>>
>> U32 magic (0xBADCC0DE)
>> U32 ctx version (0x00000001)
>> U32 savedHandle
>> U64 sequence
>> U16 contextBlobLength
>> BYTE[] contextBlob
>>
>> The 0x40000001 looks like the owner handle.
>>
>> --
>> Tadeusz
>>
>

--===============9197714899946308843==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SSBmb3VuZCB0aGUgaXNzdWU6PGRpdj48YnI+PC9kaXY+PGRpdj5JdHMg
d2l0aCB0aGUgcGFydCBpIGhhdmUgaGlnaGxpZ2h0ZWQgaW4gYm9sZCBiZWxvdyBpbiB0aGUgY2hl
Y2tfbWFnaWMoKSBmdW5jdGlvbiBpbiBmaWxlcy5jOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
PGI+wqBsb25nIG5lZ21hZ2ljID0gMCAtIHNpemVvZihtYWdpYyk7PGJyPsKgIMKgIGlmIChzZWVr
X3Jlc2V0KSB7PGJyPsKgIMKgIMKgIMKgIGludCByYyA9IGZzZWVrKGZzdHJlYW0sIC1uZWdtYWdp
YywgU0VFS19DVVIpOzwvYj48YnI+PC9kaXY+PGRpdj48Yj48YnI+PC9iPjwvZGl2PjxkaXY+SW5p
dGlhbGx5LCB0aGUgY29kZSBkb2VzIGEgY2hlY2tfbWFnaWMgd2l0aCBzZWVrX3Jlc2V0ID0gdHJ1
ZS4gU28gaXQgdHJpZXMgdG8gZG8gYW4gZnNlZWsgYmFja3dhcmRzIGJ5IDQgYnl0ZXMgLiBJIHJl
bWVtYmVyIGkgaGFkIHRvIG1vZGlmeSB0aGlzIGNvZGUgdG8gcG9ydCB0byB3aW5kb3dzIGFzIGNs
YW5nIG9uIHdpbmRvd3Mgd291bGQgbm90IGNvbXBpbGUgd2l0aCBhwqAgdW5hcnkgbWludXMgb24g
YW4gdW5zaWduZWQgaW50IGluIHdpbmRvd3MuIFRoYXQgc2VlbXMgdG8gYmUgdGhlIGlzc3VlLsKg
IEl0IGluc3RlYWQgZ29lcyBmb3J3YXJkIGJ5IDTCoCBieXRlcyAhIGFuZCB0aGUgbmV4dCBjaGVj
a19tYWdpYyBmYWlscyB3aGljaCBpcyBjYWxsZWQgYWdhaW4gZnJvbcKgPGI+ZmlsZXNfcmVhZF9o
ZWFkZXIgPC9iPmZ1bmN0aW9uIChBbHNvIGluIGZpbGVzLmMpLsKgPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5JIHNraXBwZWQgb3ZlciB0aGUgZnNlZWsgYW5kIHRoZSBzZWNvbmQgY2hlY2tfbWFn
aWMgY2FsbCBhbmQgZXZlcnl0aGluZyB3b3JrZWQgZmluZS7CoMKgPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5JIHNvbWVvbmUga25vd3MgaG93IHRvIGZpeCB0aGlzIChieSBwcm9wZXJseSBmaXhp
bmcgZnNlZWspICwgcGxlYXNlIGxldCBtZSBrbm93LiBGb3Igbm93LCBJIGhhdmUgaW50cm9kdWNl
ZCBhIGJvb2xlYW4gZmxhZyB0aGF0IHNraXBzIHRoZSBzZWNvbmQgY2hlY2tfbWFnaWMgYW5kIGdl
dHMgcmlkIG9mIHRoZSBmc2VlayBhbHRvZ2V0aGVyLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
VGhhbmtzIFRhZGV1c3ogKGFnYWluKcKgIGZvciB5b3VyIGhlbHAhPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5BcnVuPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2
IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVHVlLCBPY3QgMSwgMjAxOSBhdCAyOjMw
IFBNIEFydW4gU3VkaGlyICZsdDs8YSBocmVmPSJtYWlsdG86YXJ1bnN1ZGhpcjE5QGdtYWlsLmNv
bSI+YXJ1bnN1ZGhpcjE5QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2tx
dW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+
PGRpdiBkaXI9ImF1dG8iPkkgd2lsbCB0cnkgdGhhdC7CoDwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwgT2N0
IDEsIDIwMTksIDI6MjUgUE0gVGFkZXVzeiBTdHJ1ayAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRhZGV1
c3ouc3RydWtAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+dGFkZXVzei5zdHJ1a0BpbnRlbC5j
b208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCBy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIDEwLzEvMTkgMTE6NTAgQU0sIEFy
dW4gU3VkaGlyIHdyb3RlOjxicj4KJmd0OyBIRXJlIGFyZSB0aGUgY29tbWFuZHMgaSB1c2VkOjxi
cj4KJmd0OyA8YnI+CiZndDsgfHRwbTJfY3JlYXRlcHJpbWFyecKgLWPCoHByaW1hcnkuY3R4ICh3
b3JrcykgfHRwbTJfY3JlYXRlwqAtQ8KgcHJpbWFyeS5jdHjCoC11wqBvYmoucHViwqAtcsKgb2Jq
LnByaXYgKGZhaWxzKTxicj4KJmd0OyA8YnI+CiZndDsgfHw8YnI+CiZndDsgPGJyPgomZ3Q7IDxi
cj4KJmd0OyBUaGlzIGlzIHRoZSBlcnJvciBpIGdldDrCoDxicj4KJmd0OyA8YnI+CiZndDsgRVJS
T1I6IEZvdW5kIG1hZ2ljIDB4NDAwMDAwMDEgZGlkIG5vdCBtYXRjaCBleHBlY3RlZCBtYWdpYyBv
ZiAweGJhZGNjMGRlITxicj4KJmd0OyBXQVJOOiBUaGUgbG9hZGVkIHRwbSBjb250ZXh0IGRvZXMg
bm90IGFwcGVhciB0byBiZSBpbiB0aGUgcHJvcGVyIGZvcm1hdCwgYXNzdW1pbmcgb2xkIGZvcm1h
dCwgdGhpcyB3aWxsIGJlIGNvbnZlcnRlZCBvbiB0aGUgbmV4dCBzYXZlLjxicj4KJmd0OyBFUlJP
UjogQ291bGQgbm90IGxvYWQgdHBtIGNvbnRleHQgZmlsZTxicj4KJmd0OyBFUlJPUjogRmFpbGVk
IHRvIGxvYWRfdHBtX2NvbnRleHRfZmlsZSgpPGJyPgomZ3Q7IEVSUk9SOiBVbmFibGUgdG8gcnVu
IEM6XFVzZXJzXGFydW5zdVxzb3VyY2VccmVwb3NcdHBtMi10b29scy00LjBcdnN0dWRpb1x4NjRc
RGVidWdcdHBtMi1jcmVhdGUuZXhlPGJyPgo8YnI+CllvdSBjYW4gdHJ5IHRvIGhleCBkdW1wIHRo
ZSBwcmltYXJ5LmN0eCBhZnRlciB0cG0yX2NyZWF0ZXByaW1hcnkoKSB0byBzZWUgd2hhdCYjMzk7
cyBpbiBpdC48YnI+ClRoZSBmb3JtYXQgc2hvdWxkIGJlOjxicj4KPGJyPgpVMzIgbWFnaWMgKDB4
QkFEQ0MwREUpPGJyPgpVMzIgY3R4IHZlcnNpb24gKDB4MDAwMDAwMDEpPGJyPgpVMzIgc2F2ZWRI
YW5kbGU8YnI+ClU2NCBzZXF1ZW5jZTxicj4KVTE2IGNvbnRleHRCbG9iTGVuZ3RoPGJyPgpCWVRF
W10gY29udGV4dEJsb2I8YnI+Cjxicj4KVGhlIDB4NDAwMDAwMDEgbG9va3MgbGlrZSB0aGUgb3du
ZXIgaGFuZGxlLjxicj4KPGJyPgotLSA8YnI+ClRhZGV1c3o8YnI+CjwvYmxvY2txdW90ZT48L2Rp
dj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============9197714899946308843==--

