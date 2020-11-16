Content-Type: multipart/mixed; boundary="===============4214548904853090169=="
MIME-Version: 1.0
From: Matthew Giassa <matthew at giassa.net>
Subject: [tpm2] Question: TPM2.0 auditing services/programs for S/W solutions
 using TPM chips.
Date: Mon, 16 Nov 2020 17:16:36 +0000
Message-ID: <20201116171636.2865.49328@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4214548904853090169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Good day,

I'm trying to find a specific type of guideline and/or certification relati=
ng to TPM-based (software) product, and wasn't able to find what I'm lookin=
g for here (so far), or at other sites I was advised to check out (i.e. [1]=
, [2]), so I'm reaching out here for guidance/advice. =


Are there companies or programs (i.e. formally recognized or recommended by=
 TCG or a similar authority) that pen-test/assess the quality of a software=
-based solution that depends on a TPM (i.e. 2.0) chip? Or, failing that, ar=
e there guidelines or certification/assessment programs for qualifying soft=
ware solutions (i.e. Linux-based) that make use of a TPM device?

I'm putting together some proof-of-concept examples, and while the design s=
eems sound, it's my opinion that the person implementing the solution shoul=
dn't be the same person assessing it for weaknesses. It's effectively a mea=
sured-boot-based solution to support full disk encryption via LUKS, and lat=
er, remote attestation. I started considering the topic after coming across=
 a post [3], which strikes me as a bit of a "gotcha" (i.e. secret can be un=
sealed due to accidentally leaving a blank/default password enabled; "oops"=
). =


Any documentation/guides/resources that can help with assessing the quality=
 of a s/w-based solution and "keeping it on the rails" is appreciated.

Thank you.


1. "TPMDeveloper - Topics", <https://developers.tpm.dev/topics>, last acces=
sed 2020-11-16.
2. "Trusted Computing Group - Resources", <https://trustedcomputinggroup.or=
g/resources?>, last accessed 2020-11-16.
3. "Unsealing data despite PCR policy", <https://github.com/tpm2-software/t=
pm2-tools/issues/1123>, last accessed 2020-11-16.
--===============4214548904853090169==--

