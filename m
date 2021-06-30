Content-Type: multipart/mixed; boundary="===============2914203354081462526=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Re-provision TPM
Date: Wed, 30 Jun 2021 13:57:38 -0700
Message-ID: <CAOCvsSmHHJBW1ha4n2Yc7MCfA3nK9MNUkg1z8L7NqPkS8R1+yQ@mail.gmail.com>
In-Reply-To: VI1PR08MB265305DB5F9D4FD5F167DC1CB5019@VI1PR08MB2653.eurprd08.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2914203354081462526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Linux one of the absolute worst-case options to nuke a TPM and start
over is to use the sysfs PPI interface to the TPM:
Issue a clear request like:
echo 5 > /sys/class/tpm/tpm0/ppi/request
and reboot.  You then confirm that you really do want the BIOS to wipe the
TPM and it's done.  If something has set auths and you don't know what it
is, this a pretty decent last resort if you've got the support.

--===============2914203354081462526==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+T24gTGludXggb25lIG9mIHRoZSBhYnNvbHV0ZSB3b3JzdC1jYXNlIG9w
dGlvbnMgdG8gbnVrZSBhIFRQTSBhbmQgc3RhcnQgb3ZlciBpcyB0byB1c2UgdGhlIHN5c2ZzIFBQ
SSBpbnRlcmZhY2UgdG8gdGhlIFRQTTo8ZGl2Pklzc3VlIGEgY2xlYXIgcmVxdWVzdCBsaWtlOjxi
cj5lY2hvIDUgJmd0OyAvc3lzL2NsYXNzL3RwbS90cG0wL3BwaS9yZXF1ZXN0PGJyPmFuZCByZWJv
b3QuwqAgWW91IHRoZW4gY29uZmlybSB0aGF0IHlvdSByZWFsbHkgZG8gd2FudCB0aGUgQklPUyB0
byB3aXBlIHRoZSBUUE0gYW5kIGl0JiMzOTtzIGRvbmUuwqAgSWYgc29tZXRoaW5nIGhhcyBzZXQg
YXV0aHMgYW5kIHlvdcKgZG9uJiMzOTt0IGtub3cgd2hhdCBpdCBpcyzCoHRoaXMgYSBwcmV0dHkg
ZGVjZW50IGxhc3QgcmVzb3J0IGlmIHlvdSYjMzk7dmUgZ290IHRoZSBzdXBwb3J0LjwvZGl2Pjwv
ZGl2Pgo=

--===============2914203354081462526==--

