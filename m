Content-Type: multipart/mixed; boundary="===============4758643413691562326=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2-tools who uses transient handles in workflows?
Date: Fri, 30 Nov 2018 16:14:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CA3B77@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 2667ebfa-679c-0f89-676e-feacf49246d3@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4758643413691562326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<snip>

> > Another thing that we never finished discussing is how to properly
> > support session contexts with the tools when using the in-kernel
> > resource manager (since the session contexts are also flushed on file d=
ecriptor
> close).
> =

> I just proposed this change to Jarkko this week. Mixed feelings on it. I =
explained
> that In some embedded devices they don=E2=80=99t wish to stand up another=
 service.
> Think small Embedded IoT. I forgot to mention that there is precedence he=
re in
> that things like the in-kernel event manager (for creating dev nodes, for=
got the
> name) exists. That replaces the ueventd behavior for embedded devices.

It's called CONFIG_DEVTMPFS

--===============4758643413691562326==--

