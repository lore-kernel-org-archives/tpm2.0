Content-Type: multipart/mixed; boundary="===============4027589572443290037=="
MIME-Version: 1.0
From: Ted Kim <ted.h.kim at oracle.com>
Subject: [tpm2] get TPM applications to happily co-exist
Date: Tue, 27 Apr 2021 09:38:43 -0700
Message-ID: <20aa5df0-e69a-46eb-975a-76b7ba7db298@oracle.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4027589572443290037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

The question has come up about how to get TPM applications to happily =

coexist with minimal coordination.

One issue in the owner hierarchy is we want each application to to be =

able to manage it's own objects but not affect those of the other =

applications.

So for example, we only want application A to be able to evict =

persistent handles owned by that application and not those of another =

application B.

If I understand, tpm2_evictcontrol command, the authorization is on the =

hierarchy and not on the object. Maybe I am thinking about this wrong, =

but is there a way in the authorization to look at some property of the =

object and tell who "owns" it and then figure out if this should be =

allowed or not ?

Otherwise, I think, we end up building some other software which knows =

how to authorize this on the hierarchy and keeps track of who owns what =

and then issues the eviction only when the owner of an object is the =

requester.

Am open to any suggestions.

Thanks,
-ted


--===============4027589572443290037==--

