Content-Type: multipart/mixed; boundary="===============0930988447968876898=="
MIME-Version: 1.0
From: dawn.howe at alten.com
Subject: [tpm2] Re: Virtualbox ubuntu 22.04 guest with tpm_server
Date: Mon, 23 May 2022 16:20:52 +0000
Message-ID: <20220523162052.2134.66773@ml01.vlan13.01.org>
In-Reply-To: 20220523181049.FB9B2CCE@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0930988447968876898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the suggestion. I am still not able to get it to work. I also ma=
de sure that my login was in the tss group:
sudo usermod -a -G tss myusername

export TPM2TOOLS_TCTI=3D"tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"
$ tpm2_pcrread
ERROR:tcti:src/tss2-tcti/tctildr.c:428:Tss2_TctiLdr_Initialize_Ex() Failed =
to instantiate TCTI
ERROR: Could not load tcti, got: "tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"
--===============0930988447968876898==--

