Content-Type: multipart/mixed; boundary="===============3225379532535885903=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: get TPM applications to happily co-exist
Date: Wed, 28 Apr 2021 08:19:39 +0000
Message-ID: <AM8P194MB16755B14A6A7248EA32A6CEBA6409@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: 20aa5df0-e69a-46eb-975a-76b7ba7db298@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3225379532535885903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The TPM specification dictates that the owner/storage hierarchy authorizati=
on is the authority over persistent objects.
It makes sense in a way since EvictControl eats up TPM storage resources.

If you wanted isolation in the way you're describing you'd need to patch tp=
m2-abrmd in order to enforce some kind of access-control to EvictControl be=
yond the TPM's authorization scheme. But that would be enforced by the tpm2=
-abrmd daemon, not the TPM itself.

Hope this helps,
Andreas

________________________________________
Von: Ted Kim <ted.h.kim(a)oracle.com>
Gesendet: Dienstag, 27. April 2021 18:38
An: tpm2(a)lists.01.org
Betreff: [tpm2] get TPM applications to happily co-exist

Folks,

The question has come up about how to get TPM applications to happily
coexist with minimal coordination.

One issue in the owner hierarchy is we want each application to to be
able to manage it's own objects but not affect those of the other
applications.

So for example, we only want application A to be able to evict
persistent handles owned by that application and not those of another
application B.

If I understand, tpm2_evictcontrol command, the authorization is on the
hierarchy and not on the object. Maybe I am thinking about this wrong,
but is there a way in the authorization to look at some property of the
object and tell who "owns" it and then figure out if this should be
allowed or not ?

Otherwise, I think, we end up building some other software which knows
how to authorize this on the hierarchy and keeps track of who owns what
and then issues the eviction only when the owner of an object is the
requester.

Am open to any suggestions.

Thanks,
-ted

_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============3225379532535885903==--

