Content-Type: multipart/mixed; boundary="===============2917055040091803614=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: Re: [tpm2] PCR missing SHA-512 support
Date: Fri, 25 May 2018 15:03:19 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3D49287@ORSMSX108.amr.corp.intel.com>
In-Reply-To: 1224568147.415356.1527257069951.JavaMail.zimbra@lsd.ufcg.edu.br
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2917055040091803614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ricardo,

My guess is it is a tpm2-tss  or tpm2-tools bug, not a simulator issue.

That is especially true since we tend to use the Microsoft/IBM tpm2 simulat=
or, which, by default, has the SHA-512 PCR bank disabled.

Yes, it looks like this:
https://github.com/tpm2-software/tpm2-tools/issues/1021

Could you add your information to issue #1021 or file a new issue if it is =
different?

Dan


--===============2917055040091803614==--

