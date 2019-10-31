Content-Type: multipart/mixed; boundary="===============0748221361451447013=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: ESYS_TR to TPM2_HANDLE
Date: Thu, 31 Oct 2019 09:08:35 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163B8F69C@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E2BFC8@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0748221361451447013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I don't know if I get it.

I though you would present the persistent-handle in either case and then sa=
y if you persistent to this persistent-handle or if you evicted this perist=
ent-handle ?

Andreas

________________________________________
From: Roberts, William C [william.c.roberts(a)intel.com]
Sent: Monday, October 28, 2019 17:40
To: tpm2(a)lists.01.org
Cc: Struk, Tadeusz; Fuchs, Andreas
Subject: ESYS_TR to TPM2_HANDLE

In tpm2_evictcontrol, I can load a serialized ESYS_TR object. The tool outp=
ut, which I must keep stable, uses a TPM2_HANDLE in the output and whether =
or not that handle
was persisted or evicted. In the case of persisted, that is simple, I know =
it. In the case of evicted, I cannot know it. Is there a way to get the TPM=
2_HANDLE for that
ESYS_TR? I see ESAPI knows it... The other option I have considered is just=
 to print out a 0 or some other dummy value for the handle on evict, but I =
am not super
fond of that.

Bill

--===============0748221361451447013==--

