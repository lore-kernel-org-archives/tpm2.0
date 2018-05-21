Content-Type: multipart/mixed; boundary="===============5344338427021867796=="
MIME-Version: 1.0
From: Tony Yip <Juan.Yip at panasonic.aero>
Subject: Re: [tpm2] Documentation for configure
Date: Mon, 21 May 2018 17:09:12 +0000
Message-ID: <AE617DA1151F25478215F3E5790FBCFB15CB9E9D@MAIL-SNA04.mascorp.com>
In-Reply-To: 91741b4a-d8ea-7464-faae-871fcc7a8e9a@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5344338427021867796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Tadeusz. That was what I needed.
________________________________________
From: Tadeusz Struk [tadeusz.struk(a)intel.com]
Sent: Monday, May 21, 2018 9:49 AM
To: Tony Yip; Anderson, Daniel; tpm2(a)lists.01.org
Subject: Re: [tpm2] Documentation for configure

On 05/18/2018 01:49 PM, Tony Yip wrote:
> Anyway, after looking at it some more, I believe I need to use Tss2_Tcti_=
Mssim_Init instead of relying on a default configuration. I still haven't b=
een able to get the debug/trace logs to output however.

Hi Tony,
To enable tracing in runtime you need to set a TSS2_LOG variable.
See https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_tpm2-=
2Dsoftware_tpm2-2Dtss_blob_master_doc_logging.md&d=3DDwIC-g&c=3DlaiMAACGcvA=
xeLF9-K5nZ1uCTN9kBzTH8fWOxFTVLgs&r=3DGVrlcb0t_QREzpaQn_xsFgE-o00NN5nuTSi4_S=
d9gHI&m=3Dq4mSNfsoij2EgXU8TPoH60MhI8zFTlFRzS66Ov2ltCc&s=3Dg6eUy8ub9yn1gupzM=
j8vzLjmQLYjblnJdCGHlft3S3c&e=3D for more details.
--
Tadeusz

--===============5344338427021867796==--

