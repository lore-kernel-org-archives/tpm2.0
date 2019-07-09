Content-Type: multipart/mixed; boundary="===============0203506022381563372=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Generating a key
Date: Tue, 09 Jul 2019 20:05:39 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DCBC99@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CA+M7zR2kZh88BJimYfETUH5q4siCgjFFsedoLyQv77EWviT4Zw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0203506022381563372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You need to create the primary key and mark it persistent if you want that =
key to be available after reboot
Without having to re-create the primary key. Primary keys are unique in the=
ir behavior. Their like a transient
Object that always has to be re-created in the same fashion to get the same=
 key.

# create a primary key and generate a context file
./tools/tpm2_createprimary -o primary.ctx

# make the primary key persistent so it's available after reboot without re=
creating it
./tools/tpm2_evictcontrol -a o -c primary.ctx =

persistent-handle: 0x81000000
action: persisted

You can control what address the key is persisted at via the -p option to e=
victcontrol, else
It will find the first available slot and use that.

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
> =

> Thanks and regards
> Ramya Nair


--===============0203506022381563372==--

