Content-Type: multipart/mixed; boundary="===============7931927377835334712=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] how can i use abrmd/tpmrm0 with tpm2-tools
Date: Wed, 12 Dec 2018 07:55:47 -0800
Message-ID: <8f9ee707-d44e-53ee-5946-fb12530587b8@intel.com>
In-Reply-To: 20181212154532.GD1889@carbon
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7931927377835334712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/12/18 7:45 AM, Petko Manolov wrote:
> # tpm2_takeownership -c
> ERROR:tcti:src/tss2-tcti/tcti-device.c:319:Tss2_Tcti_Device_Init() Failed=
 to open device file /dev/tpm0: Device or resource busy
> ERROR: tcti init allocation routine failed for library: "device" options:=
 "(null)"
> ERROR: Could not load tcti, got: "device"
> =

> How do i tell tpm2_xxx to use the userspace daemon instead of /dev/tpm0?
> =

> I'd like to apologize if this has been answered before.  If that's the ca=
se =

> please point me to the corresponding thread.

Try 'man tpm2_takeownership' and find the TCTI ENVIRONMENT and TCTI OPTIONS=
 sections.

-- =

Tadeusz

--===============7931927377835334712==--

