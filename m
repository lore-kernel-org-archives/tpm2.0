Content-Type: multipart/mixed; boundary="===============6196180912486514956=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] [tpm2-abrmd] Resource manager reconnect.
Date: Fri, 08 Feb 2019 09:36:41 +0000
Message-ID: <CAKrSGQS3JLDvhMjnVO_-aMEkH4JQM4LWc=u4+G9wK9OtE2j-mw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6196180912486514956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Not sure if this is an known issue, so thought I would float it here first
before opening a github issue.

I observed the following when using tpm2-abrmd and the mssim (ibmtpm1119):

Preconditions:

running tpm_server
active tpm-abrmd service

If you now kill / restart the tpm_server, the tpm-abrmd service fails,
unless its also restarted. Let me demonstrate:

[root(a)3896227cc7ee ~]# tpm_server &
[root(a)3896227cc7ee ~]# systemctl start tpm2-abrmd
[root(a)3896227cc7ee ~]# tpm2_pcrlist
sha1:
  0 : 0x0000000000000000000000000000000000000003
  1 : 0x0000000000000000000000000000000000000000
<snip>

All good, lets kill and start the tpm_server again, while leaving the
tpm2-abrmd service running:

[root(a)3896227cc7ee ~]# pkill tpm_server
[root(a)3896227cc7ee ~]# tpm_server &
[root(a)3896227cc7ee ~]# tpm2_pcrlist
ERROR: Tss2_Sys_GetCapability(0xA000A) - tcti:IO failure
ERROR: Unable to run tpm2_pcrlist

So let's restart the service as well:

[root(a)3896227cc7ee ~]# systemctl restart tpm2-abrmd
[root(a)3896227cc7ee ~]# tpm2_pcrlist
sha1:
  0 : 0x0000000000000000000000000000000000000003
  1 : 0x0000000000000000000000000000000000000000

I guess this may be a limitation / known issue when tpm2-abrmd is used with
a swtpm. If so, nothing to see here. If not, let me know and I am happy to
raise a GH issue.

This occurred with tpm2-abrmd compiled from master.

[root(a)b1c314f19b0c tpm2-abrmd]# git rev-parse HEAD
642ca16ad1a0b2d77c8bf7e6bbed4bf4600f1ed0

Regards,

Luke

--===============6196180912486514956==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGVsbG8sPGRp
dj48YnI+PC9kaXY+PGRpdj5Ob3Qgc3VyZSBpZiB0aGlzIGlzIGFuIGtub3duIGlzc3VlLCBzbyB0
aG91Z2h0IEkgd291bGQgZmxvYXQgaXQgaGVyZSBmaXJzdCBiZWZvcmUgb3BlbmluZyBhIGdpdGh1
YiBpc3N1ZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+SSBvYnNlcnZlZCB0aGUgZm9s
bG93aW5nIHdoZW4gdXNpbmcgdHBtMi1hYnJtZCBhbmQgdGhlIG1zc2ltICg8c3BhbiBzdHlsZT0i
Y29sb3I6cmdiKDAsMCwwKSI+aWJtdHBtMTExOSk8L3NwYW4+OjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+UHJlY29uZGl0aW9uczo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnJ1bm5pbmcgdHBt
X3NlcnZlcjwvZGl2PjxkaXY+YWN0aXZlIHRwbS1hYnJtZCBzZXJ2aWNlPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5JZiB5b3Ugbm93IGtpbGwgLyByZXN0YXJ0IHRoZSB0cG1fc2VydmVyLCB0aGUg
dHBtLWFicm1kIHNlcnZpY2UgZmFpbHMsIHVubGVzcyBpdHMgYWxzbyByZXN0YXJ0ZWQuIExldCBt
ZSBkZW1vbnN0cmF0ZTo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+W3Jvb3RAMzg5NjIy
N2NjN2VlwqB+XSMgdHBtX3NlcnZlciAmYW1wOzwvZGl2PjwvZGl2PjxkaXY+W3Jvb3RAMzg5NjIy
N2NjN2VlIH5dIyBzeXN0ZW1jdGwgc3RhcnQgdHBtMi1hYnJtZDwvZGl2PjxkaXY+W3Jvb3RAMzg5
NjIyN2NjN2VlIH5dIyB0cG0yX3Bjcmxpc3TCoDwvZGl2PjxkaXY+c2hhMTo8L2Rpdj48ZGl2PsKg
IDAgOiAweDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDM8L2Rpdj48ZGl2
PsKgIDEgOiAweDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA8L2Rpdj48
ZGl2PiZsdDtzbmlwJmd0OzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QWxsIGdvb2QsIGxldHMg
a2lsbCBhbmQgc3RhcnQgdGhlIHRwbV9zZXJ2ZXIgYWdhaW4sIHdoaWxlIGxlYXZpbmcgdGhlIHRw
bTItYWJybWQgc2VydmljZSBydW5uaW5nOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+W3Jvb3RA
Mzg5NjIyN2NjN2VlIH5dIyBwa2lsbCB0cG1fc2VydmVyPC9kaXY+PGRpdj5bcm9vdEAzODk2MjI3
Y2M3ZWUgfl0jIHRwbV9zZXJ2ZXIgJmFtcDs8L2Rpdj48ZGl2Pltyb290QDM4OTYyMjdjYzdlZSB+
XSMgdHBtMl9wY3JsaXN0wqA8L2Rpdj48ZGl2PkVSUk9SOiBUc3MyX1N5c19HZXRDYXBhYmlsaXR5
KDB4QTAwMEEpIC0gdGN0aTpJTyBmYWlsdXJlPC9kaXY+PGRpdj5FUlJPUjogVW5hYmxlIHRvIHJ1
biB0cG0yX3Bjcmxpc3Q8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlNvIGxldCYjMzk7cyByZXN0
YXJ0IHRoZSBzZXJ2aWNlIGFzIHdlbGw6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5bcm9vdEAz
ODk2MjI3Y2M3ZWUgfl0jIHN5c3RlbWN0bCByZXN0YXJ0IHRwbTItYWJybWQ8L2Rpdj48ZGl2Plty
b290QDM4OTYyMjdjYzdlZSB+XSMgdHBtMl9wY3JsaXN0wqA8L2Rpdj48ZGl2PnNoYTE6PC9kaXY+
PGRpdj7CoCAwIDogMHgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAzPC9k
aXY+PGRpdj7CoCAxIDogMHgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGd1ZXNzIHRoaXMgbWF5IGJlIGEgbGlt
aXRhdGlvbiAvIGtub3duIGlzc3VlIHdoZW4gdHBtMi1hYnJtZCBpcyB1c2VkIHdpdGggYSBzd3Rw
bS4gSWYgc28sIG5vdGhpbmcgdG8gc2VlIGhlcmUuIElmIG5vdCwgbGV0IG1lIGtub3cgYW5kIEkg
YW0gaGFwcHkgdG8gcmFpc2UgYSBHSCBpc3N1ZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRo
aXMgb2NjdXJyZWQgd2l0aCB0cG0yLWFicm1kIGNvbXBpbGVkIGZyb20gbWFzdGVyLjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+PGRpdj5bcm9vdEBiMWMzMTRmMTliMGMgdHBtMi1hYnJtZF0jIGdp
dCByZXYtcGFyc2UgSEVBRDwvZGl2PjxkaXY+NjQyY2ExNmFkMWEwYjJkNzdjOGJmN2U2YmJlZDRi
ZjQ2MDBmMWVkMDwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+UmVnYXJkcyw8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2Pkx1a2U8L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rp
dj48L2Rpdj48L2Rpdj4K

--===============6196180912486514956==--

