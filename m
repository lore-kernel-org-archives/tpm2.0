Content-Type: multipart/mixed; boundary="===============4863473303183933241=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: key destruction
Date: Mon, 01 Jun 2020 21:27:48 +0000
Message-ID: <20200601212748.2851.65044@ml01.vlan13.01.org>
In-Reply-To: bc09d129-82a9-3702-c9a4-ab348856ecdd@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4863473303183933241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ted,

Per your problem statement,

1. There is one unique primary object per user.
2. There is a multitude of such users.
3. There are multiple keys created under each of the primary object.
4. Invalidating the primary object would invalidate all the keys under the =
primary object and thus the user.

To create unique primary keys you can add unique data to objects created wi=
th tpm2_createprimary using the option "-u, --unique-data".

To create multiple keys simply run tpm2_create referencing the unique prima=
ry object as the parent.

To be able to invalidate the unique primary object, have its authorization =
policy set to policyNV referencing an NV index of type TPM_NT_BITS. The NV =
index is of size equal to the number of bits that can accommodate the total=
 number of users. Now, use tpm2_nvsetbits to represent the invalidation of =
a specific key.
Example. You have 16 users. NV Index of size 2 bytes.
0x0000 =3D=3D> All keys are active.
tpm2_nvsetbits =3D=3D> 0x0001 =3D=3D> Key#1 invalidated since policyNV  sin=
ce operandB changed and is not equal to 0000 anymore.
and so on...
--===============4863473303183933241==--

