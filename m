Content-Type: multipart/mixed; boundary="===============0293561975090417568=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Lifecycle of handles and contexts
Date: Mon, 25 Jul 2022 18:56:59 +0000
Message-ID: <ab025685a774450f457da79fc1df289bdbd08f40.camel@intel.com>
In-Reply-To: BN8PR15MB27533D241112AB1F3EA9D0C7F28F9@BN8PR15MB2753.namprd15.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0293561975090417568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-07-19 at 22:17 +0000, Kenneth Goldman wrote:
> > On Mon, 2022-07-18 at 17:36 +0000, Kenneth Goldman wrote:
> > > It depends.
> > > =

> > > Windows seems to have a large keystore, so you probably don't
> > > have to
> > > ever flush.
> > > =

> > > Linux in kernel RM manages keys across processes but not within
> > > processes, so you still have to flush.
> > =

> > This is also how TBS works on Windows.
> =

> Not on my Windows 10.  I just created 32 keys with one process.  Now
> there are =

> 32 loaded keys.

Did the process exit? I always thought TBS was spec compliant:
"The RM also monitors connections, and removes table entries and
ContextFlushes leftover sessions
when the caller closes a connection." from Section 2.3.3 of:
https://trustedcomputinggroup.org/wp-content/uploads/TSS_2p0_TAB_ResourceMa=
nager_v1p0_r18_04082019_pub.pdf

The table entries include transient handles and their associated
virtual mapping.

> OK, the Windows RM swaps them out, but the application never =

> sees that.
> =

> I don't know what the RM limit is, but it's certainly far more than
> the TPM =

> itself.
> =

> getcapability.exe -cap 1 -pr 80000000
> 32 handles
>         80ffffe0
>         80ffffe1
>         80ffffe2
>         80ffffe3
>         80ffffe4
>         80ffffe5
>         80ffffe6
>         80ffffe7
>         80ffffe8
>         80ffffe9
>         80ffffea
>         80ffffeb
>         80ffffec
>         80ffffed
>         80ffffee
>         80ffffef
>         80fffff0
>         80fffff1
>         80fffff2
>         80fffff3
>         80fffff4
>         80fffff5
>         80fffff6
>         80fffff7
>         80fffff8
>         80fffff9
>         80fffffa
>         80fffffb
>         80fffffc
>         80fffffd
>         80fffffe
>         80ffffff

These look like virtual handles. The spec also states,
"In responses that return handles, these handles MUST be virtualized
before returning the
response to the caller:
=EF=82=A7 These virtual handles MUST be unique per connection".
I don't think anyone actually makes them unique per connection.

--===============0293561975090417568==--

