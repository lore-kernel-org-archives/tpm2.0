Content-Type: multipart/mixed; boundary="===============5093969115944267638=="
MIME-Version: 1.0
From: Muthukumar S <muthu.smk at gmail.com>
Subject: [tpm2] Re: NVRAM Write and Read using Esys API(s)
Date: Mon, 18 May 2020 22:38:26 +0530
Message-ID: <CANGCWd1+nenr4dr+rwXp+E6M5W_QTWAJr+rGV4cg-nMUBQSOUw@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EDE55E@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5093969115944267638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Roberts ,

Once again thanks a lot for your guidance.  I have looked in to nv.sh from
the tpm2-tools folder and find out how to use the
tpm2 define , tpm2 write and read it back . Now it is working as expected.
Below are the commands and its output:

root(a)muthu-vb:~/work# ./tpm2_nvdefine -Q -x 0x1000001 -a 0x40000001 -s 32
-t "ownerread|policywrite|ownerwrite"

root(a)muthu-vb:~/work#

root(a)muthu-vb:~/work# ./tpm2_nvwrite -Q -x 0x1000001 -a 0x40000001 nv.tes=
t_w

root(a)muthu-vb:~/work# ./tpm2_nvread -x 0x1000001 -a 0x40000001

pleafoo23abc

=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD

root(a)muthu-vb:~/work/tpm2/tpm_evo/install/bin#


Now, i tried used the test application to just read it back from the above*
0x1000001 offset* .  The sample code (pls find attachment)

has read function which uses Esys_NV_Read () api to read the offset.  But
am getting error code with "*70018*"  , i could not able to find much
details from tpm2_rc_decode of this error.


From the debug log (ref attachment : debug_log.txt)  , i could see "Esys
handle does not exist" (70018). What i suppose to do to get this handle and
make Esys_NV_Read () successfully read from already defined offset ?


Previous to this error , i was getting 0x12f (which is nothing but
TPM2_RC_AUTH_UNAVAILABLE) . So what i did was , i given the 'authHandle =3D
0x40000001" and set this value as second argument

of Esys_NV_Read Api  . After doing that , am getting this "Esys handle does
not exist" (70018)   error , let me know what am i missing here. Attached
"log file" as well for your reference along with test code.


Also tried to "nv_define" once again and then try to read it back . Since
it doesn't make sense, because we have already defined using command line
 and written data in to it.

So i believe there is no point in doing nv define and then reading it back
. Hope nv_define is not required here ?


*NOTE *: This test code also have "get_random number" and , "nv_write"
functions implemented . As i said to you earlier , i want to generate
random number and then write in to nvram and read it back .  Since the
"nv_read" itself not happening by which the offset was already well defined
and data already written in to it using command line tool API , i could not
able to proceed further.



BR,

Muthukumar









On Fri, May 15, 2020 at 8:24 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> > -----Original Message-----
> > From: Muthukumar S [mailto:muthu.smk(a)gmail.com]
> > Sent: Friday, May 15, 2020 7:58 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: tpm2(a)lists.01.org
> > Subject: Re: [tpm2] NVRAM Write and Read using Esys API(s)
> >
> > Hi Williams C,
> > Thanks for your quick response. As you suggested , i have tried below
> options
> >
> > I tried to get the index of nvram of sim that am working using
> tpm2_getcap tools
> > API .Bellow are the tpm2_getcap capabilities that i found by reading the
> > tpm2_getcap code . Request you to share me some pointers of using
> > tpm2_getcap() .
> >
> >
> >
> > Available capability from tpm2_getcap.c
> >
> >         .capability_string =3D "algorithms"
> >
> >         .capability_string =3D "commands"
> >
> >         .capability_string =3D "properties-fixed",
> >
> >         .capability_string =3D "properties-variable",
> >
> >         .capability_string =3D "ecc-curves",
> >
> >         .capability_string =3D "handles-transient",
> >
> >         .capability_string =3D "handles-persistent",
> >
> >         .capability_string =3D "handles-permanent",
> >
> >         .capability_string =3D "handles-pcr",
> >
> >         .capability_string =3D "handles-nv-index",
> >
> >         .capability_string =3D "handles-loaded-session",
> >
> >         .capability_string =3D "handles-saved-session",
> >
> >
> >
> >
> > In the above list , i tried all "capability string " but i could't able
> to see the below
> > output given by tpm2_nvlist (which i used to get with different
> tpm-tools version
> > that i used earlier) .
> >
>
> Put the tool in a debugger and look at the arguments passed to
> Esys_GetCapability and mimic it.
> It's time you learn how to fish.
>
> >
> >
> >
> > # tpm2_nvlist
> >
> > O/P
> >
> > 1 NV indexes defined.
> >
> >  0. NV Index: 0x1500015
> >
> >  {
> >
> >  Hash algorithm(nameAlg):11
> >
> > The Index attributes(attributes):0x64014001
> >
> >        The size of the data area(dataSize):32
> >
> >           }
> >
> >
> >
> >
> > 1) Even though this tpm2_nvlist that was there in my current tpm2-tools
> version
> > (tpm2-tools-3.X) ,by which it is not showing me any output .
> >
> > #tpm2_nvlist
> >
> > #
> >
>
> I don't know if your trying to ask something here, are you?
>
> >
> >
> >
> >
> >
> >
> > 2) Tried get_cap of "handles-permanent" , which shows me below values as
> > shown below , but not sure how to get the index of particular tpm bank
>
> Banks are for PCRs, ie PCR0 can have a SHA1 and SH256 bank.
>
> >
> > #/tpm2/tpm_evo/tpm2-tools-3.X/tools# ./tpm2_getcap --capability=3D"hand=
les-
> > permanent"
>
> Stop using 3.X its deprecated, grab the latest 4.X release and build it.
> The tools actually work.
>
> >
> > 0x40000001
> >
> > 0x40000007
> >
> > 0x40000009
> >
> > 0x4000000a
> >
> > 0x4000000b
> >
> > 0x4000000c
> >
> > 0x4000000d
>
> Those are not NV handles, NV Handles start with 0x10
>
> >
> >
> >
> >
> > 2)Also tried reading pcr list using tpm2_getcap . Is the below offset(s)
> are stands
> > for ?
> >
> > # ./tpm2_getcap --capability=3D"handles-pcr"
>
> Again, NV Indexes ARE NOT PCR's.
>
> >
> > 0x00000000
> >
> > 0x00000001
> >
> > 0x00000002
> >
> > 0x00000003
> >
> > 0x00000004
> >
> > 0x00000005
> >
> > 0x00000006
> >
> > 2.1) Request you to share me few points on how to use the "tpm2_getcap()
> and
> > get the offset ?
> >
>
> Debuggers are your friend.
>
> >
> >
> > Since none of the above tools API helped me or am i missing some thing
> to read
> > the output of NVRAM index ?
>
> I would upgrade to newer tools. If you must stay in the 3.X land, then
> copy what the test
> scripts are doing, they do it completely. Look for nv.sh.
>
> >
> > 3) Without knowing the offset , tried to define offset from 0x1500015
> and trying
> > to write and read back , here nvdefine works along with nvwrite ..but
> nvread fails
> > with "auth" issue. Please refere below sequence and associated errors
> >
> >
> > 3.1) Tried defining nvram using tpm2_nvdefine - Succeeded with out any
> error  --
> > given -a 0x40000001 (TPM_RH_OWNER Access) , if i define with 0x4000000C
> > (TPM_RH_OWNER , i got the same result during tpm2_nvread . Here removing
> "-t
> > 0x2000A" option and then doing nvdefine also throws me the same error
> shown
> > in point 3.3 during nvread
> >
> > #./tpm2_nvdefine -x 0x1500016 -a 0x40000001 -s 32 -t 0x2000A
>
> Offhand, I don't know what the 0x2000A mask is, so I would have to look it
> up, but I am not going to.
> Use string masks.
>
> If you just upgrade to a 4.x tools, it should work. I remember some issues
> with attributes on the 3.X branch
> Tools.
>
> >
> > #
> >
> >
> >
> >
> > 3.2) Tried NVWRITE in the same offset 0x1500015  - Succeeded without any
> error
> >
> > # ./tpm2_nvwrite -x 0x1500015 -L test_helloworld
> >
> > #
> >
> >
> >
> >
> > 3.3) Reading back the same offset -x1500015 , which throws below error
> stating
> > TPM2_RC_NV_UNINITIALIZED. Since i have initialized it as said above
> point 3.1  ,
> > what am i missing here ?
>
> Upgrade your tools, and the example I showed yesterday should work.
>
> >
> >
> >
> >
> > Below are the OPTIONS I have by tpm2_nvread:
> >
> > as you suggested  to use (echo `tpm2_nvread -C o -s5 0x1500015` command)
> >
> > I cant see -C (this might be due to tools version 3.X ? . If it is not
> the latest , can't
> > we able to use the below APIs ?
> >
> >
> >
> >
> > # ./tpm2_nvread
> >
> > Usage: tpm2_nvread [<options>]
> >
> > Where <options> are:
> >
> >     [ -x | --index=3D<value>] [ -a | --auth-handle=3D<value>] [ -f |
> --output=3D<value>] [
> > -s | --size=3D<value>]
> >
> >     [ -o | --offset=3D<value>] [ -P | --handle-passwd=3D<value>] [ -S |
> --input-session-
> > handle=3D<value>] [ -L | --set-list=3D<value>]
> >
> >     [ -F | --pcr-input-file=3D<value>]
> >
> >
> >
> >
> > # ./tpm2_nvread -x 0x1500015 -a 0x40000001 -s 32
> >
> > ERROR: Failed to read NVRAM area at index 0x1500015 (22020117).
> Error:0x14a
> >
> > ERROR: Unable to run ./tpm2_nvread
> >
> >
> >
> >
> > # tpm2_rc_decode 0x14a
> >
> > error layer
> >
> >   hex: 0x0
> >
> >   identifier: TSS2_TPM_RC_LAYER
> >
> >   description: Error produced by the TPM
> >
> > format 0 error code
> >
> >   hex: 0x4a
> >
> >   name: TPM2_RC_NV_UNINITIALIZED
> >
> >   description: an NV Index is used before being initialized or the state
> saved by
> > TPM2_Shutdown(STATE) could not be restored
> >
> >
> >
> >
> > 3.4) Tried reading the same offset 0x1500015 without giving '-a'
> > (TPM2_RH_OWNER) access , but the results shown NV_AUTHORIZATION. So i
> > understood
> >
> > if we defined with -a auth permission then we need to give the same
> permission
> > while reading the content from the same offset. Is my understanding is
> correct ?
> >
> >
> >
> >
> > # ./tpm2_nvread -x 0x1500015 -s 32
> >
> >
> > ERROR: Failed to read NVRAM area at index 0x1500015 (22020117).
> Error:0x149
> > ERROR: Unable to run ./tpm2_nvread
> >
> >
> > # tpm2_rc_decode 0x149
> > error layer
> >   hex: 0x0
> >   identifier: TSS2_TPM_RC_LAYER
> >   description: Error produced by the TPM format 0 error code
> >   hex: 0x49
> >   name: TPM2_RC_NV_AUTHORIZATION
> >   description: NV access authorization fails in command actions (this
> failure does
> > not affect lockout.action)
> >
> >
> >
> >
> >
> > 4) Tried to use tpm2_readpublic to read above written offset 0x1500015 ,
> getting
> > 0x184 (value is out of range or is not correct for the context) what am
> i missing
> > here ?
> >
> > # ./tpm2_readpublic
> > Usage: tpm2_readpublic [<options>]
> > Where <options> are:
> >     [ -H | --object=3D<value>] [ -o | --opu=3D<value>] [ -c |
> --context-object=3D<value>]
> > [ -f | --format=3D<value>]
> >
> >
> >
> >
> > # ./tpm2_readpublic -H 0x1500015
> > ERROR: TPM2_ReadPublic error: rval =3D 0x184
> > ERROR: Unable to run ./tpm2_readpublic
> > root(a)muthu-vb:~/work/tpm2/tpm_evo/install/bin# ./tpm2_readpublic -H
> > 0x1500015 --opu file
> > ERROR: TPM2_ReadPublic error: rval =3D 0x184
> > ERROR: Unable to run ./tpm2_readpublic
> > root(a)muthu-vb:~/work/tpm2/tpm_evo/install/bin# ./tpm2_rc_decode 0x184
> > error layer
> >   hex: 0x0
> >   identifier: TSS2_TPM_RC_LAYER
> >   description: Error produced by the TPM
> > format 1 error code
> >   hex: 0x04
> >   identifier: TPM2_RC_VALUE
> >   description: value is out of range or is not correct for the context
> > handle
> >   hex:0x100
> >   identifier:  TPM2_RC_1
> >   description:  (null)
> >
> >
> >
> > #
> >
> >
> >
> >
> >
> > 5)Tried releasing the same offset using nvrelease that too works fine
> >
> > #./tpm2_nvrelease -x 0x1500015 -a 0x40000001
> >
> > #
> >
> >
> >
> >
> > As per my request raised by yesterday . I need to define an offset in nv
> ram then
> > write content only once and read it back when ever required.  During
> every
> > second write , i need to read the offset (you suggested to use
> > tpm2_nvreadpubic() , but i struck with usage of this "nvread public api"
> command
> > as well (results are just shown above)
> >
> >
> >
> >
> > As per today's experiments , i cant able able to achieve the (nvread)
> using
> > command line API . Let me know what am i missing here .
> >
> >
> >
> >
> > Looking forward for your valuable reply.
> >
> >
> >
> >
> > Thanks,
> >
> > Muthukumar
> >
> >
> >
> >
> >
> >
> >
> > On Thu, May 14, 2020 at 12:51 AM Roberts, William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com> >
> wrote:
> >
> >
> >       > -----Original Message-----
> >       > From: muthu.smk(a)gmail.com <mailto:muthu.smk(a)gmail.com>
> > [mailto:muthu.smk(a)gmail.com <mailto:muthu.smk(a)gmail.com> ]
> >       > Sent: Wednesday, May 13, 2020 12:51 PM
> >       > To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> >       > Subject: [tpm2] NVRAM Write and Read using Esys API(s)
> >       >
> >       > Hi Williams,
> >       >
> >       > I am using the test code used to read and write in to NV ram.  I
> am
> > facing below
> >       > challenges if i tried to read already written data from NVRAM.
> >       >
> >       > 1) Test code attached defined create the context (ectx) , create
> random
> > number ,
> >       > define NV ram , write the random number in to NVRAM (offset
> > 0x1000001) and
> >       > read it back from NV Ram (from same offset 0x1000001)
> >       >
> >       > 2) But if i try to run this code twice or thrise , am getting
> below NVRAM
> > already
> >       > defined rc code. I can understand that we should not defined the
> nv
> > ram space
> >       > which already defined and used.
> >       > How to avoid this ? by defining nvram ONLY once and write it ON=
LY
> > once and
> >       > finally read it AS MUCH times we want ?  Below details are
> related to
> > this request
> >
> >       You can call Esys_GetCapability() and see what NV indices are
> defined.
> > The command
> >       Line tool tpm2_getcap does this, like so:
> >       tpm2_getcap handles-nv-index
> >
> >       You can use that tool as an example of how to do it.
> >
> >       >
> >       > Error code:
> >       > 0x0000014c - description: NV Index or persistend object already
> defined
> >       > 0x00000284 - description: value is out of range or is not
> correct for the
> > context
> >       >
> >       > 3) Query is : is it possible to define nvram "ONLY ONCE" with
> the API
> > shared the
> >       > test code and then create a function "createrandom" number to u=
se
> > the same
> >
> >       Call getcap, see if it's defined, if defined, don't define it....
> >
> >       > context (ects) to generate randumnumber then call separate
> > "write_nvram"
> >       > function with random number as input and ask to write in the sa=
me
> > offset .
> >       > Finally calling another function "read_nvram" to read it back
> from the
> > same
> >       > nvram's offset when ever we want ? i tried this approach but am
> > getting segfault
> >       > with above error .
> >       > What am i missing here ?
> >
> >       Segfaults are likely your code is just broken.
> >
> >       >
> >       > 3.1) Ideally in single application , i need to achieve
> "tpm2_nvdefine",
> >       > "tpm2_nvwrite" and "tpm2_nvread() tools API(s) functionality" in
> > different calls
> >       > or flow.
> >       > 3.2) Also how to check whether "write" already done (i tried
> checking
> > nv_index is
> >       > true - means whether it already has some value) , but it failed=
 ?
> >
> >       If you do what the tool tpm2_nvreadpublic does, you can check for
> the
> > written bit.
> >
> >       >
> >       > 4) Also how to check what was the content that already present
> in the
> > nvram
> >       > offset (0x1000001) before i do write the "random number" second
> time
> > in to the
> >       > same offset ? this is to ensure the "random number" that i am
> planning
> > to write
> >       > was valid one ?
> >
> >       Read it out, if it's not what you want, write it.
> >
> >       >
> >       > I remember studying that, once u write in to NVRAM offset , we
> cant
> > able to RE-
> >       > WRITE it in the same offset(0x1000001). Whether that is the same
> case
> > for
> >       > SIMULATOR as well (or) this feature is only for real tpm
> hardware?
> >
> >       No generally you can write as many times as you want... there are
> tricks
> > you can do to make
> >       It locked after write (writelocked iirc)
> >
> >       Below is a command line example of doing it...
> >
> >       tpm2_nvdefine
> >       nv-index: 0x1000000
> >
> >       tpm2_nvreadpublic 0x1000000
> >       0x1000000:
> >         name:
> > 000b1195f36a21c8219055ad0803c39e7e81d06cdb2eee2b7cf93dd83e01d4273828
> >         hash algorithm:
> >           friendly: sha256
> >           value: 0xB
> >         attributes:
> >           friendly: ownerwrite|authwrite|ownerread|authread
> >           value: 0x6000600
> >         size: 2048
> >
> >       # you can do this as much as you want, but it can wear the memory
> in the
> > TPM
> >       # depending on memory technology the vendor used.
> >       echo "hello" | tpm2_nvwrite -C o 0x1000000 -i-
> >       echo `tpm2_nvread -C o -s5 0x1000000`
> >       hello
> >
> >       tpm2_nvreadpublic 0x1000000
> >       0x1000000:
> >         name:
> > 000b287c9b1b06fab6e51bd26e98ea89460574e97a3d2ef995eb35f7e23db7e94f67
> >         hash algorithm:
> >           friendly: sha256
> >           value: 0xB
> >         attributes:
> >           friendly: ownerwrite|authwrite|ownerread|authread|written
> >           value: 0x6000620
> >         size: 2048
> >
> >       >
> >       > 6)After nvwrite i tried to use "tpm2_pcrlist" command line tool
> > application, by
> >       > which it shows the nv ram memory location , tried using
> tpm2_nvread ()
> > to read
> >       > the content but i could not able to see any data (random number)
> that i
> > used to
> >       > write via this test application . dont know why ?
> >
> >       tpm2_pcrlist is not for NVs.... you want:
> >       tpm2_getcap handles-nv-index
> >
> >       >
> >       > 7) After i manually ran the below clear API , now the test code
> is
> > working fine
> >       > (refer Test code log shown below..). This confirms we can
> reallocate
> > already
> >       > defined nv ram memory.
> >       > #tpm2_nvrelease -x 0x1000001 -a 0x40000001
> >
> >       Tpm2_clear will clear the owner hierarchy, including NV ram objec=
ts
> > declared in that hierarchy,
> >       so define will work again, because you deleted it.
> >
> >       >
> >       >
> >       > 8)If i try to read it manually via below tpm2_nvread command wi=
th
> > offset
> >       > 0x1000001 am getting below error
> >       >
> >       > #tpm2_nvread -x 0x1000001 -a 0x40000001 -o 0 -s 20
> >       > ERROR: Failed to read NVRAM public area at index 0x1000001
> > (16777217).
> >       > Error:0x18b
> >       > ERROR: Unable to run tpm2_nvread
> >       >
> >       > /* Tried to use below tools command , am always getting the same
> > error even if
> >       > we give the different nvram off set tpm2_nvwrite -x 0x1c00002
> > helloworld
> >       > ERROR: Reading the public part of the nv index failed with: 0x1=
8b
> >       > ERROR: Unable to run tpm2_nvwrite
> >       >
> >       > tpm2_nvwrite -x 0x1c00012 -a 0x40000001 helloworld
> >       > ERROR: Reading the public part of the nv index failed with: 0x1=
8b
> >       > ERROR: Unable to run tpm2_nvwrite
> >       >
> >       >
> >       > /* Try to read the nvlist of SIM , it returns nothing !!!
> >       > #tpm2_nvlist <returns nothing>
> >       >
> >       > Any points will be great help for me.
> >       >
> >       >
> -------------------------------------------------------------------------=
--------------
> > ------------
> >       > --------------------------------------------------------------
> >       > Test code log after above "tpm2_nvrelease":
> >       > Initializing
> >       > init_rand()
> >       > init_rsa()
> >       > init_ecc()
> >       > Engine name: TPM2-TSS engine for OpenSSL
> >       > Init result: 1
> >       > Setting owner auth to empty auth.
> >       > Setting parent auth to empty auth.
> >       >
> ERROR:tcti:src/tss2-tcti/tcti-device.c:440:Tss2_Tcti_Device_Init() Failed
> > to open
> >       > device file /dev/tpm0: No such file or directory
> >       > WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI
> init for
> > function
> >       > 0x7fc67376d18b failed with a000a
> >       > WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could
> not
> > initialize TCTI
> >       > named: tcti-device
> >       > ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could
> not
> > initialize TCTI
> >       > file: libtss2-tcti-default.so
> >       >  No of bytes written by GenRandom : 64
> >       >
> > b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe
> >       > 8ece5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
> >       > Created NV Index: 0x1000001
> >       > ESYS_TR: 0x418367
> >       > ESYS_TR2: 0x418368
> >       > Writing the random number written in NV Ram
> >       > Data buffer size used to write into NVRam: 64
> >       > Reading the random number written in NV Ram
> >       >
> > b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe
> >       > 8ece5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
> >       > *** SUCCESS ***
> >       > ---------------------
> >       >
> >       > TEST CODE :
> >       >
> >       > int nv_write_read()
> >       > {
> >       >
> >       >       ESYS_CONTEXT *ectx =3D NULL;
> >       >
> >       >       ESYS_TR nv_index =3D 0;
> >       >       ESYS_TR nv_index2 =3D 0;
> >       >
> >       >        int rc =3D 1;
> >       >
> >       >
> >       >       /*
> >       >        * create a connection to the TPM letting ESAPI choose how
> to get
> > there.
> >       >        * If you need more control, you can use tcti and tcti-ldr
> libraries to
> >       >        * get a TCTI pointer to use for the tcti argument of
> Esys_Initialize.
> >       >        */
> >       >       rc =3D Esys_Initialize(&ectx,
> >       >                       NULL,  // let it find the TCTI
> >       >                       NULL); // Use whatever ABI
> >       >       if (rc !=3D TSS2_RC_SUCCESS) {
> >       >               printf("Esys_Initialize Failed: 0x%x\n", rc);
> >       >               return 1;
> >       >       }
> >       >
> >       >
> >       >         rc =3D Esys_GetRandom(ectx,
> >       >                         ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NON=
E,
> >       >                         64, &bytes);
> >       >         if (rc !=3D TSS2_RC_SUCCESS) {
> >       >                 printf("Esys_GetRandom Failed: %s\n",
> Tss2_RC_Decode(rc));
> >       >                 exit(1);
> >       >         }
> >       >
> >       >       printf(" No of bytes written by GenRandom :
> %d\n",bytes->size);
> >       >       size_t i;
> >       >       for (i =3D 0; i < bytes->size; i++) {
> >       >               printf("%02x", bytes->buffer[i]);
> >       >       }
> >       >
> >       >       printf("\n");
> >       >
> >       >       /* build a template for the NV index */
> >       >       TPM2B_NV_PUBLIC pub_templ =3D {
> >       >               /* this is counter intuitive, but it tells the
> TSS2 library to calculate
> >       > this for us */
> >       >               .size =3D 0,
> >       >               /* The things that define what NV index we are
> creating */
> >       >               .nvPublic =3D {
> >       >                       /* uses sha256 to identify the tpm object
> by name */
> >       >                       .nameAlg =3D TPM2_ALG_SHA256,
> >       >                       /* allows the owner password or index
> password r/w
> >       > access */
> >       >                       .attributes =3D TPMA_NV_OWNERWRITE |
> >       >                               TPMA_NV_OWNERREAD            |
> >       >                               TPMA_NV_AUTHWRITE            |
> >       >                               TPMA_NV_AUTHREAD,
> >       >                       /* can hold 64 bytes of data */
> >       >                       .dataSize =3D 64,
> >       >                       /* Create at NV Index 1 or 0x1000001 */
> >       >                       .nvIndex =3D TPM2_HR_NV_INDEX + 1
> >       >               },
> >       >       };
> >       >
> >       >
> >       >       /* Ok, define the space and store the nv_index for future
> use */
> >       >       rc =3D Esys_NV_DefineSpace(
> >       >           ectx,
> >       >               ESYS_TR_RH_OWNER, /* create an NV index in the
> owner
> >       > hierarchy */
> >       >           ESYS_TR_PASSWORD, /* auth as the owner with a passwor=
d,
> > which is
> >       > empty */
> >       >           ESYS_TR_NONE,
> >       >           ESYS_TR_NONE,
> >       >           NULL,
> >       >           &pub_templ,
> >       >           &nv_index);
> >       >       if (rc !=3D TSS2_RC_SUCCESS) {
> >       >               printf("Esys_NV_DefineSpace Failed: 0x%x\n", rc);
> >       >               goto out;
> >       >       }
> >       >
> >       >       /* Note if you need to set the owner hierarchy auth value
> you use:
> >       >        * TSS2_RC Esys_TR_SetAuth(
> >       >        *     ESYS_CONTEXT *esysContext,
> >       >          *     ESYS_TR handle,
> >       >          *     TPM2B_AUTH const *authValue);
> >       >        */
> >       >
> >       >       printf("Created NV Index: 0x%x\n",
> pub_templ.nvPublic.nvIndex);
> >       >       printf("ESYS_TR: 0x%x\n", nv_index);
> >       >
> >       >       /*
> >       >        * Note: if we need to convert the nvIndex into an
> ESYS_TR, the
> > below
> >       > will
> >       >        * do it. Its not required for this case, since
> Esys_NV_Define gives us
> > an
> >       >        * ESYS_TR.
> >       >        */
> >       >       rc =3D Esys_TR_FromTPMPublic(
> >       >               ectx,
> >       >               TPM2_HR_NV_INDEX + 1,
> >       >               ESYS_TR_NONE,
> >       >               ESYS_TR_NONE,
> >       >               ESYS_TR_NONE,
> >       >               &nv_index2);
> >       >       if (rc !=3D TSS2_RC_SUCCESS) {
> >       >               printf("Esys_TR_FromTPMPublic Failed: 0x%x\n", rc=
);
> >       >               goto out;
> >       >       }
> >       >
> >       >       printf("ESYS_TR2: 0x%x\n", nv_index2);
> >       >
> >       >       /* copy some data into a buffer to send to the TPM */
> >       >       TPM2B_MAX_NV_BUFFER write_data =3D { 0 };
> >       >       memcpy(write_data.buffer, bytes->buffer, bytes->size);
> >       >       write_data.size =3D bytes->size;
> >       >
> >       >       printf("Writing the random number written in NV Ram\n");
> >       >       printf("Data buffer size used to write into NVRam:
> >       > %d\n",write_data.size);
> >       >       /*
> >       >        * Write the data to the TPM NV index at offset 0
> >       >        */
> >       >       rc =3D Esys_NV_Write(
> >       >           ectx,
> >       >           nv_index, /* authenticate to the NV index using the NV
> index
> >       > password */
> >       >           nv_index, /* the nv index to write to */
> >       >           ESYS_TR_PASSWORD,
> >       >               ESYS_TR_NONE,
> >       >               ESYS_TR_NONE,
> >       >           &write_data,
> >       >           0);
> >       >       if (rc !=3D TSS2_RC_SUCCESS) {
> >       >               printf("Esys_NV_Write Failed: 0x%x\n", rc);
> >       >               goto out;
> >       >       }
> >       >
> >       >       /* Read the data back, and just for fun, we will use
> nv_index2
> >       >        * to prove it's pointing to the same NV location in the
> TPM.
> >       >        */
> >       >       TPM2B_MAX_NV_BUFFER *read_data =3D NULL;
> >       >       rc =3D Esys_NV_Read(
> >       >           ectx,
> >       >           nv_index2, /* authenticate to the NV index using the
> NV index
> >       > password */
> >       >           nv_index2, /* the nv index to read from */
> >       >           ESYS_TR_PASSWORD,
> >       >           ESYS_TR_NONE,
> >       >           ESYS_TR_NONE,
> >       >           bytes->size,
> >       >           0,
> >       >           &read_data);
> >       >       if (rc !=3D TSS2_RC_SUCCESS) {
> >       >               printf("Esys_NV_Read Failed: 0x%x\n", rc);
> >       >               goto out;
> >       >       }
> >       >
> >       >       /* Print things as a string from the TPM carefully!
> >       >        * Injected traffic via MITM means that you cannot trust
> this
> >       >        * to be null terminated.
> >       >        */
> >       >       printf("Reading the random number written in NV Ram\n");
> >       >       for (i =3D 0; i < read_data->size; i++) {
> >       >               printf("%02x", read_data->buffer[i]);
> >       >       }
> >       >       printf("\n");
> >       >
> >       >       Esys_Free(read_data);
> >       >       rc =3D 0;
> >       >
> >       > out:
> >       >
> >       >       /* remove the NV space */
> >       >       if (nv_index) {
> >       >               int rc2 =3D Esys_NV_UndefineSpace(
> >       >                       ectx,
> >       >                       ESYS_TR_RH_OWNER,
> >       >                       nv_index,
> >       >                       ESYS_TR_PASSWORD,
> >       >                       ESYS_TR_NONE,
> >       >                       ESYS_TR_NONE);
> >       >               if (rc2 !=3D TSS2_RC_SUCCESS) {
> >       >                       printf("Esys_NV_UndefineSpace Failed:
> 0x%x\n", rc2);
> >       >                       rc =3D 1;
> >       >               }
> >       >       }
> >       >
> >       >       Esys_Finalize(&ectx);
> >       >
> >       >         printf("Exit from nv_write_read()\n");
> >       >       return rc;
> >       > }
> >       > _______________________________________________
> >       > tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.0=
1.org
> >
> >       > To unsubscribe send an email to tpm2-leave(a)lists.01.org <mail=
to:
> tpm2-
> > leave(a)lists.01.org>
> >       > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >
>
>

--===============5093969115944267638==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGkgUm9iZXJ0cyAswqA8ZGl2Pjxicj48L2Rpdj48ZGl2Pk9uY2UgYWdh
aW4gdGhhbmtzIGEgbG90IGZvciB5b3VyIGd1aWRhbmNlLsKgIEkgaGF2ZSBsb29rZWQgaW4gdG8g
bnYuc2ggZnJvbSB0aGUgdHBtMi10b29scyBmb2xkZXIgYW5kIGZpbmQgb3V0IGhvdyB0byB1c2Ug
dGhlwqA8L2Rpdj48ZGl2PnRwbTIgZGVmaW5lICwgdHBtMiB3cml0ZSBhbmQgcmVhZCBpdCBiYWNr
IC4gTm93IGl0IGlzIHdvcmtpbmcgYXMgZXhwZWN0ZWQuPC9kaXY+PGRpdj5CZWxvdyBhcmUgdGhl
IGNvbW1hbmRzIGFuZCBpdHMgb3V0cHV0OjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdiBz
dHlsZT0iYm9yZGVyLXRvcDpub25lO2JvcmRlci1yaWdodDpub25lO2JvcmRlci1sZWZ0Om5vbmU7
Ym9yZGVyLWJvdHRvbToxcHQgc29saWQgd2luZG93dGV4dDtwYWRkaW5nOjBjbSAwY20gMXB0O2Jh
Y2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dy
b3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9y
aWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsIj4KCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFj
a2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3Jv
dW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3Jp
Z2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxp
bmU7Ym9yZGVyOm5vbmU7cGFkZGluZzowY207Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2Fs
aWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2s7YmFja2dyb3VuZC1jb2xv
cjpyZ2IoMCwyNTUsMjU1KSI+cm9vdEBtdXRodS12Yjp+L3dvcmsjCi4vdHBtMl9udmRlZmluZSAt
USAteCAweDEwMDAwMDEgLWEgMHg0MDAwMDAwMSAtcyAzMiAtdAomcXVvdDtvd25lcnJlYWR8cG9s
aWN5d3JpdGV8b3duZXJ3cml0ZSZxdW90Ozwvc3Bhbj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFs
IiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tn
cm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3Vu
ZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdp
bjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5l
O2JvcmRlcjpub25lO3BhZGRpbmc6MGNtO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGli
cmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrO2JhY2tncm91bmQtY29sb3I6
cmdiKDAsMjU1LDI1NSkiPnJvb3RAbXV0aHUtdmI6fi93b3JrIwo8L3NwYW4+PC9wPgoKPHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0
Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0
aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFj
a2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1h
bGlnbjpiYXNlbGluZTtib3JkZXI6bm9uZTtwYWRkaW5nOjBjbTtmb250LXNpemU6MTFwdDtmb250
LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjaztiYWNr
Z3JvdW5kLWNvbG9yOnJnYigwLDI1NSwyNTUpIj5yb290QG11dGh1LXZiOn4vd29yayMKLi90cG0y
X252d3JpdGUgLVEgLXggMHgxMDAwMDAxIC1hIDB4NDAwMDAwMDEgbnYudGVzdF93PC9zcGFuPjwv
cD4KCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDts
aW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9z
aXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDpp
bml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7
dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Ym9yZGVyOm5vbmU7cGFkZGluZzowY207Zm9udC1zaXpl
OjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6
YmxhY2s7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMCwyNTUsMjU1KSI+cm9vdEBtdXRodS12Yjp+L3dv
cmsjCi4vdHBtMl9udnJlYWQgLXggMHgxMDAwMDAxIC1hIDB4NDAwMDAwMDEgPC9zcGFuPjwvcD4K
CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5l
LWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRp
b246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0
aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVy
dGljYWwtYWxpZ246YmFzZWxpbmU7Ym9yZGVyOm5vbmU7cGFkZGluZzowY207Zm9udC1zaXplOjEx
cHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6Ymxh
Y2s7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMCwyNTUsMjU1KSI+cGxlYWZvbzIzYWJjPC9zcGFuPjwv
cD4KCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDts
aW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9z
aXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDpp
bml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7
dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Ym9yZGVyOm5vbmU7cGFkZGluZzowY207Zm9udC1zaXpl
OjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iYmFja2dy
b3VuZC1jb2xvcjpyZ2IoMCwyNTUsMjU1KSI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OlRhaG9t
YSxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj7vv73vv73vv73vv73vv73vv73vv73vv73vv73vv73v
v73vv73vv73vv73vv73vv73vv73vv73vv708L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
OlRhaG9tYSxzYW5zLXNlcmlmIj48L3NwYW4+PC9zcGFuPjwvcD4KCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFj
a2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3Jv
dW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3Jp
Z2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxp
bmU7Ym9yZGVyOm5vbmU7cGFkZGluZzowY207Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2Fs
aWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2s7YmFja2dyb3VuZC1jb2xv
cjpyZ2IoMCwyNTUsMjU1KSI+cm9vdEBtdXRodS12Yjp+L3dvcmsvdHBtMi90cG1fZXZvL2luc3Rh
bGwvYmluIzwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20g
MGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7
YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tn
cm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5k
LWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtib3JkZXI6bm9uZTtwYWRkaW5n
OjBjbTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFu
IHN0eWxlPSJjb2xvcjpibGFjayI+PGJyPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIg
c3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3Jv
dW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQt
c2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46
aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTti
b3JkZXI6bm9uZTtwYWRkaW5nOjBjbTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJp
LHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+Tm93LCBpIHRyaWVkIHVzZWQg
dGhlIHRlc3QgYXBwbGljYXRpb24gdG8ganVzdCByZWFkIGl0IGJhY2sgZnJvbSB0aGUgYWJvdmU8
Yj4gMHgxMDAwMDAxIG9mZnNldDwvYj4gLsKgIFRoZSBzYW1wbGUgY29kZSAocGxzIGZpbmQgYXR0
YWNobWVudCk8L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNt
IDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFs
O2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNr
Z3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3Vu
ZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Ym9yZGVyOm5vbmU7cGFkZGlu
ZzowY207Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3Bh
biBzdHlsZT0iY29sb3I6YmxhY2siPmhhcyByZWFkIGZ1bmN0aW9uIHdoaWNoIHVzZXMgRXN5c19O
Vl9SZWFkICgpIGFwaSB0byByZWFkIHRoZSBvZmZzZXQuwqAgQnV0IGFtIGdldHRpbmcgZXJyb3Ig
Y29kZSB3aXRoICZxdW90Ozwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWwsSGVs
dmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOnNtYWxsIj48Yj43MDAxODwvYj4mcXVvdDvCoCAs
IGkgY291bGQgbm90IGFibGUgdG8gZmluZCBtdWNoIGRldGFpbHMgZnJvbSB0cG0yX3JjX2RlY29k
ZSBvZiB0aGlzIGVycm9yLjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1h
cmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdl
OmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0
aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDti
YWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtib3JkZXI6bm9u
ZTtwYWRkaW5nOjBjbTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2Vy
aWYiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtm
b250LXNpemU6c21hbGwiPjxicj48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxl
PSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1p
bWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6
aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRp
YWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Ym9yZGVy
Om5vbmU7cGFkZGluZzowY20iPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpBcmlhbCxIZWx2ZXRp
Y2Esc2Fucy1zZXJpZjtmb250LXNpemU6c21hbGwiPkZyb20gdGhlIGRlYnVnIGxvZyAocmVmIGF0
dGFjaG1lbnQgOiBkZWJ1Z19sb2cudHh0KcKgICwgaSBjb3VsZCBzZWU8c3BhbiBzdHlsZT0iYmFj
a2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwwKSI+ICZxdW90Ozwvc3Bhbj48L3NwYW4+PHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZTpz
bWFsbDtiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNTUsMjU1LDApIj5Fc3lzIGhhbmRsZSBkb2VzIG5v
dCBleGlzdCZxdW90OyAoNzAwMTgpLjwvc3Bhbj4gV2hhdCBpIHN1cHBvc2UgdG8gZG8gdG8gZ2V0
IHRoaXMgaGFuZGxlIGFuZCBtYWtlIEVzeXNfTlZfUmVhZCAoKSBzdWNjZXNzZnVsbHnCoHJlYWQg
ZnJvbSBhbHJlYWR5IGRlZmluZWQgb2Zmc2V0ID88YnI+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwi
IHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dy
b3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5k
LXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2lu
OmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7
Ym9yZGVyOm5vbmU7cGFkZGluZzowY207Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJy
aSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNh
bnMtc2VyaWY7Zm9udC1zaXplOnNtYWxsIj48YnI+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9y
bWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2Jh
Y2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dy
b3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9y
aWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2Vs
aW5lO2JvcmRlcjpub25lO3BhZGRpbmc6MGNtO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNh
bGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGlj
YSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZTpzbWFsbCI+UHJldmlvdXMgdG8gdGhpcyBlcnJvciAsIGkg
d2FzIGdldHRpbmc8c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwwKSI+
IDB4MTJmICh3aGljaCBpcyBub3RoaW5nIGJ1dMKgPC9zcGFuPjwvc3Bhbj48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOnNtYWxsIj48
c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwwKSI+VFBNMl9SQ19BVVRI
X1VOQVZBSUxBQkxFKTwvc3Bhbj4gLiBTbyB3aGF0IGkgZGlkIHdhcyAsIGkgZ2l2ZW4gdGhlICYj
Mzk7YXV0aEhhbmRsZSA9IDB4NDAwMDAwMDEmcXVvdDsgYW5kIHNldCB0aGlzIHZhbHVlIGFzIHNl
Y29uZCBhcmd1bWVudDwvc3Bhbj48YnI+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJt
YXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFn
ZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5p
dGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7
YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Ym9yZGVyOm5v
bmU7cGFkZGluZzowY207Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNl
cmlmIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7
Zm9udC1zaXplOnNtYWxsIj5vZiBFc3lzX05WX1JlYWQgQXBpwqAgLiBBZnRlciBkb2luZyB0aGF0
ICwgYW0gZ2V0dGluZyB0aGlzPC9zcGFuPgoKPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFs
LEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZTpzbWFsbCI+PHNwYW4gc3R5bGU9ImJhY2tn
cm91bmQtY29sb3I6cmdiKDI1NSwyNTUsMCkiPiAmcXVvdDs8L3NwYW4+PC9zcGFuPjxzcGFuIHN0
eWxlPSJmb250LWZhbWlseTpBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6c21h
bGwiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNTUsMjU1LDApIj5Fc3lzIGhh
bmRsZSBkb2VzIG5vdCBleGlzdCZxdW90OyAoNzAwMTgpPC9zcGFuPjwvc3Bhbj7CoMKgPHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZTpz
bWFsbCI+wqBlcnJvciAsIGxldCBtZSBrbm93IHdoYXQgYW0gaSBtaXNzaW5nIGhlcmUuIEF0dGFj
aGVkICZxdW90O2xvZyBmaWxlJnF1b3Q7IGFzIHdlbGwgZm9yIHlvdXIgcmVmZXJlbmNlIGFsb25n
IHdpdGggdGVzdCBjb2RlLjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1h
cmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdl
OmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0
aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDti
YWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtib3JkZXI6bm9u
ZTtwYWRkaW5nOjBjbTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2Vy
aWYiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtm
b250LXNpemU6c21hbGwiPjxicj48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxl
PSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1p
bWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6
aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRp
YWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Ym9yZGVy
Om5vbmU7cGFkZGluZzowY20iPkFsc28gdHJpZWQgdG8gJnF1b3Q7bnZfZGVmaW5lJnF1b3Q7IG9u
Y2UgYWdhaW4gYW5kIHRoZW4gdHJ5IHRvIHJlYWQgaXQgYmFjayAuIFNpbmNlIGl0IGRvZXNuJiMz
OTt0wqBtYWtlIHNlbnNlLCBiZWNhdXNlIHdlIGhhdmUgYWxyZWFkeSBkZWZpbmVkIHVzaW5nIGNv
bW1hbmQgbGluZSDCoGFuZCB3cml0dGVuIGRhdGEgaW4gdG8gaXQuwqDCoDwvcD48cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9y
bWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7
YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3Jv
dW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWdu
OmJhc2VsaW5lO2JvcmRlcjpub25lO3BhZGRpbmc6MGNtIj5TbyBpIGJlbGlldmUgdGhlcmUgaXMg
bm8gcG9pbnQgaW4gZG9pbmcgbnYgZGVmaW5lIGFuZCB0aGVuIHJlYWRpbmcgaXQgYmFjayAuIEhv
cGUgbnZfZGVmaW5lIGlzIG5vdCByZXF1aXJlZCBoZXJlID88L3A+PHAgY2xhc3M9Ik1zb05vcm1h
bCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNr
Z3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91
bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmln
aW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGlu
ZTtib3JkZXI6bm9uZTtwYWRkaW5nOjBjbSI+PGJyPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBz
dHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91
bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1z
aXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjpp
bml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2Jv
cmRlcjpub25lO3BhZGRpbmc6MGNtIj48Yj5OT1RFIDwvYj46IFRoaXMgdGVzdCBjb2RlIGFsc28g
aGF2ZSAmcXVvdDtnZXRfcmFuZG9tIG51bWJlciZxdW90OyBhbmQgLCAmcXVvdDtudl93cml0ZSZx
dW90OyBmdW5jdGlvbnMgaW1wbGVtZW50ZWQgLiBBcyBpIHNhaWQgdG8geW91wqBlYXJsaWVyICwg
aSB3YW50IHRvIGdlbmVyYXRlIHJhbmRvbSBudW1iZXIgYW5kIHRoZW4gd3JpdGUgaW4gdG/CoG52
cmFtIGFuZCByZWFkIGl0IGJhY2sgLsKgIFNpbmNlIHRoZSAmcXVvdDtudl9yZWFkJnF1b3Q7IGl0
c2VsZiBub3QgaGFwcGVuaW5nIGJ5IHdoaWNoIHRoZSBvZmZzZXQgd2FzIGFscmVhZHkgd2VsbCBk
ZWZpbmVkIGFuZCBkYXRhIGFscmVhZHkgd3JpdHRlbiBpbiB0b8KgaXQgdXNpbmcgY29tbWFuZCBs
aW5lwqB0b29sIEFQSSAsIGkgY291bGQgbm90IGFibGUgdG8gcHJvY2VlZCBmdXJ0aGVyLjwvcD48
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1o
ZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9u
OmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlh
bDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRp
Y2FsLWFsaWduOmJhc2VsaW5lO2JvcmRlcjpub25lO3BhZGRpbmc6MGNtIj48YnI+PC9wPjxwIGNs
YXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdo
dDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5p
dGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2Jh
Y2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwt
YWxpZ246YmFzZWxpbmU7Ym9yZGVyOm5vbmU7cGFkZGluZzowY207Zm9udC1zaXplOjExcHQ7Zm9u
dC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6QXJp
YWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOnNtYWxsIj48YnI+PC9zcGFuPjwvcD48
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1o
ZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9u
OmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlh
bDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRp
Y2FsLWFsaWduOmJhc2VsaW5lO2JvcmRlcjpub25lO3BhZGRpbmc6MGNtIj5CUiw8L3A+PHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0
Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0
aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFj
a2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1h
bGlnbjpiYXNlbGluZTtib3JkZXI6bm9uZTtwYWRkaW5nOjBjbSI+TXV0aHVrdW1hcjwvcD48cCBj
bGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWln
aHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmlu
aXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDti
YWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2Fs
LWFsaWduOmJhc2VsaW5lO2JvcmRlcjpub25lO3BhZGRpbmc6MGNtO2ZvbnQtc2l6ZToxMXB0O2Zv
bnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OkFy
aWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZTpzbWFsbCI+PGJyPjwvc3Bhbj48L3A+
PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUt
aGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlv
bjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRp
YWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0
aWNhbC1hbGlnbjpiYXNlbGluZTtib3JkZXI6bm9uZTtwYWRkaW5nOjBjbTtmb250LXNpemU6MTFw
dDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LWZhbWls
eTpBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6c21hbGwiPjxicj48L3NwYW4+
PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDts
aW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9z
aXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDpp
bml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7
dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Ym9yZGVyOm5vbmU7cGFkZGluZzowY207Zm9udC1zaXpl
OjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOnNtYWxsIj48YnI+PC9z
cGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAx
cHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5k
LXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBl
YXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0
aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2JvcmRlcjpub25lO3BhZGRpbmc6MGNtO2ZvbnQt
c2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZv
bnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZTpzbWFsbCI+PGJy
Pjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAu
MDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dy
b3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQt
cmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6
aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtib3JkZXI6bm9uZTtwYWRkaW5nOjBjbTtm
b250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxl
PSJjb2xvcjpibGFjayI+PGJyPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWlt
YWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTpp
bml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlh
bDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtib3JkZXI6
bm9uZTtwYWRkaW5nOjBjbTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMt
c2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PGJyPjwvc3Bhbj48L3A+PHAgY2xhc3M9
Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5v
cm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFs
O2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dy
b3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGln
bjpiYXNlbGluZTtib3JkZXI6bm9uZTtwYWRkaW5nOjBjbTtmb250LXNpemU6MTFwdDtmb250LWZh
bWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PGJyPjwv
c3Bhbj48L3A+Cgo8L2Rpdj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUi
PjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBGcmksIE1heSAxNSwgMjAyMCBh
dCA4OjI0IFBNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0u
Yy5yb2JlcnRzQGludGVsLmNvbSI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsg
d3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4mZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJy
PgomZ3Q7IEZyb206IE11dGh1a3VtYXIgUyBbbWFpbHRvOjxhIGhyZWY9Im1haWx0bzptdXRodS5z
bWtAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bXV0aHUuc21rQGdtYWlsLmNvbTwvYT5dPGJy
PgomZ3Q7IFNlbnQ6IEZyaWRheSwgTWF5IDE1LCAyMDIwIDc6NTggQU08YnI+CiZndDsgVG86IFJv
YmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4m
Z3Q7PGJyPgomZ3Q7IENjOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdl
dD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgU3ViamVjdDogUmU6IFt0
cG0yXSBOVlJBTSBXcml0ZSBhbmQgUmVhZCB1c2luZyBFc3lzIEFQSShzKTxicj4KJmd0OyA8YnI+
CiZndDsgSGkgV2lsbGlhbXMgQyw8YnI+CiZndDsgVGhhbmtzIGZvciB5b3VyIHF1aWNrIHJlc3Bv
bnNlLiBBcyB5b3Ugc3VnZ2VzdGVkICwgaSBoYXZlIHRyaWVkIGJlbG93IG9wdGlvbnM8YnI+CiZn
dDsgPGJyPgomZ3Q7IEkgdHJpZWQgdG8gZ2V0IHRoZSBpbmRleCBvZiBudnJhbSBvZiBzaW0gdGhh
dCBhbSB3b3JraW5nIHVzaW5nIHRwbTJfZ2V0Y2FwIHRvb2xzPGJyPgomZ3Q7IEFQSSAuQmVsbG93
IGFyZSB0aGUgdHBtMl9nZXRjYXAgY2FwYWJpbGl0aWVzIHRoYXQgaSBmb3VuZCBieSByZWFkaW5n
IHRoZTxicj4KJmd0OyB0cG0yX2dldGNhcCBjb2RlIC4gUmVxdWVzdCB5b3UgdG8gc2hhcmUgbWUg
c29tZSBwb2ludGVycyBvZiB1c2luZzxicj4KJmd0OyB0cG0yX2dldGNhcCgpIC48YnI+CiZndDsg
PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgQXZhaWxhYmxlIGNhcGFiaWxpdHkgZnJvbSB0
cG0yX2dldGNhcC5jPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgLmNhcGFiaWxpdHlf
c3RyaW5nID0gJnF1b3Q7YWxnb3JpdGhtcyZxdW90Ozxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDC
oCDCoCDCoC5jYXBhYmlsaXR5X3N0cmluZyA9ICZxdW90O2NvbW1hbmRzJnF1b3Q7PGJyPgomZ3Q7
IDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgLmNhcGFiaWxpdHlfc3RyaW5nID0gJnF1b3Q7cHJvcGVy
dGllcy1maXhlZCZxdW90Oyw8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAuY2FwYWJp
bGl0eV9zdHJpbmcgPSAmcXVvdDtwcm9wZXJ0aWVzLXZhcmlhYmxlJnF1b3Q7LDxicj4KJmd0OyA8
YnI+CiZndDvCoCDCoCDCoCDCoCDCoC5jYXBhYmlsaXR5X3N0cmluZyA9ICZxdW90O2VjYy1jdXJ2
ZXMmcXVvdDssPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgLmNhcGFiaWxpdHlfc3Ry
aW5nID0gJnF1b3Q7aGFuZGxlcy10cmFuc2llbnQmcXVvdDssPGJyPgomZ3Q7IDxicj4KJmd0O8Kg
IMKgIMKgIMKgIMKgLmNhcGFiaWxpdHlfc3RyaW5nID0gJnF1b3Q7aGFuZGxlcy1wZXJzaXN0ZW50
JnF1b3Q7LDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoCDCoC5jYXBhYmlsaXR5X3N0cmlu
ZyA9ICZxdW90O2hhbmRsZXMtcGVybWFuZW50JnF1b3Q7LDxicj4KJmd0OyA8YnI+CiZndDvCoCDC
oCDCoCDCoCDCoC5jYXBhYmlsaXR5X3N0cmluZyA9ICZxdW90O2hhbmRsZXMtcGNyJnF1b3Q7LDxi
cj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoCDCoC5jYXBhYmlsaXR5X3N0cmluZyA9ICZxdW90
O2hhbmRsZXMtbnYtaW5kZXgmcXVvdDssPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgIMKg
LmNhcGFiaWxpdHlfc3RyaW5nID0gJnF1b3Q7aGFuZGxlcy1sb2FkZWQtc2Vzc2lvbiZxdW90Oyw8
YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAuY2FwYWJpbGl0eV9zdHJpbmcgPSAmcXVv
dDtoYW5kbGVzLXNhdmVkLXNlc3Npb24mcXVvdDssPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZn
dDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBJbiB0aGUgYWJvdmUgbGlzdCAsIGkgdHJpZWQgYWxsICZx
dW90O2NhcGFiaWxpdHkgc3RyaW5nICZxdW90OyBidXQgaSBjb3VsZCYjMzk7dCBhYmxlIHRvIHNl
ZSB0aGUgYmVsb3c8YnI+CiZndDsgb3V0cHV0IGdpdmVuIGJ5IHRwbTJfbnZsaXN0ICh3aGljaCBp
IHVzZWQgdG8gZ2V0IHdpdGggZGlmZmVyZW50IHRwbS10b29scyB2ZXJzaW9uPGJyPgomZ3Q7IHRo
YXQgaSB1c2VkIGVhcmxpZXIpIC48YnI+CiZndDsgPGJyPgo8YnI+ClB1dCB0aGUgdG9vbCBpbiBh
IGRlYnVnZ2VyIGFuZCBsb29rIGF0IHRoZSBhcmd1bWVudHMgcGFzc2VkIHRvIEVzeXNfR2V0Q2Fw
YWJpbGl0eSBhbmQgbWltaWMgaXQuPGJyPgpJdCYjMzk7cyB0aW1lIHlvdSBsZWFybiBob3cgdG8g
ZmlzaC48YnI+Cjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyAjIHRwbTJf
bnZsaXN0PGJyPgomZ3Q7IDxicj4KJmd0OyBPL1A8YnI+CiZndDsgPGJyPgomZ3Q7IDEgTlYgaW5k
ZXhlcyBkZWZpbmVkLjxicj4KJmd0OyA8YnI+CiZndDvCoCAwLiBOViBJbmRleDogMHgxNTAwMDE1
PGJyPgomZ3Q7IDxicj4KJmd0O8KgIHs8YnI+CiZndDsgPGJyPgomZ3Q7wqAgSGFzaCBhbGdvcml0
aG0obmFtZUFsZyk6MTE8YnI+CiZndDsgPGJyPgomZ3Q7IFRoZSBJbmRleCBhdHRyaWJ1dGVzKGF0
dHJpYnV0ZXMpOjB4NjQwMTQwMDE8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgVGhlIHNp
emUgb2YgdGhlIGRhdGEgYXJlYShkYXRhU2l6ZSk6MzI8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqB9PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4K
Jmd0OyAxKSBFdmVuIHRob3VnaCB0aGlzIHRwbTJfbnZsaXN0IHRoYXQgd2FzIHRoZXJlIGluIG15
IGN1cnJlbnQgdHBtMi10b29scyB2ZXJzaW9uPGJyPgomZ3Q7ICh0cG0yLXRvb2xzLTMuWCkgLGJ5
IHdoaWNoIGl0IGlzIG5vdCBzaG93aW5nIG1lIGFueSBvdXRwdXQgLjxicj4KJmd0OyA8YnI+CiZn
dDsgI3RwbTJfbnZsaXN0PGJyPgomZ3Q7IDxicj4KJmd0OyAjPGJyPgomZ3Q7IDxicj4KPGJyPgpJ
IGRvbiYjMzk7dCBrbm93IGlmIHlvdXIgdHJ5aW5nIHRvIGFzayBzb21ldGhpbmcgaGVyZSwgYXJl
IHlvdT88YnI+Cjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZn
dDsgPGJyPgomZ3Q7IDxicj4KJmd0OyAyKSBUcmllZCBnZXRfY2FwIG9mICZxdW90O2hhbmRsZXMt
cGVybWFuZW50JnF1b3Q7ICwgd2hpY2ggc2hvd3MgbWUgYmVsb3cgdmFsdWVzIGFzPGJyPgomZ3Q7
IHNob3duIGJlbG93ICwgYnV0IG5vdCBzdXJlIGhvdyB0byBnZXQgdGhlIGluZGV4IG9mIHBhcnRp
Y3VsYXIgdHBtIGJhbms8YnI+Cjxicj4KQmFua3MgYXJlIGZvciBQQ1JzLCBpZSBQQ1IwIGNhbiBo
YXZlIGEgU0hBMSBhbmQgU0gyNTYgYmFuay48YnI+Cjxicj4KJmd0OyA8YnI+CiZndDsgIy90cG0y
L3RwbV9ldm8vdHBtMi10b29scy0zLlgvdG9vbHMjIC4vdHBtMl9nZXRjYXAgLS1jYXBhYmlsaXR5
PSZxdW90O2hhbmRsZXMtPGJyPgomZ3Q7IHBlcm1hbmVudCZxdW90Ozxicj4KPGJyPgpTdG9wIHVz
aW5nIDMuWCBpdHMgZGVwcmVjYXRlZCwgZ3JhYiB0aGUgbGF0ZXN0IDQuWCByZWxlYXNlIGFuZCBi
dWlsZCBpdC48YnI+ClRoZSB0b29scyBhY3R1YWxseSB3b3JrLjxicj4KPGJyPgomZ3Q7IDxicj4K
Jmd0OyAweDQwMDAwMDAxPGJyPgomZ3Q7IDxicj4KJmd0OyAweDQwMDAwMDA3PGJyPgomZ3Q7IDxi
cj4KJmd0OyAweDQwMDAwMDA5PGJyPgomZ3Q7IDxicj4KJmd0OyAweDQwMDAwMDBhPGJyPgomZ3Q7
IDxicj4KJmd0OyAweDQwMDAwMDBiPGJyPgomZ3Q7IDxicj4KJmd0OyAweDQwMDAwMDBjPGJyPgom
Z3Q7IDxicj4KJmd0OyAweDQwMDAwMDBkPGJyPgo8YnI+ClRob3NlIGFyZSBub3QgTlYgaGFuZGxl
cywgTlYgSGFuZGxlcyBzdGFydCB3aXRoIDB4MTA8YnI+Cjxicj4KJmd0OyA8YnI+CiZndDsgPGJy
PgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgMilBbHNvIHRyaWVkIHJlYWRpbmcgcGNyIGxpc3Qg
dXNpbmcgdHBtMl9nZXRjYXAgLiBJcyB0aGUgYmVsb3cgb2Zmc2V0KHMpIGFyZSBzdGFuZHM8YnI+
CiZndDsgZm9yID88YnI+CiZndDsgPGJyPgomZ3Q7ICMgLi90cG0yX2dldGNhcCAtLWNhcGFiaWxp
dHk9JnF1b3Q7aGFuZGxlcy1wY3ImcXVvdDs8YnI+Cjxicj4KQWdhaW4sIE5WIEluZGV4ZXMgQVJF
IE5PVCBQQ1ImIzM5O3MuPGJyPgo8YnI+CiZndDsgPGJyPgomZ3Q7IDB4MDAwMDAwMDA8YnI+CiZn
dDsgPGJyPgomZ3Q7IDB4MDAwMDAwMDE8YnI+CiZndDsgPGJyPgomZ3Q7IDB4MDAwMDAwMDI8YnI+
CiZndDsgPGJyPgomZ3Q7IDB4MDAwMDAwMDM8YnI+CiZndDsgPGJyPgomZ3Q7IDB4MDAwMDAwMDQ8
YnI+CiZndDsgPGJyPgomZ3Q7IDB4MDAwMDAwMDU8YnI+CiZndDsgPGJyPgomZ3Q7IDB4MDAwMDAw
MDY8YnI+CiZndDsgPGJyPgomZ3Q7IDIuMSkgUmVxdWVzdCB5b3UgdG8gc2hhcmUgbWUgZmV3IHBv
aW50cyBvbiBob3cgdG8gdXNlIHRoZSAmcXVvdDt0cG0yX2dldGNhcCgpIGFuZDxicj4KJmd0OyBn
ZXQgdGhlIG9mZnNldCA/PGJyPgomZ3Q7IDxicj4KPGJyPgpEZWJ1Z2dlcnMgYXJlIHlvdXIgZnJp
ZW5kLjxicj4KPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgU2luY2Ugbm9uZSBvZiB0aGUg
YWJvdmUgdG9vbHMgQVBJIGhlbHBlZCBtZSBvciBhbSBpIG1pc3Npbmcgc29tZSB0aGluZyB0byBy
ZWFkPGJyPgomZ3Q7IHRoZSBvdXRwdXQgb2YgTlZSQU0gaW5kZXggPzxicj4KPGJyPgpJIHdvdWxk
IHVwZ3JhZGUgdG8gbmV3ZXIgdG9vbHMuIElmIHlvdSBtdXN0IHN0YXkgaW4gdGhlIDMuWCBsYW5k
LCB0aGVuIGNvcHkgd2hhdCB0aGUgdGVzdDxicj4Kc2NyaXB0cyBhcmUgZG9pbmcsIHRoZXkgZG8g
aXQgY29tcGxldGVseS4gTG9vayBmb3IgbnYuc2guPGJyPgo8YnI+CiZndDsgPGJyPgomZ3Q7IDMp
IFdpdGhvdXQga25vd2luZyB0aGUgb2Zmc2V0ICwgdHJpZWQgdG8gZGVmaW5lIG9mZnNldCBmcm9t
IDB4MTUwMDAxNSBhbmQgdHJ5aW5nPGJyPgomZ3Q7IHRvIHdyaXRlIGFuZCByZWFkIGJhY2sgLCBo
ZXJlIG52ZGVmaW5lIHdvcmtzIGFsb25nIHdpdGggbnZ3cml0ZSAuLmJ1dCBudnJlYWQgZmFpbHM8
YnI+CiZndDsgd2l0aCAmcXVvdDthdXRoJnF1b3Q7IGlzc3VlLiBQbGVhc2UgcmVmZXJlIGJlbG93
IHNlcXVlbmNlIGFuZCBhc3NvY2lhdGVkIGVycm9yczxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgom
Z3Q7IDMuMSkgVHJpZWQgZGVmaW5pbmcgbnZyYW0gdXNpbmcgdHBtMl9udmRlZmluZSAtIFN1Y2Nl
ZWRlZCB3aXRoIG91dCBhbnkgZXJyb3LCoCAtLTxicj4KJmd0OyBnaXZlbiAtYSAweDQwMDAwMDAx
IChUUE1fUkhfT1dORVIgQWNjZXNzKSAsIGlmIGkgZGVmaW5lIHdpdGggMHg0MDAwMDAwQzxicj4K
Jmd0OyAoVFBNX1JIX09XTkVSICwgaSBnb3QgdGhlIHNhbWUgcmVzdWx0IGR1cmluZyB0cG0yX252
cmVhZCAuIEhlcmUgcmVtb3ZpbmcgJnF1b3Q7LXQ8YnI+CiZndDsgMHgyMDAwQSZxdW90OyBvcHRp
b24gYW5kIHRoZW4gZG9pbmcgbnZkZWZpbmUgYWxzbyB0aHJvd3MgbWUgdGhlIHNhbWUgZXJyb3Ig
c2hvd248YnI+CiZndDsgaW4gcG9pbnQgMy4zIGR1cmluZyBudnJlYWQ8YnI+CiZndDsgPGJyPgom
Z3Q7ICMuL3RwbTJfbnZkZWZpbmUgLXggMHgxNTAwMDE2IC1hIDB4NDAwMDAwMDEgLXMgMzIgLXQg
MHgyMDAwQTxicj4KPGJyPgpPZmZoYW5kLCBJIGRvbiYjMzk7dCBrbm93IHdoYXQgdGhlIDB4MjAw
MEEgbWFzayBpcywgc28gSSB3b3VsZCBoYXZlIHRvIGxvb2sgaXQgdXAsIGJ1dCBJIGFtIG5vdCBn
b2luZyB0by48YnI+ClVzZSBzdHJpbmcgbWFza3MuPGJyPgo8YnI+CklmIHlvdSBqdXN0IHVwZ3Jh
ZGUgdG8gYSA0LnggdG9vbHMsIGl0IHNob3VsZCB3b3JrLiBJIHJlbWVtYmVyIHNvbWUgaXNzdWVz
IHdpdGggYXR0cmlidXRlcyBvbiB0aGUgMy5YIGJyYW5jaDxicj4KVG9vbHMuPGJyPgo8YnI+CiZn
dDsgPGJyPgomZ3Q7ICM8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJy
PgomZ3Q7IDMuMikgVHJpZWQgTlZXUklURSBpbiB0aGUgc2FtZSBvZmZzZXQgMHgxNTAwMDE1wqAg
LSBTdWNjZWVkZWQgd2l0aG91dCBhbnkgZXJyb3I8YnI+CiZndDsgPGJyPgomZ3Q7ICMgLi90cG0y
X252d3JpdGUgLXggMHgxNTAwMDE1IC1MIHRlc3RfaGVsbG93b3JsZDxicj4KJmd0OyA8YnI+CiZn
dDsgIzxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgMy4z
KSBSZWFkaW5nIGJhY2sgdGhlIHNhbWUgb2Zmc2V0IC14MTUwMDAxNSAsIHdoaWNoIHRocm93cyBi
ZWxvdyBlcnJvciBzdGF0aW5nPGJyPgomZ3Q7IFRQTTJfUkNfTlZfVU5JTklUSUFMSVpFRC4gU2lu
Y2UgaSBoYXZlIGluaXRpYWxpemVkIGl0IGFzIHNhaWQgYWJvdmUgcG9pbnQgMy4xwqAgLDxicj4K
Jmd0OyB3aGF0IGFtIGkgbWlzc2luZyBoZXJlID88YnI+Cjxicj4KVXBncmFkZSB5b3VyIHRvb2xz
LCBhbmQgdGhlIGV4YW1wbGUgSSBzaG93ZWQgeWVzdGVyZGF5IHNob3VsZCB3b3JrLjxicj4KPGJy
PgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBCZWxvdyBhcmUg
dGhlIE9QVElPTlMgSSBoYXZlIGJ5IHRwbTJfbnZyZWFkOjxicj4KJmd0OyA8YnI+CiZndDsgYXMg
eW91IHN1Z2dlc3RlZMKgIHRvIHVzZSAoZWNobyBgdHBtMl9udnJlYWQgLUMgbyAtczUgMHgxNTAw
MDE1YCBjb21tYW5kKTxicj4KJmd0OyA8YnI+CiZndDsgSSBjYW50IHNlZSAtQyAodGhpcyBtaWdo
dCBiZSBkdWUgdG8gdG9vbHMgdmVyc2lvbiAzLlggPyAuIElmIGl0IGlzIG5vdCB0aGUgbGF0ZXN0
ICwgY2FuJiMzOTt0PGJyPgomZ3Q7IHdlIGFibGUgdG8gdXNlIHRoZSBiZWxvdyBBUElzID88YnI+
CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7ICMgLi90cG0yX252
cmVhZDxicj4KJmd0OyA8YnI+CiZndDsgVXNhZ2U6IHRwbTJfbnZyZWFkIFsmbHQ7b3B0aW9ucyZn
dDtdPGJyPgomZ3Q7IDxicj4KJmd0OyBXaGVyZSAmbHQ7b3B0aW9ucyZndDsgYXJlOjxicj4KJmd0
OyA8YnI+CiZndDvCoCDCoCDCoFsgLXggfCAtLWluZGV4PSZsdDt2YWx1ZSZndDtdIFsgLWEgfCAt
LWF1dGgtaGFuZGxlPSZsdDt2YWx1ZSZndDtdIFsgLWYgfCAtLW91dHB1dD0mbHQ7dmFsdWUmZ3Q7
XSBbPGJyPgomZ3Q7IC1zIHwgLS1zaXplPSZsdDt2YWx1ZSZndDtdPGJyPgomZ3Q7IDxicj4KJmd0
O8KgIMKgIMKgWyAtbyB8IC0tb2Zmc2V0PSZsdDt2YWx1ZSZndDtdIFsgLVAgfCAtLWhhbmRsZS1w
YXNzd2Q9Jmx0O3ZhbHVlJmd0O10gWyAtUyB8IC0taW5wdXQtc2Vzc2lvbi08YnI+CiZndDsgaGFu
ZGxlPSZsdDt2YWx1ZSZndDtdIFsgLUwgfCAtLXNldC1saXN0PSZsdDt2YWx1ZSZndDtdPGJyPgom
Z3Q7IDxicj4KJmd0O8KgIMKgIMKgWyAtRiB8IC0tcGNyLWlucHV0LWZpbGU9Jmx0O3ZhbHVlJmd0
O108YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7ICMgLi90
cG0yX252cmVhZCAteCAweDE1MDAwMTUgLWEgMHg0MDAwMDAwMSAtcyAzMjxicj4KJmd0OyA8YnI+
CiZndDsgRVJST1I6IEZhaWxlZCB0byByZWFkIE5WUkFNIGFyZWEgYXQgaW5kZXggMHgxNTAwMDE1
ICgyMjAyMDExNykuIEVycm9yOjB4MTRhPGJyPgomZ3Q7IDxicj4KJmd0OyBFUlJPUjogVW5hYmxl
IHRvIHJ1biAuL3RwbTJfbnZyZWFkPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgom
Z3Q7IDxicj4KJmd0OyAjIHRwbTJfcmNfZGVjb2RlIDB4MTRhPGJyPgomZ3Q7IDxicj4KJmd0OyBl
cnJvciBsYXllcjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoGhleDogMHgwPGJyPgomZ3Q7IDxicj4K
Jmd0O8KgIMKgaWRlbnRpZmllcjogVFNTMl9UUE1fUkNfTEFZRVI8YnI+CiZndDsgPGJyPgomZ3Q7
wqAgwqBkZXNjcmlwdGlvbjogRXJyb3IgcHJvZHVjZWQgYnkgdGhlIFRQTTxicj4KJmd0OyA8YnI+
CiZndDsgZm9ybWF0IDAgZXJyb3IgY29kZTxicj4KJmd0OyA8YnI+CiZndDvCoCDCoGhleDogMHg0
YTxicj4KJmd0OyA8YnI+CiZndDvCoCDCoG5hbWU6IFRQTTJfUkNfTlZfVU5JTklUSUFMSVpFRDxi
cj4KJmd0OyA8YnI+CiZndDvCoCDCoGRlc2NyaXB0aW9uOiBhbiBOViBJbmRleCBpcyB1c2VkIGJl
Zm9yZSBiZWluZyBpbml0aWFsaXplZCBvciB0aGUgc3RhdGUgc2F2ZWQgYnk8YnI+CiZndDsgVFBN
Ml9TaHV0ZG93bihTVEFURSkgY291bGQgbm90IGJlIHJlc3RvcmVkPGJyPgomZ3Q7IDxicj4KJmd0
OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyAzLjQpIFRyaWVkIHJlYWRpbmcgdGhlIHNh
bWUgb2Zmc2V0IDB4MTUwMDAxNSB3aXRob3V0IGdpdmluZyAmIzM5Oy1hJiMzOTs8YnI+CiZndDsg
KFRQTTJfUkhfT1dORVIpIGFjY2VzcyAsIGJ1dCB0aGUgcmVzdWx0cyBzaG93biBOVl9BVVRIT1JJ
WkFUSU9OLiBTbyBpPGJyPgomZ3Q7IHVuZGVyc3Rvb2Q8YnI+CiZndDsgPGJyPgomZ3Q7IGlmIHdl
IGRlZmluZWQgd2l0aCAtYSBhdXRoIHBlcm1pc3Npb24gdGhlbiB3ZSBuZWVkIHRvIGdpdmUgdGhl
IHNhbWUgcGVybWlzc2lvbjxicj4KJmd0OyB3aGlsZSByZWFkaW5nIHRoZSBjb250ZW50IGZyb20g
dGhlIHNhbWUgb2Zmc2V0LiBJcyBteSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QgPzxicj4KJmd0
OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgIyAuL3RwbTJfbnZyZWFk
IC14IDB4MTUwMDAxNSAtcyAzMjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IEVSUk9SOiBG
YWlsZWQgdG8gcmVhZCBOVlJBTSBhcmVhIGF0IGluZGV4IDB4MTUwMDAxNSAoMjIwMjAxMTcpLiBF
cnJvcjoweDE0OTxicj4KJmd0OyBFUlJPUjogVW5hYmxlIHRvIHJ1biAuL3RwbTJfbnZyZWFkPGJy
PgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgIyB0cG0yX3JjX2RlY29kZSAweDE0OTxicj4KJmd0
OyBlcnJvciBsYXllcjxicj4KJmd0O8KgIMKgaGV4OiAweDA8YnI+CiZndDvCoCDCoGlkZW50aWZp
ZXI6IFRTUzJfVFBNX1JDX0xBWUVSPGJyPgomZ3Q7wqAgwqBkZXNjcmlwdGlvbjogRXJyb3IgcHJv
ZHVjZWQgYnkgdGhlIFRQTSBmb3JtYXQgMCBlcnJvciBjb2RlPGJyPgomZ3Q7wqAgwqBoZXg6IDB4
NDk8YnI+CiZndDvCoCDCoG5hbWU6IFRQTTJfUkNfTlZfQVVUSE9SSVpBVElPTjxicj4KJmd0O8Kg
IMKgZGVzY3JpcHRpb246IE5WIGFjY2VzcyBhdXRob3JpemF0aW9uIGZhaWxzIGluIGNvbW1hbmQg
YWN0aW9ucyAodGhpcyBmYWlsdXJlIGRvZXM8YnI+CiZndDsgbm90IGFmZmVjdCBsb2Nrb3V0LmFj
dGlvbik8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxi
cj4KJmd0OyA0KSBUcmllZCB0byB1c2UgdHBtMl9yZWFkcHVibGljIHRvIHJlYWQgYWJvdmUgd3Jp
dHRlbiBvZmZzZXQgMHgxNTAwMDE1ICwgZ2V0dGluZzxicj4KJmd0OyAweDE4NCAodmFsdWUgaXMg
b3V0IG9mIHJhbmdlIG9yIGlzIG5vdCBjb3JyZWN0IGZvciB0aGUgY29udGV4dCkgd2hhdCBhbSBp
IG1pc3Npbmc8YnI+CiZndDsgaGVyZSA/PGJyPgomZ3Q7IDxicj4KJmd0OyAjIC4vdHBtMl9yZWFk
cHVibGljPGJyPgomZ3Q7IFVzYWdlOiB0cG0yX3JlYWRwdWJsaWMgWyZsdDtvcHRpb25zJmd0O108
YnI+CiZndDsgV2hlcmUgJmx0O29wdGlvbnMmZ3Q7IGFyZTo8YnI+CiZndDvCoCDCoCDCoFsgLUgg
fCAtLW9iamVjdD0mbHQ7dmFsdWUmZ3Q7XSBbIC1vIHwgLS1vcHU9Jmx0O3ZhbHVlJmd0O10gWyAt
YyB8IC0tY29udGV4dC1vYmplY3Q9Jmx0O3ZhbHVlJmd0O108YnI+CiZndDsgWyAtZiB8IC0tZm9y
bWF0PSZsdDt2YWx1ZSZndDtdPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7
IDxicj4KJmd0OyAjIC4vdHBtMl9yZWFkcHVibGljIC1IIDB4MTUwMDAxNTxicj4KJmd0OyBFUlJP
UjogVFBNMl9SZWFkUHVibGljIGVycm9yOiBydmFsID0gMHgxODQ8YnI+CiZndDsgRVJST1I6IFVu
YWJsZSB0byBydW4gLi90cG0yX3JlYWRwdWJsaWM8YnI+CiZndDsgcm9vdEBtdXRodS12Yjp+L3dv
cmsvdHBtMi90cG1fZXZvL2luc3RhbGwvYmluIyAuL3RwbTJfcmVhZHB1YmxpYyAtSDxicj4KJmd0
OyAweDE1MDAwMTUgLS1vcHUgZmlsZTxicj4KJmd0OyBFUlJPUjogVFBNMl9SZWFkUHVibGljIGVy
cm9yOiBydmFsID0gMHgxODQ8YnI+CiZndDsgRVJST1I6IFVuYWJsZSB0byBydW4gLi90cG0yX3Jl
YWRwdWJsaWM8YnI+CiZndDsgcm9vdEBtdXRodS12Yjp+L3dvcmsvdHBtMi90cG1fZXZvL2luc3Rh
bGwvYmluIyAuL3RwbTJfcmNfZGVjb2RlIDB4MTg0PGJyPgomZ3Q7IGVycm9yIGxheWVyPGJyPgom
Z3Q7wqAgwqBoZXg6IDB4MDxicj4KJmd0O8KgIMKgaWRlbnRpZmllcjogVFNTMl9UUE1fUkNfTEFZ
RVI8YnI+CiZndDvCoCDCoGRlc2NyaXB0aW9uOiBFcnJvciBwcm9kdWNlZCBieSB0aGUgVFBNPGJy
PgomZ3Q7IGZvcm1hdCAxIGVycm9yIGNvZGU8YnI+CiZndDvCoCDCoGhleDogMHgwNDxicj4KJmd0
O8KgIMKgaWRlbnRpZmllcjogVFBNMl9SQ19WQUxVRTxicj4KJmd0O8KgIMKgZGVzY3JpcHRpb246
IHZhbHVlIGlzIG91dCBvZiByYW5nZSBvciBpcyBub3QgY29ycmVjdCBmb3IgdGhlIGNvbnRleHQ8
YnI+CiZndDsgaGFuZGxlPGJyPgomZ3Q7wqAgwqBoZXg6MHgxMDA8YnI+CiZndDvCoCDCoGlkZW50
aWZpZXI6wqAgVFBNMl9SQ18xPGJyPgomZ3Q7wqAgwqBkZXNjcmlwdGlvbjrCoCAobnVsbCk8YnI+
CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgIzxicj4KJmd0OyA8YnI+CiZndDsg
PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDUpVHJpZWQgcmVsZWFzaW5n
IHRoZSBzYW1lIG9mZnNldCB1c2luZyBudnJlbGVhc2UgdGhhdCB0b28gd29ya3MgZmluZTxicj4K
Jmd0OyA8YnI+CiZndDsgIy4vdHBtMl9udnJlbGVhc2UgLXggMHgxNTAwMDE1IC1hIDB4NDAwMDAw
MDE8YnI+CiZndDsgPGJyPgomZ3Q7ICM8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+
CiZndDsgPGJyPgomZ3Q7IEFzIHBlciBteSByZXF1ZXN0IHJhaXNlZCBieSB5ZXN0ZXJkYXkgLiBJ
IG5lZWQgdG8gZGVmaW5lIGFuIG9mZnNldCBpbiBudiByYW0gdGhlbjxicj4KJmd0OyB3cml0ZSBj
b250ZW50IG9ubHkgb25jZSBhbmQgcmVhZCBpdCBiYWNrIHdoZW4gZXZlciByZXF1aXJlZC7CoCBE
dXJpbmcgZXZlcnk8YnI+CiZndDsgc2Vjb25kIHdyaXRlICwgaSBuZWVkIHRvIHJlYWQgdGhlIG9m
ZnNldCAoeW91IHN1Z2dlc3RlZCB0byB1c2U8YnI+CiZndDsgdHBtMl9udnJlYWRwdWJpYygpICwg
YnV0IGkgc3RydWNrIHdpdGggdXNhZ2Ugb2YgdGhpcyAmcXVvdDtudnJlYWQgcHVibGljIGFwaSZx
dW90OyBjb21tYW5kPGJyPgomZ3Q7IGFzIHdlbGwgKHJlc3VsdHMgYXJlIGp1c3Qgc2hvd24gYWJv
dmUpPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBBcyBw
ZXIgdG9kYXkmIzM5O3MgZXhwZXJpbWVudHMgLCBpIGNhbnQgYWJsZSBhYmxlIHRvIGFjaGlldmUg
dGhlIChudnJlYWQpIHVzaW5nPGJyPgomZ3Q7IGNvbW1hbmQgbGluZSBBUEkgLiBMZXQgbWUga25v
dyB3aGF0IGFtIGkgbWlzc2luZyBoZXJlIC48YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8
YnI+CiZndDsgPGJyPgomZ3Q7IExvb2tpbmcgZm9yd2FyZCBmb3IgeW91ciB2YWx1YWJsZSByZXBs
eS48YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IFRoYW5r
cyw8YnI+CiZndDsgPGJyPgomZ3Q7IE11dGh1a3VtYXI8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4K
Jmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IE9u
IFRodSwgTWF5IDE0LCAyMDIwIGF0IDEyOjUxIEFNIFJvYmVydHMsIFdpbGxpYW0gQzxicj4KJmd0
OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyB3cm90ZTo8YnI+CiZndDsg
PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBGcm9tOiA8YSBocmVmPSJtYWlsdG86bXV0aHUu
c21rQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm11dGh1LnNta0BnbWFpbC5jb208L2E+ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm11dGh1LnNta0BnbWFpbC5jb20iIHRhcmdldD0iX2Js
YW5rIj5tdXRodS5zbWtAZ21haWwuY29tPC9hPiZndDs8YnI+CiZndDsgW21haWx0bzo8YSBocmVm
PSJtYWlsdG86bXV0aHUuc21rQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm11dGh1LnNta0Bn
bWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm11dGh1LnNta0BnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5tdXRodS5zbWtAZ21haWwuY29tPC9hPiZndDsgXTxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0OyBTZW50OiBXZWRuZXNkYXksIE1heSAxMywgMjAyMCAxMjo1MSBQTTxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0
cy4wMS5vcmc8L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBTdWJqZWN0OiBbdHBtMl0g
TlZSQU0gV3JpdGUgYW5kIFJlYWQgdXNpbmcgRXN5cyBBUEkocyk8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgSGkgV2lsbGlhbXMsPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEkgYW0gdXNpbmcgdGhlIHRlc3QgY29k
ZSB1c2VkIHRvIHJlYWQgYW5kIHdyaXRlIGluIHRvIE5WIHJhbS7CoCBJIGFtPGJyPgomZ3Q7IGZh
Y2luZyBiZWxvdzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBjaGFsbGVuZ2VzIGlmIGkgdHJpZWQg
dG8gcmVhZCBhbHJlYWR5IHdyaXR0ZW4gZGF0YSBmcm9tIE5WUkFNLjxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAxKSBUZXN0IGNvZGUgYXR0YWNoZWQgZGVm
aW5lZCBjcmVhdGUgdGhlIGNvbnRleHQgKGVjdHgpICwgY3JlYXRlIHJhbmRvbTxicj4KJmd0OyBu
dW1iZXIgLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBkZWZpbmUgTlYgcmFtICwgd3JpdGUgdGhl
IHJhbmRvbSBudW1iZXIgaW4gdG8gTlZSQU0gKG9mZnNldDxicj4KJmd0OyAweDEwMDAwMDEpIGFu
ZDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyByZWFkIGl0IGJhY2sgZnJvbSBOViBSYW0gKGZyb20g
c2FtZSBvZmZzZXQgMHgxMDAwMDAxKTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0OyAyKSBCdXQgaWYgaSB0cnkgdG8gcnVuIHRoaXMgY29kZSB0d2ljZSBvciB0
aHJpc2UgLCBhbSBnZXR0aW5nIGJlbG93IE5WUkFNPGJyPgomZ3Q7IGFscmVhZHk8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgZGVmaW5lZCByYyBjb2RlLiBJIGNhbiB1bmRlcnN0YW5kIHRoYXQgd2Ug
c2hvdWxkIG5vdCBkZWZpbmVkIHRoZSBudjxicj4KJmd0OyByYW0gc3BhY2U8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgd2hpY2ggYWxyZWFkeSBkZWZpbmVkIGFuZCB1c2VkLjxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0OyBIb3cgdG8gYXZvaWQgdGhpcyA/IGJ5IGRlZmluaW5nIG52cmFtIE9OTFkgb25j
ZSBhbmQgd3JpdGUgaXQgT05MWTxicj4KJmd0OyBvbmNlIGFuZDxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0OyBmaW5hbGx5IHJlYWQgaXQgQVMgTVVDSCB0aW1lcyB3ZSB3YW50ID/CoCBCZWxvdyBkZXRh
aWxzIGFyZSByZWxhdGVkIHRvPGJyPgomZ3Q7IHRoaXMgcmVxdWVzdDxicj4KJmd0OyA8YnI+CiZn
dDvCoCDCoCDCoCDCoFlvdSBjYW4gY2FsbCBFc3lzX0dldENhcGFiaWxpdHkoKSBhbmQgc2VlIHdo
YXQgTlYgaW5kaWNlcyBhcmUgZGVmaW5lZC48YnI+CiZndDsgVGhlIGNvbW1hbmQ8YnI+CiZndDvC
oCDCoCDCoCDCoExpbmUgdG9vbCB0cG0yX2dldGNhcCBkb2VzIHRoaXMsIGxpa2Ugc286PGJyPgom
Z3Q7wqAgwqAgwqAgwqB0cG0yX2dldGNhcCBoYW5kbGVzLW52LWluZGV4PGJyPgomZ3Q7IDxicj4K
Jmd0O8KgIMKgIMKgIMKgWW91IGNhbiB1c2UgdGhhdCB0b29sIGFzIGFuIGV4YW1wbGUgb2YgaG93
IHRvIGRvIGl0Ljxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgRXJyb3IgY29kZTo8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgMHgwMDAwMDE0
YyAtIGRlc2NyaXB0aW9uOiBOViBJbmRleCBvciBwZXJzaXN0ZW5kIG9iamVjdCBhbHJlYWR5IGRl
ZmluZWQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgMHgwMDAwMDI4NCAtIGRlc2NyaXB0aW9uOiB2
YWx1ZSBpcyBvdXQgb2YgcmFuZ2Ugb3IgaXMgbm90IGNvcnJlY3QgZm9yIHRoZTxicj4KJmd0OyBj
b250ZXh0PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDMp
IFF1ZXJ5IGlzIDogaXMgaXQgcG9zc2libGUgdG8gZGVmaW5lIG52cmFtICZxdW90O09OTFkgT05D
RSZxdW90OyB3aXRoIHRoZSBBUEk8YnI+CiZndDsgc2hhcmVkIHRoZTxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0OyB0ZXN0IGNvZGUgYW5kIHRoZW4gY3JlYXRlIGEgZnVuY3Rpb24gJnF1b3Q7Y3JlYXRl
cmFuZG9tJnF1b3Q7IG51bWJlciB0byB1c2U8YnI+CiZndDsgdGhlIHNhbWU8YnI+CiZndDsgPGJy
PgomZ3Q7wqAgwqAgwqAgwqBDYWxsIGdldGNhcCwgc2VlIGlmIGl0JiMzOTtzIGRlZmluZWQsIGlm
IGRlZmluZWQsIGRvbiYjMzk7dCBkZWZpbmUgaXQuLi4uPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0OyBjb250ZXh0IChlY3RzKSB0byBnZW5lcmF0ZSByYW5kdW1udW1iZXIgdGhlbiBj
YWxsIHNlcGFyYXRlPGJyPgomZ3Q7ICZxdW90O3dyaXRlX252cmFtJnF1b3Q7PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IGZ1bmN0aW9uIHdpdGggcmFuZG9tIG51bWJlciBhcyBpbnB1dCBhbmQgYXNr
IHRvIHdyaXRlIGluIHRoZSBzYW1lPGJyPgomZ3Q7IG9mZnNldCAuPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IEZpbmFsbHkgY2FsbGluZyBhbm90aGVyIGZ1bmN0aW9uICZxdW90O3JlYWRfbnZyYW0m
cXVvdDsgdG8gcmVhZCBpdCBiYWNrIGZyb20gdGhlPGJyPgomZ3Q7IHNhbWU8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDsgbnZyYW0mIzM5O3Mgb2Zmc2V0IHdoZW4gZXZlciB3ZSB3YW50ID8gaSB0cmll
ZCB0aGlzIGFwcHJvYWNoIGJ1dCBhbTxicj4KJmd0OyBnZXR0aW5nIHNlZ2ZhdWx0PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IHdpdGggYWJvdmUgZXJyb3IgLjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
OyBXaGF0IGFtIGkgbWlzc2luZyBoZXJlID88YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBT
ZWdmYXVsdHMgYXJlIGxpa2VseSB5b3VyIGNvZGUgaXMganVzdCBicm9rZW4uPGJyPgomZ3Q7IDxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAzLjEpIElkZWFs
bHkgaW4gc2luZ2xlIGFwcGxpY2F0aW9uICwgaSBuZWVkIHRvIGFjaGlldmUgJnF1b3Q7dHBtMl9u
dmRlZmluZSZxdW90Oyw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJnF1b3Q7dHBtMl9udndyaXRl
JnF1b3Q7IGFuZCAmcXVvdDt0cG0yX252cmVhZCgpIHRvb2xzIEFQSShzKSBmdW5jdGlvbmFsaXR5
JnF1b3Q7IGluPGJyPgomZ3Q7IGRpZmZlcmVudCBjYWxsczxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
OyBvciBmbG93Ljxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAzLjIpIEFsc28gaG93IHRvIGNoZWNr
IHdoZXRoZXIgJnF1b3Q7d3JpdGUmcXVvdDsgYWxyZWFkeSBkb25lIChpIHRyaWVkIGNoZWNraW5n
PGJyPgomZ3Q7IG52X2luZGV4IGlzPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRydWUgLSBtZWFu
cyB3aGV0aGVyIGl0IGFscmVhZHkgaGFzIHNvbWUgdmFsdWUpICwgYnV0IGl0IGZhaWxlZCA/PGJy
PgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgSWYgeW91IGRvIHdoYXQgdGhlIHRvb2wgdHBtMl9u
dnJlYWRwdWJsaWMgZG9lcywgeW91IGNhbiBjaGVjayBmb3IgdGhlPGJyPgomZ3Q7IHdyaXR0ZW4g
Yml0Ljxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDsgNCkgQWxzbyBob3cgdG8gY2hlY2sgd2hhdCB3YXMgdGhlIGNvbnRlbnQgdGhhdCBhbHJl
YWR5IHByZXNlbnQgaW4gdGhlPGJyPgomZ3Q7IG52cmFtPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IG9mZnNldCAoMHgxMDAwMDAxKSBiZWZvcmUgaSBkbyB3cml0ZSB0aGUgJnF1b3Q7cmFuZG9tIG51
bWJlciZxdW90OyBzZWNvbmQgdGltZTxicj4KJmd0OyBpbiB0byB0aGU8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgc2FtZSBvZmZzZXQgPyB0aGlzIGlzIHRvIGVuc3VyZSB0aGUgJnF1b3Q7cmFuZG9t
IG51bWJlciZxdW90OyB0aGF0IGkgYW0gcGxhbm5pbmc8YnI+CiZndDsgdG8gd3JpdGU8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgd2FzIHZhbGlkIG9uZSA/PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKg
IMKgIMKgUmVhZCBpdCBvdXQsIGlmIGl0JiMzOTtzIG5vdCB3aGF0IHlvdSB3YW50LCB3cml0ZSBp
dC48YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IEkgcmVtZW1iZXIgc3R1ZHlpbmcgdGhhdCwgb25jZSB1IHdyaXRlIGluIHRvIE5WUkFNIG9m
ZnNldCAsIHdlIGNhbnQ8YnI+CiZndDsgYWJsZSB0byBSRS08YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDsgV1JJVEUgaXQgaW4gdGhlIHNhbWUgb2Zmc2V0KDB4MTAwMDAwMSkuIFdoZXRoZXIgdGhhdCBp
cyB0aGUgc2FtZSBjYXNlPGJyPgomZ3Q7IGZvcjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBTSU1V
TEFUT1IgYXMgd2VsbCAob3IpIHRoaXMgZmVhdHVyZSBpcyBvbmx5IGZvciByZWFsIHRwbSBoYXJk
d2FyZT88YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBObyBnZW5lcmFsbHkgeW91IGNhbiB3
cml0ZSBhcyBtYW55IHRpbWVzIGFzIHlvdSB3YW50Li4uIHRoZXJlIGFyZSB0cmlja3M8YnI+CiZn
dDsgeW91IGNhbiBkbyB0byBtYWtlPGJyPgomZ3Q7wqAgwqAgwqAgwqBJdCBsb2NrZWQgYWZ0ZXIg
d3JpdGUgKHdyaXRlbG9ja2VkIGlpcmMpPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgQmVs
b3cgaXMgYSBjb21tYW5kIGxpbmUgZXhhbXBsZSBvZiBkb2luZyBpdC4uLjxicj4KJmd0OyA8YnI+
CiZndDvCoCDCoCDCoCDCoHRwbTJfbnZkZWZpbmU8YnI+CiZndDvCoCDCoCDCoCDCoG52LWluZGV4
OiAweDEwMDAwMDA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqB0cG0yX252cmVhZHB1Ymxp
YyAweDEwMDAwMDA8YnI+CiZndDvCoCDCoCDCoCDCoDB4MTAwMDAwMDo8YnI+CiZndDvCoCDCoCDC
oCDCoCDCoG5hbWU6PGJyPgomZ3Q7IDAwMGIxMTk1ZjM2YTIxYzgyMTkwNTVhZDA4MDNjMzllN2U4
MWQwNmNkYjJlZWUyYjdjZjkzZGQ4M2UwMWQ0MjczODI4PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBo
YXNoIGFsZ29yaXRobTo8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoGZyaWVuZGx5OiBzaGEyNTY8
YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoHZhbHVlOiAweEI8YnI+CiZndDvCoCDCoCDCoCDCoCDC
oGF0dHJpYnV0ZXM6PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqBmcmllbmRseTogb3duZXJ3cml0
ZXxhdXRod3JpdGV8b3duZXJyZWFkfGF1dGhyZWFkPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqB2
YWx1ZTogMHg2MDAwNjAwPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBzaXplOiAyMDQ4PGJyPgomZ3Q7
IDxicj4KJmd0O8KgIMKgIMKgIMKgIyB5b3UgY2FuIGRvIHRoaXMgYXMgbXVjaCBhcyB5b3Ugd2Fu
dCwgYnV0IGl0IGNhbiB3ZWFyIHRoZSBtZW1vcnkgaW4gdGhlPGJyPgomZ3Q7IFRQTTxicj4KJmd0
O8KgIMKgIMKgIMKgIyBkZXBlbmRpbmcgb24gbWVtb3J5IHRlY2hub2xvZ3kgdGhlIHZlbmRvciB1
c2VkLjxicj4KJmd0O8KgIMKgIMKgIMKgZWNobyAmcXVvdDtoZWxsbyZxdW90OyB8IHRwbTJfbnZ3
cml0ZSAtQyBvIDB4MTAwMDAwMCAtaS08YnI+CiZndDvCoCDCoCDCoCDCoGVjaG8gYHRwbTJfbnZy
ZWFkIC1DIG8gLXM1IDB4MTAwMDAwMGA8YnI+CiZndDvCoCDCoCDCoCDCoGhlbGxvPGJyPgomZ3Q7
IDxicj4KJmd0O8KgIMKgIMKgIMKgdHBtMl9udnJlYWRwdWJsaWMgMHgxMDAwMDAwPGJyPgomZ3Q7
wqAgwqAgwqAgwqAweDEwMDAwMDA6PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBuYW1lOjxicj4KJmd0
OyAwMDBiMjg3YzliMWIwNmZhYjZlNTFiZDI2ZTk4ZWE4OTQ2MDU3NGU5N2EzZDJlZjk5NWViMzVm
N2UyM2RiN2U5NGY2Nzxicj4KJmd0O8KgIMKgIMKgIMKgIMKgaGFzaCBhbGdvcml0aG06PGJyPgom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqBmcmllbmRseTogc2hhMjU2PGJyPgomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqB2YWx1ZTogMHhCPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBhdHRyaWJ1dGVzOjxicj4KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgZnJpZW5kbHk6IG93bmVyd3JpdGV8YXV0aHdyaXRlfG93bmVycmVh
ZHxhdXRocmVhZHx3cml0dGVuPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqB2YWx1ZTogMHg2MDAw
NjIwPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBzaXplOiAyMDQ4PGJyPgomZ3Q7IDxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyA2KUFmdGVyIG52d3JpdGUgaSB0
cmllZCB0byB1c2UgJnF1b3Q7dHBtMl9wY3JsaXN0JnF1b3Q7IGNvbW1hbmQgbGluZSB0b29sPGJy
PgomZ3Q7IGFwcGxpY2F0aW9uLCBieTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyB3aGljaCBpdCBz
aG93cyB0aGUgbnYgcmFtIG1lbW9yeSBsb2NhdGlvbiAsIHRyaWVkIHVzaW5nIHRwbTJfbnZyZWFk
ICgpPGJyPgomZ3Q7IHRvIHJlYWQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgdGhlIGNvbnRlbnQg
YnV0IGkgY291bGQgbm90IGFibGUgdG8gc2VlIGFueSBkYXRhIChyYW5kb20gbnVtYmVyKSB0aGF0
IGk8YnI+CiZndDsgdXNlZCB0bzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyB3cml0ZSB2aWEgdGhp
cyB0ZXN0IGFwcGxpY2F0aW9uIC4gZG9udCBrbm93IHdoeSA/PGJyPgomZ3Q7IDxicj4KJmd0O8Kg
IMKgIMKgIMKgdHBtMl9wY3JsaXN0IGlzIG5vdCBmb3IgTlZzLi4uLiB5b3Ugd2FudDo8YnI+CiZn
dDvCoCDCoCDCoCDCoHRwbTJfZ2V0Y2FwIGhhbmRsZXMtbnYtaW5kZXg8YnI+CiZndDsgPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDcpIEFmdGVyIGkgbWFu
dWFsbHkgcmFuIHRoZSBiZWxvdyBjbGVhciBBUEkgLCBub3cgdGhlIHRlc3QgY29kZSBpczxicj4K
Jmd0OyB3b3JraW5nIGZpbmU8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgKHJlZmVyIFRlc3QgY29k
ZSBsb2cgc2hvd24gYmVsb3cuLikuIFRoaXMgY29uZmlybXMgd2UgY2FuIHJlYWxsb2NhdGU8YnI+
CiZndDsgYWxyZWFkeTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBkZWZpbmVkIG52IHJhbSBtZW1v
cnkuPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICN0cG0yX252cmVsZWFzZSAteCAweDEwMDAwMDEg
LWEgMHg0MDAwMDAwMTxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoFRwbTJfY2xlYXIgd2ls
bCBjbGVhciB0aGUgb3duZXIgaGllcmFyY2h5LCBpbmNsdWRpbmcgTlYgcmFtIG9iamVjdHM8YnI+
CiZndDsgZGVjbGFyZWQgaW4gdGhhdCBoaWVyYXJjaHksPGJyPgomZ3Q7wqAgwqAgwqAgwqBzbyBk
ZWZpbmUgd2lsbCB3b3JrIGFnYWluLCBiZWNhdXNlIHlvdSBkZWxldGVkIGl0Ljxicj4KJmd0OyA8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgOClJZiBpIHRyeSB0byByZWFkIGl0IG1hbnVhbGx5IHZpYSBiZWxvdyB0
cG0yX252cmVhZCBjb21tYW5kIHdpdGg8YnI+CiZndDsgb2Zmc2V0PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IDB4MTAwMDAwMSBhbSBnZXR0aW5nIGJlbG93IGVycm9yPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICN0cG0yX252cmVhZCAteCAweDEwMDAwMDEg
LWEgMHg0MDAwMDAwMSAtbyAwIC1zIDIwPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEVSUk9SOiBG
YWlsZWQgdG8gcmVhZCBOVlJBTSBwdWJsaWMgYXJlYSBhdCBpbmRleCAweDEwMDAwMDE8YnI+CiZn
dDsgKDE2Nzc3MjE3KS48YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgRXJyb3I6MHgxOGI8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgRVJST1I6IFVuYWJsZSB0byBydW4gdHBtMl9udnJlYWQ8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgLyogVHJpZWQgdG8gdXNl
IGJlbG93IHRvb2xzIGNvbW1hbmQgLCBhbSBhbHdheXMgZ2V0dGluZyB0aGUgc2FtZTxicj4KJmd0
OyBlcnJvciBldmVuIGlmPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHdlIGdpdmUgdGhlIGRpZmZl
cmVudCBudnJhbSBvZmYgc2V0IHRwbTJfbnZ3cml0ZSAteCAweDFjMDAwMDI8YnI+CiZndDsgaGVs
bG93b3JsZDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBFUlJPUjogUmVhZGluZyB0aGUgcHVibGlj
IHBhcnQgb2YgdGhlIG52IGluZGV4IGZhaWxlZCB3aXRoOiAweDE4Yjxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0OyBFUlJPUjogVW5hYmxlIHRvIHJ1biB0cG0yX252d3JpdGU8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgdHBtMl9udndyaXRlIC14IDB4MWMwMDAx
MiAtYSAweDQwMDAwMDAxIGhlbGxvd29ybGQ8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgRVJST1I6
IFJlYWRpbmcgdGhlIHB1YmxpYyBwYXJ0IG9mIHRoZSBudiBpbmRleCBmYWlsZWQgd2l0aDogMHgx
OGI8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgRVJST1I6IFVuYWJsZSB0byBydW4gdHBtMl9udndy
aXRlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IC8qIFRyeSB0byByZWFkIHRoZSBudmxpc3Qgb2YgU0lNICwgaXQg
cmV0dXJucyBub3RoaW5nICEhITxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAjdHBtMl9udmxpc3Qg
Jmx0O3JldHVybnMgbm90aGluZyZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDsgQW55IHBvaW50cyB3aWxsIGJlIGdyZWF0IGhlbHAgZm9yIG1lLjxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS08YnI+CiZndDsgLS0tLS0tLS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRlc3QgY29kZSBsb2cgYWZ0ZXIg
YWJvdmUgJnF1b3Q7dHBtMl9udnJlbGVhc2UmcXVvdDs6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IEluaXRpYWxpemluZzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBpbml0X3JhbmQoKTxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0OyBpbml0X3JzYSgpPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGluaXRf
ZWNjKCk8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgRW5naW5lIG5hbWU6IFRQTTItVFNTIGVuZ2lu
ZSBmb3IgT3BlblNTTDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBJbml0IHJlc3VsdDogMTxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0OyBTZXR0aW5nIG93bmVyIGF1dGggdG8gZW1wdHkgYXV0aC48YnI+
CiZndDvCoCDCoCDCoCDCoCZndDsgU2V0dGluZyBwYXJlbnQgYXV0aCB0byBlbXB0eSBhdXRoLjxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBFUlJPUjp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aS1kZXZp
Y2UuYzo0NDA6VHNzMl9UY3RpX0RldmljZV9Jbml0KCkgRmFpbGVkPGJyPgomZ3Q7IHRvIG9wZW48
YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgZGV2aWNlIGZpbGUgL2Rldi90cG0wOiBObyBzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFdBUk5JTkc6dGN0aTpzcmMv
dHNzMi10Y3RpL3RjdGlsZHIuYzo2Mjp0Y3RpX2Zyb21faW5pdCgpIFRDVEkgaW5pdCBmb3I8YnI+
CiZndDsgZnVuY3Rpb248YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgMHg3ZmM2NzM3NmQxOGIgZmFp
bGVkIHdpdGggYTAwMGE8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgV0FSTklORzp0Y3RpOnNyYy90
c3MyLXRjdGkvdGN0aWxkci5jOjkyOnRjdGlfZnJvbV9pbmZvKCkgQ291bGQgbm90PGJyPgomZ3Q7
IGluaXRpYWxpemUgVENUSTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBuYW1lZDogdGN0aS1kZXZp
Y2U8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgRVJST1I6dGN0aTpzcmMvdHNzMi10Y3RpL3RjdGls
ZHItZGwuYzoxNTA6dGN0aV9mcm9tX2ZpbGUoKSBDb3VsZCBub3Q8YnI+CiZndDsgaW5pdGlhbGl6
ZSBUQ1RJPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGZpbGU6IGxpYnRzczItdGN0aS1kZWZhdWx0
LnNvPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgTm8gb2YgYnl0ZXMgd3JpdHRlbiBieSBHZW5S
YW5kb20gOiA2NDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0OyBiNmM5ZTFkMDI4ZjJj
ODkzYzU2YTA4OTE2NWY5ZjM4YzA5MjMyMTgwYmE1YmI2NmIzNWM1NjUyY2I1MWFiNjFiMjM3ZWNm
ZTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyA4ZWNlNWQ3ZjE0YTMzMjNmZWUxZGNhMGU2NDFhMGYy
MGM3Njg5MTAwZTNjODA0YjgyZDZhMjQ5N2Y8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgQ3JlYXRl
ZCBOViBJbmRleDogMHgxMDAwMDAxPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEVTWVNfVFI6IDB4
NDE4MzY3PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEVTWVNfVFIyOiAweDQxODM2ODxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0OyBXcml0aW5nIHRoZSByYW5kb20gbnVtYmVyIHdyaXR0ZW4gaW4gTlYg
UmFtPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IERhdGEgYnVmZmVyIHNpemUgdXNlZCB0byB3cml0
ZSBpbnRvIE5WUmFtOiA2NDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBSZWFkaW5nIHRoZSByYW5k
b20gbnVtYmVyIHdyaXR0ZW4gaW4gTlYgUmFtPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgom
Z3Q7IGI2YzllMWQwMjhmMmM4OTNjNTZhMDg5MTY1ZjlmMzhjMDkyMzIxODBiYTViYjY2YjM1YzU2
NTJjYjUxYWI2MWIyMzdlY2ZlPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDhlY2U1ZDdmMTRhMzMy
M2ZlZTFkY2EwZTY0MWEwZjIwYzc2ODkxMDBlM2M4MDRiODJkNmEyNDk3Zjxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0OyAqKiogU1VDQ0VTUyAqKio8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IFRFU1QgQ09ERSA6PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IGludCBudl93cml0ZV9yZWFkKCk8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgezxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
RVNZU19DT05URVhUICplY3R4ID0gTlVMTDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoEVTWVNfVFIgbnZfaW5kZXggPSAwOzxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgRVNZU19UUiBudl9pbmRleDIgPSAwOzxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIGludCBy
YyA9IDE7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAvKjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgICogY3JlYXRlIGEgY29ubmVjdGlvbiB0byB0aGUgVFBNIGxldHRpbmcgRVNB
UEkgY2hvb3NlIGhvdyB0byBnZXQ8YnI+CiZndDsgdGhlcmUuPGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgKiBJZiB5b3UgbmVlZCBtb3JlIGNvbnRyb2wsIHlvdSBjYW4gdXNlIHRj
dGkgYW5kIHRjdGktbGRyIGxpYnJhcmllcyB0bzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgICogZ2V0IGEgVENUSSBwb2ludGVyIHRvIHVzZSBmb3IgdGhlIHRjdGkgYXJndW1lbnQg
b2YgRXN5c19Jbml0aWFsaXplLjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgICov
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqByYyA9IEVzeXNfSW5pdGlhbGl6ZSgm
YW1wO2VjdHgsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBOVUxMLMKgIC8vIGxldCBpdCBmaW5kIHRoZSBUQ1RJPGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBOVUxMKTsgLy8gVXNl
IHdoYXRldmVyIEFCSTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgaWYgKHJjICE9
IFRTUzJfUkNfU1VDQ0VTUykgezxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcHJpbnRmKCZxdW90O0VzeXNfSW5pdGlhbGl6ZSBGYWlsZWQ6IDB4JXhcbiZxdW90
OywgcmMpOzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
dXJuIDE7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB9PGJyPgomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqByYyA9IEVzeXNfR2V0UmFuZG9tKGVjdHgsPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBFU1lTX1RSX05PTkUs
IEVTWVNfVFJfTk9ORSwgRVNZU19UUl9OT05FLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgNjQsICZhbXA7Ynl0ZXMpOzxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgaWYgKHJjICE9IFRTUzJfUkNfU1VDQ0VTUykg
ezxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRm
KCZxdW90O0VzeXNfR2V0UmFuZG9tIEZhaWxlZDogJXNcbiZxdW90OywgVHNzMl9SQ19EZWNvZGUo
cmMpKTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGV4
aXQoMSk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB9PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBwcmludGYoJnF1
b3Q7IE5vIG9mIGJ5dGVzIHdyaXR0ZW4gYnkgR2VuUmFuZG9tIDogJWRcbiZxdW90OyxieXRlcy0m
Z3Q7c2l6ZSk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBzaXplX3QgaTs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGZvciAoaSA9IDA7IGkgJmx0OyBieXRlcy0m
Z3Q7c2l6ZTsgaSsrKSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBwcmludGYoJnF1b3Q7JTAyeCZxdW90OywgYnl0ZXMtJmd0O2J1ZmZlcltpXSk7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB9PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7XG4mcXVvdDspOzxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
LyogYnVpbGQgYSB0ZW1wbGF0ZSBmb3IgdGhlIE5WIGluZGV4ICovPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBUUE0yQl9OVl9QVUJMSUMgcHViX3RlbXBsID0gezxicj4KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogdGhpcyBpcyBjb3VudGVyIGlu
dHVpdGl2ZSwgYnV0IGl0IHRlbGxzIHRoZSBUU1MyIGxpYnJhcnkgdG8gY2FsY3VsYXRlPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHRoaXMgZm9yIHVzICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuc2l6ZSA9IDAsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBUaGUgdGhpbmdzIHRoYXQgZGVmaW5lIHdoYXQgTlYg
aW5kZXggd2UgYXJlIGNyZWF0aW5nICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAubnZQdWJsaWMgPSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiB1c2VzIHNoYTI1NiB0byBpZGVudGlmeSB0
aGUgdHBtIG9iamVjdCBieSBuYW1lICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubmFtZUFsZyA9IFRQTTJfQUxHX1NIQTI1Niw8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8q
IGFsbG93cyB0aGUgb3duZXIgcGFzc3dvcmQgb3IgaW5kZXggcGFzc3dvcmQgci93PGJyPgomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IGFjY2VzcyAqLzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmF0dHJpYnV0ZXMgPSBUUE1BX05WX09XTkVSV1JJ
VEUgfDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgVFBNQV9OVl9PV05FUlJFQUTCoCDCoCDCoCDCoCDCoCDCoCB8PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBUUE1BX05WX0FVVEhXUklURcKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFRQTUFfTlZfQVVUSFJFQUQsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBjYW4gaG9sZCA2NCBieXRlcyBvZiBkYXRhICovPGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAu
ZGF0YVNpemUgPSA2NCw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoC8qIENyZWF0ZSBhdCBOViBJbmRleCAxIG9yIDB4MTAwMDAwMSAqLzxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Lm52SW5kZXggPSBUUE0yX0hSX05WX0lOREVYICsgMTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfSw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oH07PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAvKiBPaywgZGVmaW5lIHRoZSBzcGFjZSBhbmQg
c3RvcmUgdGhlIG52X2luZGV4IGZvciBmdXR1cmUgdXNlICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqByYyA9IEVzeXNfTlZfRGVmaW5lU3BhY2UoPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqBlY3R4LDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgRVNZU19UUl9SSF9PV05FUiwgLyogY3JlYXRlIGFuIE5WIGluZGV4
IGluIHRoZSBvd25lcjxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBoaWVyYXJjaHkgKi88YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJfUEFTU1dPUkQsIC8qIGF1
dGggYXMgdGhlIG93bmVyIHdpdGggYSBwYXNzd29yZCw8YnI+CiZndDsgd2hpY2ggaXM8YnI+CiZn
dDvCoCDCoCDCoCDCoCZndDsgZW1wdHkgKi88YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCDCoEVTWVNfVFJfTk9ORSw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCDCoEVTWVNfVFJfTk9ORSw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCDCoE5VTEwsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAmYW1wO3B1
Yl90ZW1wbCw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCZhbXA7bnZf
aW5kZXgpOzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgaWYgKHJjICE9IFRTUzJf
UkNfU1VDQ0VTUykgezxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcHJpbnRmKCZxdW90O0VzeXNfTlZfRGVmaW5lU3BhY2UgRmFpbGVkOiAweCV4XG4mcXVvdDss
IHJjKTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8g
b3V0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgfTxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgLyogTm90ZSBpZiB5b3Ug
bmVlZCB0byBzZXQgdGhlIG93bmVyIGhpZXJhcmNoeSBhdXRoIHZhbHVlIHlvdSB1c2U6PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgKiBUU1MyX1JDIEVzeXNfVFJfU2V0QXV0aCg8
YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCAqwqAgwqAgwqBFU1lTX0NPTlRFWFQg
KmVzeXNDb250ZXh0LDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgICrCoCDC
oCDCoEVTWVNfVFIgaGFuZGxlLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
ICrCoCDCoCDCoFRQTTJCX0FVVEggY29uc3QgKmF1dGhWYWx1ZSk7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgKi88YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtDcmVhdGVkIE5WIEluZGV4OiAweCV4
XG4mcXVvdDssIHB1Yl90ZW1wbC5udlB1YmxpYy5udkluZGV4KTs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtFU1lTX1RSOiAweCV4XG4mcXVvdDssIG52X2lu
ZGV4KTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoC8qPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgKiBOb3RlOiBpZiB3
ZSBuZWVkIHRvIGNvbnZlcnQgdGhlIG52SW5kZXggaW50byBhbiBFU1lTX1RSLCB0aGU8YnI+CiZn
dDsgYmVsb3c8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgd2lsbDxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgICogZG8gaXQuIEl0cyBub3QgcmVxdWlyZWQgZm9yIHRoaXMgY2FzZSwg
c2luY2UgRXN5c19OVl9EZWZpbmUgZ2l2ZXMgdXM8YnI+CiZndDsgYW48YnI+CiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCAqIEVTWVNfVFIuPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgKi88YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHJjID0gRXN5c19U
Ul9Gcm9tVFBNUHVibGljKDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZWN0eCw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oFRQTTJfSFJfTlZfSU5ERVggKyAxLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgRVNZU19UUl9OT05FLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgRVNZU19UUl9OT05FLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgRVNZU19UUl9OT05FLDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmFtcDtudl9pbmRleDIpOzxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgaWYgKHJjICE9IFRTUzJfUkNfU1VDQ0VTUykgezxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRmKCZxdW90O0VzeXNfVFJfRnJv
bVRQTVB1YmxpYyBGYWlsZWQ6IDB4JXhcbiZxdW90OywgcmMpOzxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBvdXQ7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqB9PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7RVNZU19UUjI6IDB4JXhcbiZxdW90OywgbnZf
aW5kZXgyKTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoC8qIGNvcHkgc29tZSBkYXRhIGludG8gYSBidWZmZXIgdG8gc2VuZCB0byB0aGUg
VFBNICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBUUE0yQl9NQVhfTlZfQlVG
RkVSIHdyaXRlX2RhdGEgPSB7IDAgfTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oG1lbWNweSh3cml0ZV9kYXRhLmJ1ZmZlciwgYnl0ZXMtJmd0O2J1ZmZlciwgYnl0ZXMtJmd0O3Np
emUpOzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgd3JpdGVfZGF0YS5zaXplID0g
Ynl0ZXMtJmd0O3NpemU7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7V3JpdGluZyB0aGUgcmFuZG9tIG51bWJlciB3
cml0dGVuIGluIE5WIFJhbVxuJnF1b3Q7KTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoHByaW50ZigmcXVvdDtEYXRhIGJ1ZmZlciBzaXplIHVzZWQgdG8gd3JpdGUgaW50byBOVlJh
bTo8YnI+CiZndDvCoCDCoCDCoCDCoCZndDsgJWRcbiZxdW90Oyx3cml0ZV9kYXRhLnNpemUpOzxi
cj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgLyo8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCAqIFdyaXRlIHRoZSBkYXRhIHRvIHRoZSBUUE0gTlYgaW5kZXggYXQgb2Zm
c2V0IDA8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCAqLzxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgcmMgPSBFc3lzX05WX1dyaXRlKDxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgZWN0eCw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCDCoG52X2luZGV4LCAvKiBhdXRoZW50aWNhdGUgdG8gdGhlIE5WIGluZGV4IHVz
aW5nIHRoZSBOViBpbmRleDxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBwYXNzd29yZCAqLzxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgbnZfaW5kZXgsIC8qIHRoZSBudiBp
bmRleCB0byB3cml0ZSB0byAqLzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgRVNZU19UUl9QQVNTV09SRCw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoEVTWVNfVFJfTk9ORSw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoEVTWVNfVFJfTk9ORSw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCDCoCZhbXA7d3JpdGVfZGF0YSw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCDCoDApOzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgaWYgKHJjICE9
IFRTUzJfUkNfU1VDQ0VTUykgezxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcHJpbnRmKCZxdW90O0VzeXNfTlZfV3JpdGUgRmFpbGVkOiAweCV4XG4mcXVvdDss
IHJjKTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8g
b3V0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgfTxicj4KJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgLyogUmVhZCB0aGUgZGF0
YSBiYWNrLCBhbmQganVzdCBmb3IgZnVuLCB3ZSB3aWxsIHVzZSBudl9pbmRleDI8YnI+CiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCAqIHRvIHByb3ZlIGl0JiMzOTtzIHBvaW50aW5nIHRv
IHRoZSBzYW1lIE5WIGxvY2F0aW9uIGluIHRoZSBUUE0uPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgKi88YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFRQTTJCX01B
WF9OVl9CVUZGRVIgKnJlYWRfZGF0YSA9IE5VTEw7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqByYyA9IEVzeXNfTlZfUmVhZCg8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCDCoGVjdHgsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqBu
dl9pbmRleDIsIC8qIGF1dGhlbnRpY2F0ZSB0byB0aGUgTlYgaW5kZXggdXNpbmcgdGhlIE5WIGlu
ZGV4PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHBhc3N3b3JkICovPGJyPgomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqBudl9pbmRleDIsIC8qIHRoZSBudiBpbmRleCB0byByZWFk
IGZyb20gKi88YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJf
UEFTU1dPUkQsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqBFU1lTX1RS
X05PTkUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqBFU1lTX1RSX05P
TkUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqBieXRlcy0mZ3Q7c2l6
ZSw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoDAsPGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAmYW1wO3JlYWRfZGF0YSk7PGJyPgomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBpZiAocmMgIT0gVFNTMl9SQ19TVUNDRVNTKSB7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7RXN5
c19OVl9SZWFkIEZhaWxlZDogMHgleFxuJnF1b3Q7LCByYyk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIG91dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoH08YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoC8qIFByaW50IHRoaW5ncyBhcyBhIHN0cmluZyBmcm9tIHRoZSBUUE0g
Y2FyZWZ1bGx5ITxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgICogSW5qZWN0ZWQg
dHJhZmZpYyB2aWEgTUlUTSBtZWFucyB0aGF0IHlvdSBjYW5ub3QgdHJ1c3QgdGhpczxicj4KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgICogdG8gYmUgbnVsbCB0ZXJtaW5hdGVkLjxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7UmVhZGluZyB0aGUgcmFuZG9tIG51bWJlciB3cml0dGVu
IGluIE5WIFJhbVxuJnF1b3Q7KTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGZv
ciAoaSA9IDA7IGkgJmx0OyByZWFkX2RhdGEtJmd0O3NpemU7IGkrKykgezxicj4KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRmKCZxdW90OyUwMngmcXVvdDss
IHJlYWRfZGF0YS0mZ3Q7YnVmZmVyW2ldKTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoH08YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtcbiZx
dW90Oyk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqBFc3lzX0ZyZWUocmVhZF9kYXRhKTs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoHJjID0gMDs8YnI+CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+CiZndDvCoCDCoCDCoCDC
oCZndDsgb3V0Ojxicj4KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgLyogcmVtb3ZlIHRoZSBOViBzcGFjZSAqLzxicj4KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgaWYgKG52X2luZGV4KSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpbnQgcmMyID0gRXN5c19OVl9VbmRlZmluZVNwYWNlKDxicj4K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWN0
eCw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoEVTWVNfVFJfUkhfT1dORVIsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBudl9pbmRleCw8YnI+CiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJfUEFTU1dPUkQsPGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBFU1lT
X1RSX05PTkUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBFU1lTX1RSX05PTkUpOzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaWYgKHJjMiAhPSBUU1MyX1JDX1NVQ0NFU1MpIHs8YnI+CiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHByaW50ZigmcXVv
dDtFc3lzX05WX1VuZGVmaW5lU3BhY2UgRmFpbGVkOiAweCV4XG4mcXVvdDssIHJjMik7PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByYyA9
IDE7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPgom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB9PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBFc3lzX0ZpbmFsaXplKCZhbXA7ZWN0eCk7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqBwcmludGYoJnF1b3Q7RXhpdCBmcm9tIG52X3dyaXRlX3JlYWQoKVxuJnF1b3Q7KTs8YnI+
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHJldHVybiByYzs8YnI+CiZndDvCoCDCoCDC
oCDCoCZndDsgfTxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyB0cG0yIG1h
aWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4m
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnRwbTItIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi08L2E+PGJyPgomZ3Q7IDxhIGhyZWY9Im1haWx0
bzpsZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj5sZWF2ZUBsaXN0cy4wMS5vcmc8
L2E+Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8l
KGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KJmd0OyA8YnI+Cjxicj4KPC9ibG9ja3F1
b3RlPjwvZGl2Pgo=

--===============5093969115944267638==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="test_nv_read.c"

I2luY2x1ZGUgPG9wZW5zc2wvY29uZi5oPgojaW5jbHVkZSA8b3BlbnNzbC9ldnAuaD4KI2luY2x1
ZGUgPG9wZW5zc2wvZXJyLmg+CiNpbmNsdWRlIDxvcGVuc3NsL3BlbS5oPgojaW5jbHVkZSA8b3Bl
bnNzbC9yYW5kLmg+CiNpbmNsdWRlIDxvcGVuc3NsL3JzYS5oPgojaW5jbHVkZSA8b3BlbnNzbC9l
bmdpbmUuaD4KI2luY2x1ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8YXNzZXJ0Lmg+CiNpbmNsdWRl
IDx0c3MyL3RzczJfbXUuaD4KI2luY2x1ZGUgPHRzczIvdHNzMl9lc3lzLmg+CiNpbmNsdWRlIDx0
cG0yLXRzcy1lbmdpbmUuaD4KI2luY2x1ZGUgPHRzczIvdHNzMl90Y3RpLmg+CiNpbmNsdWRlIDxz
dGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KCiNkZWZpbmUg
RVJSIHByaW50ZgpFU1lTX1RSIGF1dGhIYW5kbGUgPSAweDQwMDAwMDAxOwoKc3RydWN0IG9wdG4g
ewogICAgY29uc3QgY2hhciAqZmlsZW5hbWU7IC8qYWRkZWQgY29uc3QgZm9yIHRwbXJlYWQqLwog
ICAgY2hhciAqcm5kX2ZpbGVuYW1lOwoKICAgIFRQTUlfQUxHX1BVQkxJQyBhbGc7CiAgICBUUE1J
X0VDQ19DVVJWRSBjdXJ2ZTsKICAgIGludCBleHBvbmVudDsKICAgIGNoYXIgKm93bmVycHc7CiAg
ICBjaGFyICpwYXNzd29yZDsKICAgIFRQTTJfSEFORExFIHBhcmVudDsKICAgIGNoYXIgKnBhcmVu
dHB3OwogICAgaW50IGtleXNpemU7CiAgICBpbnQgdmVyYm9zZTsKfW9wdDsKClRQTTJCX05WX1BV
QkxJQyBwdWJfdGVtcGwgPSB7Ci8qIHRoaXMgaXMgY291bnRlciBpbnR1aXRpdmUsIGJ1dCBpdCB0
ZWxscyB0aGUgVFNTMiBsaWJyYXJ5IHRvIGNhbGN1bGF0ZSB0aGlzIGZvciB1cyAqLwogICAgICAg
IC5zaXplID0gMCwKICAgICAgICAvKiBUaGUgdGhpbmdzIHRoYXQgZGVmaW5lIHdoYXQgTlYgaW5k
ZXggd2UgYXJlIGNyZWF0aW5nICovCiAgICAgICAgLm52UHVibGljID0gewogICAgICAgICAgICAg
ICAgLyogdXNlcyBzaGEyNTYgdG8gaWRlbnRpZnkgdGhlIHRwbSBvYmplY3QgYnkgbmFtZSAqLwog
ICAgICAgICAgICAgICAgLm5hbWVBbGcgPSBUUE0yX0FMR19TSEEyNTYsCiAgICAgICAgICAgICAg
ICAvKiBhbGxvd3MgdGhlIG93bmVyIHBhc3N3b3JkIG9yIGluZGV4IHBhc3N3b3JkIHIvdyBhY2Nl
c3MgKi8KICAgICAgICAgICAgICAgIC5hdHRyaWJ1dGVzID0gVFBNQV9OVl9PV05FUldSSVRFIHwK
ICAgICAgICAgICAgICAgICAgICAgICAgVFBNQV9OVl9PV05FUlJFQUQgICAgICAgIHwKICAgICAg
ICAgICAgICAgICAgICAgICAgVFBNQV9OVl9BVVRIV1JJVEUgICAgICAgIHwKICAgICAgICAgICAg
ICAgICAgICAgICAgVFBNQV9OVl9BVVRIUkVBRCwKICAgICAgICAgICAgICAgIC8qIGNhbiBob2xk
IDY0IGJ5dGVzIG9mIGRhdGEgKi8KICAgICAgICAgICAgICAgIC5kYXRhU2l6ZSA9IDY0LAogICAg
ICAgICAgICAgICAgLyogQ3JlYXRlIGF0IE5WIEluZGV4IDEgb3IgMHgxMDAwMDAxICovCiAgICAg
ICAgICAgICAgICAubnZJbmRleCA9IFRQTTJfSFJfTlZfSU5ERVggKyAxCiAgICAgICAgfSwKfTsK
ClRQTTJCX0RJR0VTVCAqZ2V0X3JhbmRudW0oRVNZU19DT05URVhUICplY3R4ICwgVFBNMkJfRElH
RVNUICpyYW5kX2J5dGVzKTsgCkVTWVNfVFIgZGVmaW5lX252cmFtKEVTWVNfQ09OVEVYVCAqZWN0
eCAsIEVTWVNfVFIgbnZfaW5kZXgpOwoKVFBNMl9EQVRBICp0cG0yRGF0YSA9IE5VTEw7ClJTQSAq
cnNhID0gTlVMTDsKRVNZU19DT05URVhUICplY3R4PU5VTEw7ClRQTTJCX0RJR0VTVCAqcmFuZF9i
eXRlcyA9IE5VTEw7ClRQTTJCX0RJR0VTVCAqcmFuZF9ieXRlc19idWZmZXIgPSBOVUxMOwpUUE0y
Ql9ESUdFU1QgKmRhdGEgPSBOVUxMOwpFU1lTX1RSIG52X2luZGV4ID0gMDsKRVNZU19UUiBzdF9p
bmRleCA9IDA7CkVTWVNfVFIgZnJvbV9pbmRleCA9IDA7CkVTWVNfVFIgYmFzZV9pbmRleCA9IDA7
CkVTWVNfVFIgbnZfaW5kZXgyID0gMDsKVFBNMkJfTUFYX05WX0JVRkZFUiAqcmVhZF9idWZmID0g
TlVMTDsKVFBNMkJfTUFYX05WX0JVRkZFUiB3cml0ZV9kYXRhID0geyAwIH0gOwppbnQgbnZfcmVh
ZChFU1lTX0NPTlRFWFQgKmVjdHgsVFBNMkJfRElHRVNUICpieXRlc190b19yZWFkLCBUUE0yQl9N
QVhfTlZfQlVGRkVSICpyZWFkX2J1ZmYpOwpUUE0yQl9NQVhfTlZfQlVGRkVSIG52X3dyaXRlKEVT
WVNfQ09OVEVYVCAqZWN0eCAsIFRQTTJCX0RJR0VTVCAqcmFuZF9ieXRlcyAsIEVTWVNfVFIgZnJv
bV9pbmRleCk7CgppbnQgbWFpbih2b2lkKQp7ICAKCiAgICBFVlBfUEtFWSAqdHBtX2V2cF9wa2V5
PU5VTEw7CiAgICAKICAgIC8qIHNldCB0aGUgZGVmYXVsdCB2YWx1ZXMgKi8KICAgIG9wdC5maWxl
bmFtZSA9ICIuL3ByaXZfa2V5XzIwNDgiOwogICAgb3B0LmFsZyA9IFRQTTJfQUxHX1JTQTsKICAg
IG9wdC5jdXJ2ZSA9IFRQTTJfRUNDX05JU1RfUDI1NjsKICAgIG9wdC5leHBvbmVudCA9IDY1NTM3
OwogICAgb3B0Lm93bmVycHcgPSBOVUxMOwogICAgb3B0LnBhc3N3b3JkID0gTlVMTDsKICAgIG9w
dC5wYXJlbnQgPSAwOwogICAgb3B0LnBhcmVudHB3ID0gTlVMTDsKICAgIG9wdC5rZXlzaXplID0g
MjA0ODsKICAgIG9wdC52ZXJib3NlID0gMDsKICAgIEZJTEUgKmZwdHI7CgogICAgLyogSW5pdGlh
bGl6ZSB0aGUgdHBtMi10c3MgZW5naW5lICovCiAgICBFTkdJTkVfbG9hZF9keW5hbWljKCk7Cgog
ICAgLyogT3BlbnNzbCAxLjEuMCByZXF1aXJlcyB0aGUgbGliLXByZWZpeCBmb3IgdGhlIGVuZ2lu
ZV9pZCAqLwogICAgRU5HSU5FICp0cG1fZW5naW5lID0gRU5HSU5FX2J5X2lkKCJ0cG0ydHNzIik7
CiAgICBpZiAoIXRwbV9lbmdpbmUpCiAgICAgICAgdHBtX2VuZ2luZSA9IEVOR0lORV9ieV9pZCgi
bGlidHBtMnRzcyIpOwogICAgaWYgKHRwbV9lbmdpbmUgPT0gTlVMTCkgewogICAgICAgIEVSUigi
Q291bGQgbm90IGxvYWQgdHBtMnRzcyBlbmdpbmVcbiIpOwogICAgICAgIHJldHVybiAxOwogICAg
fQoKICAgIGludCBpbml0X3JlcyA9IEVOR0lORV9pbml0KHRwbV9lbmdpbmUpOwogICAgcHJpbnRm
KCJFbmdpbmUgbmFtZTogJXNcbkluaXQgcmVzdWx0OiAlZCBcbiIsIEVOR0lORV9nZXRfbmFtZSh0
cG1fZW5naW5lKSwKICAgICAgICAgaW5pdF9yZXMpOwogICAgaWYgKCFpbml0X3JlcykKICAgICAg
ICByZXR1cm4gMTsKCiAgICBpZiAoIUVOR0lORV9jdHJsKHRwbV9lbmdpbmUsIFRQTTJUU1NfU0VU
X09XTkVSQVVUSCwgMCwgb3B0Lm93bmVycHcsIE5VTEwpKSB7CiAgICAgICAgRVJSKCJDb3VsZCBu
b3Qgc2V0IG93bmVyYXV0aFxuIik7CiAgICAgICAgcmV0dXJuIDE7CiAgICB9CgogICAgaWYgKCFF
TkdJTkVfY3RybCh0cG1fZW5naW5lLCBUUE0yVFNTX1NFVF9QQVJFTlRBVVRILCAwLCBvcHQucGFy
ZW50cHcsIE5VTEwpKSB7CiAgICAgICAgRVJSKCJDb3VsZCBub3Qgc2V0IHBhcmVudGF1dGhcbiIp
OwogICAgICAgIHJldHVybiAxOwogICAgfQoKI2lmIDAgCiAgICAvKiBEZWZpbmluZyBOVlJBTSAq
LwogICAgcHJpbnRmKCJEZWZpbmluZyBOVlJBTSBzcGFjZSB0byBzdG9yZSByYW5kb21udW1cbiIp
OwogICAgYmFzZV9pbmRleCA9IGRlZmluZV9udnJhbShlY3R4LCBzdF9pbmRleCk7CiNlbmRpZgog
ICAgCiAgICAvKiBSZWFkaW5nIGFscmVhZHkgc3RvcmVkIGRhdGEgZnJvbSBOVlJBTSovCiAgICBw
cmludGYoIlJFQUQgUmFuZG9tTnVtYmVyIGZyb20gTlZSQU0gZnJvbSBvZmZzZXQgMHgxMDAwMDAx
XG4iKTsKICAgIG52X3JlYWQoZWN0eCxyYW5kX2J5dGVzLHJlYWRfYnVmZik7CgogICAgRXN5c19G
aW5hbGl6ZSgmZWN0eCk7CiAgICBwcmludGYoIioqKiBOVldyaXRlICYgTlZSZWFkQ29tcGxldGVk
ICEhISoqKlxuIik7CiAgICByZXR1cm4gMDsKfQoKLyoKICpSZWFkIHRoZSByYW5kb20gbnVtYmVy
IGRhdGEgYWxyZWFkeSBzdG9yZWQgZnJvbSBOVlJBTQogKgogKi8KaW50IG52X3JlYWQoRVNZU19D
T05URVhUICplY3R4LFRQTTJCX0RJR0VTVCAqYnl0ZXNfdG9fcmVhZCwgVFBNMkJfTUFYX05WX0JV
RkZFUiAqcmVhZF9idWZmKQp7CiAgICBwcmludGYoIkluc2lkZSBudl9yZWFkKClcbiIpOwogICAg
aW50IHJjICwgaTsKICAgIAogICAgcHJpbnRmKCJDcmVhdGVkIE5WIEluZGV4OiAweCV4XG4iLCBw
dWJfdGVtcGwubnZQdWJsaWMubnZJbmRleCk7CiAgICBwcmludGYoIkVTWVNfVFI6IDB4JXhcbiIs
IG52X2luZGV4KTsKICAgIC8vaWYobnZfaW5kZXggPT0gTlVMTCkKICAgIGlmKHB1Yl90ZW1wbC5u
dlB1YmxpYy5udkluZGV4ICE9IE5VTEwpCiAgICB7CgkgICAgICAgIHJjID0gRXN5c19Jbml0aWFs
aXplKCZlY3R4LAogICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCAgLy8gbGV0IGl0IGZpbmQg
dGhlIFRDVEkKICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7IC8vIFVzZSB3aGF0ZXZlciBB
QkkKICAgICAgICAgICAgICAgIGlmIChyYyAhPSBUU1MyX1JDX1NVQ0NFU1MpIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgLy9mcHJpbnRmKHN0ZGVyciwgIkVzeXNfSW5pdGlhbGl6ZTogMHgleFxu
IiwgcmMpOwogICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIkVzeXNfSW5pdGlhbGl6ZSBG
YWlsZWQgYW5kIGl0cyBhc3NvY2lhdGVkIGVycm9yIGNvZGU6IDB4JXhcbiIsIHJjKTsKICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7CiAgICAgICAgICAgICAgICB9CiNpZiAxCiAgICAg
ICAgICAgICAgICAvKgogICAgICAgICAgICAgICAgKiBOb3RlOiBpZiB3ZSBuZWVkIHRvIGNvbnZl
cnQgdGhlIG52SW5kZXggaW50byBhbiBFU1lTX1RSLCB0aGUgYmVsb3cgd2lsbAogICAgICAgICAg
ICAgICAgKiBkbyBpdC4gSXQgbWF5IG5vdCByZXF1aXJlZCBmb3IgdGhpcyBjYXNlLCBzaW5jZSBF
c3lzX05WX0RlZmluZSBnaXZlcyB1cyBhbgogICAgICAgICAgICAgICAgKiBFU1lTX1RSLgogICAg
ICAgICAgICAgICAgKi8KICAgICAgICAgICAgICAgIHJjID0gRXN5c19UUl9Gcm9tVFBNUHVibGlj
KAogICAgICAgICAgICAgICAgICAgICAgICBlY3R4LAogICAgICAgICAgICAgICAgICAgICAgICBU
UE0yX0hSX05WX0lOREVYICsgMSwKICAgICAgICAgICAgICAgICAgICAgICAgRVNZU19UUl9OT05F
LAogICAgICAgICAgICAgICAgICAgICAgICBFU1lTX1RSX05PTkUsCiAgICAgICAgICAgICAgICAg
ICAgICAgIEVTWVNfVFJfTk9ORSwKICAgICAgICAgICAgICAgICAgICAgICAgJm52X2luZGV4Mik7
CgogICAgICAgICAgICAgICAgaWYgKHJjICE9IFRTUzJfUkNfU1VDQ0VTUykgewogICAgICAgICAg
ICAgICAgICAgICAgICBwcmludGYoIkVzeXNfVFJfRnJvbVRQTVB1YmxpYzogMHgleFxuIiwgcmMp
OwogICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgICAgIH0KCiAg
ICAgICAgICAgICAgICBwcmludGYoIkVTWVNfVFIyOiAweCV4XG4iLCBudl9pbmRleDIpOwojZW5k
aWYgIAogICAgICAgICAgICAgICAgVFBNMkJfTUFYX05WX0JVRkZFUiAqcmVhZF9kYXRhID0gTlVM
TDsKICAgICAgICAgICAgICAgIHJjID0gRXN5c19OVl9SZWFkKAogICAgICAgICAgICAgICAgZWN0
eCwKCQlhdXRoSGFuZGxlLAogICAgICAgICAgICAgICAgLy9udl9pbmRleDIsIC8qIGF1dGhlbnRp
Y2F0ZSB0byB0aGUgTlYgaW5kZXggdXNpbmcgdGhlIE5WIGluZGV4IHBhc3N3b3JkICovCiAgICAg
ICAgICAgICAgICBudl9pbmRleDIsIC8qIHRoZSBudiBpbmRleCB0byByZWFkIGZyb20gKi8KICAg
ICAgICAgICAgICAgIEVTWVNfVFJfUEFTU1dPUkQsCiAgICAgICAgICAgICAgICBFU1lTX1RSX05P
TkUsCiAgICAgICAgICAgICAgICBFU1lTX1RSX05PTkUsCgkJMjAsCiAgICAgICAgICAgICAgICAv
L2J5dGVzX3RvX3JlYWQtPnNpemUsCiAgICAgICAgICAgICAgICAwLAogICAgICAgICAgICAgICAg
JnJlYWRfZGF0YSk7CiAgICAgICAgICAgICAgICBpZiAocmMgIT0gVFNTMl9SQ19TVUNDRVNTKSB7
CiAgICAgICAgICAgICAgICAgICAgICAgIHByaW50ZigiRXN5c19OVl9SZWFkIDxFUlJPUj46IDB4
JXhcbiIsIHJjKTsKICAgICAgICAgICAgICAgIAlnb3RvIG91dDsKCQl9CgogICAgICAgICAgICAg
ICAgLyogUHJpbnQgdGhpbmdzIGFzIGEgc3RyaW5nIGZyb20gdGhlIFRQTSBjYXJlZnVsbHkhCiAg
ICAgICAgICAgICAgICAqIEluamVjdGVkIHRyYWZmaWMgdmlhIE1JVE0gbWVhbnMgdGhhdCB5b3Ug
Y2Fubm90IHRydXN0IHRoaXMKICAgICAgICAgICAgICAgICogdG8gYmUgbnVsbCB0ZXJtaW5hdGVk
LgogICAgICAgICAgICAgICAgKi8KCiAgICAgICAgICAgICAgICBwcmludGYoIiBObyBvZiBieXRl
cyhSYW5kb20gbnVtYmVyKSByZWFkIGZyb20gTlZSQU0gOiAlZFxuIixyZWFkX2J1ZmYtPnNpemUp
OwogICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IDEwOyBpKyspIHsKICAgICAgICAgICAg
ICAgICAgICAgICAgcHJpbnRmKCIlMDJ4IiwgcmVhZF9kYXRhLT5idWZmZXJbaV0pOwogICAgICAg
ICAgICAgICAgfQogICAgICAgICAgICAgICAgcHJpbnRmKCJcbiIpOwogICAgfQogICAgZWxzZQog
ICAgewoJcHJpbnRmKCJObyBkYXRhIGF2YWlhYmxlIGluIHRoaXMgTlZSQU0gb2Zmc2V0IChpbmRl
eCkgb3gleFxuIixwdWJfdGVtcGwubnZQdWJsaWMubnZJbmRleCk7CiAgICB9CgoJRXN5c19GcmVl
KHJlYWRfYnVmZik7CgpvdXQgOgoJLyogQ2xlYXJpbmcgRVNZUyBhdCB0aGUgZW5kIG9mIE5WUkVB
RCAsIG5lZWQgdG8gY2hlY2sgd2hldGhlciBpdCBpcyB0aGUgcmlnaHQgcGxhY2UgZG8gaXRcbik7
ICovCiAgICAgICAgRXN5c19GaW5hbGl6ZSgmZWN0eCk7CgogICAgICAgIHByaW50ZigiRXhpdCBm
cm9tIG52X3JlYWQoKVxuIik7CglyZXR1cm4gMDsKfQoKLyoKICoKICpEZWZpbmUgTlZSQU0gc3Bh
Y2UgdG8gc3RvcmUgdGhlIHJhbmRvbSBudW1iZXIgZ2VuZXJhdGVkIHVzaW5nIHRwbQogKgogKi8K
RVNZU19UUiBkZWZpbmVfbnZyYW0oRVNZU19DT05URVhUICplY3R4ICwgRVNZU19UUiBudl9pbmRl
eCkKewogICAgICAgICAgICAgICAKCQlwcmludGYoIkluc2lkZSBkZWZpbmVfbnZyYW0oKSB0byBk
ZWZpbmUgU3BhY2UgaW4gTlZSQU0gYW5kIHRvIHN0b3JlIHRoZSBSYW5kb20gTnVtYmVyIGludG8g
aXRcbiIpOwoJCWludCByYyA9IDE7CgoJCXJjID0gRXN5c19Jbml0aWFsaXplKCZlY3R4LAogICAg
ICAgICAgICAgICAgICAgICAgICBOVUxMLCAgLy8gbGV0IGl0IGZpbmQgdGhlIFRDVEkgCiAgICAg
ICAgICAgICAgICAgICAgICAgIE5VTEwpOyAvLyBVc2Ugd2hhdGV2ZXIgQUJJIAogICAgICAgICAg
ICAgICAgaWYgKHJjICE9IFRTUzJfUkNfU1VDQ0VTUykgewogICAgICAgICAgICAgICAgICAgICAg
ICBwcmludGYoIkVzeXNfSW5pdGlhbGl6ZSBGYWlsZWQgYW5kIGl0cyBhc3NvY2lhdGVkIGVycm9y
IGNvZGU6IDB4JXhcbiIsIHJjKTsKICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7CiAg
ICAgICAgICAgICAgICB9CiNpZiAxCgkJLyogYnVpbGQgYSB0ZW1wbGF0ZSBmb3IgdGhlIE5WIGlu
ZGV4ICovCiAgICAgICAgICAgICAgICBUUE0yQl9OVl9QVUJMSUMgcHViX3RlbXBsID0gewogICAg
ICAgICAgICAgICAgLyp0aGlzIGlzIGNvdW50ZXIgaW50dWl0aXZlLCBidXQgaXQgdGVsbHMgdGhl
IFRTUzIgbGlicmFyeSB0byBjYWxjdWxhdGUgdGhpcyBmb3IgdXMgKi8KICAgICAgICAgICAgICAg
ICAgICAgICAgLnNpemUgPSAwLAogICAgICAgICAgICAgICAgICAgICAgICAvKiBUaGUgdGhpbmdz
IHRoYXQgZGVmaW5lIHdoYXQgTlYgaW5kZXggd2UgYXJlIGNyZWF0aW5nICovCiAgICAgICAgICAg
ICAgICAgICAgICAgIC5udlB1YmxpYyA9IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKiB1c2VzIHNoYTI1NiB0byBpZGVudGlmeSB0aGUgdHBtIG9iamVjdCBieSBuYW1lICovCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLm5hbWVBbGcgPSBUUE0yX0FMR19TSEEyNTYs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogYWxsb3dzIHRoZSBvd25lciBwYXNz
d29yZCBvciBpbmRleCBwYXNzd29yZCByL3cgYWNjZXNzICovCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLmF0dHJpYnV0ZXMgPSBUUE1BX05WX09XTkVSV1JJVEUgfAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFBNQV9OVl9PV05FUlJFQUQgICAgICAgIHwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRQTUFfTlZfQVVUSFdSSVRF
ICAgICAgICB8CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUUE1BX05W
X0FVVEhSRUFELAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIGNhbiBob2xkIDY0
IGJ5dGVzIG9mIGRhdGEgKi8KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuZGF0YVNp
emUgPSA2NCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBDcmVhdGUgYXQgTlYg
SW5kZXggMSBvciAweDEwMDAwMDEgKi8KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAu
bnZJbmRleCA9IFRQTTJfSFJfTlZfSU5ERVggKyAxCiAgICAgICAgICAgICAgICAgICAgICAgIH0s
CiAgICAgICAgICAgICAgICB9OwojZW5kaWYKI2lmIDAKICAgICAgICAgICAgICAgIC8qRGVmaW5l
IHRoZSBzcGFjZSBhbmQgc3RvcmUgdGhlIG52X2luZGV4IGZvciBkYXRhIHN0b3JhZ2UgKi8KICAg
ICAgICAgICAgICAgIHJjID0gRXN5c19OVl9EZWZpbmVTcGFjZSgKICAgICAgICAgICAgICAgICAg
ICAgICAgZWN0eCwKICAgICAgICAgICAgICAgICAgICAgICAgRVNZU19UUl9SSF9PV05FUiwgLyog
Y3JlYXRlIGFuIE5WIGluZGV4IGluIHRoZSBvd25lciBoaWVyYXJjaHkgKi8KICAgICAgICAgICAg
ICAgICAgICAgICAgRVNZU19UUl9QQVNTV09SRCwgLyogYXV0aCBhcyB0aGUgb3duZXIgd2l0aCBh
IHBhc3N3b3JkLCB3aGljaCBpcyBlbXB0eSAqLwogICAgICAgICAgICAgICAgICAgICAgICBFU1lT
X1RSX05PTkUsCiAgICAgICAgICAgICAgICAgICAgICAgIEVTWVNfVFJfTk9ORSwKICAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTCwKICAgICAgICAgICAgICAgICAgICAgICAgJnB1Yl90ZW1wbCwK
ICAgICAgICAgICAgICAgICAgICAgICAgJm52X2luZGV4KTsKCiAgICAgICAgICAgICAgICBpZiAo
cmMgIT0gVFNTMl9SQ19TVUNDRVNTKSB7CiAgICAgICAgICAgICAgICAgICAgICAgIHByaW50Zigi
RXN5c19OVl9EZWZpbmVTcGFjZSBGQUlMRUQ6IDB4JXhcbiIsIHJjKTsKICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byBvdXQ7CiAgICAgICAgICAgICAgICB9CiNlbmRpZgogICAgICAgICAgICAg
ICAgLyogTm90ZSBpZiB3ZSBuZWVkIHRvIHNldCB0aGUgb3duZXIgaGllcmFyY2h5IGF1dGggdmFs
dWUgbmVlZCB0byB1c2U6CiAgICAgICAgICAgICAgICAqIFRTUzJfUkMgRXN5c19UUl9TZXRBdXRo
KAogICAgICAgICAgICAgICAgKiAgICAgRVNZU19DT05URVhUICplc3lzQ29udGV4dCwKICAgICAg
ICAgICAgICAgICogICAgIEVTWVNfVFIgaGFuZGxlLAogICAgICAgICAgICAgICAgKiAgICAgVFBN
MkJfQVVUSCBjb25zdCAqYXV0aFZhbHVlKTsKICAgICAgICAgICAgICAgICovCgogICAgICAgICAg
ICAgICAgcHJpbnRmKCJDcmVhdGVkIE5WIEluZGV4OiAweCV4XG4iLCBwdWJfdGVtcGwubnZQdWJs
aWMubnZJbmRleCk7CiAgICAgICAgICAgICAgICBwcmludGYoIkVTWVNfVFI6IDB4JXhcbiIsIG52
X2luZGV4KTsKCiAgICAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICAgKiBOb3RlOiBpZiB3
ZSBuZWVkIHRvIGNvbnZlcnQgdGhlIG52SW5kZXggaW50byBhbiBFU1lTX1RSLCB0aGUgYmVsb3cg
d2lsbAogICAgICAgICAgICAgICAgKiBkbyBpdC4KICAgICAgICAgICAgICAgICovCiAgICAgICAg
ICAgICAgICByYyA9IEVzeXNfVFJfRnJvbVRQTVB1YmxpYygKICAgICAgICAgICAgICAgICAgICAg
ICAgZWN0eCwKICAgICAgICAgICAgICAgICAgICAgICAgVFBNMl9IUl9OVl9JTkRFWCArIDEsCiAg
ICAgICAgICAgICAgICAgICAgICAgIEVTWVNfVFJfTk9ORSwKICAgICAgICAgICAgICAgICAgICAg
ICAgRVNZU19UUl9OT05FLAogICAgICAgICAgICAgICAgICAgICAgICBFU1lTX1RSX05PTkUsCiAg
ICAgICAgICAgICAgICAgICAgICAgICZudl9pbmRleDIpOwoKICAgICAgICAgICAgICAgIGlmIChy
YyAhPSBUU1MyX1JDX1NVQ0NFU1MpIHsKICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRmKCJF
c3lzX1RSX0Zyb21UUE1QdWJsaWMgPEVSUk9SPjogMHgleFxuIiwgcmMpOwogICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgICAgIAoJCX0KCglwcmludGYoIkV4aXQg
ZnJvbSBkZWZpbmVfbnZyYW0oKVxuIik7CglyZXR1cm4gbnZfaW5kZXg7CgpvdXQ6CgogICAgICAg
IC8qIHJlbW92ZSB0aGUgTlYgc3BhY2UgKi8KICAgICAgICBpZiAobnZfaW5kZXgpIHsKICAgICAg
ICAgICAgICAgIGludCByYzIgPSBFc3lzX05WX1VuZGVmaW5lU3BhY2UoCiAgICAgICAgICAgICAg
ICAgICAgICAgIGVjdHgsCiAgICAgICAgICAgICAgICAgICAgICAgIEVTWVNfVFJfUkhfT1dORVIs
CiAgICAgICAgICAgICAgICAgICAgICAgIG52X2luZGV4LAogICAgICAgICAgICAgICAgICAgICAg
ICBFU1lTX1RSX1BBU1NXT1JELAogICAgICAgICAgICAgICAgICAgICAgICBFU1lTX1RSX05PTkUs
CiAgICAgICAgICAgICAgICAgICAgICAgIEVTWVNfVFJfTk9ORSk7CiAgICAgICAgICAgICAgICBp
ZiAocmMyICE9IFRTUzJfUkNfU1VDQ0VTUykgewogICAgICAgICAgICAgICAgICAgICAgICBwcmlu
dGYoIkVzeXNfTlZfVW5kZWZpbmVTcGFjZTogMHgleFxuIiwgcmMyKTsKICAgICAgICAgICAgICAg
ICAgICAgICAgcmMgPSAxOwogICAgICAgICAgICAgICAgfQogICAgICAgIH0KCglwcmludGYoIkVy
cm9yIDogRXhpdGluZyBmcm9tIGRlZmluZV9udnJhbSgpXG4iKTsKICAgICAgICByZXR1cm4gcmM7
Cn0KCi8qCiAqV3JpdGluZyByYW5kb20gbnVtYmVyIGluIHRvIE5WUkFNIG9mZnNldCAweDEwMDAw
MDEKICoKICovCgpUUE0yQl9NQVhfTlZfQlVGRkVSIG52X3dyaXRlKEVTWVNfQ09OVEVYVCAqZWN0
eCAsIFRQTTJCX0RJR0VTVCAqcmFuZF9ieXRlcyAsIEVTWVNfVFIgZnJvbV9pbmRleCkKewogICAg
ICBwcmludGYoIkluc2lkZSBOVldSSVRFKClcbiIpOwogICAgICBpbnQgcmM9MTsKCSAgCiAgICAg
IC8qCiAgICAgICogTm90ZTogaWYgd2UgbmVlZCB0byBjb252ZXJ0IHRoZSBudkluZGV4IGludG8g
YW4gRVNZU19UUiwgdGhlIGJlbG93IHdpbGwKICAgICAgKiBkbyBpdC4KICAgICAgKi8KICAgICAg
IHJjID0gRXN5c19UUl9Gcm9tVFBNUHVibGljKAogICAgICAgICAgICAgICAgZWN0eCwKICAgICAg
ICAgICAgICAgIFRQTTJfSFJfTlZfSU5ERVggKyAxLAogICAgICAgICAgICAgICAgRVNZU19UUl9O
T05FLAogICAgICAgICAgICAgICAgRVNZU19UUl9OT05FLAogICAgICAgICAgICAgICAgRVNZU19U
Ul9OT05FLAogICAgICAgICAgICAgICAgJm52X2luZGV4Mik7CgogICAgICAgICAgICBpZiAocmMg
IT0gVFNTMl9SQ19TVUNDRVNTKSB7CiAgICAgICAgICAgICAgICAgICAgcHJpbnRmKCJFc3lzX1RS
X0Zyb21UUE1QdWJsaWMgRVJST1I6IDB4JXhcbiIsIHJjKTsKICAgICAgICAgICAgICAgICAgICBn
b3RvIG91dDsKCiAgICAgICAgICAgIH0KICAgICAgCiAgICAgIAogICAgICBtZW1jcHkod3JpdGVf
ZGF0YS5idWZmZXIsIHJhbmRfYnl0ZXMtPmJ1ZmZlciwgcmFuZF9ieXRlcy0+c2l6ZSk7CiAgICAg
IHdyaXRlX2RhdGEuc2l6ZSA9IHJhbmRfYnl0ZXMtPnNpemU7CgogICAgICBwcmludGYoIkRhdGEg
YnVmZmVyKFJhbmRvbSBudW1iZXIpIHNpemUgdXNlZCB0byB3cml0ZSBpbnRvIE5WUmFtOiAlZFxu
Iix3cml0ZV9kYXRhLnNpemUpOwogICAgICAvKgogICAgICAqIFdyaXRlIHRoZSBkYXRhIHRvIHRo
ZSBUUE0gTlYgaW5kZXggYXQgb2Zmc2V0IDAKICAgICAgKi8KICAgICAgcmMgPSBFc3lzX05WX1dy
aXRlKAogICAgICAgICAgICAgIGVjdHgsCiAgICAgICAgICAgICAgZnJvbV9pbmRleCwgLyogYXV0
aGVudGljYXRlIHRvIHRoZSBOViBpbmRleCB1c2luZyB0aGUgTlYgaW5kZXggcGFzc3dvcmQgKi8K
ICAgICAgICAgICAgICBmcm9tX2luZGV4LCAvKiB0aGUgbnYgaW5kZXggdG8gd3JpdGUgdG8gKi8K
ICAgICAgICAgICAgICBFU1lTX1RSX1BBU1NXT1JELAogICAgICAgICAgICAgIEVTWVNfVFJfTk9O
RSwKICAgICAgICAgICAgICBFU1lTX1RSX05PTkUsCiAgICAgICAgICAgICAgJndyaXRlX2RhdGEs
CiAgICAgIDApOwogICAgICBpZiAocmMgIT0gVFNTMl9SQ19TVUNDRVNTKSB7CiAgICAgICAgICAg
ICAgLy9mcHJpbnRmKHN0ZGVyciwgIkVzeXNfTlZfV3JpdGU6IDB4JXhcbiIsIHJjKTsKICAgICAg
ICAgICAgICBwcmludGYoIkVzeXNfTlZfV3JpdGUgRVJST1ItLS0tLS0tLS0tLS0+OiAweCV4XG4i
LCByYyk7CiAgICAgICAgICAgICAgZ290byBvdXQ7CiAgICAgIH0KCiAgICAgIHByaW50ZigiRXhp
dCBmcm9tIE5WV1JJVEUoKVxuIik7CiAgICAgIAogICAgICByZXR1cm4gd3JpdGVfZGF0YTsKb3V0
OgogICAgICAvKiByZW1vdmUgdGhlIE5WIHNwYWNlICovCiAgICAgIGlmIChudl9pbmRleCkgewog
ICAgICAgICAgICBpbnQgcmMyID0gRXN5c19OVl9VbmRlZmluZVNwYWNlKAogICAgICAgICAgICAg
ICAgICAgIGVjdHgsCiAgICAgICAgICAgICAgICAgICAgRVNZU19UUl9SSF9PV05FUiwKICAgICAg
ICAgICAgICAgICAgICBudl9pbmRleCwKICAgICAgICAgICAgICAgICAgICBFU1lTX1RSX1BBU1NX
T1JELAogICAgICAgICAgICAgICAgICAgIEVTWVNfVFJfTk9ORSwKICAgICAgICAgICAgICAgICAg
ICBFU1lTX1RSX05PTkUpOwogICAgICAgICAgICBpZiAocmMyICE9IFRTUzJfUkNfU1VDQ0VTUykg
ewogICAgICAgICAgICAgICAgICAgIHByaW50ZigiRXN5c19OVl9VbmRlZmluZVNwYWNlIEVycm9y
OiAweCV4XG4iLCByYzIpOwogICAgICAgICAgICAgICAgICAgIHJjID0gMTsKICAgICAgICAgICAg
fQogICAgfQoKfQoKVFBNMkJfRElHRVNUICpnZXRfcmFuZG51bShFU1lTX0NPTlRFWFQgKmVjdHgg
LCBUUE0yQl9ESUdFU1QgKnJhbmRfYnl0ZXMpCnsKICAgICAgcHJpbnRmKCJJbnNpZGUgR2V0UmFu
ZG9tIE51bWJlcigpXG4iKTsKICAgICAgaW50IHJjID0gMTsKICAgICAgcmMgPSBFc3lzX0luaXRp
YWxpemUoJmVjdHgsCiAgICAgICAgICAgICAgICAgTlVMTCwgIC8vIGxldCBpdCBmaW5kIHRoZSBU
Q1RJIAogICAgICAgICAgICAgICAgIE5VTEwpOyAvLyBVc2Ugd2hhdGV2ZXIgQUJJIAogICAgICBp
ZiAocmMgIT0gVFNTMl9SQ19TVUNDRVNTKSB7CiAgICAgICAgICAgICBwcmludGYoIkVzeXNfSW5p
dGlhbGl6ZSBGYWlsZWQgYW5kIGl0cyBhc3NvY2lhdGVkIGVycm9yIGNvZGU6IDB4JXhcbiIsIHJj
KTsKICAgICAgICAgICAgIHJldHVybiAxOwogICAgICB9CgogICAgICAvKiAKICAgICAgKiBHZW5l
cmF0ZSByYW5kb20gbnVtYmVyIHRvIGVuY3J5cHQgdGhlIFJTQSBrZXksIHdoaWNoIHdpbGwgYmUg
dXNlZCBmb3IgCiAgICAgICogVlBOIGNvbm5lY3Rpb24KICAgICAgKiAKICAgICAgKi8KICAgICAg
cmMgPSBFc3lzX0dldFJhbmRvbShlY3R4LAogICAgICAgICAgICAgICAgICAgICBFU1lTX1RSX05P
TkUsIEVTWVNfVFJfTk9ORSwgRVNZU19UUl9OT05FLAogICAgICAgICAgICAgICAgICAgICA2NCwg
JnJhbmRfYnl0ZXMpOwogICAgICBpZiAocmMgIT0gVFNTMl9SQ19TVUNDRVNTKSB7CiAgICAgICAg
ICAgICBwcmludGYoIkVzeXNfR2V0UmFuZG9tIGZhaWxlZCBhbmQgaXRzIGFzc29jaWF0ZWQgZXJy
b3IgY29kZTogJXNcbiIsIFRzczJfUkNfRGVjb2RlKHJjKSk7CiAgICAgICAgICAgICBleGl0KDEp
OwogICAgICAgfQoKICAgICAgcHJpbnRmKCIgTm8gb2YgYnl0ZXMgd3JpdHRlbiBieSBHZW5SYW5k
b20gOiAlZFxuIixyYW5kX2J5dGVzLT5zaXplKTsKICAgICAgc2l6ZV90IGk7CiAgICAgIGZvciAo
aSA9IDA7IGkgPCByYW5kX2J5dGVzLT5zaXplOyBpKyspIHsKICAgICAgICAgICAgICBwcmludGYo
IiUwMngiLCByYW5kX2J5dGVzLT5idWZmZXJbaV0pOwogICAgICB9CgogICAgICBwcmludGYoIlxu
Iik7CgogICAgICBwcmludGYoIkV4aXQgZnJvbSBHZXRSYW5kb20gTnVtYmVyKClcbiIpOwoKICAg
ICAgcmV0dXJuIHJhbmRfYnl0ZXM7Cn0KCg==

--===============5093969115944267638==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="debug_log.obj"

cm9vdEBtdXRodS12Yjp+L3dvcmsvdHBtMl9hcHBfZGV2L3RwbTJfbnZfb3BlcmF0aW9uc19yZWxf
djMjIC4vYmluL3Rlc3RfbnZyZWFkLmMgCkluaXRpYWxpemluZwppbml0X3JhbmQoKQppbml0X3Jz
YSgpCmluaXRfZWNjKCkKRW5naW5lIG5hbWU6IFRQTTItVFNTIGVuZ2luZSBmb3IgT3BlblNTTApJ
bml0IHJlc3VsdDogMSAKU2V0dGluZyBvd25lciBhdXRoIHRvIGVtcHR5IGF1dGguClNldHRpbmcg
cGFyZW50IGF1dGggdG8gZW1wdHkgYXV0aC4KUkVBRCBSYW5kb21OdW1iZXIgZnJvbSBOVlJBTSBm
cm9tIG9mZnNldCAweDEwMDAwMDEKSW5zaWRlIG52X3JlYWQoKQpDcmVhdGVkIE5WIEluZGV4OiAw
eDEwMDAwMDEKRVNZU19UUjogMHgwCkVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpLWRldmlj
ZS5jOjQ0MDpUc3MyX1RjdGlfRGV2aWNlX0luaXQoKSBGYWlsZWQgdG8gb3BlbiBkZXZpY2UgZmls
ZSAvZGV2L3RwbTA6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkgCldBUk5JTkc6dGN0aTpzcmMv
dHNzMi10Y3RpL3RjdGlsZHIuYzo2Mjp0Y3RpX2Zyb21faW5pdCgpIFRDVEkgaW5pdCBmb3IgZnVu
Y3Rpb24gMHg3ZjJhYjUwYjcxOGIgZmFpbGVkIHdpdGggYTAwMGEgCldBUk5JTkc6dGN0aTpzcmMv
dHNzMi10Y3RpL3RjdGlsZHIuYzo5Mjp0Y3RpX2Zyb21faW5mbygpIENvdWxkIG5vdCBpbml0aWFs
aXplIFRDVEkgbmFtZWQ6IHRjdGktZGV2aWNlIApFUlJPUjp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0
aWxkci1kbC5jOjE1MDp0Y3RpX2Zyb21fZmlsZSgpIENvdWxkIG5vdCBpbml0aWFsaXplIFRDVEkg
ZmlsZTogbGlidHNzMi10Y3RpLWRlZmF1bHQuc28gCkVTWVNfVFIyOiAweDQxODM2NwpFUlJPUjpl
c3lzOnNyYy90c3MyLWVzeXMvZXN5c19pdXRpbC5jOjEwODY6ZXN5c19HZXRSZXNvdXJjZU9iamVj
dCgpIEVycm9yOiBFc3lzIGhhbmRsZSBkb2VzIG5vdCBleGlzdCAoNzAwMTgpLiAKRVJST1I6ZXN5
czpzcmMvdHNzMi1lc3lzL2FwaS9Fc3lzX05WX1JlYWQuYzoxODA6RXN5c19OVl9SZWFkX0FzeW5j
KCkgYXV0aEhhbmRsZSB1bmtub3duLiBFcnJvckNvZGUgKDB4MDAwNzAwMTgpIApFUlJPUjplc3lz
OnNyYy90c3MyLWVzeXMvYXBpL0VzeXNfTlZfUmVhZC5jOjgyOkVzeXNfTlZfUmVhZCgpIEVycm9y
IGluIGFzeW5jIGZ1bmN0aW9uIEVycm9yQ29kZSAoMHgwMDA3MDAxOCkgCkVzeXNfTlZfUmVhZCA8
RVJST1I+OiAweDcwMDE4ClNlZ21lbnRhdGlvbiBmYXVsdCAoY29yZSBkdW1wZWQpCgo=

--===============5093969115944267638==--

