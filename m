Content-Type: multipart/mixed; boundary="===============1457575388314563302=="
MIME-Version: 1.0
From: Chat Overlay Streaming <benzhu88899 at gmail.com>
Subject: [tpm2] Re: Help - invalid count value
Date: Fri, 09 Apr 2021 11:25:12 -0700
Message-ID: <CAGjyWPKSF683B63Hr_9ZZZyfz5fV=9CLSf-xMwJa+eG0MA4g5Q@mail.gmail.com>
In-Reply-To: CAGjyWPJcSuEo7ewLh-Mz5KXgSccWK7X52EpTSJGjFez1ozytFQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1457575388314563302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here is my test code:

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


echo tpm2 startup
tpm2_startup -c
check_return

echo Clear the Authorization value.
tpm2_clear
check_return

echo Create the local keystore folder
if [ ! -d  ${HOME}/.local/share/tpm2-tss/user/keystore ]; then
mkdir -p ${HOME}/.local/tpm2-tss/user/keystore
fi

echo Set the algothrims for the SRK hierarchy.
key_alg=3D"rsa2048:aes256ctr"
hash_alg=3D"sha256"
pswd=3D12345

echo Create the primary key object for SRK. This will take a while...
tpm2_createprimary -Q -G "${key_alg}" -g "${hash_alg}" -C o -c srk.ctx
check_return

echo Create an AES key object with CTR mode
tpm2_create -C srk.ctx -G aes256ctr -p ${pswd} -u aes256_key.pub -r
aes256_key.priv
check_return

echo Load it into TPM module memory
tpm2_load -Q -C srk.ctx -u aes256_key.pub -r aes256_key.priv -n
aes256ctr_key -c aes256_key.ctx
check_return

echo Erase/evict any key at 0x81010000 if there is
tpm2_evictcontrol -C o 0x81010000 > /dev/null 2>&1

echo Make the key persistent with handle 0x81010000
tpm2_evictcontrol -C o -c aes256_key.ctx 0x81010000
check_return

echo AES encryption and decryption test.
echo "test data" > test.data

echo Create an IV data file
iv_part1=3D`od -Ad -N8 -t u -i /dev/random | awk '{ print $2; exit }'`
iv_part2=3D`od -Ad -N8 -t u -i /dev/random | awk '{ print $2; exit }'`
iv=3D${iv_part1}${iv_part2}
iv=3D${iv:0:15}
echo ${iv} > iv.input
cat iv.input

pause

echo Encrypt the test data file with the persistent key handle
tpm2_encryptdecrypt -c 0x81010000 --iv=3Div.input:iv.output -p ${pswd} -o
enc_test.data test.data
check_return

echo Decrypt the encrypted test file with the persistent key handle
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

On Fri, Apr 9, 2021 at 11:11 AM Chat Overlay Streaming <
benzhu88899(a)gmail.com> wrote:

> Hi there,
> I tried to use the TPM2 AES256 / AES256CTR to encrypt a file. When I ran
> the following command, I got an error message in an infinite loop and had
> to reboot my machine.
>
> $ tpm2_encryptdecrypt -c 0x81010000 --iv=3Div.input:iv.output -p ${pswd} =
-o
> enc_test.data test.data
>
> The error message was
>    tpm tpm0 invalid count value ffffffff 1000
>    tpm tpm0 invalid count value ffffffff 1000
>    ...
>    tpm tpm0 invalid count value ffffffff 1000
>
> Digging the location where the error message comes from, I found it was in
> the tpm driver file: file tpm-interface.c
>
> static ssize_t *tpm_try_transmit*(struct tpm_chip *chip, void *buf,
> size_t bufsiz)
> {
> struct tpm_header *header =3D buf;
> ...
>
> *count =3D be32_to_cpu(header->length); // ---> count =3D ffffffff *
> ...
>
>
>
>
> *if (count > bufsiz) {   // ---> bufsiz =3D 1000    dev_err(&chip->dev,
>             "invalid count value %x %zx\n", count, bufsiz);     *return
> -E2BIG;
> * }*
> ....
> }
>
> My question is did someone meet the same problem? And how can I debug this
> problem?
> I double checked the tpm2-abrmd service. It was running okay.
>
> The builds for my test are:
> 1. rpi-kernel: 5.4.y
> 2. tpm2-tss: 3.0.x
> 3. tpm2-abrmd: 2.3.2
> 4. tpm2-tools: 4.2.X
> 5. tpm2-tss-engine: v1.1.x
>
> My test environments:
> RPI 3B & 4B
> AES in the TPM was enabled.
>
> Attached is my test script.
>
> Thanks a lot,
> Ben
>
>

--===============1457575388314563302==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGVyZSBpcyBteSB0ZXN0IGNvZGU6PGRpdj48YnI+PC9kaXY+PGRpdj4v
Ly8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj4jIS9iaW4vZW52IGJhc2g8YnI+PGJyPmZ1bmN0aW9uIHBhdXNlKCkgezxicj7CoCDCoHJlYWQg
LXMgLW4gMSAtcCAmcXVvdDtQcmVzcyBhbnkga2V5IHRvIGNvbnRpbnVlIC4uLiZxdW90Ozxicj7C
oCDCoGVjaG8gJnF1b3Q7JnF1b3Q7PGJyPn08YnI+PGJyPmZ1bmN0aW9uIGNoZWNrX3JldHVybigp
IHs8YnI+wqAgwqBpZiBbICQ/ICE9IDAgXTsgdGhlbjxicj7CoCDCoCDCoCBlY2hvIGZhaWxlZCB3
aXRoIHJldHVybiBjb2RlOiAkPzxicj7CoCDCoCDCoCBleGl0IDE8YnI+wqAgwqBmaTxicj59PGJy
Pjxicj48YnI+ZWNobyB0cG0yIHN0YXJ0dXA8YnI+dHBtMl9zdGFydHVwIC1jPGJyPmNoZWNrX3Jl
dHVybjxicj48YnI+ZWNobyBDbGVhciB0aGUgQXV0aG9yaXphdGlvbiB2YWx1ZS48YnI+dHBtMl9j
bGVhcjxicj5jaGVja19yZXR1cm48YnI+PGJyPmVjaG8gQ3JlYXRlIHRoZSBsb2NhbCBrZXlzdG9y
ZSBmb2xkZXI8YnI+aWYgWyAhIC1kIMKgJHtIT01FfS8ubG9jYWwvc2hhcmUvdHBtMi10c3MvdXNl
ci9rZXlzdG9yZSBdOyB0aGVuPGJyPglta2RpciAtcCAke0hPTUV9Ly5sb2NhbC90cG0yLXRzcy91
c2VyL2tleXN0b3JlPGJyPmZpPGJyPjxicj5lY2hvIFNldCB0aGUgYWxnb3RocmltcyBmb3IgdGhl
IFNSSyBoaWVyYXJjaHkuPGJyPmtleV9hbGc9JnF1b3Q7cnNhMjA0ODphZXMyNTZjdHImcXVvdDs8
YnI+aGFzaF9hbGc9JnF1b3Q7c2hhMjU2JnF1b3Q7PGJyPnBzd2Q9MTIzNDU8YnI+PGJyPmVjaG8g
Q3JlYXRlIHRoZSBwcmltYXJ5IGtleSBvYmplY3QgZm9yIFNSSy4gVGhpcyB3aWxsIHRha2UgYSB3
aGlsZS4uLjxicj50cG0yX2NyZWF0ZXByaW1hcnkgLVEgLUcgJnF1b3Q7JHtrZXlfYWxnfSZxdW90
OyAtZyAmcXVvdDske2hhc2hfYWxnfSZxdW90OyAtQyBvIC1jIHNyay5jdHg8YnI+Y2hlY2tfcmV0
dXJuPGJyPjxicj5lY2hvIENyZWF0ZSBhbiBBRVMga2V5IG9iamVjdCB3aXRoIENUUiBtb2RlPGJy
PnRwbTJfY3JlYXRlIC1DIHNyay5jdHggLUcgYWVzMjU2Y3RyIC1wICR7cHN3ZH0gLXUgYWVzMjU2
X2tleS5wdWIgLXIgYWVzMjU2X2tleS5wcml2PGJyPmNoZWNrX3JldHVybjxicj48YnI+ZWNobyBM
b2FkIGl0IGludG8gVFBNIG1vZHVsZSBtZW1vcnk8YnI+dHBtMl9sb2FkIC1RIC1DIHNyay5jdHgg
LXUgYWVzMjU2X2tleS5wdWIgLXIgYWVzMjU2X2tleS5wcml2IC1uIGFlczI1NmN0cl9rZXkgLWMg
YWVzMjU2X2tleS5jdHg8YnI+Y2hlY2tfcmV0dXJuPGJyPjxicj5lY2hvIEVyYXNlL2V2aWN0IGFu
eSBrZXkgYXQgMHg4MTAxMDAwMCBpZiB0aGVyZSBpczxicj50cG0yX2V2aWN0Y29udHJvbCAtQyBv
IDB4ODEwMTAwMDAgJmd0OyAvZGV2L251bGwgMiZndDsmYW1wOzE8YnI+PGJyPmVjaG8gTWFrZSB0
aGUga2V5IHBlcnNpc3RlbnQgd2l0aCBoYW5kbGUgMHg4MTAxMDAwMDxicj50cG0yX2V2aWN0Y29u
dHJvbCAtQyBvIC1jIGFlczI1Nl9rZXkuY3R4IDB4ODEwMTAwMDA8YnI+Y2hlY2tfcmV0dXJuPGJy
Pjxicj5lY2hvIEFFUyBlbmNyeXB0aW9uIGFuZCBkZWNyeXB0aW9uIHRlc3QuPGJyPmVjaG8gJnF1
b3Q7dGVzdCBkYXRhJnF1b3Q7ICZndDsgdGVzdC5kYXRhPGJyPjxicj5lY2hvIENyZWF0ZSBhbiBJ
ViBkYXRhIGZpbGU8YnI+aXZfcGFydDE9YG9kIC1BZCAtTjggLXQgdSAtaSAvZGV2L3JhbmRvbSB8
IGF3ayAmIzM5O3sgcHJpbnQgJDI7IGV4aXQgfSYjMzk7YDxicj5pdl9wYXJ0Mj1gb2QgLUFkIC1O
OCAtdCB1IC1pIC9kZXYvcmFuZG9tIHwgYXdrICYjMzk7eyBwcmludCAkMjsgZXhpdCB9JiMzOTtg
PGJyPml2PSR7aXZfcGFydDF9JHtpdl9wYXJ0Mn08YnI+aXY9JHtpdjowOjE1fTxicj5lY2hvICR7
aXZ9ICZndDsgaXYuaW5wdXQ8YnI+Y2F0IGl2LmlucHV0PGJyPjxicj5wYXVzZTxicj48YnI+ZWNo
byBFbmNyeXB0IHRoZSB0ZXN0IGRhdGEgZmlsZSB3aXRoIHRoZSBwZXJzaXN0ZW50IGtleSBoYW5k
bGU8YnI+dHBtMl9lbmNyeXB0ZGVjcnlwdCAtYyAweDgxMDEwMDAwIC0taXY9aXYuaW5wdXQ6aXYu
b3V0cHV0IC1wICR7cHN3ZH0gLW8gZW5jX3Rlc3QuZGF0YSB0ZXN0LmRhdGE8YnI+Y2hlY2tfcmV0
dXJuPGJyPjxicj5lY2hvIERlY3J5cHQgdGhlIGVuY3J5cHRlZCB0ZXN0IGZpbGUgd2l0aCB0aGUg
cGVyc2lzdGVudCBrZXkgaGFuZGxlPGJyPnRwbTJfZW5jcnlwdGRlY3J5cHQgLWQgLWMgMHg4MTAx
MDAwMCAtcCAke3Bzd2R9IC0taXYtaXYuaW5wdXQ6aXYub3V0cHV0IC1vIGRlY190ZXN0LmRhdGEg
ZW5jX3Rlc3QuZGF0YTxicj5jaGVja19yZXR1cm48YnI+PGJyPmRpZmYgZGVjX3Rlc3QuZGF0YSB0
ZXN0LmRhdGEgJmd0OyAvZGV2L251bGw8YnI+aWYgWyAkPyAhPSAwIF07IHRoZW48YnI+wqAgwqBl
Y2hvIHRwbTIgZW5jcnlwdC9kZWNyeXB0IHdpdGgga2V5IGhhbmRsZSBmYWlsZWQhPGJyPsKgIMKg
ZXhpdCAxPGJyPmZpPGJyPmVjaG88YnI+ZWNobyA9PT09PT09PT09PT09PT09PT1FPU49RD09PT09
PT09PT09PT09PT09PT09PTxicj5lY2hvPGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgQXBy
IDksIDIwMjEgYXQgMTE6MTEgQU0gQ2hhdCBPdmVybGF5IFN0cmVhbWluZyAmbHQ7PGEgaHJlZj0i
bWFpbHRvOmJlbnpodTg4ODk5QGdtYWlsLmNvbSI+YmVuemh1ODg4OTlAZ21haWwuY29tPC9hPiZn
dDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwy
MDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXY+PGRpdiBp
ZD0iZ21haWwtbV81NTQyMDk0NjUxNjQ2MDU5NDM5Z21haWwtbV8zMzgyODkyNTE3Nzc0MTI2MjQ0
Z21haWwtOnJvIj5IaSB0aGVyZSw8YnI+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdj5JIHRyaWVkIHRv
IHVzZSB0aGUgVFBNMiBBRVMyNTYgLyBBRVMyNTZDVFIgdG8gZW5jcnlwdCBhIGZpbGUuIFdoZW4g
SSByYW4gdGhlIGZvbGxvd2luZyBjb21tYW5kLCBJIGdvdCBhbiBlcnJvciBtZXNzYWdlIGluIGFu
IGluZmluaXRlIGxvb3AgYW5kIGhhZCB0byByZWJvb3QgbXkgbWFjaGluZS48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PiQgdHBtMl9lbmNyeXB0ZGVjcnlwdCAtYyAweDgxMDEwMDAwIC0taXY9aXYu
aW5wdXQ6aXYub3V0cHV0IC1wICR7cHN3ZH0gLW8gZW5jX3Rlc3QuZGF0YSB0ZXN0LmRhdGE8L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+VGhlIGVycm9yIG1lc3NhZ2Ugd2FzPC9kaXY+PGRp
dj7CoCDCoHRwbSB0cG0wIGludmFsaWQgY291bnQgdmFsdWUgZmZmZmZmZmYgMTAwMDwvZGl2Pjxk
aXY+wqAgwqB0cG0gdHBtMCBpbnZhbGlkIGNvdW50IHZhbHVlIGZmZmZmZmZmIDEwMDDCoDwvZGl2
PjxkaXY+wqAgwqAuLi48L2Rpdj48ZGl2PsKgIMKgdHBtIHRwbTAgaW52YWxpZCBjb3VudCB2YWx1
ZSBmZmZmZmZmZiAxMDAwPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5EaWdnaW5nIHRoZSBsb2Nh
dGlvbiB3aGVyZSB0aGUgZXJyb3IgbWVzc2FnZSBjb21lcyBmcm9tLCBJIGZvdW5kIGl0IHdhcyBp
biB0aGUgdHBtIGRyaXZlciBmaWxlOiBmaWxlIHRwbS1pbnRlcmZhY2UuYzwvZGl2Pjxicj5zdGF0
aWMgc3NpemVfdMKgPGI+dHBtX3RyeV90cmFuc21pdDwvYj4oc3RydWN0IHRwbV9jaGlwICpjaGlw
LCB2b2lkICpidWYsIHNpemVfdCBidWZzaXopPGJyPns8YnI+c3RydWN0IHRwbV9oZWFkZXIgKmhl
YWRlciA9IGJ1Zjs8YnI+Li4uPGJyPjxicj48Yj5jb3VudCA9IGJlMzJfdG9fY3B1KGhlYWRlci0m
Z3Q7bGVuZ3RoKTsgLy8gLS0tJmd0OyBjb3VudCA9IGZmZmZmZmZmwqA8L2I+wqA8ZGl2Pi4uLjxi
cj48L2Rpdj48ZGl2PjxkaXY+PGJyPjxiPmlmIChjb3VudCAmZ3Q7IGJ1ZnNpeikgeyDCoCAvLyAt
LS0mZ3Q7IGJ1ZnNpeiA9IDEwMDA8YnI+wqAgwqAgZGV2X2VycigmYW1wO2NoaXAtJmd0O2Rldiw8
YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7aW52YWxpZCBjb3VudCB2YWx1ZSAl
eCAlenhcbiZxdW90OywgY291bnQsIGJ1ZnNpeik7PGJyPsKgIMKgIMKgPC9iPnJldHVybiAtRTJC
SUc7PGJyPjxiPsKgfTwvYj48YnI+Li4uLjxicj59PC9kaXY+PC9kaXY+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj48ZGl2Pk15IHF1ZXN0aW9uIGlzIGRpZCBzb21lb25lIG1lZXQgdGhlIHNhbWUg
cHJvYmxlbT8gQW5kIGhvdyBjYW4gSSBkZWJ1ZyB0aGlzIHByb2JsZW0/PC9kaXY+PGRpdj48L2Rp
dj48ZGl2PjwvZGl2PjwvZGl2PjxkaXY+SSBkb3VibGUgY2hlY2tlZMKgdGhlIHRwbTItYWJybWQg
c2VydmljZS4gSXQgd2FzIHJ1bm5pbmcgb2theS48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5UaGUgYnVpbGRzIGZvciBteSB0ZXN0IGFyZTo8YnI+PC9kaXY+PGRpdj4xLiBycGkta2VybmVs
OiA1LjQueTwvZGl2PjxkaXY+Mi4gdHBtMi10c3M6IDMuMC54PC9kaXY+My4gdHBtMi1hYnJtZDog
Mi4zLjI8YnI+NC4gdHBtMi10b29sczogNC4yLlg8YnI+NS4gdHBtMi10c3MtZW5naW5lOiB2MS4x
Lng8ZGl2Pjxicj48L2Rpdj48ZGl2Pk15IHRlc3QgZW52aXJvbm1lbnRzOjwvZGl2PjxkaXY+UlBJ
IDNCICZhbXA7IDRCPC9kaXY+PGRpdj5BRVMgaW4gdGhlIFRQTSB3YXMgZW5hYmxlZC48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PkF0dGFjaGVkIGlzIG15IHRlc3Qgc2NyaXB0LjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+PGRpdj5UaGFua3MgYSBsb3QsPC9kaXY+PGRpdj5CZW48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============1457575388314563302==--

