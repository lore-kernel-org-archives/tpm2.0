Content-Type: multipart/mixed; boundary="===============0484674482414616176=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Error running tpm2_create: magic does not match!
Date: Wed, 02 Oct 2019 14:16:15 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E0FDBA@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAJLNp_V7MX=nrsSeCPt0stf-bGBrwLH94_5RECdFw+f8X9ZxXA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0484674482414616176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Arun Sudhir [mailto:arunsudhir19(a)gmail.com]
> Sent: Tuesday, October 1, 2019 4:16 PM
> To: Struk, Tadeusz <tadeusz.struk(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Error running tpm2_create: magic does not match!
> =

> wait.. i should be doing "negmagic" and not -negmagic in the function cal=
l! Maybe
> that the cause of the bug!

Yeah -- would make it positive and you would seek too far.

I'm not sure though why you have some unsigned issue on windows, fseek take=
s a long which is signed.
 =

> =

> On Tue, Oct 1, 2019 at 4:02 PM Arun Sudhir <arunsudhir19(a)gmail.com
> <mailto:arunsudhir19(a)gmail.com> > wrote:
> =

> =

> 	I found the issue:
> =

> 	Its with the part i have highlighted in bold below in the check_magic()
> function in files.c:
> =

> 	 long negmagic =3D 0 - sizeof(magic);
> 	    if (seek_reset) {
> 	        int rc =3D fseek(fstream, -negmagic, SEEK_CUR);
> =

> =

> =

> 	Initially, the code does a check_magic with seek_reset =3D true. So it t=
ries
> to do an fseek backwards by 4 bytes . I remember i had to modify this cod=
e to
> port to windows as clang on windows would not compile with a  unary minus=
 on
> an unsigned int in windows. That seems to be the issue.  It instead goes =
forward
> by 4  bytes ! and the next check_magic fails which is called again from
> files_read_header function (Also in files.c).
> =

> 	I skipped over the fseek and the second check_magic call and everything
> worked fine.
> =

> 	I someone knows how to fix this (by properly fixing fseek) , please let =
me
> know. For now, I have introduced a boolean flag that skips the second
> check_magic and gets rid of the fseek altogether.
> =

> 	Thanks Tadeusz (again)  for your help!
> =

> 	Arun
> =

> 	On Tue, Oct 1, 2019 at 2:30 PM Arun Sudhir <arunsudhir19(a)gmail.com
> <mailto:arunsudhir19(a)gmail.com> > wrote:
> =

> =

> 		I will try that.
> =

> 		On Tue, Oct 1, 2019, 2:25 PM Tadeusz Struk
> <tadeusz.struk(a)intel.com <mailto:tadeusz.struk(a)intel.com> > wrote:
> =

> =

> 			On 10/1/19 11:50 AM, Arun Sudhir wrote:
> 			> HEre are the commands i used:
> 			>
> 			> |tpm2_createprimary -c primary.ctx (works)
> |tpm2_create -C primary.ctx -u obj.pub -r obj.priv (fails)
> 			>
> 			> ||
> 			>
> 			>
> 			> This is the error i get:
> 			>
> 			> ERROR: Found magic 0x40000001 did not match
> expected magic of 0xbadcc0de!
> 			> WARN: The loaded tpm context does not appear to be
> in the proper format, assuming old format, this will be converted on the =
next
> save.
> 			> ERROR: Could not load tpm context file
> 			> ERROR: Failed to load_tpm_context_file()
> 			> ERROR: Unable to run
> C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\x64\Debug\tpm2-
> create.exe
> =

> 			You can try to hex dump the primary.ctx after
> tpm2_createprimary() to see what's in it.
> 			The format should be:
> =

> 			U32 magic (0xBADCC0DE)
> 			U32 ctx version (0x00000001)
> 			U32 savedHandle
> 			U64 sequence
> 			U16 contextBlobLength
> 			BYTE[] contextBlob
> =

> 			The 0x40000001 looks like the owner handle.
> =

> 			--
> 			Tadeusz
> =



--===============0484674482414616176==--

