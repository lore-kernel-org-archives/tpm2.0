Content-Type: multipart/mixed; boundary="===============6743397832858829587=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: get TPM applications to happily co-exist
Date: Wed, 28 Apr 2021 08:15:40 +0000
Message-ID: <AM8P194MB167554BC54141CE6B6FD26B3A6409@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: 2e02c3d9-ca1c-f202-bfc4-b62d9cf9b48d@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6743397832858829587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The tpm2-abrmd as well as the in-kernel resource manager via /dev/tpmrm0 bo=
th perform isolation of "connections", i.e. each tss context (on all apis T=
CTI, SYS; ESYS, FAPI) has an isolated view on the TPM.

That even means if an application opens two ESYS context even they are isol=
ated from each other.
Helps a lot with large multi-module applications.

________________________________________
Von: Ted Kim <ted.h.kim(a)oracle.com>
Gesendet: Mittwoch, 28. April 2021 01:00
An: tpm2(a)lists.01.org
Betreff: [tpm2] Re: get TPM applications to happily co-exist

So it looks like Microsoft has done something to keep TPM-using
applications out of each others way for Windows in "TPM Base Services".

Is someone doing something similar for Linux ?
Is FAPI supposed to eventually do stuff like this ?
Of course, I would rather use the accepted standard tool, instead of
re-inventing the wheel.

Thanks,
-ted

On 4/27/21 9:38 AM, Ted Kim wrote:
> Folks,
>
> The question has come up about how to get TPM applications to happily
> coexist with minimal coordination.
>
> One issue in the owner hierarchy is we want each application to to be
> able to manage it's own objects but not affect those of the other
> applications.
>
> So for example, we only want application A to be able to evict
> persistent handles owned by that application and not those of another
> application B.
>
> If I understand, tpm2_evictcontrol command, the authorization is on
> the hierarchy and not on the object. Maybe I am thinking about this
> wrong, but is there a way in the authorization to look at some
> property of the object and tell who "owns" it and then figure out if
> this should be allowed or not ?
>
> Otherwise, I think, we end up building some other software which knows
> how to authorize this on the hierarchy and keeps track of who owns
> what and then issues the eviction only when the owner of an object is
> the requester.
>
> Am open to any suggestions.
>
> Thanks,
> -ted
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--
Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6743397832858829587==--

