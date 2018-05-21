Content-Type: multipart/mixed; boundary="===============8366699730929135157=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] Documentation for configure
Date: Mon, 21 May 2018 09:49:54 -0700
Message-ID: <91741b4a-d8ea-7464-faae-871fcc7a8e9a@intel.com>
In-Reply-To: AE617DA1151F25478215F3E5790FBCFB15CB9CA3@MAIL-SNA04.mascorp.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8366699730929135157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/18/2018 01:49 PM, Tony Yip wrote:
> Anyway, after looking at it some more, I believe I need to use Tss2_Tcti_=
Mssim_Init instead of relying on a default configuration. I still haven't b=
een able to get the debug/trace logs to output however.

Hi Tony,
To enable tracing in runtime you need to set a TSS2_LOG variable.
See https://github.com/tpm2-software/tpm2-tss/blob/master/doc/logging.md fo=
r more details.
-- =

Tadeusz

--===============8366699730929135157==--

