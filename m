Content-Type: multipart/mixed; boundary="===============2728852650447973381=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: [tpm2] tpm2_nvwrite failing
Date: Tue, 13 Mar 2018 15:06:00 +0200
Message-ID: <CAAxBZJtjWDzxwfMTfikPqucRjaAxwZGMaz5Opb7mk=uM5bQQrQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2728852650447973381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Using 1.3-rc2 of tpm2_tools

We're seeing tpm2_nvwrite fail with policies, both in the nv.sh test file
and when run manually

Here's the script which basically follows nv.sh.  NB: the file /tmp/idfile
exists and contains data!

#!/bin/sh

NVRAM=3D0x1800005
HIERACHY=3D0x40000001
PCRS=3Dsha256:0,1,2,3
PCRVALUE=3D/tmp/pcrvalue
POLICY=3D/tmp/policy

echo "Releasing NVRAM - this might fail, but this is OK"
tpm2_nvrelease -x $NVRAM -a $HIERACHY

echo "Constructing policy"
tpm2_pcrlist -Q -L $PCRS -o $PCRVALUE
tpm2_createpolicy -P -L $PCRS -F $PCRVALUE -f $POLICY

echo "Defining area"
tpm2_nvdefine -x $NVRAM -a $HIERACHY -s 64  -L $POLICY -t
"policyread|policywrite"
#tpm2_nvdefine -x $NVRAM -a $HIERACHY -s 64 -t "policyread|policywrite"

echo "Writing ID"
cat /tmp/idfile | tpm2_nvwrite -x $NVRAM -a $HIERACHY -L $PCRS -F $PCRVALUE
#cat /tmp/idfile | tpm2_nvwrite -x $NVRAM -a $HIERACHY

echo "Reading ID - first attempt should fail if the policy works"
tpm2_nvread -x $NVRAM -a $HIERACHY
tpm2_nvread -x $NVRAM -a $HIERACHY -L $PCRS -F $PCRVALUE



Specifically:

15$tpm2_nvrelease -x 0x1800005 -a 0x40000001
16$tpm2_pcrlist -Q -L sha256:0,1,2,3 -o /tmp/pcrvalue
17$tpm2_createpolicy -P -L sha256:0,1,2,3 -F /tmp/pcrvalue -f /tmp/policy
18$tpm2_nvdefine -x 0x1800005 -a 0x40000001 -s 64 -L /tmp/policy -t
"policyread|policywrite"
19$tpm2_nvlist

0x1800005:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: policywrite|policyread
    value: 0x8000800
  size: 64
  authorization policy:
60DF98CF0931EE42B5372DBC49E7B1966559A62A159B12C90556240D37E2D938

20$echo -n "test" | tpm2_nvwrite -x 0x1800005 -a 0x40000001 -L
sha256:0,1,2,3 -F /tmp/pcrvalue
ERROR: Failed to write NV area at index 0x1800005 (25165829) offset 0x0.
Error:0x12f
21$cat /tmp/idfile | tpm2_nvwrite -x 0x1800005 -a 0x40000001 -L
sha256:0,1,2,3 -F /tmp/pcrvalue
ERROR: Failed to write NV area at index 0x1800005 (25165829) offset 0x0.
Error:0x12f
22$tpm2_rc_decode 0x12f
error layer
  hex: 0x0
  identifier: TSS2_TPM_ERROR_LEVEL
  description: Error produced by the TPM
format 0 error code
  hex: 0x2f
  name: TPM_RC_AUTH_UNAVAILABLE
  description: authValue or authPolicy is not available for selected entity.

t.

Ian


-- =

*Dr. Ian Oliver*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
*Twitter: @i_j_oliver*

--===============2728852650447973381==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGk8YnI+PGRpdj48YnI+VXNpbmcgMS4zLXJjMiBvZiB0cG0yX3Rvb2xz
PGJyPjxicj48L2Rpdj48ZGl2PldlJiMzOTtyZSBzZWVpbmcgdHBtMl9udndyaXRlIGZhaWwgd2l0
aCBwb2xpY2llcywgYm90aCBpbiB0aGUgbnYuc2ggdGVzdCBmaWxlIGFuZCB3aGVuIHJ1biBtYW51
YWxseTxicj48YnI+PC9kaXY+PGRpdj5IZXJlJiMzOTtzIHRoZSBzY3JpcHQgd2hpY2ggYmFzaWNh
bGx5IGZvbGxvd3MgbnYuc2guwqAgTkI6IHRoZSBmaWxlIC90bXAvaWRmaWxlIGV4aXN0cyBhbmQg
Y29udGFpbnMgZGF0YSE8YnI+PC9kaXY+PGRpdj48YnIgY2xlYXI9ImFsbCI+PC9kaXY+PGRpdj48
ZGl2PiMhL2Jpbi9zaDxicj48L2Rpdj48ZGl2Pjxicj5OVlJBTT0weDE4MDAwMDU8YnI+SElFUkFD
SFk9MHg0MDAwMDAwMTxicj5QQ1JTPXNoYTI1NjowLDEsMiwzPGJyPlBDUlZBTFVFPS90bXAvcGNy
dmFsdWU8YnI+UE9MSUNZPS90bXAvcG9saWN5PGJyPjxicj5lY2hvICZxdW90O1JlbGVhc2luZyBO
VlJBTSAtIHRoaXMgbWlnaHQgZmFpbCwgYnV0IHRoaXMgaXMgT0smcXVvdDs8YnI+dHBtMl9udnJl
bGVhc2UgLXggJE5WUkFNIC1hICRISUVSQUNIWTxicj48YnI+ZWNobyAmcXVvdDtDb25zdHJ1Y3Rp
bmcgcG9saWN5JnF1b3Q7PGJyPnRwbTJfcGNybGlzdCAtUSAtTCAkUENSUyAtbyAkUENSVkFMVUU8
YnI+dHBtMl9jcmVhdGVwb2xpY3kgLVAgLUwgJFBDUlMgLUYgJFBDUlZBTFVFIC1mICRQT0xJQ1k8
YnI+PGJyPmVjaG8gJnF1b3Q7RGVmaW5pbmcgYXJlYSZxdW90Ozxicj50cG0yX252ZGVmaW5lIC14
ICROVlJBTSAtYSAkSElFUkFDSFkgLXMgNjTCoCAtTCAkUE9MSUNZIC10ICZxdW90O3BvbGljeXJl
YWR8cG9saWN5d3JpdGUmcXVvdDs8YnI+I3RwbTJfbnZkZWZpbmUgLXggJE5WUkFNIC1hICRISUVS
QUNIWSAtcyA2NCAtdCAmcXVvdDtwb2xpY3lyZWFkfHBvbGljeXdyaXRlJnF1b3Q7PGJyPjxicj5l
Y2hvICZxdW90O1dyaXRpbmcgSUQmcXVvdDs8YnI+Y2F0IC90bXAvaWRmaWxlIHwgdHBtMl9udndy
aXRlIC14ICROVlJBTSAtYSAkSElFUkFDSFkgLUwgJFBDUlMgLUYgJFBDUlZBTFVFPGJyPiNjYXQg
L3RtcC9pZGZpbGUgfCB0cG0yX252d3JpdGUgLXggJE5WUkFNIC1hICRISUVSQUNIWTxicj48YnI+
ZWNobyAmcXVvdDtSZWFkaW5nIElEIC0gZmlyc3QgYXR0ZW1wdCBzaG91bGQgZmFpbCBpZiB0aGUg
cG9saWN5IHdvcmtzJnF1b3Q7PGJyPnRwbTJfbnZyZWFkIC14ICROVlJBTSAtYSAkSElFUkFDSFk8
YnI+dHBtMl9udnJlYWQgLXggJE5WUkFNIC1hICRISUVSQUNIWSAtTCAkUENSUyAtRiAkUENSVkFM
VUU8YnI+PGJyPjxicj48YnI+PC9kaXY+PGRpdj5TcGVjaWZpY2FsbHk6PGJyPjxicj4xNSR0cG0y
X252cmVsZWFzZSAteCAweDE4MDAwMDUgLWEgMHg0MDAwMDAwMTxicj4xNiR0cG0yX3Bjcmxpc3Qg
LVEgLUwgc2hhMjU2OjAsMSwyLDMgLW8gL3RtcC9wY3J2YWx1ZTxicj4xNyR0cG0yX2NyZWF0ZXBv
bGljeSAtUCAtTCBzaGEyNTY6MCwxLDIsMyAtRiAvdG1wL3BjcnZhbHVlIC1mIC90bXAvcG9saWN5
PGJyPjE4JHRwbTJfbnZkZWZpbmUgLXggMHgxODAwMDA1IC1hIDB4NDAwMDAwMDEgLXMgNjQgLUwg
L3RtcC9wb2xpY3kgLXQgJnF1b3Q7cG9saWN5cmVhZHxwb2xpY3l3cml0ZSZxdW90Ozxicj4xOSR0
cG0yX252bGlzdDxicj48YnI+MHgxODAwMDA1Ojxicj7CoCBoYXNoIGFsZ29yaXRobTo8YnI+wqDC
oMKgIGZyaWVuZGx5OiBzaGEyNTY8YnI+wqDCoMKgIHZhbHVlOiAweEI8YnI+wqAgYXR0cmlidXRl
czo8YnI+wqDCoMKgIGZyaWVuZGx5OiBwb2xpY3l3cml0ZXxwb2xpY3lyZWFkPGJyPsKgwqDCoCB2
YWx1ZTogMHg4MDAwODAwPGJyPsKgIHNpemU6IDY0PGJyPsKgIGF1dGhvcml6YXRpb24gcG9saWN5
OiA2MERGOThDRjA5MzFFRTQyQjUzNzJEQkM0OUU3QjE5NjY1NTlBNjJBMTU5QjEyQzkwNTU2MjQw
RDM3RTJEOTM4PGJyPjxicj4yMCRlY2hvIC1uICZxdW90O3Rlc3QmcXVvdDsgfCB0cG0yX252d3Jp
dGUgLXggMHgxODAwMDA1IC1hIDB4NDAwMDAwMDEgLUwgc2hhMjU2OjAsMSwyLDMgLUYgL3RtcC9w
Y3J2YWx1ZTxicj5FUlJPUjogRmFpbGVkIHRvIHdyaXRlIE5WIGFyZWEgYXQgaW5kZXggMHgxODAw
MDA1ICgyNTE2NTgyOSkgb2Zmc2V0IDB4MC4gRXJyb3I6MHgxMmY8YnI+MjEkY2F0IC90bXAvaWRm
aWxlIHwgdHBtMl9udndyaXRlIC14IDB4MTgwMDAwNSAtYSAweDQwMDAwMDAxIC1MIHNoYTI1Njow
LDEsMiwzIC1GIC90bXAvcGNydmFsdWU8YnI+RVJST1I6IEZhaWxlZCB0byB3cml0ZSBOViBhcmVh
IGF0IGluZGV4IDB4MTgwMDAwNSAoMjUxNjU4MjkpIG9mZnNldCAweDAuIEVycm9yOjB4MTJmPGJy
PjIyJHRwbTJfcmNfZGVjb2RlIDB4MTJmPGJyPmVycm9yIGxheWVyPGJyPsKgIGhleDogMHgwPGJy
PsKgIGlkZW50aWZpZXI6IFRTUzJfVFBNX0VSUk9SX0xFVkVMPGJyPsKgIGRlc2NyaXB0aW9uOiBF
cnJvciBwcm9kdWNlZCBieSB0aGUgVFBNPGJyPmZvcm1hdCAwIGVycm9yIGNvZGU8YnI+wqAgaGV4
OiAweDJmPGJyPsKgIG5hbWU6IFRQTV9SQ19BVVRIX1VOQVZBSUxBQkxFPGJyPsKgIGRlc2NyaXB0
aW9uOiBhdXRoVmFsdWUgb3IgYXV0aFBvbGljeSBpcyBub3QgYXZhaWxhYmxlIGZvciBzZWxlY3Rl
ZCBlbnRpdHkuPGJyPjxicj48L2Rpdj48ZGl2PnQuPGJyPjxicj48L2Rpdj48ZGl2Pklhbjxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj4tLSA8YnI+PGRpdiBjbGFzcz0iZ21haWxfc2ln
bmF0dXJlIj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9
Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTphcmlhbDtm
b250LXNpemU6c21hbGwiPjxiPkRyLiBJYW4gT2xpdmVyPC9iPjxicj49PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsO2Zv
bnQtc2l6ZTpzbWFsbCI+UHJpdmFjeSBFbmdpbmVlcmluZzrCoCA8Yj48L2I+PHNwYW4gc3R5bGU9
ImNvbG9yOnJnYigxNywxNywxNyk7Zm9udC1mYW1pbHk6QXJpYWwsc2Fucy1zZXJpZjtmb250LXNp
emU6MTNweDtsaW5lLWhlaWdodDoxOXB4Ij48YSBocmVmPSJodHRwOi8vd3d3LmFtYXpvbi5jby51
ay9kcC8xNDk3NTY5NzEwIiB0YXJnZXQ9Il9ibGFuayI+dmlhIEFtYXpvbjwvYT48L3NwYW4+PGI+
PGJyPlR3aXR0ZXI6IEBpX2pfb2xpdmVyPC9iPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2
PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo8L2Rpdj48L2Rpdj48L2Rpdj4K

--===============2728852650447973381==--

