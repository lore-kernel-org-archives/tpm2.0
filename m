Content-Type: multipart/mixed; boundary="===============0310673529903232323=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] TSS2_DRIVER_RC_LAYER not in common spec
Date: Fri, 17 Aug 2018 13:00:03 -0700
Message-ID: <20180817200003.GA29847@intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649C2BD88@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0310673529903232323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2018 at 09:19:51AM -0700, Roberts, William C wrote:
> TSS2_DRIVER_RC_LAYER is not in common spec, but defined in common.h

Those layer definitions are leftover from before my time. We cleaned a
lot of them out but this one must have slipped through or removed from a
later draft of the spec.

> Spec:
> https://trustedcomputinggroup.org/wp-content/uploads/TSS_Overview_Common_=
Structures_Version-0.9_Revision-03_Review_030918.pdf
> =

> Is it defined somewhere else? Should we drop this from the header?

Grep says it's not used by anything but old test code. Could be used
downstream but it shouldn't be.

Philip

--===============0310673529903232323==--

