Content-Type: multipart/mixed; boundary="===============7684389556187787033=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Approaching 100 hours of troubleshooting
Date: Sat, 23 Nov 2019 18:07:12 +0000
Message-ID: <CALtZhhPfpQ4Cc_ZVGeuAXO9sWakWjBMWz2qya6ZxK8utM8YJEw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7684389556187787033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

I'm trying to get the TPM2 working in embedded Linux, and I've been
troubleshooting for nearly two weeks now.

I thought it would be a good idea to get the latest releases of the
following packages:

    tpm2-tss
    tpm2-tools
    tpm2-tss-engine

And also the latest commit of: tpm2-pkcs11

All I have succeeded in doing so far is getting random numbers from the
TPM2 chip. I haven't be able to store (or retrieve) keys, nor have I been
able to encrypt or decrypt data.

The first problem I'm having is that the command line options for the tools
(and also scripts) have been changed several times. Every time I try to
follow an example I find on the web, I get "unrecognised option -C".

In order to try follow examples I find online, I have repeatedly upgraded
and downgraded my versions of the packages, sometimes even mixing old tools
with new tools (sometimes even rewinding to an historical commit in Github
between official releases).

Can someone please suggest what are the best stable versions of these
packages for working with embedded Linux?

Another thing:
When my device boots up, I can go into the BIOS where I see a lot of
options for Trusted Platform. I'm not exactly sure what these options
actually do. Can someone advise me which settings in particular to watch
out for? I see one about fTPM but I'm not sure what it does.

--===============7684389556187787033==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

SGk8ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O20gdHJ5aW5nIHRvIGdldCB0aGUgVFBNMiB3b3Jr
aW5nIGluIGVtYmVkZGVkIExpbnV4LCBhbmQgSSYjMzk7dmUgYmVlbiB0cm91Ymxlc2hvb3Rpbmcg
Zm9yIG5lYXJseSB0d28gd2Vla3Mgbm93LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSB0aG91
Z2h0IGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhIHRvIGdldCB0aGUgbGF0ZXN0IHJlbGVhc2VzIG9m
IHRoZSBmb2xsb3dpbmcgcGFja2FnZXM6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj7CoCDCoCB0
cG0yLXRzczwvZGl2PjxkaXY+wqAgwqAgdHBtMi10b29sczwvZGl2PjxkaXY+wqAgwqAgdHBtMi10
c3MtZW5naW5lPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BbmQgYWxzbyB0aGUgbGF0ZXN0IGNv
bW1pdCBvZjogdHBtMi1wa2NzMTE8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFsbCBJIGhhdmUg
c3VjY2VlZGVkIGluIGRvaW5nIHNvIGZhciBpcyBnZXR0aW5nIHJhbmRvbSBudW1iZXJzIGZyb20g
dGhlIFRQTTIgY2hpcC4gSSBoYXZlbiYjMzk7dCBiZSBhYmxlIHRvIHN0b3JlIChvciByZXRyaWV2
ZSkga2V5cywgbm9yIGhhdmUgSSBiZWVuIGFibGUgdG8gZW5jcnlwdCBvciBkZWNyeXB0IGRhdGEu
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgZmlyc3QgcHJvYmxlbSBJJiMzOTttIGhhdmlu
ZyBpcyB0aGF0IHRoZSBjb21tYW5kIGxpbmUgb3B0aW9ucyBmb3IgdGhlIHRvb2xzIChhbmQgYWxz
byBzY3JpcHRzKSBoYXZlIGJlZW4gY2hhbmdlZCBzZXZlcmFsIHRpbWVzLiBFdmVyeSB0aW1lIEkg
dHJ5IHRvIGZvbGxvdyBhbiBleGFtcGxlIEkgZmluZCBvbiB0aGUgd2ViLCBJIGdldCAmcXVvdDt1
bnJlY29nbmlzZWQgb3B0aW9uIC1DJnF1b3Q7LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SW4g
b3JkZXIgdG8gdHJ5IGZvbGxvdyBleGFtcGxlcyBJIGZpbmQgb25saW5lLCBJIGhhdmUgcmVwZWF0
ZWRseSB1cGdyYWRlZCBhbmQgZG93bmdyYWRlZCBteSB2ZXJzaW9ucyBvZiB0aGUgcGFja2FnZXMs
IHNvbWV0aW1lcyBldmVuIG1peGluZyBvbGQgdG9vbHMgd2l0aCBuZXcgdG9vbHMgKHNvbWV0aW1l
cyBldmVuIHJld2luZGluZyB0byBhbiBoaXN0b3JpY2FsIGNvbW1pdCBpbiBHaXRodWIgYmV0d2Vl
biBvZmZpY2lhbCByZWxlYXNlcykuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DYW4gc29tZW9u
ZSBwbGVhc2Ugc3VnZ2VzdCB3aGF0IGFyZSB0aGUgYmVzdCBzdGFibGUgdmVyc2lvbnMgb2YgdGhl
c2UgcGFja2FnZXMgZm9yIHdvcmtpbmcgd2l0aCBlbWJlZGRlZCBMaW51eD88L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PkFub3RoZXIgdGhpbmc6PC9kaXY+PGRpdj5XaGVuIG15IGRldmljZSBib290
cyB1cCwgSSBjYW4gZ28gaW50byB0aGUgQklPUyB3aGVyZSBJIHNlZSBhIGxvdCBvZiBvcHRpb25z
IGZvciBUcnVzdGVkIFBsYXRmb3JtLiBJJiMzOTttIG5vdCBleGFjdGx5IHN1cmUgd2hhdCB0aGVz
ZSBvcHRpb25zIGFjdHVhbGx5IGRvLiBDYW4gc29tZW9uZSBhZHZpc2UgbWUgd2hpY2ggc2V0dGlu
Z3MgaW4gcGFydGljdWxhciB0byB3YXRjaCBvdXQgZm9yPyBJIHNlZSBvbmUgYWJvdXQgZlRQTSBi
dXQgSSYjMzk7bSBub3Qgc3VyZSB3aGF0IGl0IGRvZXMuPC9kaXY+Cg==

--===============7684389556187787033==--

