Content-Type: multipart/mixed; boundary="===============3987228088173260755=="
MIME-Version: 1.0
From: joseph at zeronsoftn.com
Subject: [tpm2] Re: How can I prevent MITM attacks for unsealing?
Date: Thu, 06 Oct 2022 13:07:19 +0000
Message-ID: <20221006130719.2030.23916@ml01.vlan13.01.org>
In-Reply-To: 3d12759fa0272161dceb21c01026e94d6560fe3b.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3987228088173260755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here is the command I tested:
https://gist.github.com/jclab-joseph/d1d6d9bbbd32c0fe200cc7725bcf0d86
A session was established via a serialized persistent handle.
This seems to be able to prevent MITM by default.

But wouldn't it still be vulnerable if an attacker could replace primary.ha=
ndle?
Is there a way to validate between session and seal.ctx or seal.pub?
--===============3987228088173260755==--

