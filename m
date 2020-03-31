Content-Type: multipart/mixed; boundary="===============7967617945356772016=="
MIME-Version: 1.0
From: John S <sedigj at gmail.com>
Subject: [tpm2] Relating tpm2_createprimary, Primary Seeds, and tpm2_clear
Date: Tue, 31 Mar 2020 15:57:36 +0000
Message-ID: <20200331155736.2692.99393@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7967617945356772016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, have been playing around with tpm2 tools and tss engine for openssl for=
 awhile.
Also reading Practical Guide to TPM 2.0.

I have found all the resources in the tpm2-tools readme and wiki and beyond=
 quite helping in getting started.

The book (chapter 10) talks about the primary seeds for the hierarchy, and =
how any amount of key hierarchies can be extended from the primary keys. Pr=
imary keys are derived from the primary seeds. My understanding is that the=
 seeds are unique and permanent in the tpm hardware.

I was anticipating that tpm2_createprimary could be used to get back to the=
 primary key (given the same inputs/template) no matter what data is cleare=
d or erased. =


Running tpm2_createprimary twice yields same result as evidence by the rsa =
value, as expected.

But running:
tpm2_createprimary
tpm2_clear
tpm2_createprimary

yields a totally different key, as can be seen from the resulting rsa value.
This is also consistent with the manpage of tpm2_clear:
"Clears lockout, endorsement and owner hierarchy authorization values." and=
 "NOTE: All objects created under the respective hierarchies are lost."

This makes tpm2_clear seem like an exceptionally dangerous command, if I ru=
n it once (inadvertently perhaps), I've now destroyed all use of all keys e=
ver created on the system. Yet, based on what I thought I understood about =
the primary seeds, I'd always be able to derive back to a key value.

So, what I am I missing?
Feel free to link in references.

A side question:
I am unable to create a primary Platform key (owner, endorsement, and null =
work). Looks like authorization is expected.
Is this an expected result based on how the TPM is configured from the chip=
 vendor? In this case Infineon
Here is the output:
$ tpm2_createprimary -C p -c platform_primary.ctx
WARNING:esys:src/tss2-esys/api/Esys_CreatePrimary.c:393:Esys_CreatePrimary_=
Finish() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_CreatePrimary.c:135:Esys_CreatePrimary() =
Esys Finish ErrorCode (0x000009a2)
ERROR: Esys_CreatePrimary(0x9A2) - tpm:session(1):authorization failure wit=
hout DA implications
ERROR: Unable to run tpm2_createprimary

Thanks,
-John
--===============7967617945356772016==--

