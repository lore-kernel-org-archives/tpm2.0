Content-Type: multipart/mixed; boundary="===============6520241549978922751=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: [tpm2] Re: tpm2_nvread Error:0x9a2
Date: Tue, 01 Oct 2019 19:11:57 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FF967C4217@fmsmsx107.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6520241549978922751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@Luke, did you try specifying the index as the auth handle like tpm2_nvread=
 -x 0x1c00002 -s 1171 -f outfile.out -a 0x1c000002
What you did should have work based on the NV index attributes, unless owne=
r auth is set to non empty value.
________________________________________
From: tpm2-request(a)lists.01.org [tpm2-request(a)lists.01.org]
Sent: Tuesday, October 01, 2019 11:51 AM
To: tpm2(a)lists.01.org
Subject: tpm2 Digest, Vol 27, Issue 30

Send tpm2 mailing list submissions to
        tpm2(a)lists.01.org

To subscribe or unsubscribe via email, send a message with subject or
body 'help' to
        tpm2-request(a)lists.01.org

You can reach the person managing the list at
        tpm2-owner(a)lists.01.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of tpm2 digest..."

Today's Topics:

   1. tpm2_nvread Error:0x9a2 (Luke Hinds)
   2. Cannot build tpm2-tss(a)2.2.3 and tpm2-abrmd(a)2.0.3 with Automake 1.6
      (Oliver, Dario N)
   3. Re: Cannot build tpm2-tss(a)2.2.3 and tpm2-abrmd(a)2.0.3 with Automak=
e 1.6
      (Jonas Witschel)
   4. Error running tpm2_create: magic does not match! (Arun Sudhir)


----------------------------------------------------------------------

Date: Tue, 1 Oct 2019 12:11:38 +0100
From: Luke Hinds <lhinds(a)redhat.com>
Subject: [tpm2] tpm2_nvread Error:0x9a2
To: tpm2(a)lists.01.org
Message-ID:
        <CAKrSGQRr0ZoP5hq9KFtgD45HbpT3dhBF6umG2-cZ73FC8YcEGQ(a)mail.gmail.c=
om>
Content-Type: multipart/alternative;
        boundary=3D"000000000000edba810593d777e1"

--000000000000edba810593d777e1
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Apologies, that might be hardware specific. but thought it might be worth
asking here, in case anyone has seen the same.

My Intel Nuc 7i7DNHE with an Infineon SLB9665VQ2.0 TPM is no longer
allowing me to read the NV index.

This is after clearing the TPM by removing the yellow jumper and selecting
4 to clear on first boot (and then placing the jumper back into position)

I can run tpm2_takeownership -c with no issues, but not 'tpm2_nvread'

0x1c00002:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly:
ppwrite|writedefine|ppread|ownerread|authread|no_da|written|platformcreate
    value: 0x1200762
  size: 1177

tpm2_nvread -x 0x1c00002 -s 1171 -f outfile.out
ERROR: Failed to read NVRAM area at index 0x1c00002 (29360130). Error:0x9a2
ERROR: Unable to run tpm2_nvread

tpm2_rc_decode 0x9a2
error layer
  hex: 0x0
  identifier: TSS2_TPM_RC_LAYER
  description: Error produced by the TPM
format 1 error code
  hex: 0x22
  identifier: TPM2_RC_BAD_AUTH
  description: authorization failure without DA implications
session
  hex: 0x100
  identifier: TPM2_RC_1
  description:  (null)

Does this ring any bells for anyone?

--=3D20
Luke Hinds

--000000000000edba810593d777e1
Content-Type: text/html; charset=3DUTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D3D"ltr"><div>Hi,</div><div><br></div><div>Apologies, that might =
be=3D
 hardware specific. but thought it might be worth asking here, in case anyo=
=3D
ne has seen the same.<br></div><div><br></div><div>My <span class=3D3D"gmai=
l-=3D
il">Intel</span> <span class=3D3D"gmail-il">Nuc</span> 7i7DNHE with <span c=
la=3D
ss=3D3D"gmail-st">an Infineon SLB9665VQ2.0 TPM is no longer allowing me to =
re=3D
ad the NV index.<br></span></div><div><span class=3D3D"gmail-st"><br></span=
><=3D
/div><div><span class=3D3D"gmail-st">This is after clearing the TPM by remo=
vi=3D
ng the yellow jumper and selecting 4 to clear on first boot (and then placi=
=3D
ng the jumper back into position)<br></span></div><div><span class=3D3D"gma=
il=3D
-st"><br></span></div><div><span class=3D3D"gmail-st">I can run tpm2_takeow=
ne=3D
rship -c with no issues, but not &#39;<span class=3D3D"gmail-st">tpm2_nvrea=
d&=3D
#39;</span></span></div><div><span class=3D3D"gmail-st"><br></span></div><d=
iv=3D
><span class=3D3D"gmail-st">0x1c00002:<br>=3DC2=3DA0 hash algorithm:<br>=3D=
C2=3DA0 =3D
=3DC2=3DA0 friendly: sha256<br>=3DC2=3DA0 =3DC2=3DA0 value: 0xB<br>=3DC2=3D=
A0 attributes:<b=3D
r>=3DC2=3DA0 =3DC2=3DA0 friendly: ppwrite|writedefine|ppread|ownerread|auth=
read|no_=3D
da|written|platformcreate<br>=3DC2=3DA0 =3DC2=3DA0 value: 0x1200762<br>=3DC=
2=3DA0 size:=3D
 1177<br></span></div><div><span class=3D3D"gmail-st"><br></span></div><div=
><=3D
span class=3D3D"gmail-st">tpm2_nvread -x 0x1c00002 -s 1171 -f outfile.out<b=
r>=3D
ERROR: Failed to read NVRAM area at index 0x1c00002 (29360130). Error:0x9a2=
=3D
<br>ERROR: Unable to run tpm2_nvread<br></span></div><div><br></div><div>tp=
=3D
m2_rc_decode 0x9a2 =3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA0 =
=3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA0 =3D
=3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA=
0 =3DC2=3DA0 =3DC2=3DA0 =3DC2=3DA0 =3DC2=3D
=3DA0 =3DC2=3DA0 <br>error layer<br>=3DC2=3DA0 hex: 0x0<br>=3DC2=3DA0 ident=
ifier: TSS2_TP=3D
M_RC_LAYER<br>=3DC2=3DA0 description: Error produced by the TPM<br>format 1=
 err=3D
or code<br>=3DC2=3DA0 hex: 0x22<br>=3DC2=3DA0 identifier: TPM2_RC_BAD_AUTH<=
br>=3DC2=3D
=3DA0 description: authorization failure without DA implications<br>session=
<b=3D
r>=3DC2=3DA0 hex: 0x100<br>=3DC2=3DA0 identifier: TPM2_RC_1<br>=3DC2=3DA0 d=
escription: =3D
=3DC2=3DA0(null)</div><div><br></div><div>Does this ring any bells for anyo=
ne?<=3D
br></div><div><br></div>-- <br><div dir=3D3D"ltr" class=3D3D"gmail_signatur=
e" d=3D
ata-smartmail=3D3D"gmail_signature"><div dir=3D3D"ltr"><div><div dir=3D3D"l=
tr"><d=3D
iv><div dir=3D3D"ltr"><div><div dir=3D3D"ltr"><span style=3D3D"font-size:12=
.8px">=3D
Luke Hinds</span><br style=3D3D"font-size:12.8px"></div></div></div></div><=
/d=3D
iv></div></div></div></div>

--000000000000edba810593d777e1--

------------------------------

Date: Tue, 1 Oct 2019 17:10:04 +0000
From: "Oliver, Dario N" <dario.n.oliver(a)intel.com>
Subject: [tpm2] Cannot build tpm2-tss(a)2.2.3 and tpm2-abrmd(a)2.0.3 with
        Automake 1.6
To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
Message-ID: <20A6FE0AC912764FB8B5BC5A1A7CB92B4255A062(a)FMSMSX103.amr.co
        rp.intel.com>
Content-Type: text/plain; charset=3D"us-ascii"

Hello,

I just noticed that I am no longer able to build tpm2-tss and tpm-abrmd (th=
e specified versions) with the latest automake 1.6.
I am not sure if tpm2-tools(a)3.2.0  have the same problem.
This is caused by automake 1.6, there are several other persons having the =
same problem because of broken compatibility, i.e. https://gitlab.gnome.org=
/GNOME/libgdata/issues/24
The latest versions of tss, abrmd and tools works fine. Maybe there is a fi=
x in those version that you could consider porting to the older versions?
The workaround is not using automake 1.6, and rolling back to 1.5.

In summary,

Versions that do not work with automake 1.6:

        - TPM2_TSS_VERSION=3D2.2.3
        - TPM2_ABRMD_VERSION=3D2.0.3
        - TPM2_TOOLS_VERSION=3D3.2.0 ?

The error will be the following, and using --disable-dependency-tracking wi=
ll not help (a make error will appear anyways)

        config.status: error: Something went wrong bootstrapping makefile f=
ragments
            for automatic dependency tracking.  Try re-running configure wi=
th the
            '--disable-dependency-tracking' option to at least be able to b=
uild
            the package (albeit without support for automatic dependency tr=
acking).

Versions that work with automake 1.6:

 - TPM2_TSS_VERSION=3D2.3.1
 - TPM2_ABRMD_VERSION=3D2.2.0
 - TPM2_TOOLS_VERSION=3D4.0

Regards,

Nicolas Oliver

------------------------------

Date: Tue, 1 Oct 2019 19:29:14 +0200
From: Jonas Witschel <diabonas(a)gmx.de>
Subject: [tpm2] Re: Cannot build tpm2-tss(a)2.2.3 and tpm2-abrmd(a)2.0.3
        with Automake 1.6
To: "Oliver, Dario N" <dario.n.oliver(a)intel.com>, "tpm2(a)lists.01.org"
        <tpm2(a)lists.01.org>
Message-ID: <65510ab5-fa9c-9ae5-7d2b-e13de955d035(a)gmx.de>
Content-Type: multipart/signed; micalg=3Dpgp-sha512;
        protocol=3D"application/pgp-signature";
        boundary=3D"aX3nwywEo3oo70ssI8rjWTr0axwsPUFqi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aX3nwywEo3oo70ssI8rjWTr0axwsPUFqi
Content-Type: multipart/mixed; boundary=3D"UnCCuvj5XsFhkgZbAlDaGKNmsLNyFIlj=
a";
 protected-headers=3D"v1"
From: Jonas Witschel <diabonas(a)gmx.de>
To: "Oliver, Dario N" <dario.n.oliver(a)intel.com>,
 "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
Message-ID: <65510ab5-fa9c-9ae5-7d2b-e13de955d035(a)gmx.de>
Subject: Re: [tpm2] Cannot build tpm2-tss(a)2.2.3 and tpm2-abrmd(a)2.0.3 wi=
th
 Automake 1.6
References: <20A6FE0AC912764FB8B5BC5A1A7CB92B4255A062(a)FMSMSX103.amr.corp.=
intel.com>
In-Reply-To: <20A6FE0AC912764FB8B5BC5A1A7CB92B4255A062(a)FMSMSX103.amr.corp=
.intel.com>

--UnCCuvj5XsFhkgZbAlDaGKNmsLNyFIlja
Content-Type: text/plain; charset=3Dutf-8
Content-Language: en-GB-large
Content-Transfer-Encoding: quoted-printable

Hi,

On 2019-10-01 19:10, Oliver, Dario N wrote:
> I just noticed that I am no longer able to build tpm2-tss and tpm-abrmd=
=3D
 (the specified versions) with the latest automake 1.6.
> [...]
> This is caused by automake 1.6, there are several other persons having =
=3D
the same problem because of broken compatibility, i.e. https://gitlab.gno=
=3D
me.org/GNOME/libgdata/issues/24
> The latest versions of tss, abrmd and tools works fine. Maybe there is =
=3D
a fix in those version that you could consider porting to the older versi=
=3D
ons?
> [...]
> Versions that do not work with automake 1.6:
>=3D20
>       - TPM2_TSS_VERSION=3D3D2.2.3
>       - TPM2_ABRMD_VERSION=3D3D2.0.3
>       - TPM2_TOOLS_VERSION=3D3D3.2.0 ?

these build failures are most probably caused by a breaking change in
Autoconf Archive 2019.01.06, see the following pull requests for the
fixes incorporated in the most recent versions:

- tpm2-tss: https://github.com/tpm2-software/tpm2-tss/pull/1238, fixed
by https://github.com/tpm2-software/tpm2-tss/pull/1256
- tpm2-abrmd: https://github.com/tpm2-software/tpm2-abrmd/pull/574
- tpm2-tools: https://github.com/tpm2-software/tpm2-tools/pull/1292

Best,
Jonas


--UnCCuvj5XsFhkgZbAlDaGKNmsLNyFIlja--

--aX3nwywEo3oo70ssI8rjWTr0axwsPUFqi
Content-Type: application/pgp-signature; name=3D"signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=3D"signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE0ZGnjxiB84R1PJZ+aGsGOsS8DskFAl2TjPMACgkQaGsGOsS8
DskemBAApuBfgtDeWZzU5XMx4zMy/ak5xPz+AFVwNCeFUF+HDIS+V7QjMWyobH4X
iKLPmgGysSZaXzde+uTrkQBNf9T9S7Wuh1xSlnA5tkIr0fvK4NKqhFVgvnZu8+ei
dE3hLX4AKvkMJbE9Bpd/WZnFaMuRF7rSGklricR1guQYPPdBC2tDbMOzOdS29VSp
ViZHJgvJ+qqx1RS79OChXMnKVXTNleXYrl7MIRjoYpgZZ1K6wxQJg5UB7nd7JDh9
JdbS4KMH1VIdQzr52ikqu8K8Rc15u4inkMP/7zYaDoPEaoTJe1AblFDABaKuaxgv
LlhrNapdTY9MD9RkJmqQuEgZ7F6/VO3qtAmb61IcFnvwcKEZnAJo6FGKHYhiXha7
3Z15pKe3Ag+XyHYqfgyjHx6eaA7p2nGe48p1Qetvrik6hW3xYntT4PbbU6dp/GLO
nvg/5l2+YetV1bsbBHPChCHo0IIkCyGDoSvPrvUXm1833lJPP7k71lkLpRlZtmIR
s9FaglN/PUjht5x51YB0sadoggDND4VthihccRDrc0D+AD0o4wjCbjssOGM4vkrd
oIEANJFCfYh00M43F9BaPpkI85IJ+TT9D30ReFYKQGuyEFHrbujOsQZ/SGa76MRI
71XqDxGsTdr1lHuwporyD/7adeOaLWESjfIiWRCF5uXtDroyj0Y=3D
=3DKzdc
-----END PGP SIGNATURE-----

--aX3nwywEo3oo70ssI8rjWTr0axwsPUFqi--

------------------------------

Date: Tue, 1 Oct 2019 11:50:15 -0700
From: Arun Sudhir <arunsudhir19(a)gmail.com>
Subject: [tpm2] Error running tpm2_create: magic does not match!
To: tpm2(a)lists.01.org
Message-ID:
        <CAJLNp_XZ0UonxQane-no3GVCzGq4X-X7p9Y0_fva5qZO9bOrVg(a)mail.gmail.c=
om>
Content-Type: multipart/alternative;
        boundary=3D"00000000000050f90b0593ddd367"

--00000000000050f90b0593ddd367
Content-Type: text/plain; charset=3D"UTF-8"

I hve ported tpm2_tools to windows and and am able to run tpm2_getrandom,
tpm2_createprimary etc. I am using the ctx file generated by
tpm2_createprimary to run tpm2_create.

HEre are the commands i used:

tpm2_createprimary -c primary.ctx (works)tpm2_create -C primary.ctx -u
obj.pub -r obj.priv (fails)



This is the error i get:

ERROR: Found magic 0x40000001 did not match expected magic of 0xbadcc0de!
WARN: The loaded tpm context does not appear to be in the proper format,
assuming old format, this will be converted on the next save.
ERROR: Could not load tpm context file
ERROR: Failed to load_tpm_context_file()
ERROR: Unable to run
C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\x64\Debug\tpm2-create.e=
xe


I see from files.c that the magic is hardcoded.
/**
 * This is the magic for the file header. The header is organized
 * as a big endian U32 (BEU32) of MAGIC followed by a BEU32 of the
 * version number. Tools can define their own, individual file
 * formats as they make sense, but they should always have the header.
 */
static const UINT32 MAGIC =3D 0xBADCC0DE;
Is this a windows vs Linux issue? Should i change the magic value?

--00000000000050f90b0593ddd367
Content-Type: text/html; charset=3D"UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D3D"ltr"><div>I hve ported tpm2_tools to windows and and am able =
to=3D
 run tpm2_getrandom, tpm2_createprimary etc. I am using the ctx file genera=
=3D
ted by tpm2_createprimary to run tpm2_create.=3DC2=3DA0</div><div><br></div=
><di=3D
v>HEre are the commands i used:</div><div><br></div><div><pre class=3D3D"gm=
ai=3D
l-indent-7" style=3D3D"box-sizing:border-box;overflow-x:auto;font-family:SF=
Mo=3D
no-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;fon=
=3D
t-size:0.9rem;margin-top:0px;margin-bottom:0px;padding-left:2rem;color:rgb(=
=3D
51,51,51);background-color:rgb(247,247,247)"><code style=3D3D"box-sizing:bo=
rd=3D
er-box;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menl=
=3D
o,Courier,monospace;font-size:0.9rem">tpm2_createprimary=3DC2=3DA0-c=3DC2=
=3DA0prima=3D
ry.ctx (works)
</code>tpm2_create=3DC2=3DA0-C=3DC2=3DA0primary.ctx=3DC2=3DA0-u=3DC2=3DA0ob=
j.pub=3DC2=3DA0-r=3DC2=3D
=3DA0obj.priv (fails)</pre><pre class=3D3D"gmail-indent-7" style=3D3D"box-s=
izing:=3D
border-box;overflow-x:auto;font-family:SFMono-Regular,Consolas,&quot;Libera=
=3D
tion Mono&quot;,Menlo,Courier,monospace;font-size:0.9rem;margin-top:0px;mar=
=3D
gin-bottom:0px;padding-left:2rem;color:rgb(51,51,51);background-color:rgb(2=
=3D
47,247,247)"><code style=3D3D"box-sizing:border-box;font-family:SFMono-Regu=
la=3D
r,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:0.=
=3D
9rem">

</code></pre></div><div><br></div><div>This is the error i get:=3DC2=3DA0</=
div>=3D
<div><br></div>ERROR: Found magic 0x40000001 did not match expected magic o=
=3D
f 0xbadcc0de!<br>WARN: The loaded tpm context does not appear to be in the =
=3D
proper format, assuming old format, this will be converted on the next save=
=3D
.<br>ERROR: Could not load tpm context file<br>ERROR: Failed to load_tpm_co=
=3D
ntext_file()<br>ERROR: Unable to run C:\Users\arunsu\source\repos\tpm2-tool=
=3D
s-4.0\vstudio\x64\Debug\tpm2-create.exe<br><div><br></div><div><br></div><d=
=3D
iv>I see from files.c that the magic is hardcoded.</div><div><font face=3D3=
D"=3D
monospace">/**<br>=3DC2=3DA0* This is the magic for the file header. The he=
ader=3D
 is organized<br>=3DC2=3DA0* as a big endian U32 (BEU32) of MAGIC followed =
by a=3D
 BEU32 of the<br>=3DC2=3DA0* version number. Tools can define their own, in=
divi=3D
dual file<br>=3DC2=3DA0* formats as they make sense, but they should always=
 hav=3D
e the header.<br>=3DC2=3DA0*/<br>static const UINT32 MAGIC =3D3D 0xBADCC0DE=
;</fon=3D
t><br></div><div><font face=3D3D"arial, sans-serif">Is this a windows vs Li=
nu=3D
x issue? Should i change the magic value?</font></div></div>

--00000000000050f90b0593ddd367--

------------------------------

Subject: Digest Footer

_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

------------------------------

End of tpm2 Digest, Vol 27, Issue 30
************************************
--===============6520241549978922751==--

