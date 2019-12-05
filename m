Content-Type: multipart/mixed; boundary="===============5073487138361892078=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Re: Check to see if signature is okay, then reboot
Date: Thu, 05 Dec 2019 18:14:25 +0000
Message-ID: <CALtZhhPDzuOtMY45JbacHpUe+4rribj5pOxE0rUBnS-R1Krs6A@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E4C232@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5073487138361892078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> But anyways, you can use nvram to store it,
> and then use the key externally with openssl
> or call tpm2_loadexternal again.


First I will try to load a keypair into the TMP2, such that the private
part is garbage but the public part is correct.

To achieve this, I will first try to zero out parts of the private key
before I load it in. I'm not sure if this will work. (It works with openssl
anyway).

--===============5073487138361892078==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigzNCwzNCwzNCk7Zm9udC1zaXplOjE0cHgiPiZndDsgQnV0
IGFueXdheXMsIHlvdSBjYW7CoDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDM0LDM0LDM0
KTtmb250LXNpemU6MTRweCI+dXNlIG52cmFtIHRvIHN0b3JlIGl0LDwvc3Bhbj48ZGl2PjxzcGFu
IHN0eWxlPSJjb2xvcjpyZ2IoMzQsMzQsMzQpO2ZvbnQtc2l6ZToxNHB4Ij4mZ3Q7IGFuZCB0aGVu
IHVzZSB0aGUga2V5IGV4dGVybmFsbHkgd2l0aCBvcGVuc3NsPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4gc3R5bGU9ImNvbG9yOnJnYigzNCwzNCwzNCk7Zm9udC1zaXplOjE0cHgiPiZndDsgb3IgY2Fs
bCB0cG0yX2xvYWRleHRlcm5hbCBhPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMzQsMzQs
MzQpO2ZvbnQtc2l6ZToxNHB4Ij5nYWluLjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJj
b2xvcjpyZ2IoMzQsMzQsMzQpO2ZvbnQtc2l6ZToxNHB4Ij48YnI+PC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigzNCwzNCwzNCk7Zm9udC1zaXplOjE0cHgiPjxicj48L3Nw
YW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDM0LDM0LDM0KTtmb250LXNpemU6
MTRweCI+Rmlyc3QgSSB3aWxsIHRyeSB0byBsb2FkIGEga2V5cGFpciBpbnRvIHRoZSBUTVAyLCBz
dWNoIHRoYXQgdGhlIHByaXZhdGUgcGFydCBpcyBnYXJiYWdlIGJ1dCB0aGUgcHVibGljIHBhcnQg
aXMgY29ycmVjdC48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDM0LDM0
LDM0KTtmb250LXNpemU6MTRweCI+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJj
b2xvcjpyZ2IoMzQsMzQsMzQpO2ZvbnQtc2l6ZToxNHB4Ij5UbyBhY2hpZXZlIHRoaXMsIEkgd2ls
bCBmaXJzdCB0cnkgdG8gemVybyBvdXQgcGFydHMgb2YgdGhlIHByaXZhdGUga2V5IGJlZm9yZSBJ
IGxvYWQgaXQgaW4uIEkmIzM5O20gbm90IHN1cmUgaWYgdGhpcyB3aWxsIHdvcmsuIChJdCB3b3Jr
cyB3aXRoIG9wZW5zc2wgYW55d2F5KS48L3NwYW4+PC9kaXY+Cg==

--===============5073487138361892078==--

