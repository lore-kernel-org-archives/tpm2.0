Content-Type: multipart/mixed; boundary="===============3707635224014971620=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] [Help] what the default parameter of tpm2-tools
Date: Fri, 23 Aug 2019 10:45:04 -0700
Message-ID: <15833d16-f422-0066-0c4d-131b0d3a36f9@intel.com>
In-Reply-To: A888B25CD99C1141B7C254171A953E8E49067334@shsmsx102.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3707635224014971620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/15/19 2:14 AM, Zhao, Shirley wrote:
> Previously, run tpm2_tool command can connect to simulator directly.
> =

> But this time, I got error like.
> =


Hi,
Have you uninstalled (make uninstall) the previous versions of the software
before installing the more recent versions?
You can make the tools talking directly to the simulator by creating a link
libtss2-tcti-default.so pointing to libtss2-tcti-mssim.so:

$ unlink /usr/local/lib/libtss2-tcti-default.so
$ ln -s /usr/local/lib/libtss2-tcti-mssim.so /usr/local/lib/libtss2-tcti-de=
fault.so

-- =

Tadeusz

--===============3707635224014971620==--

