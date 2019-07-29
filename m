Content-Type: multipart/mixed; boundary="===============7297142765041425030=="
MIME-Version: 1.0
From: Garrett Fields <ghfields at gmail.com>
Subject: Re: [tpm2] PCR Policy enforcement when using nvram
Date: Mon, 29 Jul 2019 15:37:33 -0400
Message-ID: <CA++-fmt20BzOekDa5eGOyASoAO4Mj=624v-nekLsky9d6dnOSQ@mail.gmail.com>
In-Reply-To: A3DEEEBB19900C48B49572CB9C2891C9878F5092@SHSMSX108.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7297142765041425030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I was hoping to need to pass both authread and policyread before it could
read the nvram.  Either / or seems pretty straightforward.

This is how I did it in TPM 1.2:
----------------------------

# Release the tpm nvram index, if already used
tpm_nvrelease -i$index -o$tpmownerpw
# Create the tpm nvram index with certain permissions, pcr checks, and area
password
tpm_nvdefine -i$index -s${#datasetpw} -p"OWNERWRITE|AUTHREAD|READ_STCLEAR"
-r0 -r1 -r2 -r3 -r4 -r5 -r6 -r7 -a$nvrampw  -o$tpmownerpw
# Write the dataset password value into the tpm nvram index
tpm_nvwrite -i $index -d$datasetpw -p$tpmownerpw
# Retrieve Password
tpm_nvread -i $tpmindex -p$rootguid
# Lock from further reading until after reboot
tpm_nvread -i $tpmindex -s 0 -p$rootguid

------------------------------


I can't find much information on ppread though.  While "Requires Physical
Presence" is an understandable concept, I don't know how it evaluates the
location of the requester.

--===============7297142765041425030==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SSB3YXMgaG9waW5nIHRvIG5lZWQgdG8gcGFzcyBib3RoIGF1dGhyZWFk
IGFuZCBwb2xpY3lyZWFkIGJlZm9yZSBpdCBjb3VsZCByZWFkIHRoZSBudnJhbS7CoCBFaXRoZXIg
LyBvciBzZWVtcyBwcmV0dHkgc3RyYWlnaHRmb3J3YXJkLjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhp
cyBpcyBob3cgSSBkaWQgaXQgaW4gVFBNIDEuMjo8L2Rpdj48ZGl2Pi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS08L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMgUmVsZWFzZSB0aGUgdHBtIG52
cmFtIGluZGV4LCBpZiBhbHJlYWR5IHVzZWQ8YnI+dHBtX252cmVsZWFzZSAtaSRpbmRleCAtbyR0
cG1vd25lcnB3PGJyPiMgQ3JlYXRlIHRoZSB0cG0gbnZyYW0gaW5kZXggd2l0aCBjZXJ0YWluIHBl
cm1pc3Npb25zLCBwY3IgY2hlY2tzLCBhbmQgYXJlYSBwYXNzd29yZDxicj50cG1fbnZkZWZpbmUg
LWkkaW5kZXggLXMkeyNkYXRhc2V0cHd9IC1wJnF1b3Q7T1dORVJXUklURXxBVVRIUkVBRHxSRUFE
X1NUQ0xFQVImcXVvdDsgLXIwIC1yMSAtcjIgLXIzIC1yNCAtcjUgLXI2IC1yNyAtYSRudnJhbXB3
IMKgLW8kdHBtb3duZXJwdzxicj4jIFdyaXRlIHRoZSBkYXRhc2V0IHBhc3N3b3JkIHZhbHVlIGlu
dG8gdGhlIHRwbSBudnJhbSBpbmRleDxicj50cG1fbnZ3cml0ZSAtaSAkaW5kZXggLWQkZGF0YXNl
dHB3IC1wJHRwbW93bmVycHc8YnI+PC9kaXY+PGRpdj4jIFJldHJpZXZlIFBhc3N3b3JkPC9kaXY+
PGRpdj50cG1fbnZyZWFkIC1pICR0cG1pbmRleCAtcCRyb290Z3VpZDxicj48L2Rpdj48ZGl2PiMg
TG9jayBmcm9tIGZ1cnRoZXIgcmVhZGluZyB1bnRpbCBhZnRlciByZWJvb3Q8L2Rpdj48ZGl2PnRw
bV9udnJlYWQgLWkgJHRwbWluZGV4IC1zIDAgLXAkcm9vdGd1aWQ8YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBjYW4mIzM5O3QgZmluZCBtdWNoIGluZm9y
bWF0aW9uIG9uIHBwcmVhZCB0aG91Z2guwqAgV2hpbGUgJnF1b3Q7UmVxdWlyZXMgUGh5c2ljYWwg
UHJlc2VuY2UmcXVvdDsgaXMgYW4gdW5kZXJzdGFuZGFibGUgY29uY2VwdCwgSSBkb24mIzM5O3Qg
a25vdyBob3cgaXQgZXZhbHVhdGVzIHRoZSBsb2NhdGlvbiBvZiB0aGUgcmVxdWVzdGVyLjwvZGl2
PjwvZGl2PjwvZGl2Pgo=

--===============7297142765041425030==--

