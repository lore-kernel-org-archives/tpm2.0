Content-Type: multipart/mixed; boundary="===============0999654494618376344=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] Using TPM to protect private key
Date: Wed, 11 Sep 2019 16:45:12 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FF907A19B1@fmsmsx104.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0999654494618376344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ashok, for what you are doing, tpm2-tss-engine may be more suitable. It is =
available here: https://github.com/tpm2-software/tpm2-tss-engine.
The readme has an example of how to create a self signed certificate with t=
he private key generated and protected by the TPM.

If you are planning to do it the tpm2-tools way instead, There are two ways=
 the key can reside as a TPM2 object.
1. Create the key using the tpm2_create command
2. Import an existing key to the TPM2 using tpm2_import or tpm2_loadexterna=
l. (Existing key may be generated with openssl etc.)

In general there is an auth/ passphrase associated with the key. Being root=
 does not give you exclusive access to the tpm2 key. So long as the passphr=
ase or auth is satisfied the key is accessible.

Man pages for the tools is the best place to find examples and explanations=
 for the tools.

All the necessary packages and dependencies information can be found here h=
ttps://github.com/tpm2-software/tpm2-tools/wiki/Dependency-Matrix

Yes we use the IBM simulator for the testing.

You may choose any distribution and install the necessary dependencies. All=
 projects tpm2-software are built with autotools which will hint you on mis=
sing dependencies for your distribution/ installation.

From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of tpm2-request(a)lists.=
01.org [tpm2-request(a)lists.01.org]
Sent: Wednesday, September 11, 2019 4:34 AM
To: tpm2(a)lists.01.org
Subject: tpm2 Digest, Vol 27, Issue 10

Send tpm2 mailing list submissions to
        tpm2(a)lists.01.org

To subscribe or unsubscribe via the World Wide Web, visit
        https://lists.01.org/mailman/listinfo/tpm2
or, via email, send a message with subject or body 'help' to
        tpm2-request(a)lists.01.org

You can reach the person managing the list at
        tpm2-owner(a)lists.01.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of tpm2 digest..."


Today's Topics:

   1. Re: Creating a TPM EK Public object at the server (Rahul Hardikar)
   2. Re: Creating a TPM EK Public object at the server
      (Matthew Dempsky)
   3. Re: Windows Visual Studio 2017: Trying to use
      Tss2_TctiLdr_Initialize (Philip Tricca)
   4. Using TPM to protect private key (Ashok Kumar)


----------------------------------------------------------------------

Message: 1
Date: Tue, 10 Sep 2019 23:51:57 -0700
From: Rahul Hardikar <rahulhardikar(a)gmail.com>
To: Matthew Dempsky <matthew(a)dempsky.org>
Cc: "Roberts, William C" <william.c.roberts(a)intel.com>,
        "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
Subject: Re: [tpm2] Creating a TPM EK Public object at the server
Message-ID:
        <CAP3jAwQc2rJEbD8oBfcW38vG1oFay_B1m8TBd2VsLO+QTs97Kw(a)mail.gmail.c=
om>
Content-Type: text/plain; charset=3D"utf-8"

My confusion is , since my goal is to make sure the (a) TPM is genuine and
(b) the platform actually owns the TPM , technically I don't need the AK
Certificate Signing Request i.e I'm not doing the whole attestation CA
since i don't have any use for the AK Certificate, but my server
application  is going to run the challenge-response protocol to confirm the
client indeed owns the TPM, i.e the platform hardware is legit.
With this in mind, I didn't think it was necessary to send the AK
credentials at all , I just send the AK name to the server so that it can
run Make Credential!  Is that enough? Or am I expected to send AK Public
Object and the server will create AK name by hashing it and then use that
for Make Credential?

Thanks,
Rahul


On Tue, Sep 10, 2019 at 10:17 PM Matthew Dempsky <matthew(a)dempsky.org>
wrote:

> On Tue, Sep 10, 2019 at 9:33 PM Rahul Hardikar <rahulhardikar(a)gmail.com>
> wrote:
>
>> In TPM2.0, do we have to do the same, i.e.
>> - send AK public object along with the AK Cert signed  or
>>
>
> Do you mean "AK certificate signing request" here? If so, yes, this is
> probably the best option.
>
>
>> - would sending the AK name suffice since it is cryptographically linked
>> to EK or
>>
>
> TPM2_ActivateCredential doesn't care what sort of object "name" refers to,
> as long as the TPM has a secret area loaded for it.
>
> So sending the AK name is not sufficient. The server should check the AK's
> public data for suitability as an AK. E.g., you probably want to verify
> that "restricted", "fixedTPM", "fixedParent", "sensitiveDataOrigin", and
> "sign" are set, and "decrypt" is clear.
>
> - do we just send back the credential blob and secret that Make_credential
>> created and since we already have the EK and AK keys loaded in the TPM, =
we
>> don't have to do anything else other than pass the 2 outputs of
>> MakeCredential?
>>
>
> Correct.
>
>>

--===============0999654494618376344==--

