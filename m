Content-Type: multipart/mixed; boundary="===============3243705786954470249=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: tpm2_createprimary command
Date: Fri, 11 Oct 2019 12:30:50 -0700
Message-ID: <a7790d21-be82-2e8a-4638-afa8f6cfed26@intel.com>
In-Reply-To: 20191011185614.2949.87910@new-ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3243705786954470249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/11/19 11:56 AM, mohammed.aitbendaoud(a)gmail.com wrote:
> i am using tpm2-tools for testing my tpm.
> =

> Before starting the tests i am doing : tpm2_createprimary -H o -g sha256 =
-G ecc
> =

> why we need a hash to create a primary key ?

It is used to calculate the object's qualified name. See "27.2.3 nameAlg" in
https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-Arc=
hitecture-01.38.pdf

Thanks,
-- =

Tadeusz
--===============3243705786954470249==--

