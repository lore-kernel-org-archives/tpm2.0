Content-Type: multipart/mixed; boundary="===============1266994070223141721=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 8
Date: Wed, 13 Mar 2019 17:58:01 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FF83F237FD@fmsmsx104.amr.corp.intel.com>
In-Reply-To: mailman.990.1552490053.2109.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1266994070223141721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@Rahul why not use tpm2_createek?
________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of tpm2-request(a)lists.=
01.org [tpm2-request(a)lists.01.org]
Sent: Wednesday, March 13, 2019 8:14 AM
To: tpm2(a)lists.01.org
Subject: tpm2 Digest, Vol 21, Issue 8

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

   1. Generating TPM Vendors Primary EK (Rahul Hardikar)
   2. Re: using existing key with tpm2-tss-engine (Roberts, William C)
   3. Re: tpm2 Digest, Vol 21, Issue 2 (Roberts, William C)
   4. Re: using existing key with tpm2-tss-engine (David Woodhouse)


----------------------------------------------------------------------

Message: 1
Date: Tue, 12 Mar 2019 15:55:39 -0700
From: Rahul Hardikar <rahulhardikar(a)gmail.com>
To: tpm2(a)lists.01.org
Subject: [tpm2] Generating TPM Vendors Primary EK
Message-ID:
        <CAP3jAwTo2frWJCzx3L-7AfinWuRgeW70a_t4VPgE0aj6asMdXw(a)mail.gmail.c=
om>
Content-Type: text/plain; charset=3D"utf-8"

Hi,
I'm trying to create EK pair whose public key corresponds to the EKCert's
public key. Unlike the SRK, this one needs Admin with Policy role and I'm
unable to create it.
I'm using ESAPI and trying to implement the tpm2_getmanufec.c code where it
tries to create one.

Any suggestions?
Thanks,
Rahul

--===============1266994070223141721==--

