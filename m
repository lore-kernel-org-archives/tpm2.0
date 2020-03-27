Content-Type: multipart/mixed; boundary="===============5884271806483940150=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Failed to initialize tcti context: 0x1
Date: Fri, 27 Mar 2020 15:07:03 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB38A6@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200326223940.2692.93288@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5884271806483940150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: sedigj(a)gmail.com [mailto:sedigj(a)gmail.com]
> Sent: Thursday, March 26, 2020 5:40 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Failed to initialize tcti context: 0x1
> =

> Have you got other tpm2_ commands to work?
> If you are trying to interact with actual hardware (not emulator) like I =
was when I
> encountered this error I found I had to run commands like:
> =

> sudo tpm2_<command> -T device
> =

> and then things would work. On Ubuntu 18.04.

Ahh your using the device node directly. You probably just wont to chgrp th=
at
And share a common group with users that need access.

Im surprised theirs not some default udev rules or however they do it now a=
days.
@tstruk, do you know what the guidance is on permissions for /dev/tpm[0-9]+?

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============5884271806483940150==--

