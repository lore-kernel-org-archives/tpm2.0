Content-Type: multipart/mixed; boundary="===============4395312168379168133=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Is there a way to get the name for an NV index in
 tpm2_tools?
Date: Fri, 22 Nov 2019 14:03:42 -0800
Message-ID: <CAOCvsS=YPo=PNS+=XT1Fr6fCWWeY3NonQbL35dvGzN1xUS6NMw@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E460A9@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4395312168379168133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That's what I thought, but it doesn't.  I provides the handle,
attributes, and policy hash, but not the Name.
If I read the spec right the contents of the index are part of the
hash so I don't think this is even enough
information to compute the Name.  And manually computing a Name is
beyond my trust in my own abilities right now.
--===============4395312168379168133==--

