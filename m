Content-Type: multipart/mixed; boundary="===============3359152793385203628=="
MIME-Version: 1.0
From: Patrick Ohly <patrick.ohly at intel.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Fri, 10 Nov 2017 13:44:46 +0100
Message-ID: <1510317886.22094.47.camel@intel.com>
In-Reply-To: 49a9b739-63be-3b12-2eae-54e6af0daa20@linux.vnet.ibm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3359152793385203628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-11-10 at 06:53 -0500, Stefan Berger wrote:
> Other possibilities, you have an old libtpms library that's being
> picked=C2=A0up that may have had a bug?

I indeed didn't have the latest code, but for other reasons - see my
other email. It's working now :-)

> > BTW, should the swtpm instance above really terminate when qemu
> > disconnects? It currently does, although -terminate is not given.
> =

> It is terminated by QEMU issuing a shutdown on it. I think it's
> better=C2=A0than leaving stale swtpm processes running.

That it explains it. I was just wondering.

Having swtpm spawned by QEMU avoids exactly this issue with lingering
processes, even when QEMU itself gets killed and doesn't get around to
shut down the TPM properly. Unfortunately the QEMU developers didn't
buy that argument :-/

> > How can I enable more debug logging inside swtpm? Increasing the
> > level
> > does not really provide much useful information.
> > =

> =

> There's not much debugging output inside the TPM 2 code. Some fatal=C2=A0
> errors, such as not swtpm not being able to write the TPM2 state
> file=C2=A0should show up, though.

Just to close on this, --enable-debug also enables additional output,
doesn't it? I haven't actually used it, though, because it leads to an
assertion in swtpm when using TPM2 (https://github.com/stefanberger/swt
pm/issues/54).

-- =

Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



--===============3359152793385203628==--

