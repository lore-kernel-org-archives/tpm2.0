Content-Type: multipart/mixed; boundary="===============0644621167540581187=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] There is no '-I' option for tpm2_rsaencrypt which I found
 it in the doc.
Date: Fri, 19 Oct 2018 13:10:39 +0100
Message-ID: <82664f73d081578de7dc45fb804ab4527fede427.camel@linux.intel.com>
In-Reply-To: CA+tBKViQvj4SfavhkL6z=GQnkWkcB7SNEgNzWSQFsZcvkLgUeQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0644621167540581187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-10-19 at 16:36 +0800, Terry An wrote:
> [root(a)localhost Test]# tpm2_rsaencrypt -I data.in -c obj.ctx  -o
> data.encrypted =

> tpm2_rsaencrypt: invalid option -- 'I'
> [root(a)localhost Test]#

I see the example was incorrect in both the 3.0.X and 3.X branches,
I've sent pull requests to update.

You want:
# tpm2_rsaencrypt -c obj.ctx -o data.encrypted data.in

Joshua


--===============0644621167540581187==--

