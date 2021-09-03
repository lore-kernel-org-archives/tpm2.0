Content-Type: multipart/mixed; boundary="===============3035679859303966726=="
MIME-Version: 1.0
From: Andy Purcell <andy_purcell at keysight.com>
Subject: [tpm2] NXP i.MX8X security co-processor? 
Date: Fri, 03 Sep 2021 17:00:36 +0000
Message-ID: <
 <SA1PR17MB54320CDCC7FB67A6516DCC059FCF9@SA1PR17MB5432.namprd17.prod.outlook.com>>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3035679859303966726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

This is my first email to this tpm2 group and hope this is the right forum.

I am investigating the security capabilities of NXP arm i.MX8X processor.
This arm processor has a "security co-processor" but not an actual hardware=
 TPM.

I must determine if this chip, coupled with existing software (or minimal n=
ew software), can provide a software layer that functions like a real hardw=
are TPM 2.0.

The implementation must
1.      Create a pair of asymmetric crypto keys (private, public)
a.      RSA 2048 bits (or better)
b.      Private key must exist in persisted secure storage - not visible, c=
an never be exported
2.      Be used to create an acceptable Certificate Signing Request suitabl=
e to send to a CA.
3.      Provide a unique TPM Serial Number
4.      Provide any necessary attestation
5.      Run on Linux O/S

Any advice/suggestions?

AP




--===============3035679859303966726==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+CjwhLS0gY29udmVydGVkIGZyb20gcnRmIC0t
Pgo8c3R5bGU+PCEtLSAuRW1haWxRdW90ZSB7IG1hcmdpbi1sZWZ0OiAxcHQ7IHBhZGRpbmctbGVm
dDogNHB0OyBib3JkZXItbGVmdDogIzgwMDAwMCAycHggc29saWQ7IH0gLS0+PC9zdHlsZT4KPC9o
ZWFkPgo8Ym9keT4KPGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMXB0OyI+CjxkaXY+SGVsbG8sPC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+
VGhpcyBpcyBteSBmaXJzdCBlbWFpbCB0byB0aGlzIHRwbTIgZ3JvdXAgYW5kIGhvcGUgdGhpcyBp
cyB0aGUgcmlnaHQgZm9ydW0uIDwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PkkgYW0gaW52
ZXN0aWdhdGluZyB0aGUgc2VjdXJpdHkgY2FwYWJpbGl0aWVzIG9mIE5YUCBhcm0gaS5NWDhYIHBy
b2Nlc3Nvci4gPC9kaXY+CjxkaXY+VGhpcyBhcm0gcHJvY2Vzc29yIGhhcyBhICYjODIyMDtzZWN1
cml0eSBjby1wcm9jZXNzb3ImIzgyMjE7IGJ1dCBub3QgYW4gYWN0dWFsIGhhcmR3YXJlIFRQTS4g
PC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+SSBtdXN0IGRldGVybWluZSBpZiB0aGlzIGNo
aXAsIGNvdXBsZWQgd2l0aCBleGlzdGluZyBzb2Z0d2FyZSAob3IgbWluaW1hbCBuZXcgc29mdHdh
cmUpLCBjYW4gcHJvdmlkZSBhIHNvZnR3YXJlIGxheWVyIHRoYXQgZnVuY3Rpb25zIGxpa2UgYSBy
ZWFsIGhhcmR3YXJlIFRQTSAyLjAuIDwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PlRoZSBp
bXBsZW1lbnRhdGlvbiBtdXN0IDwvZGl2Pgo8b2wgc3R5bGU9Im1hcmdpbjowO3BhZGRpbmctbGVm
dDozNnB0O2xpc3Qtc3R5bGUtdHlwZTpkZWNpbWFsOyI+CjxsaT5DcmVhdGUgYSBwYWlyIG9mIGFz
eW1tZXRyaWMgY3J5cHRvIGtleXMgKHByaXZhdGUsIHB1YmxpYyk8L2xpPjwvb2w+CjxvbCBzdHls
ZT0ibWFyZ2luOjA7cGFkZGluZy1sZWZ0OjcycHQ7bGlzdC1zdHlsZS10eXBlOmxvd2VyLWFscGhh
OyI+CjxsaT5SU0EgMjA0OCBiaXRzIChvciBiZXR0ZXIpPC9saT48bGk+UHJpdmF0ZSBrZXkgbXVz
dCBleGlzdCBpbiBwZXJzaXN0ZWQgc2VjdXJlIHN0b3JhZ2UgJiM4MjExOyBub3QgdmlzaWJsZSwg
Y2FuIG5ldmVyIGJlIGV4cG9ydGVkIDwvbGk+PC9vbD4KPG9sIHN0YXJ0PSIyIiBzdHlsZT0ibWFy
Z2luOjA7cGFkZGluZy1sZWZ0OjM2cHQ7bGlzdC1zdHlsZS10eXBlOmRlY2ltYWw7Ij4KPGxpPkJl
IHVzZWQgdG8gY3JlYXRlIGFuIGFjY2VwdGFibGUgQ2VydGlmaWNhdGUgU2lnbmluZyBSZXF1ZXN0
IHN1aXRhYmxlIHRvIHNlbmQgdG8gYSBDQS4gPC9saT48bGk+UHJvdmlkZSBhIHVuaXF1ZSBUUE0g
U2VyaWFsIE51bWJlciA8L2xpPjxsaT5Qcm92aWRlIGFueSBuZWNlc3NhcnkgYXR0ZXN0YXRpb248
L2xpPjxsaT5SdW4gb24gTGludXggTy9TIDwvbGk+PC9vbD4KPGRpdj4mbmJzcDs8L2Rpdj4KPGRp
dj5BbnkgYWR2aWNlL3N1Z2dlc3Rpb25zPyA8L2Rpdj4KPGRpdj4mbmJzcDs8L2Rpdj4KPGRpdj5B
UDwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PiZuYnNwOzwv
ZGl2Pgo8L3NwYW4+PC9mb250Pgo8L2JvZHk+CjwvaHRtbD4K

--===============3035679859303966726==--

