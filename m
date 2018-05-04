Content-Type: multipart/mixed; boundary="===============1226589349973491209=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] clevis with tpm-tools 2.1.0 (tpm2_create proper use for
 tpm2_unseal compatibility)
Date: Fri, 04 May 2018 14:16:40 +0200
Message-ID: <4ada7fc8-b788-0c89-1280-551ddc4fd845@redhat.com>
In-Reply-To: CANtcRX6JDcHsFnGRBnq1OTNL6+T=zvREpZZ9BpytFtJ37j1ZUA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1226589349973491209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 05/04/2018 12:38 PM, Peter Magnusson wrote:
> thanks, that worked out very well!
>

I'm glad it worked.
 =

> echo hi | clevis encrypt tpm2 '{}' | clevis decrypt
> hi
> =

> Also needed to build dracut, clevis from source to resolve some (Ubuntu
> specific?) problems,

Since you are using Ubuntu, you may be interested in this PR for clevis
that allows it to be used with initramfs-tools instead of dracut:

https://github.com/latchset/clevis/pull/35

Best regards
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============1226589349973491209==--

