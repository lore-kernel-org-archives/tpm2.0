Content-Type: multipart/mixed; boundary="===============1199762586084907650=="
MIME-Version: 1.0
From: Arun Sudhir <arunsudhir19 at gmail.com>
Subject: [tpm2] Re: Error running tpm2_create: magic does not match!
Date: Tue, 01 Oct 2019 14:30:52 -0700
Message-ID: <CAJLNp_X6eT5ubkYBxE30b_HgFgUFDrM42zt7B1jvY7kbbvO2UA@mail.gmail.com>
In-Reply-To: 1229681c-02d1-2782-ab26-f88810c8d1bb@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1199762586084907650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I will try that.

On Tue, Oct 1, 2019, 2:25 PM Tadeusz Struk <tadeusz.struk(a)intel.com> wrot=
e:

> On 10/1/19 11:50 AM, Arun Sudhir wrote:
> > HEre are the commands i used:
> >
> > |tpm2_createprimary -c primary.ctx (works)
> |tpm2_create -C primary.ctx -u obj.pub -r obj.priv (fails)
> >
> > ||
> >
> >
> > This is the error i get:
> >
> > ERROR: Found magic 0x40000001 did not match expected magic of 0xbadcc0d=
e!
> > WARN: The loaded tpm context does not appear to be in the proper format,
> assuming old format, this will be converted on the next save.
> > ERROR: Could not load tpm context file
> > ERROR: Failed to load_tpm_context_file()
> > ERROR: Unable to run
> C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\x64\Debug\tpm2-create=
.exe
>
> You can try to hex dump the primary.ctx after tpm2_createprimary() to see
> what's in it.
> The format should be:
>
> U32 magic (0xBADCC0DE)
> U32 ctx version (0x00000001)
> U32 savedHandle
> U64 sequence
> U16 contextBlobLength
> BYTE[] contextBlob
>
> The 0x40000001 looks like the owner handle.
>
> --
> Tadeusz
>

--===============1199762586084907650==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPkkgd2lsbCB0cnkgdGhhdC7CoDwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwgT2N0
IDEsIDIwMTksIDI6MjUgUE0gVGFkZXVzeiBTdHJ1ayAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRhZGV1
c3ouc3RydWtAaW50ZWwuY29tIj50YWRldXN6LnN0cnVrQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3Rl
Ojxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5P
biAxMC8xLzE5IDExOjUwIEFNLCBBcnVuIFN1ZGhpciB3cm90ZTo8YnI+CiZndDsgSEVyZSBhcmUg
dGhlIGNvbW1hbmRzIGkgdXNlZDo8YnI+CiZndDsgPGJyPgomZ3Q7IHx0cG0yX2NyZWF0ZXByaW1h
cnnCoC1jwqBwcmltYXJ5LmN0eCAod29ya3MpIHx0cG0yX2NyZWF0ZcKgLUPCoHByaW1hcnkuY3R4
wqAtdcKgb2JqLnB1YsKgLXLCoG9iai5wcml2IChmYWlscyk8YnI+CiZndDsgPGJyPgomZ3Q7IHx8
PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgVGhpcyBpcyB0aGUgZXJyb3IgaSBnZXQ6wqA8
YnI+CiZndDsgPGJyPgomZ3Q7IEVSUk9SOiBGb3VuZCBtYWdpYyAweDQwMDAwMDAxIGRpZCBub3Qg
bWF0Y2ggZXhwZWN0ZWQgbWFnaWMgb2YgMHhiYWRjYzBkZSE8YnI+CiZndDsgV0FSTjogVGhlIGxv
YWRlZCB0cG0gY29udGV4dCBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgaW4gdGhlIHByb3BlciBmb3Jt
YXQsIGFzc3VtaW5nIG9sZCBmb3JtYXQsIHRoaXMgd2lsbCBiZSBjb252ZXJ0ZWQgb24gdGhlIG5l
eHQgc2F2ZS48YnI+CiZndDsgRVJST1I6IENvdWxkIG5vdCBsb2FkIHRwbSBjb250ZXh0IGZpbGU8
YnI+CiZndDsgRVJST1I6IEZhaWxlZCB0byBsb2FkX3RwbV9jb250ZXh0X2ZpbGUoKTxicj4KJmd0
OyBFUlJPUjogVW5hYmxlIHRvIHJ1biBDOlxVc2Vyc1xhcnVuc3Vcc291cmNlXHJlcG9zXHRwbTIt
dG9vbHMtNC4wXHZzdHVkaW9ceDY0XERlYnVnXHRwbTItY3JlYXRlLmV4ZTxicj4KPGJyPgpZb3Ug
Y2FuIHRyeSB0byBoZXggZHVtcCB0aGUgcHJpbWFyeS5jdHggYWZ0ZXIgdHBtMl9jcmVhdGVwcmlt
YXJ5KCkgdG8gc2VlIHdoYXQmIzM5O3MgaW4gaXQuPGJyPgpUaGUgZm9ybWF0IHNob3VsZCBiZTo8
YnI+Cjxicj4KVTMyIG1hZ2ljICgweEJBRENDMERFKTxicj4KVTMyIGN0eCB2ZXJzaW9uICgweDAw
MDAwMDAxKTxicj4KVTMyIHNhdmVkSGFuZGxlPGJyPgpVNjQgc2VxdWVuY2U8YnI+ClUxNiBjb250
ZXh0QmxvYkxlbmd0aDxicj4KQllURVtdIGNvbnRleHRCbG9iPGJyPgo8YnI+ClRoZSAweDQwMDAw
MDAxIGxvb2tzIGxpa2UgdGhlIG93bmVyIGhhbmRsZS48YnI+Cjxicj4KLS0gPGJyPgpUYWRldXN6
PGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============1199762586084907650==--

