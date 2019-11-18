Content-Type: multipart/mixed; boundary="===============2945933919448517678=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Any suggestions on how to lock a TPM without passwords?
Date: Mon, 18 Nov 2019 13:51:04 -0800
Message-ID: <CAOCvsSn5gYap6ZmX_dOtMdPPdsoZuZbie-TS-x+tXB94me3Nsw@mail.gmail.com>
In-Reply-To: CAOCvsSnb=fJf_Jqh1_uaWQC-F50K0Xn5R3AVCYRdJay5iSAMMw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2945933919448517678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've done my experimenting with writelocking using a tools 4.1 rc0
build I've got kicking around and some more spec reading.
tpm2_nvwritelock isn't enough to actually secure an index against
tampering until the next reboot.  The problem is it doesn't block
undefine calls.
There is an NV attribute which would allow control of deletion
behavior TPMA_NV_POLICY_DELETE but according to the standard Vol 1
section
37.2.22 : "If the Index to be created has its TPMA_NV_POLICY_DELETE
attribute SET, then platform authorization is required for
allocation."
This is said to be necessary to prevent a user from shooting
themselves in the foot with an undeleteable-by-default object that can
only be
removed by the platform.  But thanks to the PPI I ~can~ reliably get
the platform to delete this.

Is NV Write Lock with owner authorization even useful?
--===============2945933919448517678==--

