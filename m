Content-Type: multipart/mixed; boundary="===============1595943491867117668=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE] tpm2-pkcs11 1.6.0
Date: Mon, 03 May 2021 18:57:25 +0000
Message-ID: <SN6PR11MB3437F7EBF3130901F71FAF9EB85B9@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1595943491867117668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce the release of tpm2-pcks11 version 1.6.0:
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.6.0

With the following CHANGELOG:

### 1.6.0 - 2021-05-03
  * Spelling and grammar fixes throughout the project.
  * tpm2_ptool: fix bug in verify commandlet where `--sopin` leads to local=
 variable referenced before assignment. See #624.
  * Docs: add a document describing SSH Hostkey configuration using tpm2-pk=
cs11.
  * Support changes in tpm2-tss-engine using TPM2_RH_OWNER instead of 0.
    * Since upstream commit tpm2-software/tpm2-tss-engine(a)06f57a3.
  * Fix endian issue in test_db.
  * Fix tpm2_ptool error messages when exceptions are raised during executi=
on of tpm2-tools commands.
  * Support CKA_DERIVE=3Dtrue which will support the newest pkcs11-tool EC =
template.
  * Fix requirement of having ESYS >=3D 2.4, see #632 for details.
  * Fix docs/INITIALIZING.md reference to `--pobj-pin`, should be `--hierar=
chy-auth`.
  * Fix missing libyaml dependency in documentation.
  * Fix bug in DB update logic where errors in handlers were ignored.
  * Fix NPD bug when ESAPI and FAPI return 0 tokens.
  * Add support for over TPM sized AES buffers.
  * Add support for mechanism CKM_AES_CBC_PAD.
  * Add support for mechanism CKM_AES_CTR.
  * Add support for RSA 3072 (3k) keys.
  * Remove usage of function Esys_TR_GetTpmHandle. FAPI Backend will no lon=
ger depend on ESAPI 2.4 or
    greater.
  * Add **Experimental** RSA 4096 support. **Use at your own risk**.

Thanks,
Bill



--===============1595943491867117668==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+IFAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fSA8L3N0
eWxlPgo8L2hlYWQ+Cjxib2R5IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENh
bGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPgpIZWxsbyw8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPgo8YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWls
eTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Ckkgd291bGQgbGlrZSB0byBhbm5vdW5jZSB0aGUgcmVs
ZWFzZSBvZiB0cG0yLXBja3MxMSB2ZXJzaW9uIDEuNi4wOjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+CjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNv
bS90cG0yLXNvZnR3YXJlL3RwbTItcGtjczExL3JlbGVhc2VzL3RhZy8xLjYuMCIgaWQ9IkxQbG5r
NzIyNzM2Ij5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXBrY3MxMS9yZWxl
YXNlcy90YWcvMS42LjA8L2E+PGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENh
bGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPgo8YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
Q2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBj
b2xvcjogcmdiKDAsIDAsIDApOyI+CldpdGggdGhlIGZvbGxvd2luZyBDSEFOR0VMT0c6PC9kaXY+
CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KPGJyPgo8L2Rp
dj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgojIyMgMS42
LjAgLSAyMDIxLTA1LTAzCjxkaXY+Jm5ic3A7ICogU3BlbGxpbmcgYW5kIGdyYW1tYXIgZml4ZXMg
dGhyb3VnaG91dCB0aGUgcHJvamVjdC48L2Rpdj4KPGRpdj4mbmJzcDsgKiB0cG0yX3B0b29sOiBm
aXggYnVnIGluIHZlcmlmeSBjb21tYW5kbGV0IHdoZXJlIGAtLXNvcGluYCBsZWFkcyB0byBsb2Nh
bCB2YXJpYWJsZSByZWZlcmVuY2VkIGJlZm9yZSBhc3NpZ25tZW50LiBTZWUgIzYyNC48L2Rpdj4K
PGRpdj4mbmJzcDsgKiBEb2NzOiBhZGQgYSBkb2N1bWVudCBkZXNjcmliaW5nIFNTSCBIb3N0a2V5
IGNvbmZpZ3VyYXRpb24gdXNpbmcgdHBtMi1wa2NzMTEuPC9kaXY+CjxkaXY+Jm5ic3A7ICogU3Vw
cG9ydCBjaGFuZ2VzIGluIHRwbTItdHNzLWVuZ2luZSB1c2luZyBUUE0yX1JIX09XTkVSIGluc3Rl
YWQgb2YgMC48L2Rpdj4KPGRpdj4mbmJzcDsgJm5ic3A7ICogU2luY2UgdXBzdHJlYW0gY29tbWl0
IHRwbTItc29mdHdhcmUvdHBtMi10c3MtZW5naW5lQDA2ZjU3YTMuPC9kaXY+CjxkaXY+Jm5ic3A7
ICogRml4IGVuZGlhbiBpc3N1ZSBpbiB0ZXN0X2RiLjwvZGl2Pgo8ZGl2PiZuYnNwOyAqIEZpeCB0
cG0yX3B0b29sIGVycm9yIG1lc3NhZ2VzIHdoZW4gZXhjZXB0aW9ucyBhcmUgcmFpc2VkIGR1cmlu
ZyBleGVjdXRpb24gb2YgdHBtMi10b29scyBjb21tYW5kcy48L2Rpdj4KPGRpdj4mbmJzcDsgKiBT
dXBwb3J0IENLQV9ERVJJVkU9dHJ1ZSB3aGljaCB3aWxsIHN1cHBvcnQgdGhlIG5ld2VzdCBwa2Nz
MTEtdG9vbCBFQyB0ZW1wbGF0ZS48L2Rpdj4KPGRpdj4mbmJzcDsgKiBGaXggcmVxdWlyZW1lbnQg
b2YgaGF2aW5nIEVTWVMgJmd0Oz0gMi40LCBzZWUgIzYzMiBmb3IgZGV0YWlscy48L2Rpdj4KPGRp
dj4mbmJzcDsgKiBGaXggZG9jcy9JTklUSUFMSVpJTkcubWQgcmVmZXJlbmNlIHRvIGAtLXBvYmot
cGluYCwgc2hvdWxkIGJlIGAtLWhpZXJhcmNoeS1hdXRoYC48L2Rpdj4KPGRpdj4mbmJzcDsgKiBG
aXggbWlzc2luZyBsaWJ5YW1sIGRlcGVuZGVuY3kgaW4gZG9jdW1lbnRhdGlvbi48L2Rpdj4KPGRp
dj4mbmJzcDsgKiBGaXggYnVnIGluIERCIHVwZGF0ZSBsb2dpYyB3aGVyZSBlcnJvcnMgaW4gaGFu
ZGxlcnMgd2VyZSBpZ25vcmVkLjwvZGl2Pgo8ZGl2PiZuYnNwOyAqIEZpeCBOUEQgYnVnIHdoZW4g
RVNBUEkgYW5kIEZBUEkgcmV0dXJuIDAgdG9rZW5zLjwvZGl2Pgo8ZGl2PiZuYnNwOyAqIEFkZCBz
dXBwb3J0IGZvciBvdmVyIFRQTSBzaXplZCBBRVMgYnVmZmVycy48L2Rpdj4KPGRpdj4mbmJzcDsg
KiBBZGQgc3VwcG9ydCBmb3IgbWVjaGFuaXNtIENLTV9BRVNfQ0JDX1BBRC48L2Rpdj4KPGRpdj4m
bmJzcDsgKiBBZGQgc3VwcG9ydCBmb3IgbWVjaGFuaXNtIENLTV9BRVNfQ1RSLjwvZGl2Pgo8ZGl2
PiZuYnNwOyAqIEFkZCBzdXBwb3J0IGZvciBSU0EgMzA3MiAoM2spIGtleXMuPC9kaXY+CjxkaXY+
Jm5ic3A7ICogUmVtb3ZlIHVzYWdlIG9mIGZ1bmN0aW9uIEVzeXNfVFJfR2V0VHBtSGFuZGxlLiBG
QVBJIEJhY2tlbmQgd2lsbCBubyBsb25nZXIgZGVwZW5kIG9uIEVTQVBJIDIuNCBvcjwvZGl2Pgo8
ZGl2PiZuYnNwOyAmbmJzcDsgZ3JlYXRlci48L2Rpdj4KJm5ic3A7ICogQWRkICoqRXhwZXJpbWVu
dGFsKiogUlNBIDQwOTYgc3VwcG9ydC4gKipVc2UgYXQgeW91ciBvd24gcmlzayoqLjxicj4KPGJy
PgpUaGFua3MsPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwg
SGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwg
MCk7Ij4KQmlsbDxicj4KPGJyPgo8YnI+CjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K

--===============1595943491867117668==--

