Content-Type: multipart/mixed; boundary="===============1649676314446038029=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Generating a key
Date: Tue, 09 Jul 2019 20:09:02 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DCBCAD@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CA+M7zR2kZh88BJimYfETUH5q4siCgjFFsedoLyQv77EWviT4Zw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1649676314446038029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of ramyasnair
> ramyasnair
> Sent: Monday, July 8, 2019 11:10 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Generating a key
> =

> Hi,
> I tried generating a key using tpm2tss-genkey under owner authority. But =
the key
> generated is written to the disk.I want to load the key to the tpm.I used
> tpm2_createprimary and tpm2_load commands as well.How do I verify if I ha=
ve
> successfully loaded the key into the TPM and store it there?I need help s=
ince I'm
> a beginner.

I didn't explain the primary key well. Each hierarchy is a a fixed seed, wi=
th the exception of
The null hierarchy. But when you create a primary key in a hierarchy, the c=
ommand to do so
Creates the key and loads it in transient (goes away volatile memory) of th=
e TPM. So on reboot,
That key is gone. However, if you run the command again, with the same inpu=
ts it produces the
same key. So you can do that on every reboot, and get the same primary key.=
 If you just wanted
to create it, and never have to re-create it, you can persist it with the e=
victcontrol command into
non-volatile memory, as the previous commands I showed you did.

Bill

> =

> Thanks and regards
> Ramya Nair


--===============1649676314446038029==--

