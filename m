Content-Type: multipart/mixed; boundary="===============7618457288091695912=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How do I use Microsoft's sim (TSS.MSR) with lib tss2-esys
Date: Thu, 10 Mar 2022 16:17:13 +0000
Message-ID: <394a2d08fa6151131b6bbac9a3dc184b28fea433.camel@intel.com>
In-Reply-To: CAMs2GArBD5c5M-CPxUiUd4F2Gq7qChkFfwKxOyPXiG0v67C5HQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7618457288091695912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-03-09 at 13:08 -0800, Markus Willhelm Schmid wrote:
> Thanks Bill, =

> =

> I am a noob and I am just trying to learn. I have no TPM on my
> computer so I have to use a simulator.
> =

> I am a little confused since this page: =

> https://sourceforge.net/projects/ibmswtpm2/
> Says: The latter implements the protocol exposed by the Microsoft
> software TPM2 simulator. Google sent me to: =

> https://www.microsoft.com/en-us/download/details.aspx?id=3D52507
> =

> When you say IBM simulator, are you referring to: =

> https://sourceforge.net/projects/ibmtpm20tss/
> If so, this code will not compile on Windows or Linux. I tried to
> bypass the ifdef for OpenSSL version check in the headers, but I then
> got a lot of errors. I believe this code requires an ancient
> (unspecified) OpenSSL version. Also, I could not find anything pre-
> built.

That's the TSS which provides an API to the TPM, nothing more, nothing
less.

This is the reference implementation of a TPM2.0 simualtor by
microsoft:
  - https://www.microsoft.com/en-us/download/details.aspx?id=3D52507

The download says TSS but if you follow the link from this page:
  - =

https://www.microsoft.com/en-us/research/project/the-trusted-platform-modul=
e-tpm/

its really the simulator as pre-built binary (the zip file name says
simulator as well)

The source for the MS simulator is open source and found here:
  - https://github.com/microsoft/ms-tpm-20-ref

This is the ibmtpm simulator which is the reference code/microsoft
simulator massaged for linux and ken adds a few things if IIUC:
  - https://sourceforge.net/projects/ibmswtpm2/


The interface (2 sockets) to the simulators between the IBM and MS
versions is identical. In tpm2-tss world, they use the mssim tcti.

<snip>

--===============7618457288091695912==--

