Content-Type: multipart/mixed; boundary="===============4575696153938866501=="
MIME-Version: 1.0
From: Litjes, Christian <christian.litjes at philips.com>
Subject: Re: [tpm2] How to clear DA lockout mode ?
Date: Thu, 11 Oct 2018 14:03:41 +0000
Message-ID: <AM0P122MB0099EAA3547CDA52CEE1D68D90E10@AM0P122MB0099.EURP122.PROD.OUTLOOK.COM>
In-Reply-To: 848b1467-f06e-f99b-1af2-f4e117056a78@mikronika.pl
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4575696153938866501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Heey Tomasz,

I'll help you out:
Clear you're tpm from your bios.

PASS=3D"1234"
tpm2_takeownership -T "device" -c
Returns an error, like you mention. This is correct behavior. (I read this =
somewhere can't find the source atm)

tpm2_takeownership -T "device" -l "$PASS"
tpm2_dictionarylockout -T "device" -s -n 30 -l 1200 -t 0 -p "$PASS"

By setting -t to 0 you disable the lockout mode.

Kind Regards,
Christian Litjes

-----Original Message-----
From: tpm2 <tpm2-bounces(a)lists.01.org> On Behalf Of Tomasz Przybysz
Sent: donderdag 11 oktober 2018 11:00
To: tpm2(a)lists.01.org
Subject: Re: [tpm2] How to clear DA lockout mode ?

Also:
tpm2_takeownership -c
ERROR: Clearing Failed! TPM error code: 0x921
ERROR: Unable to run tpm2_takeownership

_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.=
01.org%2Fmailman%2Flistinfo%2Ftpm2&amp;data=3D02%7C01%7C%7C4def8b29c0af4070=
d05408d62f57e9b0%7C1a407a2d76754d178692b3ac285306e4%7C0%7C0%7C6367484519614=
07815&amp;sdata=3DzmyqQCHATgm7Xu%2Fx7o3LCBurHqdy4TAkV8OzWxkXhug%3D&amp;rese=
rved=3D0

________________________________
The information contained in this message may be confidential and legally p=
rotected under applicable law. The message is intended solely for the addre=
ssee(s). If you are not the intended recipient, you are hereby notified tha=
t any use, forwarding, dissemination, or reproduction of this message is st=
rictly prohibited and may be unlawful. If you are not the intended recipien=
t, please contact the sender by return e-mail and destroy all copies of the=
 original message.

--===============4575696153938866501==--

