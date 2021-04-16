Content-Type: multipart/mixed; boundary="===============0278561704444623808=="
MIME-Version: 1.0
From: Chat Overlay Streaming <benzhu88899 at gmail.com>
Subject: [tpm2] Re: Help - invalid count value
Date: Thu, 15 Apr 2021 17:21:25 -0700
Message-ID: <CAGjyWPLVddC_9HbDwKfdoV9Hx8tLozjks=inry7V+rs8F3SO6w@mail.gmail.com>
In-Reply-To: SN6PR11MB34371D4F022BBA118A7D80C4B84E9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0278561704444623808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks William.
I checked them by running our proprietary tpm tool. Both were activated,
but I ran the command  - tpm2_getcap commands | grep EncryptDecrypt
both were empty. Any suggestions?

Thanks a lot,
Ben





On Wed, Apr 14, 2021 at 1:54 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> Tl;DR
> I investigated a bug report, and I can't find anything wrong in the user
> space side. Does anyone know of any issues or see
> anything wrong?
>
> Follow Up Questions for benzhu88899:
> Does your TPM support TPM2_EncryptDecrypt2 or the original command? You
> can look by running
>
> tpm2_getcap commands | grep EncryptDecrypt
> TPM2_CC_EncryptDecrypt:
> TPM2_CC_EncryptDecrypt2:
>
> Synopsis:
>
> Below is a script that was sent to reproduce a bug it. I don't have the
> exact environemnt, but I reproduced the user space components, but ran
> against an emulator (no kernel).
>
> I just had to tweak this line in the script, as the --iv option is wrong:
> tpm2_encryptdecrypt -d -c 0x81010000 -p ${pswd} --iv-iv.input:iv.output -o
> dec_test.data enc_test.data
>
> It needs an equal in between --iv and the argument.
> tpm2_encryptdecrypt -d -c 0x81010000 -p ${pswd} --iv=3Div.input:iv.output=
 -o
> dec_test.data enc_test.data
>
> Otherwise, then that, it ran and the diff seemed to be ok.
>
> Since that worked, I bumped my tss version forward (3.1.0-rc0) to have the
> pcap tcti for ease of digging into the bytes sent.
> I added an export TPM2TOOLS_TCTI=3Dpcap to the script right before the
> enc/dec calls so I had less things to wade through with wireshark.
>
> First EncryptDecrypt2 call (which I assume yours fails at, because the
> second command won't run due to iv option issue):
>
> 0000   80 02 00 00 00 7c 00 00 01 93 81 01 00 00 00 00
> 0010   00 49 02 00 00 00 00 20 b1 28 17 58 5b 03 28 6e
> 0020   a2 c6 0d 1e 16 01 a2 3b ac 7f 87 da 07 55 25 90
> 0030   08 e6 2a 9f 29 d1 32 40 01 00 20 95 85 0d c8 75
> 0040   f4 2a 40 f5 da a1 6e 64 5a 05 0a a4 f5 6a 83 9d
> 0050   de 94 2f 68 31 ca bb ab 4a 82 de 00 0a 74 65 73
> 0060   74 20 64 61 74 61 0a 00 00 40 00 10 33 33 34 32
> 0070   30 37 37 33 39 39 33 32 39 37 36 0a
>
> The structure the kernel defines is:
> struct tpm_header {
>
> 	__be16 tag;
> 	__be32 length;
> 	union {
> 		__be32 ordinal;
> 		__be32 return_code;
> 	};
> } __packed;
>
>
> So tag is: 80 02
> Length is: 00 00 00 7c (which is Big Endian decimal value 124)
>
> Peter has touched code in that area, perhaps Peter or someone else spots
> something I didnt?
>
>
> ------------------------------
> *From:* Chat Overlay Streaming <benzhu88899(a)gmail.com>
> *Sent:* Friday, April 9, 2021 1:25 PM
> *To:* tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> *Subject:* [tpm2] Re: Help - invalid count value
>
> Here is my test code:
>
> //////////////////////////////////
>
> #!/bin/env bash
>
> function pause() {
>    read -s -n 1 -p "Press any key to continue ..."
>    echo ""
> }
>
> function check_return() {
>    if [ $? !=3D 0 ]; then
>       echo failed with return code: $?
>       exit 1
>    fi
> }
>
>
> echo tpm2 startup
> tpm2_startup -c
> check_return
>
> echo Clear the Authorization value.
> tpm2_clear
> check_return
>
> echo Create the local keystore folder
> if [ ! -d  ${HOME}/.local/share/tpm2-tss/user/keystore ]; then
> mkdir -p ${HOME}/.local/tpm2-tss/user/keystore
> fi
>
> echo Set the algothrims for the SRK hierarchy.
> key_alg=3D"rsa2048:aes256ctr"
> hash_alg=3D"sha256"
> pswd=3D12345
>
> echo Create the primary key object for SRK. This will take a while...
> tpm2_createprimary -Q -G "${key_alg}" -g "${hash_alg}" -C o -c srk.ctx
> check_return
>
> echo Create an AES key object with CTR mode
> tpm2_create -C srk.ctx -G aes256ctr -p ${pswd} -u aes256_key.pub -r
> aes256_key.priv
> check_return
>
> echo Load it into TPM module memory
> tpm2_load -Q -C srk.ctx -u aes256_key.pub -r aes256_key.priv -n
> aes256ctr_key -c aes256_key.ctx
> check_return
>
> echo Erase/evict any key at 0x81010000 if there is
> tpm2_evictcontrol -C o 0x81010000 > /dev/null 2>&1
>
> echo Make the key persistent with handle 0x81010000
> tpm2_evictcontrol -C o -c aes256_key.ctx 0x81010000
> check_return
>
> echo AES encryption and decryption test.
> echo "test data" > test.data
>
> echo Create an IV data file
> iv_part1=3D`od -Ad -N8 -t u -i /dev/random | awk '{ print $2; exit }'`
> iv_part2=3D`od -Ad -N8 -t u -i /dev/random | awk '{ print $2; exit }'`
> iv=3D${iv_part1}${iv_part2}
> iv=3D${iv:0:15}
> echo ${iv} > iv.input
> cat iv.input
>
> pause
>
> echo Encrypt the test data file with the persistent key handle
> tpm2_encryptdecrypt -c 0x81010000 --iv=3Div.input:iv.output -p ${pswd} -o
> enc_test.data test.data
> check_return
>
> echo Decrypt the encrypted test file with the persistent key handle
> tpm2_encryptdecrypt -d -c 0x81010000 -p ${pswd} --iv-iv.input:iv.output -o
> dec_test.data enc_test.data
> check_return
>
> diff dec_test.data test.data > /dev/null
> if [ $? !=3D 0 ]; then
>    echo tpm2 encrypt/decrypt with key handle failed!
>    exit 1
> fi
> echo
> echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DE=3DN=3DD=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> echo
>
> On Fri, Apr 9, 2021 at 11:11 AM Chat Overlay Streaming <
> benzhu88899(a)gmail.com> wrote:
>
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
> *if (count > bufsiz) {   // ---> bufsiz =3D 1000     dev_err(&chip->dev,
>               "invalid count value %x %zx\n", count, bufsiz);      *return
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

--===============0278561704444623808==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzwqBXaWxsaWFtLjxkaXY+SSBjaGVja2VkIHRoZW0gYnkgcnVu
bmluZyBvdXIgcHJvcHJpZXRhcnkgdHBtIHRvb2wuIEJvdGggd2VyZSBhY3RpdmF0ZWQsIGJ1dCBJ
IHJhbiB0aGUgY29tbWFuZMKgIC0gdHBtMl9nZXRjYXAgY29tbWFuZHMgfCBncmVwIEVuY3J5cHRE
ZWNyeXB0PC9kaXY+PGRpdj5ib3RoIHdlcmXCoGVtcHR5LiBBbnkgc3VnZ2VzdGlvbnM/PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgYSBsb3QsPC9kaXY+PGRpdj5CZW48L2Rpdj48ZGl2
IHN0eWxlPSJjb2xvcjpyZ2IoMzIsMzEsMzApIj48Zm9udCBzaXplPSIxIj48YnI+PC9mb250Pjwv
ZGl2PjxkaXYgc3R5bGU9ImNvbG9yOnJnYigzMiwzMSwzMCkiPjxmb250IHNpemU9IjEiPjxicj48
L2ZvbnQ+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24g
V2VkLCBBcHIgMTQsIDIwMjEgYXQgMTo1NCBQTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhy
ZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4
O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgi
PgoKCgoKPGRpdiBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJp
YWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+
CjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMzIsMzEsMzApO2ZvbnQtc2l6ZToxNXB4O2JhY2tncm91
bmQtY29sb3I6cmdiKDI1NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+VGw7RFI8YnI+CkkgaW52
ZXN0aWdhdGVkIGEgYnVnIHJlcG9ydCwgYW5kIEkgY2FuJiMzOTt0IGZpbmQgYW55dGhpbmcgd3Jv
bmcgaW4gdGhlIHVzZXIgc3BhY2Ugc2lkZS4gRG9lcyBhbnlvbmUga25vdyBvZiBhbnkgaXNzdWVz
IG9yIHNlZTxicj4KYW55dGhpbmcgd3Jvbmc/PGJyPgo8YnI+CkZvbGxvdyBVcCBRdWVzdGlvbnMg
Zm9yIGJlbnpodTg4ODk5Ojwvc3Bhbj48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2Fs
aWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2Io
MCwwLDApIj4KPHNwYW4gc3R5bGU9ImNvbG9yOnJnYigzMiwzMSwzMCk7Zm9udC1zaXplOjE1cHg7
YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwyNTUpO2Rpc3BsYXk6aW5saW5lIj5Eb2VzCiB5
b3VyIFRQTSBzdXBwb3J0IFRQTTJfRW5jcnlwdERlY3J5cHQyIG9yIHRoZSBvcmlnaW5hbCBjb21t
YW5kPyBZb3UgY2FuIGxvb2sgYnkgcnVubmluZzxicj4KPGJyPgp0cG0yX2dldGNhcCBjb21tYW5k
cyB8IGdyZXAgRW5jcnlwdERlY3J5cHQKPGRpdj5UUE0yX0NDX0VuY3J5cHREZWNyeXB0OjwvZGl2
Pgo8ZGl2PlRQTTJfQ0NfRW5jcnlwdERlY3J5cHQyOjwvZGl2Pgo8YnI+ClN5bm9wc2lzOjxicj4K
PGJyPgpCZWxvdyBpcyBhIHNjcmlwdCB0aGF0IHdhcyBzZW50IHRvIHJlcHJvZHVjZSBhIGJ1ZyBp
dC4gSSBkb24mIzM5O3QgaGF2ZSB0aGUgZXhhY3QgZW52aXJvbmVtbnQsIGJ1dCBJIHJlcHJvZHVj
ZWQgdGhlIHVzZXIgc3BhY2UgY29tcG9uZW50cywgYnV0IHJhbjxicj4KYWdhaW5zdCBhbiBlbXVs
YXRvciAobm8ga2VybmVsKS48YnI+Cjxicj4KSSBqdXN0IGhhZCB0byB0d2VhayB0aGlzIGxpbmUg
aW4gdGhlIHNjcmlwdCwgYXMgdGhlIC0taXYgb3B0aW9uIGlzIHdyb25nOjwvc3Bhbj48L2Rpdj4K
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJp
Zjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPHNwYW4gc3R5bGU9ImNvbG9yOnJn
YigzMiwzMSwzMCk7Zm9udC1zaXplOjE1cHg7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwy
NTUpO2Rpc3BsYXk6aW5saW5lIj50cG0yX2VuY3J5cHRkZWNyeXB0CiAtZCAtYyAweDgxMDEwMDAw
IC1wICR7cHN3ZH0gLS1pdi1pdi5pbnB1dDppdi5vdXRwdXQgLW8gZGVjX3Rlc3QuZGF0YSBlbmNf
dGVzdC5kYXRhPC9zcGFuPjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGli
cmksQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAs
MCwwKSI+CjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMzIsMzEsMzApO2ZvbnQtc2l6ZToxNXB4O2Jh
Y2tncm91bmQtY29sb3I6cmdiKDI1NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+PGJyPgo8L3Nw
YW4+PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNh
LHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+CjxzcGFuIHN0eWxl
PSJjb2xvcjpyZ2IoMzIsMzEsMzApO2ZvbnQtc2l6ZToxNXB4O2JhY2tncm91bmQtY29sb3I6cmdi
KDI1NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+SXQgbmVlZHMKIGFuIGVxdWFsIGluIGJldHdl
ZW4gLS1pdiBhbmQgdGhlIGFyZ3VtZW50Ljwvc3Bhbj48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtj
b2xvcjpyZ2IoMCwwLDApIj4KPHNwYW4gc3R5bGU9ImNvbG9yOnJnYigzMiwzMSwzMCk7Zm9udC1z
aXplOjE1cHg7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwyNTUpO2Rpc3BsYXk6aW5saW5l
Ij48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwyNTUpO2Rpc3BsYXk6
aW5saW5lIj50cG0yX2VuY3J5cHRkZWNyeXB0CiAtZCAtYyAweDgxMDEwMDAwIC1wICR7cHN3ZH0g
LS1pdj1pdi5pbnB1dDppdi5vdXRwdXQgLW8gZGVjX3Rlc3QuZGF0YSBlbmNfdGVzdC5kYXRhPC9z
cGFuPjxicj4KPC9zcGFuPjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFy
aWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCki
Pgo8c3BhbiBzdHlsZT0iY29sb3I6cmdiKDMyLDMxLDMwKTtmb250LXNpemU6MTVweDtiYWNrZ3Jv
dW5kLWNvbG9yOnJnYigyNTUsMjU1LDI1NSk7ZGlzcGxheTppbmxpbmUiPjxzcGFuIHN0eWxlPSJi
YWNrZ3JvdW5kLWNvbG9yOnJnYigyNTUsMjU1LDI1NSk7ZGlzcGxheTppbmxpbmUiPjxicj4KPC9z
cGFuPjwvc3Bhbj48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxI
ZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPHNw
YW4gc3R5bGU9ImNvbG9yOnJnYigzMiwzMSwzMCk7Zm9udC1zaXplOjE1cHg7YmFja2dyb3VuZC1j
b2xvcjpyZ2IoMjU1LDI1NSwyNTUpO2Rpc3BsYXk6aW5saW5lIj48c3BhbiBzdHlsZT0iYmFja2dy
b3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwyNTUpO2Rpc3BsYXk6aW5saW5lIj5PdGhlcndpc2UsCiB0
aGVuIHRoYXQsIGl0IHJhbiBhbmQgdGhlIGRpZmYgc2VlbWVkIHRvIGJlIG9rLjwvc3Bhbj48L3Nw
YW4+PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNh
LHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+Cjxicj4KPC9kaXY+
CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2Vy
aWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+CjxzcGFuIHN0eWxlPSJjb2xvcjpy
Z2IoMzIsMzEsMzApO2ZvbnQtc2l6ZToxNXB4O2JhY2tncm91bmQtY29sb3I6cmdiKDI1NSwyNTUs
MjU1KTtkaXNwbGF5OmlubGluZSI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6cmdiKDI1
NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+U2luY2UKIHRoYXQgd29ya2VkLCBJIGJ1bXBlZCBt
eSB0c3MgdmVyc2lvbiBmb3J3YXJkICgzLjEuMC1yYzApIHRvIGhhdmUgdGhlIHBjYXAgdGN0aSBm
b3IgZWFzZSBvZiBkaWdnaW5nIGludG8gdGhlIGJ5dGVzIHNlbnQuPC9zcGFuPjwvc3Bhbj48L2Rp
dj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1z
ZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPHNwYW4gc3R5bGU9ImNvbG9y
OnJnYigzMiwzMSwzMCk7Zm9udC1zaXplOjE1cHg7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1
NSwyNTUpO2Rpc3BsYXk6aW5saW5lIj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2Io
MjU1LDI1NSwyNTUpO2Rpc3BsYXk6aW5saW5lIj5JCiBhZGRlZCBhbiBleHBvcnQgVFBNMlRPT0xT
X1RDVEk9cGNhcCB0byB0aGUgc2NyaXB0IHJpZ2h0IGJlZm9yZSB0aGUgZW5jL2RlYyBjYWxscyBz
byBJIGhhZCBsZXNzIHRoaW5ncyB0byB3YWRlIHRocm91Z2ggd2l0aCB3aXJlc2hhcmsuPC9zcGFu
Pjwvc3Bhbj48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2
ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPHNwYW4g
c3R5bGU9ImNvbG9yOnJnYigzMiwzMSwzMCk7Zm9udC1zaXplOjE1cHg7YmFja2dyb3VuZC1jb2xv
cjpyZ2IoMjU1LDI1NSwyNTUpO2Rpc3BsYXk6aW5saW5lIj48c3BhbiBzdHlsZT0iYmFja2dyb3Vu
ZC1jb2xvcjpyZ2IoMjU1LDI1NSwyNTUpO2Rpc3BsYXk6aW5saW5lIj48YnI+Cjwvc3Bhbj48L3Nw
YW4+PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNh
LHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+CjxzcGFuIHN0eWxl
PSJjb2xvcjpyZ2IoMzIsMzEsMzApO2ZvbnQtc2l6ZToxNXB4O2JhY2tncm91bmQtY29sb3I6cmdi
KDI1NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29s
b3I6cmdiKDI1NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+Rmlyc3QKIEVuY3J5cHREZWNyeXB0
MiBjYWxsICh3aGljaCBJIGFzc3VtZSB5b3VycyBmYWlscyBhdCwgYmVjYXVzZSB0aGUgc2Vjb25k
IGNvbW1hbmQgd29uJiMzOTt0IHJ1biBkdWUgdG8gaXYgb3B0aW9uIGlzc3VlKTo8L3NwYW4+PC9z
cGFuPjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGlj
YSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPgo8c3BhbiBzdHls
ZT0iY29sb3I6cmdiKDMyLDMxLDMwKTtmb250LXNpemU6MTVweDtiYWNrZ3JvdW5kLWNvbG9yOnJn
YigyNTUsMjU1LDI1NSk7ZGlzcGxheTppbmxpbmUiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNv
bG9yOnJnYigyNTUsMjU1LDI1NSk7ZGlzcGxheTppbmxpbmUiPjxicj4KPC9zcGFuPjwvc3Bhbj48
L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fu
cy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPHNwYW4gc3R5bGU9ImNv
bG9yOnJnYigzMiwzMSwzMCk7Zm9udC1zaXplOjE1cHg7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1
LDI1NSwyNTUpO2Rpc3BsYXk6aW5saW5lIj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpy
Z2IoMjU1LDI1NSwyNTUpO2Rpc3BsYXk6aW5saW5lIj4wMDAwCiDCoCA4MCAwMiAwMCAwMCAwMCA3
YyAwMCAwMCAwMSA5MyA4MSAwMSAwMCAwMCAwMCAwMAo8ZGl2PjAwMTAgwqAgMDAgNDkgMDIgMDAg
MDAgMDAgMDAgMjAgYjEgMjggMTcgNTggNWIgMDMgMjggNmU8L2Rpdj4KPGRpdj4wMDIwIMKgIGEy
IGM2IDBkIDFlIDE2IDAxIGEyIDNiIGFjIDdmIDg3IGRhIDA3IDU1IDI1IDkwPC9kaXY+CjxkaXY+
MDAzMCDCoCAwOCBlNiAyYSA5ZiAyOSBkMSAzMiA0MCAwMSAwMCAyMCA5NSA4NSAwZCBjOCA3NTwv
ZGl2Pgo8ZGl2PjAwNDAgwqAgZjQgMmEgNDAgZjUgZGEgYTEgNmUgNjQgNWEgMDUgMGEgYTQgZjUg
NmEgODMgOWQ8L2Rpdj4KPGRpdj4wMDUwIMKgIGRlIDk0IDJmIDY4IDMxIGNhIGJiIGFiIDRhIDgy
IGRlIDAwIDBhIDc0IDY1IDczPC9kaXY+CjxkaXY+MDA2MCDCoCA3NCAyMCA2NCA2MSA3NCA2MSAw
YSAwMCAwMCA0MCAwMCAxMCAzMyAzMyAzNCAzMjwvZGl2Pgo8ZGl2PjAwNzAgwqAgMzAgMzcgMzcg
MzMgMzkgMzkgMzMgMzIgMzkgMzcgMzYgMGE8L2Rpdj4KPGRpdj48L2Rpdj4KPGJyPgo8L3NwYW4+
PC9zcGFuPjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZl
dGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPgo8c3BhbiBz
dHlsZT0iY29sb3I6cmdiKDAsMCwwKSI+VGhlIHN0cnVjdHVyZSB0aGUga2VybmVsIGRlZmluZXMg
aXM6PC9zcGFuPjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJp
YWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+
CjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMCwwLDApIj5zdHJ1Y3QgdHBtX2hlYWRlciB7PC9zcGFu
Pjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0
aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+CjxzcGFuIHN0
eWxlPSJjb2xvcjpyZ2IoMzIsMzEsMzApO2ZvbnQtc2l6ZToxNXB4O2JhY2tncm91bmQtY29sb3I6
cmdiKDI1NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQt
Y29sb3I6cmdiKDI1NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+CjxwcmUgc3R5bGU9ImNvbG9y
OnJnYigwLDAsMCkiPglfX2JlMTYgdGFnOwoJX19iZTMyIGxlbmd0aDsKCXVuaW9uIHsKCQlfX2Jl
MzIgb3JkaW5hbDsKCQlfX2JlMzIgcmV0dXJuX2NvZGU7Cgl9Owp9IF9fcGFja2VkOzwvcHJlPgo8
YnI+Cjwvc3Bhbj48L3NwYW4+PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmks
QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCww
KSI+CjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMzIsMzEsMzApO2ZvbnQtc2l6ZToxNXB4O2JhY2tn
cm91bmQtY29sb3I6cmdiKDI1NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+PHNwYW4gc3R5bGU9
ImJhY2tncm91bmQtY29sb3I6cmdiKDI1NSwyNTUsMjU1KTtkaXNwbGF5OmlubGluZSI+U28KIHRh
ZyBpczrCoDwvc3Bhbj48L3NwYW4+ODAgMDI8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpy
Z2IoMCwwLDApIj4KTGVuZ3RoIGlzOiAwMCAwMCAwMCA3YyAod2hpY2ggaXMgQmlnIEVuZGlhbiBk
ZWNpbWFsIHZhbHVlIDEyNCk8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxB
cmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDAp
Ij4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2
ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPHNwYW4g
c3R5bGU9ImNvbG9yOnJnYigwLDAsMCk7Zm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRp
Y2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdCI+UGV0ZXLCoDwvc3Bhbj48c3BhbiBzdHlsZT0i
Y29sb3I6cmdiKDAsMCwwKTtmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxMnB0Ij5oYXMgdG91Y2hlZCBjb2RlIGluIHRoYXQgYXJlYSwgcGVy
aGFwcwogUGV0ZXIgb3Igc29tZW9uZSBlbHNlIHNwb3RzIHNvbWV0aGluZyBJIGRpZG50Pzwvc3Bh
bj48YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZl
dGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPgo8YnI+Cjwv
ZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPgo8YnI+CjwvZGl2Pgo8ZGl2
IGlkPSJnbWFpbC1tXzczNDYyNDYwODY3NjM4NTUwODZnbWFpbC1tXzUxMTY5NDg2NjM2NTE2NzY2
MDFhcHBlbmRvbnNlbmQiPjwvZGl2Pgo8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dp
ZHRoOjk4JSI+CjxkaXYgaWQ9ImdtYWlsLW1fNzM0NjI0NjA4Njc2Mzg1NTA4NmdtYWlsLW1fNTEx
Njk0ODY2MzY1MTY3NjYwMWRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxp
YnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48
Yj5Gcm9tOjwvYj4gQ2hhdCBPdmVybGF5IFN0cmVhbWluZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmJl
bnpodTg4ODk5QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmJlbnpodTg4ODk5QGdtYWlsLmNv
bTwvYT4mZ3Q7PGJyPgo8Yj5TZW50OjwvYj4gRnJpZGF5LCBBcHJpbCA5LCAyMDIxIDE6MjUgUE08
YnI+CjxiPlRvOjwvYj4gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9
Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJy
Pgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIFJlOiBIZWxwIC0gaW52YWxpZCBjb3VudCB2YWx1ZTwv
Zm9udD4KPGRpdj7CoDwvZGl2Pgo8L2Rpdj4KPGRpdj4KPGRpdiBkaXI9Imx0ciI+SGVyZSBpcyBt
eSB0ZXN0IGNvZGU6CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4vLy8vLy8vLy8vLy8vLy8vLy8vLy8v
Ly8vLy8vLy8vLy8vPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4jIS9iaW4vZW52IGJhc2g8
YnI+Cjxicj4KZnVuY3Rpb24gcGF1c2UoKSB7PGJyPgrCoCDCoHJlYWQgLXMgLW4gMSAtcCAmcXVv
dDtQcmVzcyBhbnkga2V5IHRvIGNvbnRpbnVlIC4uLiZxdW90Ozxicj4KwqAgwqBlY2hvICZxdW90
OyZxdW90Ozxicj4KfTxicj4KPGJyPgpmdW5jdGlvbiBjaGVja19yZXR1cm4oKSB7PGJyPgrCoCDC
oGlmIFsgJD8gIT0gMCBdOyB0aGVuPGJyPgrCoCDCoCDCoCBlY2hvIGZhaWxlZCB3aXRoIHJldHVy
biBjb2RlOiAkPzxicj4KwqAgwqAgwqAgZXhpdCAxPGJyPgrCoCDCoGZpPGJyPgp9PGJyPgo8YnI+
Cjxicj4KZWNobyB0cG0yIHN0YXJ0dXA8YnI+CnRwbTJfc3RhcnR1cCAtYzxicj4KY2hlY2tfcmV0
dXJuPGJyPgo8YnI+CmVjaG8gQ2xlYXIgdGhlIEF1dGhvcml6YXRpb24gdmFsdWUuPGJyPgp0cG0y
X2NsZWFyPGJyPgpjaGVja19yZXR1cm48YnI+Cjxicj4KZWNobyBDcmVhdGUgdGhlIGxvY2FsIGtl
eXN0b3JlIGZvbGRlcjxicj4KaWYgWyAhIC1kIMKgJHtIT01FfS8ubG9jYWwvc2hhcmUvdHBtMi10
c3MvdXNlci9rZXlzdG9yZSBdOyB0aGVuPGJyPgpta2RpciAtcCAke0hPTUV9Ly5sb2NhbC90cG0y
LXRzcy91c2VyL2tleXN0b3JlPGJyPgpmaTxicj4KPGJyPgplY2hvIFNldCB0aGUgYWxnb3Rocmlt
cyBmb3IgdGhlIFNSSyBoaWVyYXJjaHkuPGJyPgprZXlfYWxnPSZxdW90O3JzYTIwNDg6YWVzMjU2
Y3RyJnF1b3Q7PGJyPgpoYXNoX2FsZz0mcXVvdDtzaGEyNTYmcXVvdDs8YnI+CnBzd2Q9MTIzNDU8
YnI+Cjxicj4KZWNobyBDcmVhdGUgdGhlIHByaW1hcnkga2V5IG9iamVjdCBmb3IgU1JLLiBUaGlz
IHdpbGwgdGFrZSBhIHdoaWxlLi4uPGJyPgp0cG0yX2NyZWF0ZXByaW1hcnkgLVEgLUcgJnF1b3Q7
JHtrZXlfYWxnfSZxdW90OyAtZyAmcXVvdDske2hhc2hfYWxnfSZxdW90OyAtQyBvIC1jIHNyay5j
dHg8YnI+CmNoZWNrX3JldHVybjxicj4KPGJyPgplY2hvIENyZWF0ZSBhbiBBRVMga2V5IG9iamVj
dCB3aXRoIENUUiBtb2RlPGJyPgp0cG0yX2NyZWF0ZSAtQyBzcmsuY3R4IC1HIGFlczI1NmN0ciAt
cCAke3Bzd2R9IC11IGFlczI1Nl9rZXkucHViIC1yIGFlczI1Nl9rZXkucHJpdjxicj4KY2hlY2tf
cmV0dXJuPGJyPgo8YnI+CmVjaG8gTG9hZCBpdCBpbnRvIFRQTSBtb2R1bGUgbWVtb3J5PGJyPgp0
cG0yX2xvYWQgLVEgLUMgc3JrLmN0eCAtdSBhZXMyNTZfa2V5LnB1YiAtciBhZXMyNTZfa2V5LnBy
aXYgLW4gYWVzMjU2Y3RyX2tleSAtYyBhZXMyNTZfa2V5LmN0eDxicj4KY2hlY2tfcmV0dXJuPGJy
Pgo8YnI+CmVjaG8gRXJhc2UvZXZpY3QgYW55IGtleSBhdCAweDgxMDEwMDAwIGlmIHRoZXJlIGlz
PGJyPgp0cG0yX2V2aWN0Y29udHJvbCAtQyBvIDB4ODEwMTAwMDAgJmd0OyAvZGV2L251bGwgMiZn
dDsmYW1wOzE8YnI+Cjxicj4KZWNobyBNYWtlIHRoZSBrZXkgcGVyc2lzdGVudCB3aXRoIGhhbmRs
ZSAweDgxMDEwMDAwPGJyPgp0cG0yX2V2aWN0Y29udHJvbCAtQyBvIC1jIGFlczI1Nl9rZXkuY3R4
IDB4ODEwMTAwMDA8YnI+CmNoZWNrX3JldHVybjxicj4KPGJyPgplY2hvIEFFUyBlbmNyeXB0aW9u
IGFuZCBkZWNyeXB0aW9uIHRlc3QuPGJyPgplY2hvICZxdW90O3Rlc3QgZGF0YSZxdW90OyAmZ3Q7
IHRlc3QuZGF0YTxicj4KPGJyPgplY2hvIENyZWF0ZSBhbiBJViBkYXRhIGZpbGU8YnI+Cml2X3Bh
cnQxPWBvZCAtQWQgLU44IC10IHUgLWkgL2Rldi9yYW5kb20gfCBhd2sgJiMzOTt7IHByaW50ICQy
OyBleGl0IH0mIzM5O2A8YnI+Cml2X3BhcnQyPWBvZCAtQWQgLU44IC10IHUgLWkgL2Rldi9yYW5k
b20gfCBhd2sgJiMzOTt7IHByaW50ICQyOyBleGl0IH0mIzM5O2A8YnI+Cml2PSR7aXZfcGFydDF9
JHtpdl9wYXJ0Mn08YnI+Cml2PSR7aXY6MDoxNX08YnI+CmVjaG8gJHtpdn0gJmd0OyBpdi5pbnB1
dDxicj4KY2F0IGl2LmlucHV0PGJyPgo8YnI+CnBhdXNlPGJyPgo8YnI+CmVjaG8gRW5jcnlwdCB0
aGUgdGVzdCBkYXRhIGZpbGUgd2l0aCB0aGUgcGVyc2lzdGVudCBrZXkgaGFuZGxlPGJyPgp0cG0y
X2VuY3J5cHRkZWNyeXB0IC1jIDB4ODEwMTAwMDAgLS1pdj1pdi5pbnB1dDppdi5vdXRwdXQgLXAg
JHtwc3dkfSAtbyBlbmNfdGVzdC5kYXRhIHRlc3QuZGF0YTxicj4KY2hlY2tfcmV0dXJuPGJyPgo8
YnI+CmVjaG8gRGVjcnlwdCB0aGUgZW5jcnlwdGVkIHRlc3QgZmlsZSB3aXRoIHRoZSBwZXJzaXN0
ZW50IGtleSBoYW5kbGU8YnI+CnRwbTJfZW5jcnlwdGRlY3J5cHQgLWQgLWMgMHg4MTAxMDAwMCAt
cCAke3Bzd2R9IC0taXYtaXYuaW5wdXQ6aXYub3V0cHV0IC1vIGRlY190ZXN0LmRhdGEgZW5jX3Rl
c3QuZGF0YTxicj4KY2hlY2tfcmV0dXJuPGJyPgo8YnI+CmRpZmYgZGVjX3Rlc3QuZGF0YSB0ZXN0
LmRhdGEgJmd0OyAvZGV2L251bGw8YnI+CmlmIFsgJD8gIT0gMCBdOyB0aGVuPGJyPgrCoCDCoGVj
aG8gdHBtMiBlbmNyeXB0L2RlY3J5cHQgd2l0aCBrZXkgaGFuZGxlIGZhaWxlZCE8YnI+CsKgIMKg
ZXhpdCAxPGJyPgpmaTxicj4KZWNobzxicj4KZWNobyA9PT09PT09PT09PT09PT09PT1FPU49RD09
PT09PT09PT09PT09PT09PT09PTxicj4KZWNobzxicj4KPC9kaXY+CjwvZGl2Pgo8YnI+CjxkaXY+
CjxkaXYgZGlyPSJsdHIiPk9uIEZyaSwgQXByIDksIDIwMjEgYXQgMTE6MTEgQU0gQ2hhdCBPdmVy
bGF5IFN0cmVhbWluZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmJlbnpodTg4ODk5QGdtYWlsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmJlbnpodTg4ODk5QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4K
PC9kaXY+CjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CjxkaXYg
ZGlyPSJsdHIiPgo8ZGl2Pgo8ZGl2Pgo8ZGl2IGlkPSJnbWFpbC1tXzczNDYyNDYwODY3NjM4NTUw
ODZnbWFpbC1tXzUxMTY5NDg2NjM2NTE2NzY2MDF4X2dtYWlsLW1fNTU0MjA5NDY1MTY0NjA1OTQz
OWdtYWlsLW1fMzM4Mjg5MjUxNzc3NDEyNjI0NGdtYWlsLTpybyI+SGkgdGhlcmUsPGJyPgo8L2Rp
dj4KPC9kaXY+CjwvZGl2Pgo8ZGl2PkkgdHJpZWQgdG8gdXNlIHRoZSBUUE0yIEFFUzI1NiAvIEFF
UzI1NkNUUiB0byBlbmNyeXB0IGEgZmlsZS4gV2hlbiBJIHJhbiB0aGUgZm9sbG93aW5nIGNvbW1h
bmQsIEkgZ290IGFuIGVycm9yIG1lc3NhZ2UgaW4gYW4gaW5maW5pdGUgbG9vcCBhbmQgaGFkIHRv
IHJlYm9vdCBteSBtYWNoaW5lLjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+JCB0cG0yX2Vu
Y3J5cHRkZWNyeXB0IC1jIDB4ODEwMTAwMDAgLS1pdj1pdi5pbnB1dDppdi5vdXRwdXQgLXAgJHtw
c3dkfSAtbyBlbmNfdGVzdC5kYXRhIHRlc3QuZGF0YTwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+Cjxk
aXY+CjxkaXY+VGhlIGVycm9yIG1lc3NhZ2Ugd2FzPC9kaXY+CjxkaXY+wqAgwqB0cG0gdHBtMCBp
bnZhbGlkIGNvdW50IHZhbHVlIGZmZmZmZmZmIDEwMDA8L2Rpdj4KPGRpdj7CoCDCoHRwbSB0cG0w
IGludmFsaWQgY291bnQgdmFsdWUgZmZmZmZmZmYgMTAwMMKgPC9kaXY+CjxkaXY+wqAgwqAuLi48
L2Rpdj4KPGRpdj7CoCDCoHRwbSB0cG0wIGludmFsaWQgY291bnQgdmFsdWUgZmZmZmZmZmYgMTAw
MDwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+RGlnZ2luZyB0aGUgbG9jYXRpb24gd2hlcmUg
dGhlIGVycm9yIG1lc3NhZ2UgY29tZXMgZnJvbSwgSSBmb3VuZCBpdCB3YXMgaW4gdGhlIHRwbSBk
cml2ZXIgZmlsZTogZmlsZSB0cG0taW50ZXJmYWNlLmM8L2Rpdj4KPGJyPgpzdGF0aWMgc3NpemVf
dMKgPGI+dHBtX3RyeV90cmFuc21pdDwvYj4oc3RydWN0IHRwbV9jaGlwICpjaGlwLCB2b2lkICpi
dWYsIHNpemVfdCBidWZzaXopPGJyPgp7PGJyPgpzdHJ1Y3QgdHBtX2hlYWRlciAqaGVhZGVyID0g
YnVmOzxicj4KLi4uPGJyPgo8YnI+CjxiPmNvdW50ID0gYmUzMl90b19jcHUoaGVhZGVyLSZndDts
ZW5ndGgpOyAvLyAtLS0mZ3Q7IGNvdW50ID0gZmZmZmZmZmbCoDwvYj7CoAo8ZGl2Pi4uLjxicj4K
PC9kaXY+CjxkaXY+CjxkaXY+PGJyPgo8Yj5pZiAoY291bnQgJmd0OyBidWZzaXopIHsgwqAgLy8g
LS0tJmd0OyBidWZzaXogPSAxMDAwPGJyPgrCoCDCoCBkZXZfZXJyKCZhbXA7Y2hpcC0mZ3Q7ZGV2
LDxicj4KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7aW52YWxpZCBjb3VudCB2YWx1
ZSAleCAlenhcbiZxdW90OywgY291bnQsIGJ1ZnNpeik7PGJyPgrCoCDCoCDCoDwvYj5yZXR1cm4g
LUUyQklHOzxicj4KPGI+wqB9PC9iPjxicj4KLi4uLjxicj4KfTwvZGl2Pgo8L2Rpdj4KPC9kaXY+
CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4KPGRpdj5NeSBxdWVzdGlvbiBpcyBkaWQgc29tZW9uZSBt
ZWV0IHRoZSBzYW1lIHByb2JsZW0/IEFuZCBob3cgY2FuIEkgZGVidWcgdGhpcyBwcm9ibGVtPzwv
ZGl2Pgo8ZGl2PjwvZGl2Pgo8ZGl2PjwvZGl2Pgo8L2Rpdj4KPGRpdj5JIGRvdWJsZSBjaGVja2Vk
wqB0aGUgdHBtMi1hYnJtZCBzZXJ2aWNlLiBJdCB3YXMgcnVubmluZyBva2F5Ljxicj4KPC9kaXY+
CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5UaGUgYnVpbGRzIGZvciBteSB0ZXN0IGFyZTo8YnI+Cjwv
ZGl2Pgo8ZGl2PjEuIHJwaS1rZXJuZWw6IDUuNC55PC9kaXY+CjxkaXY+Mi4gdHBtMi10c3M6IDMu
MC54PC9kaXY+CjMuIHRwbTItYWJybWQ6IDIuMy4yPGJyPgo0LiB0cG0yLXRvb2xzOiA0LjIuWDxi
cj4KNS4gdHBtMi10c3MtZW5naW5lOiB2MS4xLngKPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pk15IHRl
c3QgZW52aXJvbm1lbnRzOjwvZGl2Pgo8ZGl2PlJQSSAzQiAmYW1wOyA0QjwvZGl2Pgo8ZGl2PkFF
UyBpbiB0aGUgVFBNIHdhcyBlbmFibGVkLjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+QXR0
YWNoZWQgaXMgbXkgdGVzdCBzY3JpcHQuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4KPGRp
dj5UaGFua3MgYSBsb3QsPC9kaXY+CjxkaXY+QmVuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRp
dj48L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Jsb2NrcXVvdGU+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+
Cgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============0278561704444623808==--

