Content-Type: multipart/mixed; boundary="===============5289131326349575721=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: TPM 2.0 over TCP/IP
Date: Mon, 25 Nov 2019 23:16:46 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E47F39@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20191125230416.2967.2031@new-ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5289131326349575721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The payload is just the serialized command buffers, which are described in:
https://trustedcomputinggroup.org/wp-content/uploads/TSS_Marshaling_Unmarsh=
aling_API_Version-1.0_Revision-04_review_ENDS030918.pdf


> -----Original Message-----
> From: pneumiller(a)directstream.com [mailto:pneumiller(a)directstream.com]
> Sent: Monday, November 25, 2019 5:04 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] TPM 2.0 over TCP/IP
> =

> The IBM TPM 2.0 simulator uses TCP/IP to carry the TPM 2.0 commands.  Whe=
re
> is this protocol specified?  I noticed wireshark decodes it.  Is there an=
 IETF RFC or
> some other standard?
> =

> Thanks,
> =

> Phil
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============5289131326349575721==--

