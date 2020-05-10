Content-Type: multipart/mixed; boundary="===============1925988932460585252=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: The script of evictcontrol failed during create ek and ak
Date: Sun, 10 May 2020 21:38:14 +0000
Message-ID: <20200510213814.2843.36012@ml01.vlan13.01.org>
In-Reply-To: BL0PR11MB325260A04C60D926D41980EB8DA30@BL0PR11MB3252.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1925988932460585252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use a resource manager like tpm2-abrmd or /dev/tpmrm0. If that is not an op=
tion in your setup, try flushing contexts at the point where the problem is=
 faced. You can do this by executing "tpm2_flushcontext -t, tpm2_flushconte=
xt -l, tpm2_flushcontext -s"
--===============1925988932460585252==--

