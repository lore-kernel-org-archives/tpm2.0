Content-Type: multipart/mixed; boundary="===============3695903663738795115=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: abrmd crashing - how to debug? - dbus logs?
Date: Mon, 15 Mar 2021 19:15:38 -0700
Message-ID: <755f9025-b569-864f-c2c4-a33c13991b83@gmail.com>
In-Reply-To: OFACEAAC77.2AC958C7-ON00258696.004DC513-85258696.004F3B10@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3695903663738795115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/12/21 6:25 AM, Kenneth Goldman wrote:
>> CRITICAL **: 10:43:39.780: CreateConnection expected to return 1
>> handles, received 2
>>
>> what might happen is that for whatever reason it leaks one of this dbus
>> proxy objects on every pcr_read and finally runs out of them.
>> It might be that it is very WSL specific.
> =

> I don't think it's a hard limit. =C2=A0As I said, it runs longer after
> debug is turned on and longer with a sleep. =C2=A0The actual failure
> count varies a lot from run to run.

Ken,
Could you try if this patch fixes the problem for you:
https://patch-diff.githubusercontent.com/raw/tpm2-software/tpm2-abrmd/pull/=
770.patch

Thanks,
Tadeusz
--===============3695903663738795115==--

