Content-Type: multipart/mixed; boundary="===============3035009638635480936=="
MIME-Version: 1.0
From: Tricca, Philip B <philip.b.tricca at intel.com>
Subject: Re: [tpm2] ESYS API pull request review to start 2018-02-05
Date: Fri, 16 Feb 2018 18:41:21 +0000
Message-ID: <DB638850A6A2434A93ECADDA0BC838905F124692@ORSMSX103.amr.corp.intel.com>
In-Reply-To: a525b28f-aaf3-58c1-7b13-1c4d8d52d22e@twobit.us
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3035009638635480936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We got started a bit late, and the review ran a bit late, but the PR adding=
 the Enhanced System API (Esys, aka ESAPI) has now been merged into our TSS=
2 library repo: https://github.com/tpm2-software/tpm2-tss/commit/ff821bd3ed=
112c3ddfb27aadd6898789a2545d2d. Our PR queue is now unblocked and I'll be s=
pending some time today doing the usual maintenance that's built up. Thanks=
 to everyone who put some of their time into the review. =


Special thanks to SIT for all of their hard work writing the code and worki=
ng with us through the review, and to Infineon for sponsoring the work and =
enabling its release as OSS.

For those looking to work with the ESAPI library now that it's been merged,=
 the TCG has reshuffled their website (... again) and the spec is now here:=
 https://trustedcomputinggroup.org/tcg-tss-2-0-enhanced-system-api-esapi-sp=
ecification/

Regards,
Philip

-----Original Message-----
From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of philip.b.tricc=
a(a)intel.com
Sent: 1 February, 2018 23:39
To: tpm2(a)lists.01.org
Cc: linux-integrity(a)vger.kernel.org
Subject: [tpm2] ESYS API pull request review to start 2018-02-05

Sorry for the spam but this topic has been discussed at the plumbers TPM mi=
croconf and so I thought the wider audience might find this interesting / r=
elevant:

The OSS implementation of of the TCG TSS2 core libraries / APIs is working =
its way toward a version 2.0 release and we're a few days away from startin=
g a pull request & review that will add the "Enhanced System API". This new=
 API adds additional features like automating the application side of the h=
ash and encryption operations for HMAC and encrypted sessions.

If you're interested the spec is available here:
https://trustedcomputinggroup.org/wp-content/uploads/TSS_ESAPI_Version-0.9_=
Revision-04_reviewEND030918.pdf

Given the size of this generous code contribution (our thanks to Fraunhofer=
 SIT and Infineon), this PR will be under review for several days. During t=
his time lower priority PRs will be delayed and we may build up a bit of a =
queue.

--===============3035009638635480936==--

