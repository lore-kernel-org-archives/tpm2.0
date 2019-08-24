Content-Type: multipart/mixed; boundary="===============4086642883695243249=="
MIME-Version: 1.0
From: Zhao, Shirley <shirley.zhao at intel.com>
Subject: Re: [tpm2] [Help] what the default parameter of tpm2-tools
Date: Sat, 24 Aug 2019 09:33:27 +0000
Message-ID: <A888B25CD99C1141B7C254171A953E8E49068226@shsmsx102.ccr.corp.intel.com>
In-Reply-To: 15833d16-f422-0066-0c4d-131b0d3a36f9@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4086642883695243249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Tadeusz, =


Still can't work after create the link =

$ ln -s /usr/local/lib/libtss2-tcti-mssim.so /usr/local/lib/libtss2-tcti-de=
fault.so. =


Does it have version requirement? =

I use the version of 2.1.0. =


- Shirley =



-----Original Message-----
From: Struk, Tadeusz =

Sent: Saturday, August 24, 2019 1:45 AM
To: Zhao, Shirley <shirley.zhao(a)intel.com>; tpm2(a)lists.01.org
Subject: Re: [tpm2] [Help] what the default parameter of tpm2-tools

On 8/15/19 2:14 AM, Zhao, Shirley wrote:
> Previously, run tpm2_tool command can connect to simulator directly.
> =

> But this time, I got error like.
> =


Hi,
Have you uninstalled (make uninstall) the previous versions of the software=
 before installing the more recent versions?
You can make the tools talking directly to the simulator by creating a link=
 libtss2-tcti-default.so pointing to libtss2-tcti-mssim.so:

$ unlink /usr/local/lib/libtss2-tcti-default.so
$ ln -s /usr/local/lib/libtss2-tcti-mssim.so /usr/local/lib/libtss2-tcti-de=
fault.so

--
Tadeusz

--===============4086642883695243249==--

