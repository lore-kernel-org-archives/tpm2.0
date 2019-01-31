Content-Type: multipart/mixed; boundary="===============1145205623155239542=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 19, Issue 12
Date: Thu, 31 Jan 2019 20:06:23 +0000
Message-ID: <5E77A751-8D08-4860-A583-E9B2BBE25E45@intel.com>
In-Reply-To: mailman.21.1548964802.530.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1145205623155239542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yes, EK is also a primary key under endorsement hierarchy. However, the att=
ributes and authpolicy required for the endorsement key to be certified by =
the TPM manufacturer are distinct and are per TCG specification. You can re=
ad the attributes and authpolicy with readpublic tool and compare. This uni=
queness justifies the special case/ tool for the unique primary object unde=
r endorsement hierarchy.

=EF=BB=BFOn 1/31/19, 1:00 PM, "tpm2 on behalf of tpm2-request(a)lists.01.or=
g" <tpm2-bounces(a)lists.01.org on behalf of tpm2-request(a)lists.01.org> w=
rote:

    Send tpm2 mailing list submissions to
    	tpm2(a)lists.01.org
    =

    To subscribe or unsubscribe via the World Wide Web, visit
    	https://lists.01.org/mailman/listinfo/tpm2
    or, via email, send a message with subject or body 'help' to
    	tpm2-request(a)lists.01.org
    =

    You can reach the person managing the list at
    	tpm2-owner(a)lists.01.org
    =

    When replying, please edit your Subject line so it is more specific
    than "Re: Contents of tpm2 digest..."
    =

    =

    Today's Topics:
    =

       1. [tpm2-tools] Question about generating EK (Jordan Hand)
    =

    =

    ----------------------------------------------------------------------
    =

    Message: 1
    Date: Wed, 30 Jan 2019 18:17:39 -0800
    From: Jordan Hand <jordanhand22(a)gmail.com>
    To: tpm2(a)lists.01.org
    Subject: [tpm2] [tpm2-tools] Question about generating EK
    Message-ID:
    	<CAEjdKLUTWj6BjJQkFF=3DOonf=3DLk17vrit+KXXfOpkNsBKLAkL6g(a)mail.gmail.=
com>
    Content-Type: text/plain; charset=3D"utf-8"
    =

    Why do the two following commands generate different RSA keypairs?
    =

    =

    =

       1. tpm2_createek -G rsa -c -
       2. tpm2_createprimary -a e -g sha256 -G rsa
    =

    =

    As I understand it, generating a primary key under the endorsement
    hierarchy using the same algorithm should product the same key. This is
    because the same seed is used to generate both keys with the same
    parameters. Am I missing something about how the TPM generates these ke=
ys?
    =

    =

    =

    Thanks,
    =

    Jordan
    -------------- next part --------------
    An HTML attachment was scrubbed...
    URL: <http://lists.01.org/pipermail/tpm2/attachments/20190130/b1c7aafd/=
attachment-0001.html>
    =

    ------------------------------
    =

    Subject: Digest Footer
    =

    _______________________________________________
    tpm2 mailing list
    tpm2(a)lists.01.org
    https://lists.01.org/mailman/listinfo/tpm2
    =

    =

    ------------------------------
    =

    End of tpm2 Digest, Vol 19, Issue 12
    ************************************
    =



--===============1145205623155239542==--

