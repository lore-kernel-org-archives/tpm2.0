Content-Type: multipart/mixed; boundary="===============6769012117304651633=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: ActivateCredential not working
Date: Thu, 16 Jan 2020 22:43:25 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E6705F@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 8592e618-4b74-14cd-bb81-a35e783afce1@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6769012117304651633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<snip>
> Hello,
> =

> the gist looks very good, thanks for sharing.
> A quick question, tho.
> =

> Sometime you use create_primary, sometimes you use createek
> =

> https://gist.github.com/dnoliver/04364e72d8b81368f72ad4e6896f688d#file-
> enrollment-sh-L19
> =

> https://gist.github.com/dnoliver/04364e72d8b81368f72ad4e6896f688d#file-
> enrollment-sh-L41
> =

> =

> Is it true that those commands are interchangeable

tpm2_createek is just a specific call to tpm2_createprimary with a very spe=
cific template for
the object. That template is defined in the EK profile spec:

https://trustedcomputinggroup.org/wp-content/uploads/TCG_IWG_Credential_Pro=
file_EK_V2.1_R13.pdf

<snip>
--===============6769012117304651633==--

