Content-Type: multipart/mixed; boundary="===============1723252723743007485=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Any suggestions on how to lock a TPM without passwords?
Date: Tue, 19 Nov 2019 14:06:52 -0800
Message-ID: <CAOCvsSmfVbPyq2f72KL=oZFoLqDLhm2x+djc=B-Z7cYRwY+vjg@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E4569B@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1723252723743007485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That would be acceptable, it would essentially link reset of the
version field to a crypto erase.  The Linux kernel already has a sysfs
interface for requesting Physical Presence operations so the operation
to clear can be kicked off from software and confirmed by a user on
next boot.  It's not going to happen, but it would be workable.
Probably safer than trying to use counters for it.

A new idea, related to yours:
An NV index with authread and policywrite.
Policy is probably a pcr policy +  policyauthorized.
On boot the initramfs checks the attributes then verifies the policy
fits the formula and a given signature.
It then trusts the contents of this NV index.
If the index has incorrect attributes it spoils the PCRs used to unseal sec=
rets.
If a USB installer validates as an old version it spoils the PCRs
backing the secrets.
If the version on the system disk validates to a newer version it uses
policy auth to write a new version to the NV index.
It always extends one of the PCRs used in the policy to authorize the
NV region to revoke write access before handing off control to the
real init.
--===============1723252723743007485==--

