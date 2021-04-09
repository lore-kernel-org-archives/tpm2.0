Content-Type: multipart/mixed; boundary="===============8182982180421264816=="
MIME-Version: 1.0
From: Chat Overlay Streaming <benzhu88899 at gmail.com>
Subject: [tpm2] Help -- invalid count value
Date: Fri, 09 Apr 2021 11:38:41 -0700
Message-ID: <CAGjyWPKbhT_N7xqr0K6on77NOJXqxTDiMaQVVntnD=ApNGWr7w@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8182982180421264816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The following is my test code for my previous email about the 'invalid
count value' problem.
Thanks,
Ben

//////////////////////////////////

#!/bin/env bash

function pause() {
   read -s -n 1 -p "Press any key to continue ..."
   echo ""
}

function check_return() {
   if [ $? !=3D 0 ]; then
      echo failed with return code: $?
      exit 1
   fi
}

tpm2_startup -c
check_return

tpm2_clear
check_return

if [ ! -d  ${HOME}/.local/share/tpm2-tss/user/keystore ]; then
   mkdir -p ${HOME}/.local/tpm2-tss/user/keystore
fi

key_alg=3D"rsa2048:aes256ctr"
hash_alg=3D"sha256"
pswd=3D12345

tpm2_createprimary -Q -G "${key_alg}" -g "${hash_alg}" -C o -c srk.ctx
check_return

tpm2_create -C srk.ctx -G aes256ctr -p ${pswd} -u aes256_key.pub -r
aes256_key.priv
check_return

tpm2_load -Q -C srk.ctx -u aes256_key.pub -r aes256_key.priv -n
aes256ctr_key -c aes256_key.ctx
check_return

tpm2_evictcontrol -C o 0x81010000 > /dev/null 2>&1

tpm2_evictcontrol -C o -c aes256_key.ctx 0x81010000
check_return

echo "test data" > test.data

iv_part1=3D`od -Ad -N8 -t u -i /dev/random | awk '{ print $2; exit }'`
iv_part2=3D`od -Ad -N8 -t u -i /dev/random | awk '{ print $2; exit }'`
iv=3D${iv_part1}${iv_part2}
iv=3D${iv:0:15}
echo ${iv} > iv.input
cat iv.input

pause

tpm2_encryptdecrypt -c 0x81010000 --iv=3Div.input:iv.output -p ${pswd} -o
enc_test.data test.data
check_return

tpm2_encryptdecrypt -d -c 0x81010000 -p ${pswd} --iv-iv.input:iv.output -o
dec_test.data enc_test.data
check_return

diff dec_test.data test.data > /dev/null
if [ $? !=3D 0 ]; then
   echo tpm2 encrypt/decrypt with key handle failed!
   exit 1
fi
echo
echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DE=3DN=3DD=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
echo

--===============8182982180421264816==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhlIGZvbGxvd2luZyBpcyBteSB0ZXN0IGNvZGUgZm9yIG15IHByZXZp
b3VzIGVtYWlsIGFib3V0IHRoZSAmIzM5O2ludmFsaWQgY291bnQgdmFsdWUmIzM5OyBwcm9ibGVt
LjxkaXY+VGhhbmtzLDwvZGl2PjxkaXY+QmVuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4vLy8v
Ly8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4j
IS9iaW4vZW52IGJhc2g8YnI+PGJyPmZ1bmN0aW9uIHBhdXNlKCkgezxicj7CoCDCoHJlYWQgLXMg
LW4gMSAtcCAmcXVvdDtQcmVzcyBhbnkga2V5IHRvIGNvbnRpbnVlIC4uLiZxdW90Ozxicj7CoCDC
oGVjaG8gJnF1b3Q7JnF1b3Q7PGJyPn08YnI+PGJyPmZ1bmN0aW9uIGNoZWNrX3JldHVybigpIHs8
YnI+wqAgwqBpZiBbICQ/ICE9IDAgXTsgdGhlbjxicj7CoCDCoCDCoCBlY2hvIGZhaWxlZCB3aXRo
IHJldHVybiBjb2RlOiAkPzxicj7CoCDCoCDCoCBleGl0IDE8YnI+wqAgwqBmaTxicj59PGJyPjxi
cj50cG0yX3N0YXJ0dXAgLWM8YnI+Y2hlY2tfcmV0dXJuPGJyPjxicj50cG0yX2NsZWFyPGJyPmNo
ZWNrX3JldHVybjxicj48YnI+aWYgWyAhIC1kIMKgJHtIT01FfS8ubG9jYWwvc2hhcmUvdHBtMi10
c3MvdXNlci9rZXlzdG9yZSBdOyB0aGVuPGJyPsKgIMKgbWtkaXIgLXAgJHtIT01FfS8ubG9jYWwv
dHBtMi10c3MvdXNlci9rZXlzdG9yZTxicj5maTxicj48YnI+a2V5X2FsZz0mcXVvdDtyc2EyMDQ4
OmFlczI1NmN0ciZxdW90Ozxicj5oYXNoX2FsZz0mcXVvdDtzaGEyNTYmcXVvdDs8YnI+cHN3ZD0x
MjM0NTxicj48YnI+dHBtMl9jcmVhdGVwcmltYXJ5IC1RIC1HICZxdW90OyR7a2V5X2FsZ30mcXVv
dDsgLWcgJnF1b3Q7JHtoYXNoX2FsZ30mcXVvdDsgLUMgbyAtYyBzcmsuY3R4PGJyPmNoZWNrX3Jl
dHVybjxicj48YnI+dHBtMl9jcmVhdGUgLUMgc3JrLmN0eCAtRyBhZXMyNTZjdHIgLXAgJHtwc3dk
fSAtdSBhZXMyNTZfa2V5LnB1YiAtciBhZXMyNTZfa2V5LnByaXY8YnI+Y2hlY2tfcmV0dXJuPGJy
Pjxicj50cG0yX2xvYWQgLVEgLUMgc3JrLmN0eCAtdSBhZXMyNTZfa2V5LnB1YiAtciBhZXMyNTZf
a2V5LnByaXYgLW4gYWVzMjU2Y3RyX2tleSAtYyBhZXMyNTZfa2V5LmN0eDxicj5jaGVja19yZXR1
cm48YnI+PGJyPnRwbTJfZXZpY3Rjb250cm9sIC1DIG8gMHg4MTAxMDAwMCAmZ3Q7IC9kZXYvbnVs
bCAyJmd0OyZhbXA7MTxicj48YnI+dHBtMl9ldmljdGNvbnRyb2wgLUMgbyAtYyBhZXMyNTZfa2V5
LmN0eCAweDgxMDEwMDAwPGJyPmNoZWNrX3JldHVybjxicj48YnI+ZWNobyAmcXVvdDt0ZXN0IGRh
dGEmcXVvdDsgJmd0OyB0ZXN0LmRhdGE8YnI+PGJyPml2X3BhcnQxPWBvZCAtQWQgLU44IC10IHUg
LWkgL2Rldi9yYW5kb20gfCBhd2sgJiMzOTt7IHByaW50ICQyOyBleGl0IH0mIzM5O2A8YnI+aXZf
cGFydDI9YG9kIC1BZCAtTjggLXQgdSAtaSAvZGV2L3JhbmRvbSB8IGF3ayAmIzM5O3sgcHJpbnQg
JDI7IGV4aXQgfSYjMzk7YDxicj5pdj0ke2l2X3BhcnQxfSR7aXZfcGFydDJ9PGJyPml2PSR7aXY6
MDoxNX08YnI+ZWNobyAke2l2fSAmZ3Q7IGl2LmlucHV0PGJyPmNhdCBpdi5pbnB1dDxicj48YnI+
cGF1c2U8YnI+PGJyPjxzcGFuIGNsYXNzPSJnbWFpbC1pbSIgc3R5bGU9ImNvbG9yOnJnYig4MCww
LDgwKSI+dHBtMl9lbmNyeXB0ZGVjcnlwdCAtYyAweDgxMDEwMDAwIC0taXY9aXYuaW5wdXQ6aXYu
b3V0cHV0IC1wICR7cHN3ZH0gLW8gZW5jX3Rlc3QuZGF0YSB0ZXN0LmRhdGE8YnI+PC9zcGFuPmNo
ZWNrX3JldHVybjxicj48YnI+dHBtMl9lbmNyeXB0ZGVjcnlwdCAtZCAtYyAweDgxMDEwMDAwIC1w
ICR7cHN3ZH0gLS1pdi1pdi5pbnB1dDppdi5vdXRwdXQgLW8gZGVjX3Rlc3QuZGF0YSBlbmNfdGVz
dC5kYXRhPGJyPmNoZWNrX3JldHVybjxicj48YnI+ZGlmZiBkZWNfdGVzdC5kYXRhIHRlc3QuZGF0
YSAmZ3Q7IC9kZXYvbnVsbDxicj5pZiBbICQ/ICE9IDAgXTsgdGhlbjxicj7CoCDCoGVjaG8gdHBt
MiBlbmNyeXB0L2RlY3J5cHQgd2l0aCBrZXkgaGFuZGxlIGZhaWxlZCE8YnI+wqAgwqBleGl0IDE8
YnI+Zmk8YnI+ZWNobzxicj5lY2hvID09PT09PT09PT09PT09PT09PUU9Tj1EPT09PT09PT09PT09
PT09PT09PT09PGJyPmVjaG88ZGl2IGNsYXNzPSJnbWFpbC15ajZxbyBnbWFpbC1halUiIHN0eWxl
PSJvdXRsaW5lOm5vbmU7cGFkZGluZzoxMHB4IDBweDt3aWR0aDoyMnB4O21hcmdpbjoycHggMHB4
IDBweCI+PGJyIGNsYXNzPSJnbWFpbC1BcHBsZS1pbnRlcmNoYW5nZS1uZXdsaW5lIj48L2Rpdj48
L2Rpdj48L2Rpdj4K

--===============8182982180421264816==--

