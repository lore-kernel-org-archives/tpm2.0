Content-Type: multipart/mixed; boundary="===============1363103610011643076=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Thu, 24 Mar 2022 12:08:31 -0700
Message-ID: <fd666b8d-9bfe-89e5-d75d-e22a9bc9afdd@gmail.com>
In-Reply-To: d9e4b269-39ec-b350-a6cc-ffed39b90ba7@sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1363103610011643076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/20/21 14:06, Juergen Repp wrote:
> When /dev/tpmrm0 was used with kernel 5.10.
> After sending the command read public:
> 0x80 0x01 0x00 0x00 0x00 0x0e 0x00 0x00 0x01 0x73 0x80 0x00 0x00 0x00
> the write worked but the poll call in  tcti_device_receive did stuck.
> With kernel 4.19 write for this command did return -1

It took awhile, but the fix is now queued for 5.10.109 and above.
--
Thanks,
Tadeusz
--===============1363103610011643076==--

