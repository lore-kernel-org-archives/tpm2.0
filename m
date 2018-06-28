Content-Type: multipart/mixed; boundary="===============8188935072192843049=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tools: tcti init allocation route failed for library
 "tabrmd"
Date: Thu, 28 Jun 2018 14:22:34 +0200
Message-ID: <4bbf89c5-5e52-1fab-947c-c5dddb0d2a67@redhat.com>
In-Reply-To: 75b1350fd612401a999370c997ccfb1c@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8188935072192843049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 06/26/2018 08:40 PM, Scheie, Peter M wrote:
> I'm trying to get the tools working with the emulator, on a CentOS 7 VM. =
 I've got tss 2.0.0, abrmd 2.0.0, tools 3.1.0, and the IBM emulator 1119.  =
Everything compiles and installs okay, the emulator is running, I start abr=
md with 'sudo -u tss /tmp/tpm2/sbin/tpm2-abrmd --tcti=3Dlibtss2-tcti-mssim.=
s' and the emulator says 'Client accepted'.  However, when I then run, say,=
 tpm2_pcrlist, I get this error:
> =

> WARNING: Failed to create connection with service: GDBus.Error:org.freede=
sktop.DBus.Error.NoReply: Message recipient disconnected from message bus w=
ithout replying
> ERROR: tcti init allocation routine failed for library: "tabrmd" options:=
 "(null)"
> ERROR: Could not load tcti, got: "tabrmd"
> =

> And then abrmd crashes, while the emulator reports 'read() error.  Error =
is 2 No such file or directory'.
> =

> Suggestions?
>

That very much sounds like a SELinux issue, did you try putting SELinux in
permissive mode (setenforce 0) ?

Best regards,
Javier

--===============8188935072192843049==--

