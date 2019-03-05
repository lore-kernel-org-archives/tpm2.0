Content-Type: multipart/mixed; boundary="===============1597041826989688759=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 2
Date: Tue, 05 Mar 2019 20:50:05 +0000
Message-ID: <F50B7B1A-F3CF-4298-B129-D3650443D5EF@intel.com>
In-Reply-To: mailman.14.1551816001.20077.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1597041826989688759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+1 to what Bill said. If you must do this I'd suggest you use createprimary=
 to create the key under endorsement hierarchy. I understand that is exactl=
y what tpm2_createek does but there is a caveat. For what you intend to do =
it requires userwith attribute set to 1. The reason it is not set to 1 in c=
reateek tool is because it would create an endorsement key off a non standa=
rd template per TCK EK credential profile spec. The alternative is to satis=
fy policysecret of the endorsement hierarchy and that will require a change=
 in the tool.

=EF=BB=BFOn 3/5/19, 1:00 PM, "tpm2 on behalf of tpm2-request(a)lists.01.org=
" <tpm2-bounces(a)lists.01.org on behalf of tpm2-request(a)lists.01.org> wr=
ote:

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

       1. Re: Use endorsement key for encryption and decryption
          (Roberts, William C)
    =

    =

    ----------------------------------------------------------------------
    =

    Message: 1
    Date: Tue, 5 Mar 2019 17:29:10 +0000
    From: "Roberts, William C" <william.c.roberts(a)intel.com>
    To: arjun kashyap <arjun21k(a)gmail.com>, "tpm2(a)lists.01.org"
    	<tpm2(a)lists.01.org>
    Subject: Re: [tpm2] Use endorsement key for encryption and decryption
    Message-ID:
    	<476DC76E7D1DF2438D32BFADF679FC5649CFA6CA(a)ORSMSX101.amr.corp.intel.c=
om>
    	=

    Content-Type: text/plain; charset=3D"utf-8"
    =

    =

    =

    > -----Original Message-----
    > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of arjun ka=
shyap
    > Sent: Sunday, March 3, 2019 12:58 PM
    > To: tpm2(a)lists.01.org
    > Subject: [tpm2] Use endorsement key for encryption and decryption
    > =

    > Hello all,
    > =

    > I am using the IBM tpm2.0 simulator. My use case is that I would like=
 to encrypt
    > data and send to tpm and then decrypt this at the tpm side. I would w=
ant to use
    > the endorsement key (EK) for this purpose. Hence, I would like to enc=
rypt data
    > using EK's public key and decrypt using EK's private key. I tried cre=
ating EK using
    > tpm2_createek -G rsa -f pem -c - -p ek.pem. Now, I have the ek.pem( p=
ublic
    > portion of EK) to encrypt the data. When I load this key into the tpm=
 and invoke
    > tpm2_rsadecrypt I get an error. I also tried using tpm2_createprimary=
 to create
    > an EK but failed in the above attempt. Could anyone please help me ou=
t so that I
    > can use EK to encrypt/decrypt data.
    > =

    > Please let me know if more information is needed.
    =

    What's the error code? You probably can't perform an rsadecrypt,
    Do to object attributes. I would bet sign would work. Endorsement
    usually means signing.
    =

    > =

    > Thanks in advance.
    > =

    >  <https://www.avast.com/sig-
    > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
    > email&utm_content=3Dwebmail&utm_term=3Dicon> 	 Virus-free.
    > www.avast.com <https://www.avast.com/sig-
    > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
    > email&utm_content=3Dwebmail&utm_term=3Dlink>
    =

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

    End of tpm2 Digest, Vol 21, Issue 2
    ***********************************
    =



--===============1597041826989688759==--

