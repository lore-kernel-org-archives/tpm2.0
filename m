Content-Type: multipart/mixed; boundary="===============7568531217073942965=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: tpm2_getekcertificate: certificate not found on Infineon
 SLB 9670
Date: Thu, 19 Nov 2020 14:47:50 +0000
Message-ID: <20201119144750.2865.63235@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB34377E077B4739794A1DC28DB8E10@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7568531217073942965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Looks like CURL returns CURL_OK despite HTTP 404 errors.
It needs a flag like https://curl.se/libcurl/c/CURLOPT_FAILONERROR.html

This will cause the return code to be 0 even with the latest tools.

@nicolasoliver, can you please create the issue on github?

Thanks and regards,

Imran Desai
--===============7568531217073942965==--

