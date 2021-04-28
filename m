Content-Type: multipart/mixed; boundary="===============4136398897273415943=="
MIME-Version: 1.0
From: Ted Kim <ted.h.kim at oracle.com>
Subject: [tpm2] Re: [External] : AW: Re: get TPM applications to happily
 co-exist
Date: Wed, 28 Apr 2021 13:29:21 -0700
Message-ID: <6002bce5-70ec-6ec9-eab0-3e7b3ccb6294@oracle.com>
In-Reply-To: AM8P194MB16751FF1F36F2F7873BA4527A6409@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4136398897273415943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andreas,

OK, but then the problem of preventing other applications from evicting =

persistent objects from our application doesn't seem to have a solution, =

except by locking down the owner hierarchy (e.g. my application has the =

password) - which doesn't seem very friendly. How does any other =

application create a primary object, etc. ?

Anyway, thanks for the vtpm-proxy suggestion.

Thanks,
-ted


On 4/28/21 12:55 PM, Fuchs, Andreas wrote:
> Ted, same thing.
>
> The physical and virtual resources mentioned in the QUote are the transie=
nt key objects.
> The TBS as well as the tpm2-abrmd and tpmrm provide separation for these =
on a per-context basis.
>
> (P.S. Microsoft is also a TCG member and tpm2-abrmd implements a TCG spec=
 for resource managers. So this is not really a coincidence.)
>
> I am pretty certain that the TBS does not include separation for persiste=
nt key object or let alone NV indices.
>
> I'm afraid you are misinterpreting the Quoted statement.
>
> Vor vTPMs you can look at the swtpm project of Stefan Berge with the vtpm=
-proxy option. This gives you additional /dev/tpm1,2,...
>
> ________________________________________
> Von: Ted Kim <ted.h.kim(a)oracle.com>
> Gesendet: Mittwoch, 28. April 2021 19:50
> An: Fuchs, Andreas
> Cc: tpm2(a)lists.01.org
> Betreff: Re: [External] : AW: [tpm2] Re: get TPM applications to happily =
co-exist
>
> Andreas,
>
> I certainly appreciate what the ABRMD or in-kernel resource manager does.=
 But I think the MS TPM Base Services goes a bit further. Quoting something=
 from a MS web page:
>
> Each context is only allowed to access virtual resources created specific=
ally on its behalf, as well as the physical resources on the TPM that corre=
sponds to those virtual resources.
>
> So for my situation, I am thinking if application A (using its own contex=
t) created some objects, application B (with a different context) would not=
 even see them and would not be able to evict those persistent objects of t=
he other application.
>
> ++++
>
> Maybe in a VM environment maybe we could have multiple virtual TPMs (not =
just /dev/tpm0, but also /dev/tpm1 and tpm2, etc.) ? I suppose then each ap=
plication could use it's own. However, I am not sure if the ABRMD or in-ker=
nel resource manager would handle that (maybe also the virtualization SW wo=
n't do the right thing) ?
>
> But of course in bare-metal, I am not aware any system which has more tha=
n one hardware TPM.
>
>
> Thanks,
> -ted
>
> On 4/28/21 1:15 AM, Fuchs, Andreas wrote:
>
> The tpm2-abrmd as well as the in-kernel resource manager via /dev/tpmrm0 =
both perform isolation of "connections", i.e. each tss context (on all apis=
 TCTI, SYS; ESYS, FAPI) has an isolated view on the TPM.
>
> That even means if an application opens two ESYS context even they are is=
olated from each other.
> Helps a lot with large multi-module applications.
>
> ________________________________________
> Von: Ted Kim <ted.h.kim(a)oracle.com><mailto:ted.h.kim(a)oracle.com>
> Gesendet: Mittwoch, 28. April 2021 01:00
> An: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> Betreff: [tpm2] Re: get TPM applications to happily co-exist
>
> So it looks like Microsoft has done something to keep TPM-using
> applications out of each others way for Windows in "TPM Base Services".
>
> Is someone doing something similar for Linux ?
> Is FAPI supposed to eventually do stuff like this ?
> Of course, I would rather use the accepted standard tool, instead of
> re-inventing the wheel.
>
> Thanks,
> -ted
>
> On 4/27/21 9:38 AM, Ted Kim wrote:
>
>
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
> tpm2 mailing list -- tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> To unsubscribe send an email to tpm2-leave(a)lists.01.org<mailto:tpm2-lea=
ve(a)lists.01.org>
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
>
> --
> Ted H. Kim, PhD
> ted.h.kim(a)oracle.com<mailto:ted.h.kim(a)oracle.com>
> +1 310-258-7515
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
> To unsubscribe send an email to tpm2-leave(a)lists.01.org<mailto:tpm2-lea=
ve(a)lists.01.org>
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
> --
> Ted H. Kim, PhD
> ted.h.kim(a)oracle.com<mailto:ted.h.kim(a)oracle.com>
> +1 310-258-7515

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515

--===============4136398897273415943==--

