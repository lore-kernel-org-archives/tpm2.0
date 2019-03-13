Content-Type: multipart/mixed; boundary="===============3243746835093083745=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 2
Date: Wed, 13 Mar 2019 13:43:18 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D0CA7F@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CA+tUB7DBmVzXwDsHjk4ud5rkspbBGjY-=Cw1pG2oBJu9k36x1Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3243746835093083745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You should probably use a non-primary key for this, nor a restricted key fo=
r this.
Just create a key in the appropriate hierarchy under a primary object via t=
pm2_create

If you need the public portion of an object as a PEM output, tpm2_readpubli=
c will do it.

> -----Original Message-----
> From: arjun kashyap [mailto:arjun21k(a)gmail.com]
> Sent: Thursday, March 7, 2019 11:42 AM
> To: Desai, Imran <imran.desai(a)intel.com>; Roberts, William C
> <william.c.roberts(a)intel.com>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 2
> =

> Thanks William and Imran for your inputs. My use case is that once my sys=
tem
> boots up (with tpm) I should be able to send encrypted data to it over the
> network. I thought I could use the EK as each tpm has a unique and built-=
in one.
> My thought process was to try to use the EK public portion to encrypt the=
 data
> and send it over the network to the tpm and then decrypt it using EK priv=
ate
> portion. As both of you pointed out that I should set appropriate attribu=
tes while
> creating the key and prefer using tpm2_createprimary instead of tpm2_crea=
teek.
> But I have another concern with this approach. With tpm2_createek I could
> extract the public key portion of the EK which gets created. But if I use
> tpm2_createprimary I do not have that option. So could you suggest some
> workaround? Also, please feel free to suggest another approach for this u=
se
> case. Kindly correct me if I am wrong as I am new to tpms.
> =

> Thanks again,
> Arjun
> =

> On Tue, Mar 5, 2019 at 3:27 PM Desai, Imran <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com> > wrote:
> =

> =

> 	For what you want to do, try this.
> =

> 	tpm2_createprimary -a e -G rsa -A
> "fixedtpm|fixedparent|sensitivedataorigin|userwithauth|adminwithpolicy|de=
cr
> ypt" -o key.ctx
> 	tpm2_evictcontrol -a o -c key.ctx -p 0x81010002
> 	tpm2_rsaencrypt -c 0x81010002 -o enc.out plain.txt
> 	tpm2_rsadecrypt -c 0x81010002 -o dec.out -I enc.out
> =

> 	PS: I would not use such a key if I cared about privacy.
> =

> 	=EF=BB=BFOn 3/5/19, 1:50 PM, "Desai, Imran" <imran.desai(a)intel.com
> <mailto:imran.desai(a)intel.com> > wrote:
> =

> 	    +1 to what Bill said. If you must do this I'd suggest you use
> createprimary to create the key under endorsement hierarchy. I understand=
 that
> is exactly what tpm2_createek does but there is a caveat. For what you in=
tend to
> do it requires userwith attribute set to 1. The reason it is not set to 1=
 in createek
> tool is because it would create an endorsement key off a non standard tem=
plate
> per TCK EK credential profile spec. The alternative is to satisfy policys=
ecret of the
> endorsement hierarchy and that will require a change in the tool.
> =

> 	    On 3/5/19, 1:00 PM, "tpm2 on behalf of tpm2-request(a)lists.01.org
> <mailto:tpm2-request(a)lists.01.org> " <tpm2-bounces(a)lists.01.org
> <mailto:tpm2-bounces(a)lists.01.org>  on behalf of tpm2-request(a)lists.0=
1.org
> <mailto:tpm2-request(a)lists.01.org> > wrote:
> =

> 	        Send tpm2 mailing list submissions to
> 	                tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> =

> 	        To subscribe or unsubscribe via the World Wide Web, visit
> 	                https://lists.01.org/mailman/listinfo/tpm2
> 	        or, via email, send a message with subject or body 'help' to
> 	                tpm2-request(a)lists.01.org <mailto:tpm2-request(a)lists=
.01.org>
> =

> 	        You can reach the person managing the list at
> 	                tpm2-owner(a)lists.01.org <mailto:tpm2-owner(a)lists.01.=
org>
> =

> 	        When replying, please edit your Subject line so it is more speci=
fic
> 	        than "Re: Contents of tpm2 digest..."
> =

> =

> 	        Today's Topics:
> =

> 	           1. Re: Use endorsement key for encryption and decryption
> 	              (Roberts, William C)
> =

> =

> 	        ----------------------------------------------------------------=
------
> =

> 	        Message: 1
> 	        Date: Tue, 5 Mar 2019 17:29:10 +0000
> 	        From: "Roberts, William C" <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	        To: arjun kashyap <arjun21k(a)gmail.com
> <mailto:arjun21k(a)gmail.com> >, "tpm2(a)lists.01.org <mailto:tpm2(a)list=
s.01.org>
> "
> 	                <tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	        Subject: Re: [tpm2] Use endorsement key for encryption and
> decryption
> 	        Message-ID:
> =

> <476DC76E7D1DF2438D32BFADF679FC5649CFA6CA(a)ORSMSX101.amr.corp.intel.c
> om
> <mailto:476DC76E7D1DF2438D32BFADF679FC5649CFA6CA(a)ORSMSX101.amr.cor
> p.intel.com> >
> =

> 	        Content-Type: text/plain; charset=3D"utf-8"
> =

> =

> =

> 	        > -----Original Message-----
> 	        > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org <mailto:tpm2-
> bounces(a)lists.01.org> ] On Behalf Of arjun kashyap
> 	        > Sent: Sunday, March 3, 2019 12:58 PM
> 	        > To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	        > Subject: [tpm2] Use endorsement key for encryption and
> decryption
> 	        >
> 	        > Hello all,
> 	        >
> 	        > I am using the IBM tpm2.0 simulator. My use case is that I wou=
ld like
> to encrypt
> 	        > data and send to tpm and then decrypt this at the tpm side. I =
would
> want to use
> 	        > the endorsement key (EK) for this purpose. Hence, I would like=
 to
> encrypt data
> 	        > using EK's public key and decrypt using EK's private key. I tr=
ied
> creating EK using
> 	        > tpm2_createek -G rsa -f pem -c - -p ek.pem. Now, I have the
> ek.pem( public
> 	        > portion of EK) to encrypt the data. When I load this key into =
the tpm
> and invoke
> 	        > tpm2_rsadecrypt I get an error. I also tried using
> tpm2_createprimary to create
> 	        > an EK but failed in the above attempt. Could anyone please hel=
p me
> out so that I
> 	        > can use EK to encrypt/decrypt data.
> 	        >
> 	        > Please let me know if more information is needed.
> =

> 	        What's the error code? You probably can't perform an rsadecrypt,
> 	        Do to object attributes. I would bet sign would work. Endorsement
> 	        usually means signing.
> =

> 	        >
> 	        > Thanks in advance.
> 	        >
> 	        >  <https://www.avast.com/sig-
> 	        > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
> 	        > email&utm_content=3Dwebmail&utm_term=3Dicon>       Virus-free.
> 	        > www.avast.com <http://www.avast.com>
> <https://www.avast.com/sig-
> 	        > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
> 	        > email&utm_content=3Dwebmail&utm_term=3Dlink>
> =

> =

> 	        ------------------------------
> =

> 	        Subject: Digest Footer
> =

> 	        _______________________________________________
> 	        tpm2 mailing list
> 	        tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	        https://lists.01.org/mailman/listinfo/tpm2
> =

> =

> 	        ------------------------------
> =

> 	        End of tpm2 Digest, Vol 21, Issue 2
> 	        ***********************************
> =

> =

> =

> =

> 	_______________________________________________
> 	tpm2 mailing list
> 	tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	https://lists.01.org/mailman/listinfo/tpm2
> =

> =

> =

>  <https://www.avast.com/sig-
> email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
> email&utm_content=3Dwebmail&utm_term=3Dicon> 	 Virus-free.
> www.avast.com <https://www.avast.com/sig-
> email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
> email&utm_content=3Dwebmail&utm_term=3Dlink>


--===============3243746835093083745==--

