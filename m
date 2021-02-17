Content-Type: multipart/mixed; boundary="===============1502139556409560078=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: building tpm tools - only built one tool?
Date: Wed, 17 Feb 2021 16:45:04 +0000
Message-ID: <20210217164504.2937.47739@ml01.vlan13.01.org>
In-Reply-To: OF2ABF8AAD.CC53FE67-ON0025867E.00776245-8525867E.0077F86F@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1502139556409560078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tpm2_tools and tss2_tools are now a busybox style commandlet. Ie
tpm2_getrandom becomes tpm2 getrandom. make install will install symlinks
to the old tool names and the tpm2 commandlet will interrogate argv[0] for
the command to run. This will provide backwards compatibility if they are
installed. If you wish to use the old names not installed system wide, set
DESTDIR during install to a separate path and set the proper directory on
PATH.

Thanks and regards,

Imran Desai
--===============1502139556409560078==--

