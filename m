Content-Type: multipart/mixed; boundary="===============2231080371538155552=="
MIME-Version: 1.0
From: Rodolphe AVERTY <rodolphe.averty at free.fr>
Subject: [tpm2] Re: Can't se't signature algorithm when using tpm2_import
Date: Fri, 20 May 2022 11:27:15 +0000
Message-ID: <20220520112715.2134.81231@ml01.vlan13.01.org>
In-Reply-To: BDEEB7F2-3161-DE4D-A613-6BCBFA206487@hxcore.ol
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2231080371538155552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I'am trying to import my private key into the TPM (to use it with StrongSwa=
n)

>> tpm2_createprimary... .. .
>> tpm2_import -G rsa2048:rsassa-sha256 -i private.pem -C parent.ctx -u irs=
akey.pub -r irsakey.pri
>> tpm2_load... ..
>> tpm2_evictcontrol... ..

Every thing seems to be Ok

But when i use the command :

>> pki --print --type private --keyid 0x81000002
TPM 2.0 via TSS2 v2 available
signature algorithm is NULL with ERROR hash
privkey: RSA 2048 bits
keyid: 42:e7:94:da:9b:07:40:01:8e:40:e5:51:35:fc:10:da:8f:2c:61:3b
subjkey: f8:4e:a2:ae:5c:3a:1b:40:7a:6a:19:04:38:32:05:62:db:f0:d5:9e


With that i can't use my key with strong swan. The message (Signature algor=
ithm is null with error hash) indicate that tpm2_import hasn't done its job.

Is there a way to have a signature algorithm with tpm2_import ?
Is this a tpm2_import limitation ?
Or maybe a bug.. .

I am using de debian SID package of tpm2-tools which is a 5.2

Thanks for help
--===============2231080371538155552==--

