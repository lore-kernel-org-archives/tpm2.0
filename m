Content-Type: multipart/mixed; boundary="===============0832293754615940660=="
MIME-Version: 1.0
From: dawn.howe at alten.com
Subject: [tpm2] Re: Virtualbox ubuntu 22.04 guest with tpm_server
Date: Mon, 23 May 2022 22:39:57 +0000
Message-ID: <20220523223957.2134.98287@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB34376AD96431EB78E359BE1BB8D49@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0832293754615940660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

$ pkg-config --libs tss2-tcti-tabrmd
Package tss2-tcti-tabrmd was not found in the pkg-config search path.
Perhaps you should add the directory containing `tss2-tcti-tabrmd.pc'
to the PKG_CONFIG_PATH environment variable
No package 'tss2-tcti-tabrmd' found

$ export PKG_CONFIG_PATH=3D~/tpm2-abrmd/dist
$ pkg-config --libs tss2-tcti-tabrmd
-L/usr/lib64 -ltss2-tcti-tabrmd

So then I did a "make uninstall" on abrmd, tss and tools
set environment variable PKG_CONFIG_PATH, and re-make and installed each
then sudo ldconfig after building abrmd

export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib64
restarted the abrmd, and it worked!!!

Thank you, thank you, thank you!

At least now, I know it's all possible. I'm going to try to repeat everythi=
ng on another VM and carefully record the steps.  I've been trying so much =
stuff I'm afraid there is something I did that I haven't captured.
--===============0832293754615940660==--

