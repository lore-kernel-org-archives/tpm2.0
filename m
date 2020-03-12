Content-Type: multipart/mixed; boundary="===============3373803928463289974=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: [tpm2] [Release] tpm2-tools v4.2-RC0
Date: Thu, 12 Mar 2020 17:20:53 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FFB0782D8D@fmsmsx117.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3373803928463289974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

tpm2-tools release candidate version 4.2-RC0 is published at https://github=
.com/tpm2-software/tpm2-tools/releases/tag/4.2-RC0.

Please provide your feedback for this release candidate.

Changelog/ Updates:

# 4.2-RC0 - 2020-03-12

 * tpm2_createek: Drop the unused -p or --ek-auth option

 * tpm2_policyor: List of policy files should be specified as an argument
   instead of -l option. The -l option is still retained for backwards
   compatibility. See issue#1894.

 * tpm2\_eventlog: add a tool for parsing and displaying the event log.

 * tpm2_createek: Fix an issue where the `template` option looked for args

 * tpm2_hierarchycontrol: Fixed bug where tool operation failed silently

 * tpm2_nvdefine: Fixed an issue where text output suggested failures as pa=
sses

 * tpm2_certify: Add an example usage in man page

 * tpm2_policyor: Fix a bug where tool failed silently when no input were g=
iven

 * tpm2_getekcertificate: Intel (R) PTT EK cert web portal is set as defaul=
t address

 * tpm2_alg_util.c: Fix a bug where string rsa3072 was not parsed

 * .ci/download-deps.sh: Change tss dependency to 2.4.0 to acquire SAPI han=
dles for cpHash calculations

 * tpm2_policycphash: Add a tool to implement enhanced authorization with c=
pHash of a command

 * Add option to tools to enable cpHash outputs

 * tpm2_import: Fix an issue where the imported key always required to have=
 a policy

 * tpm2_policysecret: Fix an issue where authorization model was fixed to p=
assword only

 * Feature API (FAPI) tools added. These additional set of tools implement =
utilities
   using the FAPI which was added to the tpm2-tss v2.4.0:
   tss2_decrypt, tss2_encrypt, tss2_list, tss2_changeauth, tss2_delete,
   tss2_import, tss2_getinfo, tss2_createkey, tss2_createseal, tss2_exportk=
ey,
   tss2_getcertificate, tss2_getplatformcertificates, tss2_gettpmblobs,
   tss2_getappdata, tss2_setappdata, tss2_setcertificate, tss2_sign,
   tss2_verifysignature, tss2_verifyquote, tss2_createnv, tss2_nvextend,
   tss2_nvincrement, tss2_nvread, tss2_nvsetbits, tss2_nvwrite,
   tss2_getdescription, tss2_setdescription, tss2_pcrextend, tss2_quote,
   tss2_pcrread, tss2_authorizepolicy, tss2_exportpolicy, tss2_import,
   tss2_provision, tss2_getrandom, tss2_unseal, tss2_writeauthorizenv

 * tpm2_policycountertimer: Fix an issue where operandB array was reversed =
causing faulty comparisons.


Thanks and Regards,

Imran Desai

--===============3373803928463289974==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBkYXRhLWdyLWMt
cy1sb2FkZWQ9InRydWUiIGZwc3R5bGU9IjEiIG9jc2k9IjAiPgo8ZGl2IHN0eWxlPSJkaXJlY3Rp
b246IGx0cjtmb250LWZhbWlseTogVGFob21hO2NvbG9yOiAjMDAwMDAwO2ZvbnQtc2l6ZTogMTBw
dDsiPgo8ZGl2PkhlbGxvLDwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+dHBtMi10b29scyBy
ZWxlYXNlIGNhbmRpZGF0ZSB2ZXJzaW9uIDQuMi1SQzAgaXMgcHVibGlzaGVkIGF0Jm5ic3A7aHR0
cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9yZWxlYXNlcy90YWcvNC4y
LVJDMC48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlBsZWFzZSBwcm92aWRlIHlvdXIgZmVl
ZGJhY2sgZm9yIHRoaXMgcmVsZWFzZSBjYW5kaWRhdGUuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4K
PGRpdj5DaGFuZ2Vsb2cvIFVwZGF0ZXM6PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4KPGRp
dj4jIDQuMi1SQzAgLSAyMDIwLTAzLTEyPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4mbmJz
cDsqIHRwbTJfY3JlYXRlZWs6IERyb3AgdGhlIHVudXNlZCAtcCBvciAtLWVrLWF1dGggb3B0aW9u
PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4mbmJzcDsqIHRwbTJfcG9saWN5b3I6IExpc3Qg
b2YgcG9saWN5IGZpbGVzIHNob3VsZCBiZSBzcGVjaWZpZWQgYXMgYW4gYXJndW1lbnQ8L2Rpdj4K
PGRpdj4mbmJzcDsgJm5ic3A7aW5zdGVhZCBvZiAtbCBvcHRpb24uIFRoZSAtbCBvcHRpb24gaXMg
c3RpbGwgcmV0YWluZWQgZm9yIGJhY2t3YXJkczwvZGl2Pgo8ZGl2PiZuYnNwOyAmbmJzcDtjb21w
YXRpYmlsaXR5LiBTZWUgaXNzdWUjMTg5NC48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PiZu
YnNwOyogdHBtMlxfZXZlbnRsb2c6IGFkZCBhIHRvb2wgZm9yIHBhcnNpbmcgYW5kIGRpc3BsYXlp
bmcgdGhlIGV2ZW50IGxvZy48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PiZuYnNwOyogdHBt
Ml9jcmVhdGVlazogRml4IGFuIGlzc3VlIHdoZXJlIHRoZSBgdGVtcGxhdGVgIG9wdGlvbiBsb29r
ZWQgZm9yIGFyZ3M8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PiZuYnNwOyogdHBtMl9oaWVy
YXJjaHljb250cm9sOiBGaXhlZCBidWcgd2hlcmUgdG9vbCBvcGVyYXRpb24gZmFpbGVkIHNpbGVu
dGx5PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4mbmJzcDsqIHRwbTJfbnZkZWZpbmU6IEZp
eGVkIGFuIGlzc3VlIHdoZXJlIHRleHQgb3V0cHV0IHN1Z2dlc3RlZCBmYWlsdXJlcyBhcyBwYXNz
ZXM8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PiZuYnNwOyogdHBtMl9jZXJ0aWZ5OiBBZGQg
YW4gZXhhbXBsZSB1c2FnZSBpbiBtYW4gcGFnZTwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+
Jm5ic3A7KiB0cG0yX3BvbGljeW9yOiBGaXggYSBidWcgd2hlcmUgdG9vbCBmYWlsZWQgc2lsZW50
bHkgd2hlbiBubyBpbnB1dCB3ZXJlIGdpdmVuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4m
bmJzcDsqIHRwbTJfZ2V0ZWtjZXJ0aWZpY2F0ZTogSW50ZWwgKFIpIFBUVCBFSyBjZXJ0IHdlYiBw
b3J0YWwgaXMgc2V0IGFzIGRlZmF1bHQgYWRkcmVzczwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+Cjxk
aXY+Jm5ic3A7KiB0cG0yX2FsZ191dGlsLmM6IEZpeCBhIGJ1ZyB3aGVyZSBzdHJpbmcgcnNhMzA3
MiB3YXMgbm90IHBhcnNlZDwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+Jm5ic3A7KiAuY2kv
ZG93bmxvYWQtZGVwcy5zaDogQ2hhbmdlIHRzcyBkZXBlbmRlbmN5IHRvIDIuNC4wIHRvIGFjcXVp
cmUgU0FQSSBoYW5kbGVzIGZvciBjcEhhc2ggY2FsY3VsYXRpb25zPC9kaXY+CjxkaXY+PGJyPgo8
L2Rpdj4KPGRpdj4mbmJzcDsqIHRwbTJfcG9saWN5Y3BoYXNoOiBBZGQgYSB0b29sIHRvIGltcGxl
bWVudCBlbmhhbmNlZCBhdXRob3JpemF0aW9uIHdpdGggY3BIYXNoIG9mIGEgY29tbWFuZDwvZGl2
Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+Jm5ic3A7KiBBZGQgb3B0aW9uIHRvIHRvb2xzIHRvIGVu
YWJsZSBjcEhhc2ggb3V0cHV0czwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+Jm5ic3A7KiB0
cG0yX2ltcG9ydDogRml4IGFuIGlzc3VlIHdoZXJlIHRoZSBpbXBvcnRlZCBrZXkgYWx3YXlzIHJl
cXVpcmVkIHRvIGhhdmUgYSBwb2xpY3k8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PiZuYnNw
OyogdHBtMl9wb2xpY3lzZWNyZXQ6IEZpeCBhbiBpc3N1ZSB3aGVyZSBhdXRob3JpemF0aW9uIG1v
ZGVsIHdhcyBmaXhlZCB0byBwYXNzd29yZCBvbmx5PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRp
dj4mbmJzcDsqIEZlYXR1cmUgQVBJIChGQVBJKSB0b29scyBhZGRlZC4gVGhlc2UgYWRkaXRpb25h
bCBzZXQgb2YgdG9vbHMgaW1wbGVtZW50IHV0aWxpdGllczwvZGl2Pgo8ZGl2PiZuYnNwOyAmbmJz
cDt1c2luZyB0aGUgRkFQSSB3aGljaCB3YXMgYWRkZWQgdG8gdGhlIHRwbTItdHNzIHYyLjQuMDo8
L2Rpdj4KPGRpdj4mbmJzcDsgJm5ic3A7dHNzMl9kZWNyeXB0LCB0c3MyX2VuY3J5cHQsIHRzczJf
bGlzdCwgdHNzMl9jaGFuZ2VhdXRoLCB0c3MyX2RlbGV0ZSw8L2Rpdj4KPGRpdj4mbmJzcDsgJm5i
c3A7dHNzMl9pbXBvcnQsIHRzczJfZ2V0aW5mbywgdHNzMl9jcmVhdGVrZXksIHRzczJfY3JlYXRl
c2VhbCwgdHNzMl9leHBvcnRrZXksPC9kaXY+CjxkaXY+Jm5ic3A7ICZuYnNwO3RzczJfZ2V0Y2Vy
dGlmaWNhdGUsIHRzczJfZ2V0cGxhdGZvcm1jZXJ0aWZpY2F0ZXMsIHRzczJfZ2V0dHBtYmxvYnMs
PC9kaXY+CjxkaXY+Jm5ic3A7ICZuYnNwO3RzczJfZ2V0YXBwZGF0YSwgdHNzMl9zZXRhcHBkYXRh
LCB0c3MyX3NldGNlcnRpZmljYXRlLCB0c3MyX3NpZ24sPC9kaXY+CjxkaXY+Jm5ic3A7ICZuYnNw
O3RzczJfdmVyaWZ5c2lnbmF0dXJlLCB0c3MyX3ZlcmlmeXF1b3RlLCB0c3MyX2NyZWF0ZW52LCB0
c3MyX252ZXh0ZW5kLDwvZGl2Pgo8ZGl2PiZuYnNwOyAmbmJzcDt0c3MyX252aW5jcmVtZW50LCB0
c3MyX252cmVhZCwgdHNzMl9udnNldGJpdHMsIHRzczJfbnZ3cml0ZSw8L2Rpdj4KPGRpdj4mbmJz
cDsgJm5ic3A7dHNzMl9nZXRkZXNjcmlwdGlvbiwgdHNzMl9zZXRkZXNjcmlwdGlvbiwgdHNzMl9w
Y3JleHRlbmQsIHRzczJfcXVvdGUsPC9kaXY+CjxkaXY+Jm5ic3A7ICZuYnNwO3RzczJfcGNycmVh
ZCwgdHNzMl9hdXRob3JpemVwb2xpY3ksIHRzczJfZXhwb3J0cG9saWN5LCB0c3MyX2ltcG9ydCw8
L2Rpdj4KPGRpdj4mbmJzcDsgJm5ic3A7dHNzMl9wcm92aXNpb24sIHRzczJfZ2V0cmFuZG9tLCB0
c3MyX3Vuc2VhbCwgdHNzMl93cml0ZWF1dGhvcml6ZW52PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4K
PGRpdj4mbmJzcDsqIHRwbTJfcG9saWN5Y291bnRlcnRpbWVyOiBGaXggYW4gaXNzdWUgd2hlcmUg
b3BlcmFuZEIgYXJyYXkgd2FzIHJldmVyc2VkIGNhdXNpbmcgZmF1bHR5IGNvbXBhcmlzb25zLjwv
ZGl2Pgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VGhhbmtz
IGFuZCBSZWdhcmRzLDwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SW1yYW4gRGVzYWk8L2Rp
dj4KPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============3373803928463289974==--

