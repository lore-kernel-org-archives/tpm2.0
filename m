Content-Type: multipart/mixed; boundary="===============7886540040112325552=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: The script of tpm2_policyauthorize failed 
Date: Thu, 07 May 2020 17:00:22 +0000
Message-ID: <20200507170022.2843.27582@ml01.vlan13.01.org>
In-Reply-To: BL0PR11MB32527E92B39F79A922D39A848DA50@BL0PR11MB3252.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7886540040112325552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In a quick glance, I can see that you are not satisfying the policypcr afte=
r started the policysession and prior to running policyauthorize. You can r=
eference the example in the man page - https://github.com/tpm2-software/tpm=
2-tools/blob/master/man/tpm2_policyauthorize.1.md
--===============7886540040112325552==--

