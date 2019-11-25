Content-Type: multipart/mixed; boundary="===============4915500441874854970=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Is there a way to get the name for an NV index in
 tpm2_tools?
Date: Mon, 25 Nov 2019 16:47:07 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E47E0A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAOCvsS=YPo=PNS+=XT1Fr6fCWWeY3NonQbL35dvGzN1xUS6NMw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4915500441874854970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tpm2_getcapability -c primary.ctx:
name: 000b914a1abc3f6b71166e4b8d3a02ee338524bb5b82a7c9e1a59f28dc97f7f2fd0c
qualified name: 000bdb4f165a0db93bc1cccbc5266f69ceaafe1bf96bcab11ca73d6f155=
a15a66591
name-alg:
  value: sha256
  raw: 0xb
<snip>

What version of the tools are you on as reported by the -V option?


> -----Original Message-----
> From: Steven Clark [mailto:davolfman(a)gmail.com]
> Sent: Friday, November 22, 2019 4:04 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Is there a way to get the name for an NV index in
> tpm2_tools?
> =

> That's what I thought, but it doesn't.  I provides the handle, attributes=
, and policy
> hash, but not the Name.
> If I read the spec right the contents of the index are part of the hash s=
o I don't
> think this is even enough information to compute the Name.  And manually
> computing a Name is beyond my trust in my own abilities right now.

--===============4915500441874854970==--

