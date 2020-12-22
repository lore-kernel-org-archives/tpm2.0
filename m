Content-Type: multipart/mixed; boundary="===============0752761856713612472=="
MIME-Version: 1.0
From: Auriga7 <Auriga7 at protonmail.com>
Subject: [tpm2] Ensure the link between an unrestricted signing key and a TPM
Date: Tue, 22 Dec 2020 14:37:16 +0000
Message-ID: <1xY442AjNtSF-2-2Z0wAmaNt7Ls9WJ3wDa28g8RkC0rUzkOZ8-NKN2ElubfvSApUmifoBspVU4-w_R19ag9C-gOFinvFOipyKcf-wXt3mJU=@protonmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0752761856713612472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to know how i can certiffy that a non restricted signing key b=
elongs to a real TPM in the same way that an AIK key can guarantee it is fr=
om a TPM using EK and the EK certificate of the TPM. I've tried using the m=
akecredential and activatecredential commands of tpm2-tools on a non restri=
cted signing key created with the create command. However those commands se=
ems to only work for an AIK key created using createak command. How can I c=
reate a non restricted signing key and then ensure that this key is linked =
to real TPM using the tpm2-tools.

Thank you.

--===============0752761856713612472==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdj5IaSw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIHdvdWxkIGxpa2UgdG8ga25v
dyBob3cgaSBjYW4gY2VydGlmZnkgdGhhdCBhIG5vbiByZXN0cmljdGVkIHNpZ25pbmcga2V5IGJl
bG9uZ3MgdG8gYSByZWFsIFRQTSBpbiB0aGUgc2FtZSB3YXkgdGhhdCBhbiBBSUsga2V5IGNhbiBn
dWFyYW50ZWUgaXQgaXMgZnJvbSBhIFRQTSB1c2luZyBFSyBhbmQgdGhlIEVLIGNlcnRpZmljYXRl
IG9mIHRoZSBUUE0uIEkndmUgdHJpZWQgdXNpbmcgdGhlIG1ha2VjcmVkZW50aWFsIGFuZCBhY3Rp
dmF0ZWNyZWRlbnRpYWwgY29tbWFuZHMgb2YgdHBtMi10b29scyBvbiBhIG5vbiByZXN0cmljdGVk
IHNpZ25pbmcga2V5IGNyZWF0ZWQgd2l0aCB0aGUgY3JlYXRlIGNvbW1hbmQuIEhvd2V2ZXIgdGhv
c2UgY29tbWFuZHMgc2VlbXMgdG8gb25seSB3b3JrIGZvciBhbiBBSUsga2V5IGNyZWF0ZWQgdXNp
bmcgY3JlYXRlYWsgY29tbWFuZC4gSG93IGNhbiBJIGNyZWF0ZSBhIG5vbiByZXN0cmljdGVkIHNp
Z25pbmcga2V5IGFuZCB0aGVuIGVuc3VyZSB0aGF0IHRoaXMga2V5IGlzIGxpbmtlZCB0byByZWFs
IFRQTSB1c2luZyB0aGUgdHBtMi10b29scy48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5U
aGFuayB5b3UuPGJyPjwvZGl2Pg==
--===============0752761856713612472==--

