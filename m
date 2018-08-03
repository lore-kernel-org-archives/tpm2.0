Content-Type: multipart/mixed; boundary="===============4191342680864337268=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: Re: [tpm2] AIK Enrollment Process implementations using tpm2-tools or
 similar
Date: Fri, 03 Aug 2018 13:02:53 +0200
Message-ID: <CANtcRX5B9dJG_tHS+dkjG6cLD8pw+dJyy-SGg4pW78VOtYAi2w@mail.gmail.com>
In-Reply-To: 15CA292A0CD93849BA2105D0F0B2D8A1EB980A80@ORSMSX105.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4191342680864337268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks!

Does it seem like a correct understanding of that the proof of
possession process is something like follows;

1. Client -> CA.identityRequestGetChallenge( AIK, EKCert )

2. Client receives challenge [RSA encrypted AES key, AES encrypted data]

3. Client uses endorsement key and tool/command
tpm2_activatecredential to decrypt RSA blob (the AES key)

4. Client decrypt the AES block using the AES key, yielding the proper
response (proof of possession)

5. Client -> CA.identityRequestSubmitResponse ( response )

6. Client receive the AIKCert

(Based my understanding on HisPrivacyCAWebService2Impl.java and
various threads about tpm2_activetecredential being involved in how to
proving ownership.)

https://github.com/OpenAttestation/OpenAttestation/blob/e34fa3be4a4ce199d34=
8f12e62265ec853b4d5fa/trust-agent/HisPrivacyCAWebServices2/src/main/java/go=
v/niarl/his/webservices/hisPrivacyCAWebService2/server/HisPrivacyCAWebServi=
ce2Impl.java

Presumably the AES operations in Open Attestation are very
implementation specific and could be replaced with more modern modes
of operations.

//P
On Wed, Aug 1, 2018 at 6:38 PM Agerstam, Mats G
<mats.g.agerstam(a)intel.com> wrote:
>
> I think Open CIT (Cloud Integrity Technology) supersedes OpenAttestation.=
 More details on that can be found here:
> https://github.com/opencit/opencit/wiki/Open-CIT-3.2-Product-Guide
>
> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Roberts, Wil=
liam C
> Sent: Wednesday, August 1, 2018 9:29 AM
> To: Peter Magnusson <blaufish.public.email(a)gmail.com>; tpm2(a)lists.01.=
org
> Subject: Re: [tpm2] AIK Enrollment Process implementations using tpm2-too=
ls or similar
>
> I dug around and someone pointed me to this:
> https://github.com/OpenAttestation/OpenAttestation
>
> Unfortunately, I know nothing beyond that (typical problem for me).
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Peter Magn=
usson
> > Sent: Wednesday, August 1, 2018 3:55 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] AIK Enrollment Process implementations using tpm2-tools=
 or
> > similar
> >
> > Hello,
> >
> > TL;DR:
> > Is there any AIK Enrollment / POP examples available using tpm2-tools (=
or other
> > open source tools, code bases)?
> >
> > Long version:
> >
> > I had some success with tpm2-tools based attestation, e.g. generating A=
IK,
> > extracting EKpub and EKCert from TPM, performing the tpm2 quotation, et=
c.
> >
> > However, my understanding of the relevant spec's is that for TPM2 User =
Devices
> > (and many other devices), the EK is limited to performing the Enrolment
> > Processes (Proof of Possession). So to complete a meaningful Remote
> > Attestation flow, there is a need to get AIKCert externally using AIK E=
nrollment
> > Process[1] against an Attestation CA (formerly known as Privacy CA).
> >
> > I fail to find public examples (tools, example code, etc) of the enrolm=
ent step.
> > Most of what I find when googling, for example strongswan's TPM pages,
> > appears to skip the AIK Enrollment Process / POP and just issue the the=
 certificate
> > without any proof of possession.
> >
> > Any links or insights would be appreciated =3D)
> >
> >
> > [1]. Section 2.3.
> > https://trustedcomputinggroup.org/wp-
> > content/uploads/IWG_CMC_Profile_Cert_Enrollment_v1_r7.pdf
> > _______________________________________________
> > tpm2 mailing list
> > tpm2(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/tpm2
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============4191342680864337268==--

