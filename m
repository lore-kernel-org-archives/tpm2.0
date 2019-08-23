Content-Type: multipart/mixed; boundary="===============7180463693958671221=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Is the session encryption and bind key in
 tpm2_startauthsession 4.0 used to pass in salt?
Date: Fri, 23 Aug 2019 14:45:56 -0700
Message-ID: <CAOCvsSkT2f-TjZ+Jw1gBbt2TatVkTj8TaGFrVfYbtHPr4iNxMA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7180463693958671221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The -c,--keycontext parameter in the 4.0 rc version of
tpm2_startauthsession is documented as being the "session encryption and
bind key".  My application isn't using password auths anywhere so I don't
expect to get much useful entropy from a bound session.  Is this key being
used to pass in a random salt which would give me a usefully secure session
key?  I've already got everything working with an older pull from master
before the ESAPI integration but getting free bus encryption on sensitive
items would be a nice bonus for upgrading to release.

--===============7180463693958671221==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhlIC1jLC0ta2V5Y29udGV4dCBwYXJhbWV0ZXIgaW4gdGhlIDQuMCBy
YyB2ZXJzaW9uIG9mIHRwbTJfc3RhcnRhdXRoc2Vzc2lvbiBpcyBkb2N1bWVudGVkIGFzIGJlaW5n
IHRoZSAmcXVvdDtzZXNzaW9uIGVuY3J5cHRpb24gYW5kIGJpbmQga2V5JnF1b3Q7LsKgIE15IGFw
cGxpY2F0aW9uIGlzbiYjMzk7dCB1c2luZyBwYXNzd29yZCBhdXRocyBhbnl3aGVyZSBzbyBJIGRv
biYjMzk7dCBleHBlY3QgdG8gZ2V0IG11Y2ggdXNlZnVsIGVudHJvcHkgZnJvbSBhIGJvdW5kIHNl
c3Npb24uwqAgSXMgdGhpcyBrZXkgYmVpbmcgdXNlZCB0byBwYXNzIGluIGEgcmFuZG9tIHNhbHQg
d2hpY2ggd291bGQgZ2l2ZSBtZSBhIHVzZWZ1bGx5IHNlY3VyZSBzZXNzaW9uIGtleT/CoCBJJiMz
OTt2ZSBhbHJlYWR5IGdvdCBldmVyeXRoaW5nIHdvcmtpbmcgd2l0aCBhbiBvbGRlciBwdWxsIGZy
b20gbWFzdGVyIGJlZm9yZSB0aGUgRVNBUEkgaW50ZWdyYXRpb24gYnV0IGdldHRpbmcgZnJlZSBi
dXMgZW5jcnlwdGlvbiBvbiBzZW5zaXRpdmUgaXRlbXMgd291bGQgYmUgYSBuaWNlIGJvbnVzIGZv
ciB1cGdyYWRpbmcgdG8gcmVsZWFzZS48L2Rpdj4K

--===============7180463693958671221==--

