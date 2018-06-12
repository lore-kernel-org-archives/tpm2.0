Content-Type: multipart/mixed; boundary="===============2235175896450791133=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: Re: [tpm2] dlopen()'ing raw .so files considered bad
Date: Tue, 12 Jun 2018 07:43:08 -0400
Message-ID: <20180612114308.GA1648@linux-uys3>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D010EB3CC0F@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2235175896450791133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you everyone!! With the latest master, the .so handling is great:

	# tpm2_pcrlist -v
	tool=3D"tpm2_pcrlist" version=3D"3.0.2-537-ge25e9ee" tctis=3D"dynamic" tct=
i-default=3Dtabrmd dlclose=3Denabled

	# /etc/init.d/tpm2-abrmd start
	Starting TCG TSS2 Access Broker and Resource Management daemon: tpm2-abrmd.

	# tpm2_pcrlist =

	sha1:
	  0 : 0x0000000000000000000000000000000000000000
	  1 : 0x0000000000000000000000000000000000000000
	  2 : 0x0000000000000000000000000000000000000000
	[...]

	# /etc/init.d/tpm2-abrmd stop
	Stopping TCG TSS2 Access Broker and Resource Management daemon: tpm2-abrmd.

	# tpm2_pcrlist -T device:/dev/tpm0
	sha1:
	  0 : 0x0000000000000000000000000000000000000000
	  1 : 0x0000000000000000000000000000000000000000
	  2 : 0x0000000000000000000000000000000000000000
	[...]

--===============2235175896450791133==--

