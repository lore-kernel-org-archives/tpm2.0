Content-Type: multipart/mixed; boundary="===============0317454827620267454=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] Ansible role
Date: Wed, 31 Oct 2018 15:23:13 +0000
Message-ID: <CAKrSGQSbvWwXAQ76ep938cBUQuHNTofgXbr4wANgZuF=yqxEmg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0317454827620267454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I thought I would share this in case its useful to someone else.

https://github.com/lukehinds/ansible-tpm-simulator

Its an ansible role with Vagrantfile for deploying the tpm2 simulator and
building the tpm2-software suite from source. I used it to get a basic
development environment in place, and so it might be useful for someone who
wants a simple way to deploy the tpm2 tools / stack and resource manager +
simulator and get their feet wet.

You can set the branch you want to build from as ansible variables.

tpm2_tss_version: 2.1.0
tpm2_abrmd_version: 2.0.2
tpm2_tools_version: v1.1.0

There are few other things such as using the hosts /dev/urandom for more
entropy.

Note, its only been used by myself and not tested on many environments, so
consider it a WIP. Any issues just make a PR or raise an issue.

Regards,

Luke

--===============0317454827620267454==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSw8L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgdGhvdWdodCBJIHdvdWxkIHNoYXJlIHRoaXMgaW4gY2Fz
ZSBpdHMgdXNlZnVsIHRvIHNvbWVvbmUgZWxzZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxh
IGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9sdWtlaGluZHMvYW5zaWJsZS10cG0tc2ltdWxhdG9y
Ij5odHRwczovL2dpdGh1Yi5jb20vbHVrZWhpbmRzL2Fuc2libGUtdHBtLXNpbXVsYXRvcjwvYT48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkl0cyBhbiBhbnNpYmxlIHJvbGUgd2l0aCBWYWdyYW50
ZmlsZSBmb3IgZGVwbG95aW5nIHRoZSB0cG0yIHNpbXVsYXRvciBhbmQgYnVpbGRpbmcgdGhlIHRw
bTItc29mdHdhcmUgc3VpdGUgZnJvbSBzb3VyY2UuIEkgdXNlZCBpdCB0byBnZXQgYSBiYXNpYyBk
ZXZlbG9wbWVudCBlbnZpcm9ubWVudCBpbiBwbGFjZSwgYW5kIHNvIGl0IG1pZ2h0IGJlIHVzZWZ1
bCBmb3Igc29tZW9uZSB3aG8gd2FudHMgYSBzaW1wbGUgd2F5IHRvIGRlcGxveSB0aGUgdHBtMiB0
b29scyAvIHN0YWNrIGFuZCByZXNvdXJjZSBtYW5hZ2VywqArIHNpbXVsYXRvciBhbmQgZ2V0IHRo
ZWlyIGZlZXQgd2V0Ljxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PllvdSBjYW4gc2V0IHRo
ZSBicmFuY2ggeW91IHdhbnQgdG8gYnVpbGQgZnJvbSBhcyBhbnNpYmxlIHZhcmlhYmxlcy48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRwbTJfdHNzX3ZlcnNpb246IDIuMS4wPGJyPnRwbTJfYWJy
bWRfdmVyc2lvbjogMi4wLjI8YnI+dHBtMl90b29sc192ZXJzaW9uOiB2MS4xLjA8L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PlRoZXJlIGFyZSBmZXcgb3RoZXIgdGhpbmdzIHN1Y2ggYXMgdXNpbmcg
dGhlIGhvc3RzIC9kZXYvdXJhbmRvbSBmb3IgbW9yZSBlbnRyb3B5Ljxicj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2Pk5vdGUsIGl0cyBvbmx5IGJlZW4gdXNlZCBieSBteXNlbGYgYW5kIG5vdCB0
ZXN0ZWQgb24gbWFueSBlbnZpcm9ubWVudHMsIHNvIGNvbnNpZGVyIGl0IGEgV0lQLiBBbnkgaXNz
dWVzIGp1c3QgbWFrZSBhIFBSIG9yIHJhaXNlIGFuIGlzc3VlLjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+UmVnYXJkcyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkx1a2U8YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+Cg==

--===============0317454827620267454==--

