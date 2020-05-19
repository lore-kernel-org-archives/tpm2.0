Content-Type: multipart/mixed; boundary="===============2247683864614933921=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: NVRAM Write and Read using Esys API(s)
Date: Tue, 19 May 2020 14:47:08 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EE6978@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANGCWd1+nenr4dr+rwXp+E6M5W_QTWAJr+rGV4cg-nMUBQSOUw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2247683864614933921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I see that your auth handle should be an ESYS_TR for the authorization. It'=
s currently
The raw tpm handle for the Owner Hiearchy. ESYS will not understand this.

You can authorize to an NV Index using the auth the hierarchy the NV was cr=
eated in, or the
NV index. Think of it as two ways to access the NV Index, Hierarchy password
Or per-nv-index password. This is controllable via attributes OWNER_<XXX>
And AUTH_<XXX> attributes.

Just pass the same ESYS_TR that is the NV Index as the auth handle as well.

I have no idea where that error code is coming from, perhaps it=E2=80=99s a=
 bug in Esys
And it's not formatting the error code properly....

> -----Original Message-----
> From: Muthukumar S [mailto:muthu.smk(a)gmail.com]
> Sent: Monday, May 18, 2020 12:08 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] NVRAM Write and Read using Esys API(s)
> =

> Hi Roberts ,
> =

> Once again thanks a lot for your guidance.  I have looked in to nv.sh fro=
m the
> tpm2-tools folder and find out how to use the
> tpm2 define , tpm2 write and read it back . Now it is working as expected.
> Below are the commands and its output:
> =

> =

> root(a)muthu-vb:~/work# ./tpm2_nvdefine -Q -x 0x1000001 -a 0x40000001 -s =
32 -t
> "ownerread|policywrite|ownerwrite"
> =

> root(a)muthu-vb:~/work#
> =

> root(a)muthu-vb:~/work# ./tpm2_nvwrite -Q -x 0x1000001 -a 0x40000001
> nv.test_w
> =

> root(a)muthu-vb:~/work# ./tpm2_nvread -x 0x1000001 -a 0x40000001
> =

> pleafoo23abc
> =

> =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD
> =

> root(a)muthu-vb:~/work/tpm2/tpm_evo/install/bin#
> =

> =

> =

> =

> Now, i tried used the test application to just read it back from the above
> 0x1000001 offset .  The sample code (pls find attachment)
> =

> has read function which uses Esys_NV_Read () api to read the offset.  But=
 am
> getting error code with "70018"  , i could not able to find much details =
from
> tpm2_rc_decode of this error.
> =

> =

> =

> =

> From the debug log (ref attachment : debug_log.txt)  , i could see "Esys =
handle
> does not exist" (70018). What i suppose to do to get this handle and make
> Esys_NV_Read () successfully read from already defined offset ?
> =

> =

> =

> =

> =

> Previous to this error , i was getting 0x12f (which is nothing but
> TPM2_RC_AUTH_UNAVAILABLE) . So what i did was , i given the 'authHandle =
=3D
> 0x40000001" and set this value as second argument
> =

> =

> of Esys_NV_Read Api  . After doing that , am getting this "Esys handle do=
es not
> exist" (70018)   error , let me know what am i missing here. Attached "lo=
g file" as
> well for your reference along with test code.
> =

> =

> =

> =

> Also tried to "nv_define" once again and then try to read it back . Since=
 it doesn't
> make sense, because we have already defined using command line  and writt=
en
> data in to it.
> =

> So i believe there is no point in doing nv define and then reading it bac=
k . Hope
> nv_define is not required here ?
> =

> =

> =

> =

> NOTE : This test code also have "get_random number" and , "nv_write" func=
tions
> implemented . As i said to you earlier , i want to generate random number=
 and
> then write in to nvram and read it back .  Since the "nv_read" itself not=
 happening
> by which the offset was already well defined and data already written in =
to it
> using command line tool API , i could not able to proceed further.
> =

> =

> =

> =

> =

> =

> =

> BR,
> =

> Muthukumar
> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> =

> On Fri, May 15, 2020 at 8:24 PM Roberts, William C <william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	> -----Original Message-----
> 	> From: Muthukumar S [mailto:muthu.smk(a)gmail.com
> <mailto:muthu.smk(a)gmail.com> ]
> 	> Sent: Friday, May 15, 2020 7:58 AM
> 	> To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> Subject: Re: [tpm2] NVRAM Write and Read using Esys API(s)
> 	>
> 	> Hi Williams C,
> 	> Thanks for your quick response. As you suggested , i have tried below
> options
> 	>
> 	> I tried to get the index of nvram of sim that am working using
> tpm2_getcap tools
> 	> API .Bellow are the tpm2_getcap capabilities that i found by reading t=
he
> 	> tpm2_getcap code . Request you to share me some pointers of using
> 	> tpm2_getcap() .
> 	>
> 	>
> 	>
> 	> Available capability from tpm2_getcap.c
> 	>
> 	>         .capability_string =3D "algorithms"
> 	>
> 	>         .capability_string =3D "commands"
> 	>
> 	>         .capability_string =3D "properties-fixed",
> 	>
> 	>         .capability_string =3D "properties-variable",
> 	>
> 	>         .capability_string =3D "ecc-curves",
> 	>
> 	>         .capability_string =3D "handles-transient",
> 	>
> 	>         .capability_string =3D "handles-persistent",
> 	>
> 	>         .capability_string =3D "handles-permanent",
> 	>
> 	>         .capability_string =3D "handles-pcr",
> 	>
> 	>         .capability_string =3D "handles-nv-index",
> 	>
> 	>         .capability_string =3D "handles-loaded-session",
> 	>
> 	>         .capability_string =3D "handles-saved-session",
> 	>
> 	>
> 	>
> 	>
> 	> In the above list , i tried all "capability string " but i could't abl=
e to see
> the below
> 	> output given by tpm2_nvlist (which i used to get with different tpm-
> tools version
> 	> that i used earlier) .
> 	>
> =

> 	Put the tool in a debugger and look at the arguments passed to
> Esys_GetCapability and mimic it.
> 	It's time you learn how to fish.
> =

> 	>
> 	>
> 	>
> 	> # tpm2_nvlist
> 	>
> 	> O/P
> 	>
> 	> 1 NV indexes defined.
> 	>
> 	>  0. NV Index: 0x1500015
> 	>
> 	>  {
> 	>
> 	>  Hash algorithm(nameAlg):11
> 	>
> 	> The Index attributes(attributes):0x64014001
> 	>
> 	>        The size of the data area(dataSize):32
> 	>
> 	>           }
> 	>
> 	>
> 	>
> 	>
> 	> 1) Even though this tpm2_nvlist that was there in my current tpm2-
> tools version
> 	> (tpm2-tools-3.X) ,by which it is not showing me any output .
> 	>
> 	> #tpm2_nvlist
> 	>
> 	> #
> 	>
> =

> 	I don't know if your trying to ask something here, are you?
> =

> 	>
> 	>
> 	>
> 	>
> 	>
> 	>
> 	> 2) Tried get_cap of "handles-permanent" , which shows me below
> values as
> 	> shown below , but not sure how to get the index of particular tpm bank
> =

> 	Banks are for PCRs, ie PCR0 can have a SHA1 and SH256 bank.
> =

> 	>
> 	> #/tpm2/tpm_evo/tpm2-tools-3.X/tools# ./tpm2_getcap --
> capability=3D"handles-
> 	> permanent"
> =

> 	Stop using 3.X its deprecated, grab the latest 4.X release and build it.
> 	The tools actually work.
> =

> 	>
> 	> 0x40000001
> 	>
> 	> 0x40000007
> 	>
> 	> 0x40000009
> 	>
> 	> 0x4000000a
> 	>
> 	> 0x4000000b
> 	>
> 	> 0x4000000c
> 	>
> 	> 0x4000000d
> =

> 	Those are not NV handles, NV Handles start with 0x10
> =

> 	>
> 	>
> 	>
> 	>
> 	> 2)Also tried reading pcr list using tpm2_getcap . Is the below offset(=
s)
> are stands
> 	> for ?
> 	>
> 	> # ./tpm2_getcap --capability=3D"handles-pcr"
> =

> 	Again, NV Indexes ARE NOT PCR's.
> =

> 	>
> 	> 0x00000000
> 	>
> 	> 0x00000001
> 	>
> 	> 0x00000002
> 	>
> 	> 0x00000003
> 	>
> 	> 0x00000004
> 	>
> 	> 0x00000005
> 	>
> 	> 0x00000006
> 	>
> 	> 2.1) Request you to share me few points on how to use the
> "tpm2_getcap() and
> 	> get the offset ?
> 	>
> =

> 	Debuggers are your friend.
> =

> 	>
> 	>
> 	> Since none of the above tools API helped me or am i missing some thing
> to read
> 	> the output of NVRAM index ?
> =

> 	I would upgrade to newer tools. If you must stay in the 3.X land, then
> copy what the test
> 	scripts are doing, they do it completely. Look for nv.sh.
> =

> 	>
> 	> 3) Without knowing the offset , tried to define offset from 0x1500015
> and trying
> 	> to write and read back , here nvdefine works along with nvwrite ..but
> nvread fails
> 	> with "auth" issue. Please refere below sequence and associated errors
> 	>
> 	>
> 	> 3.1) Tried defining nvram using tpm2_nvdefine - Succeeded with out
> any error  --
> 	> given -a 0x40000001 (TPM_RH_OWNER Access) , if i define with
> 0x4000000C
> 	> (TPM_RH_OWNER , i got the same result during tpm2_nvread . Here
> removing "-t
> 	> 0x2000A" option and then doing nvdefine also throws me the same
> error shown
> 	> in point 3.3 during nvread
> 	>
> 	> #./tpm2_nvdefine -x 0x1500016 -a 0x40000001 -s 32 -t 0x2000A
> =

> 	Offhand, I don't know what the 0x2000A mask is, so I would have to look
> it up, but I am not going to.
> 	Use string masks.
> =

> 	If you just upgrade to a 4.x tools, it should work. I remember some issu=
es
> with attributes on the 3.X branch
> 	Tools.
> =

> 	>
> 	> #
> 	>
> 	>
> 	>
> 	>
> 	> 3.2) Tried NVWRITE in the same offset 0x1500015  - Succeeded without
> any error
> 	>
> 	> # ./tpm2_nvwrite -x 0x1500015 -L test_helloworld
> 	>
> 	> #
> 	>
> 	>
> 	>
> 	>
> 	> 3.3) Reading back the same offset -x1500015 , which throws below error
> stating
> 	> TPM2_RC_NV_UNINITIALIZED. Since i have initialized it as said above
> point 3.1  ,
> 	> what am i missing here ?
> =

> 	Upgrade your tools, and the example I showed yesterday should work.
> =

> 	>
> 	>
> 	>
> 	>
> 	> Below are the OPTIONS I have by tpm2_nvread:
> 	>
> 	> as you suggested  to use (echo `tpm2_nvread -C o -s5 0x1500015`
> command)
> 	>
> 	> I cant see -C (this might be due to tools version 3.X ? . If it is not=
 the
> latest , can't
> 	> we able to use the below APIs ?
> 	>
> 	>
> 	>
> 	>
> 	> # ./tpm2_nvread
> 	>
> 	> Usage: tpm2_nvread [<options>]
> 	>
> 	> Where <options> are:
> 	>
> 	>     [ -x | --index=3D<value>] [ -a | --auth-handle=3D<value>] [ -f | --
> output=3D<value>] [
> 	> -s | --size=3D<value>]
> 	>
> 	>     [ -o | --offset=3D<value>] [ -P | --handle-passwd=3D<value>] [ -S =
| --
> input-session-
> 	> handle=3D<value>] [ -L | --set-list=3D<value>]
> 	>
> 	>     [ -F | --pcr-input-file=3D<value>]
> 	>
> 	>
> 	>
> 	>
> 	> # ./tpm2_nvread -x 0x1500015 -a 0x40000001 -s 32
> 	>
> 	> ERROR: Failed to read NVRAM area at index 0x1500015 (22020117).
> Error:0x14a
> 	>
> 	> ERROR: Unable to run ./tpm2_nvread
> 	>
> 	>
> 	>
> 	>
> 	> # tpm2_rc_decode 0x14a
> 	>
> 	> error layer
> 	>
> 	>   hex: 0x0
> 	>
> 	>   identifier: TSS2_TPM_RC_LAYER
> 	>
> 	>   description: Error produced by the TPM
> 	>
> 	> format 0 error code
> 	>
> 	>   hex: 0x4a
> 	>
> 	>   name: TPM2_RC_NV_UNINITIALIZED
> 	>
> 	>   description: an NV Index is used before being initialized or the sta=
te
> saved by
> 	> TPM2_Shutdown(STATE) could not be restored
> 	>
> 	>
> 	>
> 	>
> 	> 3.4) Tried reading the same offset 0x1500015 without giving '-a'
> 	> (TPM2_RH_OWNER) access , but the results shown
> NV_AUTHORIZATION. So i
> 	> understood
> 	>
> 	> if we defined with -a auth permission then we need to give the same
> permission
> 	> while reading the content from the same offset. Is my understanding is
> correct ?
> 	>
> 	>
> 	>
> 	>
> 	> # ./tpm2_nvread -x 0x1500015 -s 32
> 	>
> 	>
> 	> ERROR: Failed to read NVRAM area at index 0x1500015 (22020117).
> Error:0x149
> 	> ERROR: Unable to run ./tpm2_nvread
> 	>
> 	>
> 	> # tpm2_rc_decode 0x149
> 	> error layer
> 	>   hex: 0x0
> 	>   identifier: TSS2_TPM_RC_LAYER
> 	>   description: Error produced by the TPM format 0 error code
> 	>   hex: 0x49
> 	>   name: TPM2_RC_NV_AUTHORIZATION
> 	>   description: NV access authorization fails in command actions (this
> failure does
> 	> not affect lockout.action)
> 	>
> 	>
> 	>
> 	>
> 	>
> 	> 4) Tried to use tpm2_readpublic to read above written offset 0x1500015
> , getting
> 	> 0x184 (value is out of range or is not correct for the context) what a=
m i
> missing
> 	> here ?
> 	>
> 	> # ./tpm2_readpublic
> 	> Usage: tpm2_readpublic [<options>]
> 	> Where <options> are:
> 	>     [ -H | --object=3D<value>] [ -o | --opu=3D<value>] [ -c | --contex=
t-
> object=3D<value>]
> 	> [ -f | --format=3D<value>]
> 	>
> 	>
> 	>
> 	>
> 	> # ./tpm2_readpublic -H 0x1500015
> 	> ERROR: TPM2_ReadPublic error: rval =3D 0x184
> 	> ERROR: Unable to run ./tpm2_readpublic
> 	> root(a)muthu-vb:~/work/tpm2/tpm_evo/install/bin#
> ./tpm2_readpublic -H
> 	> 0x1500015 --opu file
> 	> ERROR: TPM2_ReadPublic error: rval =3D 0x184
> 	> ERROR: Unable to run ./tpm2_readpublic
> 	> root(a)muthu-vb:~/work/tpm2/tpm_evo/install/bin#
> ./tpm2_rc_decode 0x184
> 	> error layer
> 	>   hex: 0x0
> 	>   identifier: TSS2_TPM_RC_LAYER
> 	>   description: Error produced by the TPM
> 	> format 1 error code
> 	>   hex: 0x04
> 	>   identifier: TPM2_RC_VALUE
> 	>   description: value is out of range or is not correct for the context
> 	> handle
> 	>   hex:0x100
> 	>   identifier:  TPM2_RC_1
> 	>   description:  (null)
> 	>
> 	>
> 	>
> 	> #
> 	>
> 	>
> 	>
> 	>
> 	>
> 	> 5)Tried releasing the same offset using nvrelease that too works fine
> 	>
> 	> #./tpm2_nvrelease -x 0x1500015 -a 0x40000001
> 	>
> 	> #
> 	>
> 	>
> 	>
> 	>
> 	> As per my request raised by yesterday . I need to define an offset in =
nv
> ram then
> 	> write content only once and read it back when ever required.  During
> every
> 	> second write , i need to read the offset (you suggested to use
> 	> tpm2_nvreadpubic() , but i struck with usage of this "nvread public ap=
i"
> command
> 	> as well (results are just shown above)
> 	>
> 	>
> 	>
> 	>
> 	> As per today's experiments , i cant able able to achieve the (nvread)
> using
> 	> command line API . Let me know what am i missing here .
> 	>
> 	>
> 	>
> 	>
> 	> Looking forward for your valuable reply.
> 	>
> 	>
> 	>
> 	>
> 	> Thanks,
> 	>
> 	> Muthukumar
> 	>
> 	>
> 	>
> 	>
> 	>
> 	>
> 	>
> 	> On Thu, May 14, 2020 at 12:51 AM Roberts, William C
> 	> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.c=
om> > >
> wrote:
> 	>
> 	>
> 	>       > -----Original Message-----
> 	>       > From: muthu.smk(a)gmail.com <mailto:muthu.smk(a)gmail.com>
> <mailto:muthu.smk(a)gmail.com <mailto:muthu.smk(a)gmail.com> >
> 	> [mailto:muthu.smk(a)gmail.com <mailto:muthu.smk(a)gmail.com>
> <mailto:muthu.smk(a)gmail.com <mailto:muthu.smk(a)gmail.com> > ]
> 	>       > Sent: Wednesday, May 13, 2020 12:51 PM
> 	>       > To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > Subject: [tpm2] NVRAM Write and Read using Esys API(s)
> 	>       >
> 	>       > Hi Williams,
> 	>       >
> 	>       > I am using the test code used to read and write in to NV ram. =
 I am
> 	> facing below
> 	>       > challenges if i tried to read already written data from NVRAM.
> 	>       >
> 	>       > 1) Test code attached defined create the context (ectx) , crea=
te
> random
> 	> number ,
> 	>       > define NV ram , write the random number in to NVRAM (offset
> 	> 0x1000001) and
> 	>       > read it back from NV Ram (from same offset 0x1000001)
> 	>       >
> 	>       > 2) But if i try to run this code twice or thrise , am getting =
below
> NVRAM
> 	> already
> 	>       > defined rc code. I can understand that we should not defined t=
he
> nv
> 	> ram space
> 	>       > which already defined and used.
> 	>       > How to avoid this ? by defining nvram ONLY once and write it O=
NLY
> 	> once and
> 	>       > finally read it AS MUCH times we want ?  Below details are rel=
ated
> to
> 	> this request
> 	>
> 	>       You can call Esys_GetCapability() and see what NV indices are
> defined.
> 	> The command
> 	>       Line tool tpm2_getcap does this, like so:
> 	>       tpm2_getcap handles-nv-index
> 	>
> 	>       You can use that tool as an example of how to do it.
> 	>
> 	>       >
> 	>       > Error code:
> 	>       > 0x0000014c - description: NV Index or persistend object already
> defined
> 	>       > 0x00000284 - description: value is out of range or is not corr=
ect for
> the
> 	> context
> 	>       >
> 	>       > 3) Query is : is it possible to define nvram "ONLY ONCE" with =
the
> API
> 	> shared the
> 	>       > test code and then create a function "createrandom" number to
> use
> 	> the same
> 	>
> 	>       Call getcap, see if it's defined, if defined, don't define it....
> 	>
> 	>       > context (ects) to generate randumnumber then call separate
> 	> "write_nvram"
> 	>       > function with random number as input and ask to write in the
> same
> 	> offset .
> 	>       > Finally calling another function "read_nvram" to read it back =
from
> the
> 	> same
> 	>       > nvram's offset when ever we want ? i tried this approach but am
> 	> getting segfault
> 	>       > with above error .
> 	>       > What am i missing here ?
> 	>
> 	>       Segfaults are likely your code is just broken.
> 	>
> 	>       >
> 	>       > 3.1) Ideally in single application , i need to achieve
> "tpm2_nvdefine",
> 	>       > "tpm2_nvwrite" and "tpm2_nvread() tools API(s) functionality" =
in
> 	> different calls
> 	>       > or flow.
> 	>       > 3.2) Also how to check whether "write" already done (i tried
> checking
> 	> nv_index is
> 	>       > true - means whether it already has some value) , but it faile=
d ?
> 	>
> 	>       If you do what the tool tpm2_nvreadpublic does, you can check for
> the
> 	> written bit.
> 	>
> 	>       >
> 	>       > 4) Also how to check what was the content that already present=
 in
> the
> 	> nvram
> 	>       > offset (0x1000001) before i do write the "random number" second
> time
> 	> in to the
> 	>       > same offset ? this is to ensure the "random number" that i am
> planning
> 	> to write
> 	>       > was valid one ?
> 	>
> 	>       Read it out, if it's not what you want, write it.
> 	>
> 	>       >
> 	>       > I remember studying that, once u write in to NVRAM offset , we
> cant
> 	> able to RE-
> 	>       > WRITE it in the same offset(0x1000001). Whether that is the sa=
me
> case
> 	> for
> 	>       > SIMULATOR as well (or) this feature is only for real tpm hardw=
are?
> 	>
> 	>       No generally you can write as many times as you want... there are
> tricks
> 	> you can do to make
> 	>       It locked after write (writelocked iirc)
> 	>
> 	>       Below is a command line example of doing it...
> 	>
> 	>       tpm2_nvdefine
> 	>       nv-index: 0x1000000
> 	>
> 	>       tpm2_nvreadpublic 0x1000000
> 	>       0x1000000:
> 	>         name:
> 	>
> 000b1195f36a21c8219055ad0803c39e7e81d06cdb2eee2b7cf93dd83e01d4273828
> 	>         hash algorithm:
> 	>           friendly: sha256
> 	>           value: 0xB
> 	>         attributes:
> 	>           friendly: ownerwrite|authwrite|ownerread|authread
> 	>           value: 0x6000600
> 	>         size: 2048
> 	>
> 	>       # you can do this as much as you want, but it can wear the memory
> in the
> 	> TPM
> 	>       # depending on memory technology the vendor used.
> 	>       echo "hello" | tpm2_nvwrite -C o 0x1000000 -i-
> 	>       echo `tpm2_nvread -C o -s5 0x1000000`
> 	>       hello
> 	>
> 	>       tpm2_nvreadpublic 0x1000000
> 	>       0x1000000:
> 	>         name:
> 	>
> 000b287c9b1b06fab6e51bd26e98ea89460574e97a3d2ef995eb35f7e23db7e94f67
> 	>         hash algorithm:
> 	>           friendly: sha256
> 	>           value: 0xB
> 	>         attributes:
> 	>           friendly: ownerwrite|authwrite|ownerread|authread|written
> 	>           value: 0x6000620
> 	>         size: 2048
> 	>
> 	>       >
> 	>       > 6)After nvwrite i tried to use "tpm2_pcrlist" command line tool
> 	> application, by
> 	>       > which it shows the nv ram memory location , tried using
> tpm2_nvread ()
> 	> to read
> 	>       > the content but i could not able to see any data (random numbe=
r)
> that i
> 	> used to
> 	>       > write via this test application . dont know why ?
> 	>
> 	>       tpm2_pcrlist is not for NVs.... you want:
> 	>       tpm2_getcap handles-nv-index
> 	>
> 	>       >
> 	>       > 7) After i manually ran the below clear API , now the test cod=
e is
> 	> working fine
> 	>       > (refer Test code log shown below..). This confirms we can
> reallocate
> 	> already
> 	>       > defined nv ram memory.
> 	>       > #tpm2_nvrelease -x 0x1000001 -a 0x40000001
> 	>
> 	>       Tpm2_clear will clear the owner hierarchy, including NV ram obje=
cts
> 	> declared in that hierarchy,
> 	>       so define will work again, because you deleted it.
> 	>
> 	>       >
> 	>       >
> 	>       > 8)If i try to read it manually via below tpm2_nvread command w=
ith
> 	> offset
> 	>       > 0x1000001 am getting below error
> 	>       >
> 	>       > #tpm2_nvread -x 0x1000001 -a 0x40000001 -o 0 -s 20
> 	>       > ERROR: Failed to read NVRAM public area at index 0x1000001
> 	> (16777217).
> 	>       > Error:0x18b
> 	>       > ERROR: Unable to run tpm2_nvread
> 	>       >
> 	>       > /* Tried to use below tools command , am always getting the sa=
me
> 	> error even if
> 	>       > we give the different nvram off set tpm2_nvwrite -x 0x1c00002
> 	> helloworld
> 	>       > ERROR: Reading the public part of the nv index failed with: 0x=
18b
> 	>       > ERROR: Unable to run tpm2_nvwrite
> 	>       >
> 	>       > tpm2_nvwrite -x 0x1c00012 -a 0x40000001 helloworld
> 	>       > ERROR: Reading the public part of the nv index failed with: 0x=
18b
> 	>       > ERROR: Unable to run tpm2_nvwrite
> 	>       >
> 	>       >
> 	>       > /* Try to read the nvlist of SIM , it returns nothing !!!
> 	>       > #tpm2_nvlist <returns nothing>
> 	>       >
> 	>       > Any points will be great help for me.
> 	>       >
> 	>       > --------------------------------------------------------------=
-------------------
> ------
> 	> ------------
> 	>       > --------------------------------------------------------------
> 	>       > Test code log after above "tpm2_nvrelease":
> 	>       > Initializing
> 	>       > init_rand()
> 	>       > init_rsa()
> 	>       > init_ecc()
> 	>       > Engine name: TPM2-TSS engine for OpenSSL
> 	>       > Init result: 1
> 	>       > Setting owner auth to empty auth.
> 	>       > Setting parent auth to empty auth.
> 	>       > ERROR:tcti:src/tss2-tcti/tcti-device.c:440:Tss2_Tcti_Device_In=
it()
> Failed
> 	> to open
> 	>       > device file /dev/tpm0: No such file or directory
> 	>       > WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI =
init for
> 	> function
> 	>       > 0x7fc67376d18b failed with a000a
> 	>       > WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could=
 not
> 	> initialize TCTI
> 	>       > named: tcti-device
> 	>       > ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Cou=
ld not
> 	> initialize TCTI
> 	>       > file: libtss2-tcti-default.so
> 	>       >  No of bytes written by GenRandom : 64
> 	>       >
> 	>
> b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe
> 	>       > 8ece5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
> 	>       > Created NV Index: 0x1000001
> 	>       > ESYS_TR: 0x418367
> 	>       > ESYS_TR2: 0x418368
> 	>       > Writing the random number written in NV Ram
> 	>       > Data buffer size used to write into NVRam: 64
> 	>       > Reading the random number written in NV Ram
> 	>       >
> 	>
> b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe
> 	>       > 8ece5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
> 	>       > *** SUCCESS ***
> 	>       > ---------------------
> 	>       >
> 	>       > TEST CODE :
> 	>       >
> 	>       > int nv_write_read()
> 	>       > {
> 	>       >
> 	>       >       ESYS_CONTEXT *ectx =3D NULL;
> 	>       >
> 	>       >       ESYS_TR nv_index =3D 0;
> 	>       >       ESYS_TR nv_index2 =3D 0;
> 	>       >
> 	>       >        int rc =3D 1;
> 	>       >
> 	>       >
> 	>       >       /*
> 	>       >        * create a connection to the TPM letting ESAPI choose h=
ow to
> get
> 	> there.
> 	>       >        * If you need more control, you can use tcti and tcti-l=
dr libraries
> to
> 	>       >        * get a TCTI pointer to use for the tcti argument of
> Esys_Initialize.
> 	>       >        */
> 	>       >       rc =3D Esys_Initialize(&ectx,
> 	>       >                       NULL,  // let it find the TCTI
> 	>       >                       NULL); // Use whatever ABI
> 	>       >       if (rc !=3D TSS2_RC_SUCCESS) {
> 	>       >               printf("Esys_Initialize Failed: 0x%x\n", rc);
> 	>       >               return 1;
> 	>       >       }
> 	>       >
> 	>       >
> 	>       >         rc =3D Esys_GetRandom(ectx,
> 	>       >                         ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NO=
NE,
> 	>       >                         64, &bytes);
> 	>       >         if (rc !=3D TSS2_RC_SUCCESS) {
> 	>       >                 printf("Esys_GetRandom Failed: %s\n",
> Tss2_RC_Decode(rc));
> 	>       >                 exit(1);
> 	>       >         }
> 	>       >
> 	>       >       printf(" No of bytes written by GenRandom : %d\n",bytes-
> >size);
> 	>       >       size_t i;
> 	>       >       for (i =3D 0; i < bytes->size; i++) {
> 	>       >               printf("%02x", bytes->buffer[i]);
> 	>       >       }
> 	>       >
> 	>       >       printf("\n");
> 	>       >
> 	>       >       /* build a template for the NV index */
> 	>       >       TPM2B_NV_PUBLIC pub_templ =3D {
> 	>       >               /* this is counter intuitive, but it tells the T=
SS2 library to
> calculate
> 	>       > this for us */
> 	>       >               .size =3D 0,
> 	>       >               /* The things that define what NV index we are c=
reating */
> 	>       >               .nvPublic =3D {
> 	>       >                       /* uses sha256 to identify the tpm objec=
t by name */
> 	>       >                       .nameAlg =3D TPM2_ALG_SHA256,
> 	>       >                       /* allows the owner password or index pa=
ssword r/w
> 	>       > access */
> 	>       >                       .attributes =3D TPMA_NV_OWNERWRITE |
> 	>       >                               TPMA_NV_OWNERREAD            |
> 	>       >                               TPMA_NV_AUTHWRITE            |
> 	>       >                               TPMA_NV_AUTHREAD,
> 	>       >                       /* can hold 64 bytes of data */
> 	>       >                       .dataSize =3D 64,
> 	>       >                       /* Create at NV Index 1 or 0x1000001 */
> 	>       >                       .nvIndex =3D TPM2_HR_NV_INDEX + 1
> 	>       >               },
> 	>       >       };
> 	>       >
> 	>       >
> 	>       >       /* Ok, define the space and store the nv_index for futur=
e use
> */
> 	>       >       rc =3D Esys_NV_DefineSpace(
> 	>       >           ectx,
> 	>       >               ESYS_TR_RH_OWNER, /* create an NV index in the o=
wner
> 	>       > hierarchy */
> 	>       >           ESYS_TR_PASSWORD, /* auth as the owner with a passwo=
rd,
> 	> which is
> 	>       > empty */
> 	>       >           ESYS_TR_NONE,
> 	>       >           ESYS_TR_NONE,
> 	>       >           NULL,
> 	>       >           &pub_templ,
> 	>       >           &nv_index);
> 	>       >       if (rc !=3D TSS2_RC_SUCCESS) {
> 	>       >               printf("Esys_NV_DefineSpace Failed: 0x%x\n", rc);
> 	>       >               goto out;
> 	>       >       }
> 	>       >
> 	>       >       /* Note if you need to set the owner hierarchy auth valu=
e you
> use:
> 	>       >        * TSS2_RC Esys_TR_SetAuth(
> 	>       >        *     ESYS_CONTEXT *esysContext,
> 	>       >          *     ESYS_TR handle,
> 	>       >          *     TPM2B_AUTH const *authValue);
> 	>       >        */
> 	>       >
> 	>       >       printf("Created NV Index: 0x%x\n",
> pub_templ.nvPublic.nvIndex);
> 	>       >       printf("ESYS_TR: 0x%x\n", nv_index);
> 	>       >
> 	>       >       /*
> 	>       >        * Note: if we need to convert the nvIndex into an ESYS_=
TR, the
> 	> below
> 	>       > will
> 	>       >        * do it. Its not required for this case, since Esys_NV_=
Define
> gives us
> 	> an
> 	>       >        * ESYS_TR.
> 	>       >        */
> 	>       >       rc =3D Esys_TR_FromTPMPublic(
> 	>       >               ectx,
> 	>       >               TPM2_HR_NV_INDEX + 1,
> 	>       >               ESYS_TR_NONE,
> 	>       >               ESYS_TR_NONE,
> 	>       >               ESYS_TR_NONE,
> 	>       >               &nv_index2);
> 	>       >       if (rc !=3D TSS2_RC_SUCCESS) {
> 	>       >               printf("Esys_TR_FromTPMPublic Failed: 0x%x\n", r=
c);
> 	>       >               goto out;
> 	>       >       }
> 	>       >
> 	>       >       printf("ESYS_TR2: 0x%x\n", nv_index2);
> 	>       >
> 	>       >       /* copy some data into a buffer to send to the TPM */
> 	>       >       TPM2B_MAX_NV_BUFFER write_data =3D { 0 };
> 	>       >       memcpy(write_data.buffer, bytes->buffer, bytes->size);
> 	>       >       write_data.size =3D bytes->size;
> 	>       >
> 	>       >       printf("Writing the random number written in NV Ram\n");
> 	>       >       printf("Data buffer size used to write into NVRam:
> 	>       > %d\n",write_data.size);
> 	>       >       /*
> 	>       >        * Write the data to the TPM NV index at offset 0
> 	>       >        */
> 	>       >       rc =3D Esys_NV_Write(
> 	>       >           ectx,
> 	>       >           nv_index, /* authenticate to the NV index using the =
NV index
> 	>       > password */
> 	>       >           nv_index, /* the nv index to write to */
> 	>       >           ESYS_TR_PASSWORD,
> 	>       >               ESYS_TR_NONE,
> 	>       >               ESYS_TR_NONE,
> 	>       >           &write_data,
> 	>       >           0);
> 	>       >       if (rc !=3D TSS2_RC_SUCCESS) {
> 	>       >               printf("Esys_NV_Write Failed: 0x%x\n", rc);
> 	>       >               goto out;
> 	>       >       }
> 	>       >
> 	>       >       /* Read the data back, and just for fun, we will use nv_=
index2
> 	>       >        * to prove it's pointing to the same NV location in the=
 TPM.
> 	>       >        */
> 	>       >       TPM2B_MAX_NV_BUFFER *read_data =3D NULL;
> 	>       >       rc =3D Esys_NV_Read(
> 	>       >           ectx,
> 	>       >           nv_index2, /* authenticate to the NV index using the=
 NV
> index
> 	>       > password */
> 	>       >           nv_index2, /* the nv index to read from */
> 	>       >           ESYS_TR_PASSWORD,
> 	>       >           ESYS_TR_NONE,
> 	>       >           ESYS_TR_NONE,
> 	>       >           bytes->size,
> 	>       >           0,
> 	>       >           &read_data);
> 	>       >       if (rc !=3D TSS2_RC_SUCCESS) {
> 	>       >               printf("Esys_NV_Read Failed: 0x%x\n", rc);
> 	>       >               goto out;
> 	>       >       }
> 	>       >
> 	>       >       /* Print things as a string from the TPM carefully!
> 	>       >        * Injected traffic via MITM means that you cannot trust=
 this
> 	>       >        * to be null terminated.
> 	>       >        */
> 	>       >       printf("Reading the random number written in NV Ram\n");
> 	>       >       for (i =3D 0; i < read_data->size; i++) {
> 	>       >               printf("%02x", read_data->buffer[i]);
> 	>       >       }
> 	>       >       printf("\n");
> 	>       >
> 	>       >       Esys_Free(read_data);
> 	>       >       rc =3D 0;
> 	>       >
> 	>       > out:
> 	>       >
> 	>       >       /* remove the NV space */
> 	>       >       if (nv_index) {
> 	>       >               int rc2 =3D Esys_NV_UndefineSpace(
> 	>       >                       ectx,
> 	>       >                       ESYS_TR_RH_OWNER,
> 	>       >                       nv_index,
> 	>       >                       ESYS_TR_PASSWORD,
> 	>       >                       ESYS_TR_NONE,
> 	>       >                       ESYS_TR_NONE);
> 	>       >               if (rc2 !=3D TSS2_RC_SUCCESS) {
> 	>       >                       printf("Esys_NV_UndefineSpace Failed: 0x=
%x\n", rc2);
> 	>       >                       rc =3D 1;
> 	>       >               }
> 	>       >       }
> 	>       >
> 	>       >       Esys_Finalize(&ectx);
> 	>       >
> 	>       >         printf("Exit from nv_write_read()\n");
> 	>       >       return rc;
> 	>       > }
> 	>       > _______________________________________________
> 	>       > tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.=
01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>       > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> leave(a)lists.01.org <mailto:leave(a)lists.01.org> >
> 	>       > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> 	>
> =

> =



--===============2247683864614933921==--

