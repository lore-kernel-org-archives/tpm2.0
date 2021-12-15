Content-Type: multipart/mixed; boundary="===============5704916848336005457=="
MIME-Version: 1.0
From: Han <keepsimple at gmail.com>
Subject: [tpm2] tpm2_flushcontext stuck
Date: Wed, 15 Dec 2021 15:56:49 -0800
Message-ID: <CAEjGaqfmSV=OZRVkPCgAXP6Mp38C6+8OFUeQNuB5vz86zyu3bg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5704916848336005457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I'm using tpm2-tools 5.0 in Debian 11 Bullseye based Raspberry Pi OS.  I'm
trying to run tpm2_flushcontext but the command got stuck and it's not
showing anything. Is the data in TPM corrupted?  How can I check?

$ sudo tpm2_flushcontext 0x80000000
< no output at all and stuck here >

(note: the handle 0x80000000 was obtained from previous command output when
I was running previous version tpm2-tools 3.1.3 on Debian 10 Buster based
OS:

$ sudo tpm2_createprimary -H o -g sha256 -G ecc -C context.out
ObjectAttribute: 0x00030072

CreatePrimary Succeed ! Handle: 0x80000000)

--===============5704916848336005457==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTttIHVzaW5nIHRwbTIt
dG9vbHMgNS4wIGluIERlYmlhbiAxMSBCdWxsc2V5ZSBiYXNlZCBSYXNwYmVycnkgUGkgT1MuwqAg
SSYjMzk7bSB0cnlpbmcgdG8gcnVuwqB0cG0yX2ZsdXNoY29udGV4dCBidXQgdGhlIGNvbW1hbmQg
Z290IHN0dWNrIGFuZCBpdCYjMzk7cyBub3Qgc2hvd2luZyBhbnl0aGluZy4gSXMgdGhlIGRhdGEg
aW4gVFBNIGNvcnJ1cHRlZD/CoCBIb3cgY2FuIEkgY2hlY2s/wqA8L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PiQgc3VkbyB0cG0yX2ZsdXNoY29udGV4dCAweDgwMDAwMDAwPGJyPjwvZGl2PjxkaXY+
Jmx0OyBubyBvdXRwdXQgYXQgYWxsIGFuZCBzdHVjayBoZXJlICZndDs8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2Pihub3RlOiB0aGUgaGFuZGxlIDB4ODAwMDAwMDAgd2FzIG9idGFpbmVkIGZyb20g
cHJldmlvdXMgY29tbWFuZCBvdXRwdXQgd2hlbiBJIHdhcyBydW5uaW5nIHByZXZpb3VzIHZlcnNp
b24gdHBtMi10b29scyAzLjEuMyBvbiBEZWJpYW4gMTAgQnVzdGVyIGJhc2VkIE9TOsKgPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj48cHJlIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1ib3g7Zm9u
dC1mYW1pbHk6dWktbW9ub3NwYWNlLFNGTW9uby1SZWd1bGFyLCZxdW90O1NGIE1vbm8mcXVvdDss
TWVubG8sQ29uc29sYXMsJnF1b3Q7TGliZXJhdGlvbiBNb25vJnF1b3Q7LG1vbm9zcGFjZTtmb250
LXNpemU6MTEuOXB4O21hcmdpbi10b3A6MHB4O21hcmdpbi1ib3R0b206MTZweDtwYWRkaW5nOjE2
cHg7b3ZlcmZsb3c6YXV0bztsaW5lLWhlaWdodDoxLjQ1O2JvcmRlci1yYWRpdXM6NnB4O2NvbG9y
OnJnYigzNiw0MSw0NykiPjxjb2RlIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1ib3g7Zm9udC1m
YW1pbHk6dWktbW9ub3NwYWNlLFNGTW9uby1SZWd1bGFyLCZxdW90O1NGIE1vbm8mcXVvdDssTWVu
bG8sQ29uc29sYXMsJnF1b3Q7TGliZXJhdGlvbiBNb25vJnF1b3Q7LG1vbm9zcGFjZTtmb250LXNp
emU6MTEuOXB4O3BhZGRpbmc6MHB4O21hcmdpbjowcHg7YmFja2dyb3VuZDp0cmFuc3BhcmVudDti
b3JkZXItcmFkaXVzOjZweDt3b3JkLWJyZWFrOm5vcm1hbDtib3JkZXI6MHB4O2Rpc3BsYXk6aW5s
aW5lO292ZXJmbG93OnZpc2libGU7bGluZS1oZWlnaHQ6aW5oZXJpdCI+JCBzdWRvIHRwbTJfY3Jl
YXRlcHJpbWFyeSAtSCBvIC1nIHNoYTI1NiAtRyBlY2MgLUMgY29udGV4dC5vdXQKT2JqZWN0QXR0
cmlidXRlOiAweDAwMDMwMDcyCgpDcmVhdGVQcmltYXJ5IFN1Y2NlZWQgISBIYW5kbGU6IDB4ODAw
MDAwMDApIDwvY29kZT48L3ByZT48L2Rpdj48L2Rpdj4K

--===============5704916848336005457==--

