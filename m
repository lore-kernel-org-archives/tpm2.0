Content-Type: multipart/mixed; boundary="===============8933633612536159765=="
MIME-Version: 1.0
From: Tim K <tpm2 at bitzap.e4ward.com>
Subject: [tpm2] Re: Lifecycle of handles and contexts
Date: Tue, 19 Jul 2022 02:25:28 +0000
Message-ID: <20220719022528.2549.51199@ml01.vlan13.01.org>
In-Reply-To: 2164e6a1f1a71ba937d139fe36f035653964108b.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8933633612536159765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On Mon, 2022-07-18 at 17:36 +0000, Kenneth Goldman wrote:
>
> It would help to have specific examples and your environment, very
> rarely do you ever need to be concerned with flushcontext calls. The
> details below will be very specific to Linux using a resource manager
> and the tpm2-tools. If your using the tpm2-tools you use a context
> file, so even if the object is flushed, when you call tpm2_unseal -c
> <context file> the context is loaded and object is created again. The
> context files are only good for that "tpm boot". The same is if your
> not using a resource manager, since the tpm2-tools act as a resource
> manager. This is so you can use transient objects between commands and
> have a resource manager automatically flush the transient resources.
> The end goal is that the behavior should appear the same with and
> without Resource Managers running in your scripts.

Indeed, I do use tpm2-tools on Ubuntu 20.04 LTS, with the kernel RM (no tpm=
2-abrmd).
This is exactly the confirmation I was looking for, thank you. I figured it=
 was something like that otherwise I could not explain why it worked.
--===============8933633612536159765==--

