Content-Type: multipart/mixed; boundary="===============1441981124057511713=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Error running tpm2_create: magic does not match!
Date: Tue, 01 Oct 2019 14:25:56 -0700
Message-ID: <1229681c-02d1-2782-ab26-f88810c8d1bb@intel.com>
In-Reply-To: CAJLNp_XZ0UonxQane-no3GVCzGq4X-X7p9Y0_fva5qZO9bOrVg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1441981124057511713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/1/19 11:50 AM, Arun Sudhir wrote:
> HEre are the commands i used:
> =

> |tpm2_createprimary=C2=A0-c=C2=A0primary.ctx (works) |tpm2_create=C2=A0-C=
=C2=A0primary.ctx=C2=A0-u=C2=A0obj.pub=C2=A0-r=C2=A0obj.priv (fails)
> =

> ||
> =

> =

> This is the error i get:=C2=A0
> =

> ERROR: Found magic 0x40000001 did not match expected magic of 0xbadcc0de!
> WARN: The loaded tpm context does not appear to be in the proper format, =
assuming old format, this will be converted on the next save.
> ERROR: Could not load tpm context file
> ERROR: Failed to load_tpm_context_file()
> ERROR: Unable to run C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\=
x64\Debug\tpm2-create.exe

You can try to hex dump the primary.ctx after tpm2_createprimary() to see w=
hat's in it.
The format should be:

U32 magic (0xBADCC0DE)
U32 ctx version (0x00000001)
U32 savedHandle
U64 sequence
U16 contextBlobLength
BYTE[] contextBlob
 =

The 0x40000001 looks like the owner handle.

-- =

Tadeusz
--===============1441981124057511713==--

