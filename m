Content-Type: multipart/mixed; boundary="===============6097030044711107076=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: Re: [tpm2] AIK Enrollment Process implementations using tpm2-tools or
 similar
Date: Fri, 24 Aug 2018 11:14:37 +0200
Message-ID: <CANtcRX596gicT4Ei9UiE44J4jDqORo2OVJU1x4PkQ-C7cV0qgQ@mail.gmail.com>
In-Reply-To: b1004831-05cd-42d8-d18e-8e2993330f26@arm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6097030044711107076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks,

No I don't recall seeing the ibmtpm20acs project before.

I did find openattestation, opencit projects bit big and challenging,
and started a very simple demo-project using a few of the
gov.niarl.his.privacyca from them.
https://github.com/blaufish/Tpm2AttestationCertificationAuthority
* Just a command line tool, no server etc for the CA demo, all
complexity possible to strip away has been stripped away.
* Verifies EKpub against a TPM manufacturers key.  (very basic,
correct signer =3D> success, not a full PKI/cert check)
* Encrypts to the TPM's Endoresement Key (public) so only the TPM can
decrypt using TPM2_ActivateCredential (using gov.niarl.his.privacyca).
* Creates a TPM2_ActivateCrential compatible with tpm2tools 3.1.0.
* The credential contains an AES key for decrypting the AK certificate.

The AKpub parsing is hardcoded to exact structure presented by my TPM,
so it isn't really a portable project currently, others report
different structures.
Overall quite untested code, but 99% of the complexity stripped away :)

Thanks.
//P

On Thu, Aug 23, 2018 at 11:44 PM Stuart Yoder <stuart.yoder(a)arm.com> wrot=
e:
>
> BTW-- have you seen the IBM Attestation Client/Sever project for TPM 2.0:
> https://sourceforge.net/projects/ibmtpm20acs/
>
> One potentially helpful doc show a provisioning flow:
> https://sourceforge.net/projects/ibmtpm20acs/files/Tutorials/AttestProv.p=
df/download
>
> Thanks,
> Stuart
>
> On 8/3/18 6:02 AM, Peter Magnusson wrote:
>
> Thanks!
>
> Does it seem like a correct understanding of that the proof of
> possession process is something like follows;
>
> 1. Client -> CA.identityRequestGetChallenge( AIK, EKCert )
>
> 2. Client receives challenge [RSA encrypted AES key, AES encrypted data]
>
> 3. Client uses endorsement key and tool/command
> tpm2_activatecredential to decrypt RSA blob (the AES key)
>
> 4. Client decrypt the AES block using the AES key, yielding the proper
> response (proof of possession)
>
> 5. Client -> CA.identityRequestSubmitResponse ( response )
>
> 6. Client receive the AIKCert
>
> (Based my understanding on HisPrivacyCAWebService2Impl.java and
> various threads about tpm2_activetecredential being involved in how to
> proving ownership.)
>
> https://github.com/OpenAttestation/OpenAttestation/blob/e34fa3be4a4ce199d=
348f12e62265ec853b4d5fa/trust-agent/HisPrivacyCAWebServices2/src/main/java/=
gov/niarl/his/webservices/hisPrivacyCAWebService2/server/HisPrivacyCAWebSer=
vice2Impl.java
>
> Presumably the AES operations in Open Attestation are very
> implementation specific and could be replaced with more modern modes
> of operations.
>
> //P
> On Wed, Aug 1, 2018 at 6:38 PM Agerstam, Mats G
> <mats.g.agerstam(a)intel.com> wrote:
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
> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Peter Magnus=
son
> Sent: Wednesday, August 1, 2018 3:55 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] AIK Enrollment Process implementations using tpm2-tools or
> similar
>
> Hello,
>
> TL;DR:
> Is there any AIK Enrollment / POP examples available using tpm2-tools (or=
 other
> open source tools, code bases)?
>
> Long version:
>
> I had some success with tpm2-tools based attestation, e.g. generating AIK,
> extracting EKpub and EKCert from TPM, performing the tpm2 quotation, etc.
>
> However, my understanding of the relevant spec's is that for TPM2 User De=
vices
> (and many other devices), the EK is limited to performing the Enrolment
> Processes (Proof of Possession). So to complete a meaningful Remote
> Attestation flow, there is a need to get AIKCert externally using AIK Enr=
ollment
> Process[1] against an Attestation CA (formerly known as Privacy CA).
>
> I fail to find public examples (tools, example code, etc) of the enrolmen=
t step.
> Most of what I find when googling, for example strongswan's TPM pages,
> appears to skip the AIK Enrollment Process / POP and just issue the the c=
ertificate
> without any proof of possession.
>
> Any links or insights would be appreciated =3D)
>
>
> [1]. Section 2.3.
> https://trustedcomputinggroup.org/wp-
> content/uploads/IWG_CMC_Profile_Cert_Enrollment_v1_r7.pdf
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>
>

--===============6097030044711107076==--

