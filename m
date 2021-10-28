Content-Type: multipart/mixed; boundary="===============6016493535160907866=="
MIME-Version: 1.0
From: michael.g.millsap at intel.com
Subject: [tpm2] Help implementing "OR" PCR policy using C lib
Date: Thu, 28 Oct 2021 23:17:22 +0000
Message-ID: <20211028231722.2830.22029@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6016493535160907866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm implementing the sealing of a LUKS key against secure boot PCRs and am =
trying to enable firmware updates using Esys_PolicyOR(). I can't find any e=
xample code. I am currently doing an Esys_PolicyPCR(), followed by Esys_Pol=
icyGetDigest() and then I seal against that digest. How would I add the Pol=
icyOR step? Would I do an Esys_PolicyPCR() & Esys_PolicyGetDigest() for eac=
h set of PCR values, followed by a Esys_PolicyOR() and then another Esys_Po=
licyGetDigest() to get the final digest to seal against? What would the uns=
eal process look like?

Thanks,
Mike
--===============6016493535160907866==--

