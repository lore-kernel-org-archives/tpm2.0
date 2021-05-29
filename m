Content-Type: multipart/mixed; boundary="===============7842900453882539069=="
MIME-Version: 1.0
From: Felix Rubio <felix at kngnt.org>
Subject: [tpm2] Lost/blocked when trying to setup a symmetric
 decryption/encryption scheme using the tpm...
Date: Sat, 29 May 2021 09:14:19 +0200
Message-ID: <5627ff076acbafb56d940e1dd85bdff6@kngnt.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7842900453882539069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everybody!

I am giving a try in setting up an encryption system for one of my =

computers, by making use of the TPM 2.0. I am completely stuck for two =

days now, and... maybe somebody can give me a hand?

My first experiment was to seal the disk encryption key, using a PCR =

policy. This worked:

a) To seal the key
     tpm2_takeownership -c
     tpm2_pcrlist -L sha1:0,1,7 -o pcr_state.bin
     tpm2_createpolicy -P -L sha1:0,1,7 -F pcr_state.bin -f policy.bin
     tpm2_createprimary -H e -g sha1 -G rsa
     tpm2_create -g sha256 -G keyedhash -u key.pub -r key.priv -H =

0x80000000 -L policy.bin -A "fixedtpm|fixedparent|noda|adminwithpolicy" =

-I /dev/shm/key.bin
     tpm2_load -H 0x80000000 -u key.pub -r key.priv
     tpm2_evictcontrol -A o -H 0x80000001 -S 0x81010002

b) to unseal it:
     tpm2_unseal -H 0x81010002 -L sha1:0,1,7 > key.bin

However, in case the TPM has an issue (or I need to restore a backup,  =

use a rescue disk, etc.), I want to give it another twist: to use the =

TPM to encrypt/decrypt a regular ascii string... still tying it to the =

pcr registers. And... I do not manage to get it right. I have been =

looking for two days around on the internet, and I do not get to find an =

example doing something similar to what I need (I am running tpm2-tools =

3.1 on debian stable). I know I can just seal an ascii passphrase and =

use my previous approach... but I'd really like to understand how it =

should be done.

Regards!
Felix
--===============7842900453882539069==--

