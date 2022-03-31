Content-Type: multipart/mixed; boundary="===============8673264704911078943=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: Installing on FreeBSD?
Date: Thu, 31 Mar 2022 12:50:03 -0700
Message-ID: <b4be5fb4-0b3d-89c9-9860-b5db5f5a3b0c@gmail.com>
In-Reply-To: 5853998f-e565-0347-7ea7-d929bdce73e1@skylon.me.uk
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8673264704911078943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/31/22 12:16, John Connett wrote:
> That's what I would have hoped. However, I've found several problems:
> =

>  1. /usr/local/etc/rc.d/tpm2-abrmd
>     The line starting "desc=3D" breaks the script because of the un-quoted
>     multi-word description text value. Putting quotes around the text val=
ue
>     fixes it.

Right, that will be fixed soon.

>  2. /dev/tpm0
>     This has owner root. A temporary fix is to change the owner to "_tss"=
 which
>     allows tpm2_getrandom to work. Not sure how the ownership and permiss=
ions
>     are supposed to be set?

Right, we are missing some udev rules here.

>  3. Hyper-V Virtual TPM not found
>     With FreeBSD installed on a Generation 2 VM on a Windows 11 host the =
Virtual
>     TPM is not found. Ubuntu installed on the same VM does find the Virtu=
al TPM.

did you "sudo kldload tpm" ?

> Not quite as smooth as I anticipated. However, the problems are probably =
with =

> the packaging for FreeBSD rather than tpm2-software issues. I've copied t=
his to =

> the maintainer of tpm2-tss for FreeBSD in case they have any comments.


--===============8673264704911078943==--

