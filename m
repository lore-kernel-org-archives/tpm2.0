Content-Type: multipart/mixed; boundary="===============9170425848096712974=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Are there any help documents/sites on writing an ESAPI program.
Date: Wed, 29 Apr 2020 17:51:14 -0700
Message-ID: <CAOCvsSkU7cMsp9OmRHt0kA0aGZA9zu0nDtkgrG_JGE=soW457g@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9170425848096712974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I need to perform a command that doesn't have a tools executable yet
(TPM2_ECDH_ZGen) and on a persistent object handle that won't be compatible
with the on-disk key-databases of FAPI or PKCS#11.  So that means I need to
write my own code in C, and that code needs to use the ESAPI.

I've had a lot of lead time to see this coming so I've done a few little
experiments.  They have not improved my confidence in my understanding of
the API.  For example I'm still not sure which structures I'm supposed to
access directly and which ones are supposed to be manipulated using
functions.

The Specs are either long and theoretical or dry and terse.  And both the
tests for TSS and the source files for Tools make use of internal
abstraction layers.  I'm having trouble getting a whole-process
picture.  Are there any resources out there to help me get my sea-legs on
ESAPI code?

--===============9170425848096712974==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SSBuZWVkIHRvIHBlcmZvcm0gYSBjb21tYW5kIHRoYXQgZG9lc24mIzM5
O3QgaGF2ZSBhIHRvb2xzIGV4ZWN1dGFibGUgeWV0IChUUE0yX0VDREhfWkdlbikgYW5kIG9uIGEg
cGVyc2lzdGVudCBvYmplY3QgaGFuZGxlIHRoYXQgd29uJiMzOTt0IGJlIGNvbXBhdGlibGUgd2l0
aCB0aGUgb24tZGlzayBrZXktZGF0YWJhc2VzIG9mIEZBUEkgb3IgUEtDUyMxMS7CoCBTbyB0aGF0
IG1lYW5zIEkgbmVlZCB0byB3cml0ZSBteSBvd24gY29kZSBpbiBDLCBhbmQgdGhhdCBjb2RlIG5l
ZWRzIHRvIHVzZSB0aGUgRVNBUEkuPGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTt2ZSBoYWQgYSBs
b3Qgb2YgbGVhZCB0aW1lIHRvIHNlZSB0aGlzIGNvbWluZyBzbyBJJiMzOTt2ZSBkb25lIGEgZmV3
IGxpdHRsZSBleHBlcmltZW50cy7CoCBUaGV5IGhhdmUgbm90IGltcHJvdmVkIG15IGNvbmZpZGVu
Y2UgaW4gbXkgdW5kZXJzdGFuZGluZyBvZiB0aGUgQVBJLsKgIEZvciBleGFtcGxlIEkmIzM5O20g
c3RpbGwgbm90IHN1cmUgd2hpY2ggc3RydWN0dXJlcyBJJiMzOTttIHN1cHBvc2VkIHRvIGFjY2Vz
cyBkaXJlY3RseSBhbmQgd2hpY2ggb25lcyBhcmUgc3VwcG9zZWQgdG8gYmUgbWFuaXB1bGF0ZWQg
dXNpbmcgZnVuY3Rpb25zLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlIFNwZWNzIGFyZSBl
aXRoZXIgbG9uZyBhbmQgdGhlb3JldGljYWwgb3IgZHJ5IGFuZCB0ZXJzZS7CoCBBbmQgYm90aCB0
aGUgdGVzdHMgZm9yIFRTUyBhbmQgdGhlIHNvdXJjZSBmaWxlcyBmb3IgVG9vbHMgbWFrZSB1c2Ug
b2YgaW50ZXJuYWwgYWJzdHJhY3Rpb24gbGF5ZXJzLsKgIEkmIzM5O20gaGF2aW5nIHRyb3VibGUg
Z2V0dGluZyBhIHdob2xlLXByb2Nlc3MgcGljdHVyZS7CoMKgQXJlIHRoZXJlIGFueSByZXNvdXJj
ZXMgb3V0IHRoZXJlIHRvIGhlbHAgbWUgZ2V0IG15IHNlYS1sZWdzIG9uIEVTQVBJIGNvZGU/wqAg
PC9kaXY+PC9kaXY+Cg==

--===============9170425848096712974==--

