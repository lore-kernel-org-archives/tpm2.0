Content-Type: multipart/mixed; boundary="===============3692975540750035551=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] Re: TPM 2.0 hardware error DA lockout mode
Date: Fri, 03 Jul 2020 18:47:54 +0000
Message-ID: <20200703184754.2663.83758@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB3437F6091BFDC50104185C1FB8850@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3692975540750035551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks all for the reply.

The command below helped me resolve the issue.
"tpm2_takeownership -c -L <PWD> -O <PWD> -E <PWD>"
--===============3692975540750035551==--

