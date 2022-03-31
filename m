Content-Type: multipart/mixed; boundary="===============8210196992223083152=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: Installing on FreeBSD?
Date: Thu, 31 Mar 2022 07:05:09 -0700
Message-ID: <4aa36b9e-4039-7937-aa75-533d712f3689@gmail.com>
In-Reply-To: e2d89678-8b03-6159-7f0f-b5e258ed6f1f@skylon.me.uk
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8210196992223083152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/31/22 03:55, John Connett wrote:
> Is there a simple, step-by-step guide for installing tpm2 on FreeBSD?

What about:
$ sudo pkg install tpm2-abrmd tpm2-tools

That should install and configure everything.
--===============8210196992223083152==--

