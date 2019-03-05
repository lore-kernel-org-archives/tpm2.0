Content-Type: multipart/mixed; boundary="===============7019342421128036982=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 2
Date: Tue, 05 Mar 2019 21:27:52 +0000
Message-ID: <71B2FF90-DEFD-441F-B734-D86739D855AF@intel.com>
In-Reply-To: F50B7B1A-F3CF-4298-B129-D3650443D5EF@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7019342421128036982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For what you want to do, try this.

tpm2_createprimary -a e -G rsa -A "fixedtpm|fixedparent|sensitivedataorigin=
|userwithauth|adminwithpolicy|decrypt" -o key.ctx
tpm2_evictcontrol -a o -c key.ctx -p 0x81010002
tpm2_rsaencrypt -c 0x81010002 -o enc.out plain.txt
tpm2_rsadecrypt -c 0x81010002 -o dec.out -I enc.out

PS: I would not use such a key if I cared about privacy.

=EF=BB=BFOn 3/5/19, 1:50 PM, "Desai, Imran" <imran.desai(a)intel.com> wrote:

    +1 to what Bill said. If you must do this I'd suggest you use createpri=
mary to create the key under endorsement hierarchy. I understand that is ex=
actly what tpm2_createek does but there is a caveat. For what you intend to=
 do it requires userwith attribute set to 1. The reason it is not set to 1 =
in createek tool is because it would create an endorsement key off a non st=
andard template per TCK EK credential profile spec. The alternative is to s=
atisfy policysecret of the endorsement hierarchy and that will require a ch=
ange in the tool.
    =

    On 3/5/19, 1:00 PM, "tpm2 on behalf of tpm2-request(a)lists.01.org" <tp=
m2-bounces(a)lists.01.org on behalf of tpm2-request(a)lists.01.org> wrote:
    =

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

        -------------------------------------------------------------------=
---
        =

        Message: 1
        Date: Tue, 5 Mar 2019 17:29:10 +0000
        From: "Roberts, William C" <william.c.roberts(a)intel.com>
        To: arjun kashyap <arjun21k(a)gmail.com>, "tpm2(a)lists.01.org"
        	<tpm2(a)lists.01.org>
        Subject: Re: [tpm2] Use endorsement key for encryption and decrypti=
on
        Message-ID:
        	<476DC76E7D1DF2438D32BFADF679FC5649CFA6CA(a)ORSMSX101.amr.corp.int=
el.com>
        	=

        Content-Type: text/plain; charset=3D"utf-8"
        =

        =

        =

        > -----Original Message-----
        > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of arju=
n kashyap
        > Sent: Sunday, March 3, 2019 12:58 PM
        > To: tpm2(a)lists.01.org
        > Subject: [tpm2] Use endorsement key for encryption and decryption
        > =

        > Hello all,
        > =

        > I am using the IBM tpm2.0 simulator. My use case is that I would =
like to encrypt
        > data and send to tpm and then decrypt this at the tpm side. I wou=
ld want to use
        > the endorsement key (EK) for this purpose. Hence, I would like to=
 encrypt data
        > using EK's public key and decrypt using EK's private key. I tried=
 creating EK using
        > tpm2_createek -G rsa -f pem -c - -p ek.pem. Now, I have the ek.pe=
m( public
        > portion of EK) to encrypt the data. When I load this key into the=
 tpm and invoke
        > tpm2_rsadecrypt I get an error. I also tried using tpm2_createpri=
mary to create
        > an EK but failed in the above attempt. Could anyone please help m=
e out so that I
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

    =

    =



--===============7019342421128036982==--

