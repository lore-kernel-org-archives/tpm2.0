Content-Type: multipart/mixed; boundary="===============1434821240396583523=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Maximum number of transient objects?
Date: Fri, 15 Oct 2021 19:11:39 +0200
Message-ID: <20211015191139.3B15F897@centrum.cz>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1434821240396583523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
=C2=A0
I still wonder how many transient objects (virtual handles) can I create wi=
th the tpm2-abrmd?
=C2=A0
There is TPM_PT_HR_TRANSIENT_MIN, which is said to be a minimum. An explana=
tion from Tadeusz: This tells you what is the minimum number of persistent =
objects a TPM needs to support to be able to support all TPM command implem=
ented by the given TPM chip.
=C2=A0
But then there are statements in the RM specification that:
For the TPM this is a minimum, but for the RM it=E2=80=99s both a minimum a=
nd a maximum for the maximum number of loaded objects. (Section 3.15.3)
The RM SHALL NOT allow the creation of more concurrent objects than TPM_PT_=
HR_TRANSIENT_MIN. (Section 3.15.12)
=C2=A0
Does this mean that for one connection the tpm2-abrmd will allow only (max)=
 TPM_PT_HR_TRANSIENT_MIN transient objects?
Because the section 3.4 then says
A TAB/RM MAY enforce a maximum number of session and/or object and sequence=
 handles per connection and MAY guarantee a minimum number of such handles =
per connection.
=C2=A0
=C2=A0
Petr
=C2=A0
--===============1434821240396583523==--

