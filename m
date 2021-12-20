Content-Type: multipart/mixed; boundary="===============8346623603614474888=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Mon, 20 Dec 2021 10:57:26 -0800
Message-ID: <964b6c7d-f045-c93a-d260-363c79eee8fb@gmail.com>
In-Reply-To: 4055fbd2-3816-6458-f874-ebd194e588b1@sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8346623603614474888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/19/21 04:17, Juergen Repp wrote:
> Am 18.12.21 um 20:34 schrieb Han:
>> I probably missed it,=C2=A0 how can I specify to make sure /dev/tpm0 is =
used, and not /dev/tpmrm0=C2=A0?=C2=A0 Is it in some configurations?
>>
> You can use the TPM without resource manager with:
> =

> tpm2_createprimary  -Tdevice:/dev/tpm0 -C o -g sha256 -G ecc -c primary.c=
tx
> tpm2_getcap handles-transient -Tdevice:/dev/tpm0
> tpm2_flushcontext -Tdevice:/dev/tpm0 0x80000000

The problem is that when /dev/tpm0 is used it just sends a request straight=
 to
the tpm and the tpm responds with a valid error message, which it then pass=
ed =

back to tcti. In case of /dev/tpmrm0 the RM tries to first load the none =

existing object 0x80000000 from its cash, but since it cannot find it just
returns an error code -22 (EINVAL) and nothing gets send to the tpm.
The tpm_dev_async_work() handler needs to be modified to handle such error =
cases
as well. I will send a fix for this.

Thanks,
--
Tadeusz
--===============8346623603614474888==--

