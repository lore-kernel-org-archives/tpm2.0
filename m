Content-Type: multipart/mixed; boundary="===============8500776471014285189=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Information Needed on FAPI Usage
Date: Tue, 21 Jul 2020 10:34:36 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0171B92A36@exch2010c.sit.fraunhofer.de>
In-Reply-To: SN6PR11MB34372D9CC72CEB006758F3BBB8780@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8500776471014285189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> > *       How to specify the Unique value in the profile while creating t=
he SRK
> > This is currently not forseen. Is this really necessary ?
> > We're currently using the most-used template.
> =

> Andreas is this not true, am I misreading the code?
> =

> My response yesterday:
> > I don't think there is.... the SRK follows the EK but with a few change=
s.
> > https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-
> > Provisioning-Guidance-Published-v1r1.pdf
> > https://trustedcomputinggroup.org/wp-
> > content/uploads/Credential_Profile_EK_V2.0_R14_published.pdf
> >
> > So the unique values come from reading the NV index and it looks like
> > ifapi_init_primary_async() handles that case.
> > https://github.com/tpm2-software/tpm2-
> > tss/blob/72ecf7c1eec2c40f9daf93f9ac3eaedc5afb95e0/src/tss2-fapi/fapi_u
> > til.c

For the EK, we follow the Credential Profile (which includes the Unique val=
ue of
64/256 Zeros. We need to do so, because of the EK Cert.
For the SRK we deviate, because most SRKs have a Unique value of 0 length;
which is different from the Provisioning Guidance.
That choice was made based on SRKs "in the wild" for which none set the
Unique value (pkcs11 and both openssl-engines).
Also should not matter too much, because you can retrieve the exact SRK that
was used for the primary from the FAPI API or the SRK is even persistent.
--===============8500776471014285189==--

