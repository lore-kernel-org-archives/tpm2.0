Content-Type: multipart/mixed; boundary="===============9078762506315284765=="
MIME-Version: 1.0
From: Jerry Snitselaar <jsnitsel at redhat.com>
Subject: [tpm2] question about tpm2-tools pull request: Update tpm2_pcrlist.c
 #728
Date: Tue, 02 Jan 2018 16:05:50 -0700
Message-ID: <20180102230550.hcgairgol7mmk6ts@cantor>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9078762506315284765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm wondering if that is the correct solution. I don't think I've ever
seen sizeofSelect greater than 3, so the change of pcr_id to UINT8
probably doesn't hurt, but I'm not sure how the compiler decided that
was okay all the sudden over the UINT32 since I think the problem
arose from the * 8. I think the more correct thing probably is to
explicitly make that 8 unsigned, so '* 8u', and leave pcr_id alone.

I still don't comletely understand the type conversions taking
place in the for loop condition check with and without the patch.

Thoughts?

--===============9078762506315284765==--

