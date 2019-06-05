Content-Type: multipart/mixed; boundary="===============6341932497687386387=="
MIME-Version: 1.0
From: Jordan Hand <jordanhand22 at gmail.com>
Subject: [tpm2] TPM Object Duplication questions
Date: Wed, 05 Jun 2019 09:38:59 -0700
Message-ID: <CAEjdKLUMe57kaVezfaugXYntWz8XjHCQvh86xfM1=iC9La5epw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6341932497687386387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I am wondering, is it possible to have the TPM duplicate a key without
adding a policy digest with
=E2=80=9CEsys_PolicyCommandCode(TPM2_CC_DUPLICATION)=E2=80=9D to the object=
's
authPolicy.

Here is why I ask:

I have some data that I want to (1) seal to the PCR state on a TPM
with EK, duplicate,  (2) import/load on the same TPM as a child of the
EK, and (3) unseal. I do this to test unsealing data that was sealed
remotely.

For background on why I need to do this: The remote service whose
behavior I am emulating doesn't use a TPM to do the sealing, it
implements the same functionality outside the TPM and uses the EK pub
it gets from the client. But I am not able to run this code in my
tests.

The flow I use is:
* Create and start a trial session
* call Esys_PolicyCommandCode(TPM2_CC_DUPLICATION) on the session
* call Esys_PolicyPcr on the session
* Get the digest of the session
* Set session digest as inPub.publicArea.authPolicy
* Esys_CreateObject
* Esys_Load(createdObject)
* Start policy session
* call same Esys_PolicyCommandCode and Esys_PolicyPcr
* Esys_Duplicate

This works fine. Now the problem is that the created object requires a
policy that has Esys_PolicyCommandCode and Esys_PolicyPcr set. But the
caller to Esys_Unseal should be able to unseal with just the PolicyPcr
session. I need to set PolicyCommandCode to duplicate the object but
then I don=E2=80=99t want to enforce that policy during Unseal. It seems li=
ke
the policy digest from authPolicy needs to match exactly the session
digest I use when calling Esys_Unseal.

The other option is to create the object outside the TPM and just
implement all the object creation/sealing myself. But I would rather
have the TPM do the heavy lifting.

Please let me know if I can clarify anything here.

Thanks,

Jordan

--===============6341932497687386387==--

