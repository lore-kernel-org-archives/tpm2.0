Content-Type: multipart/mixed; boundary="===============1225461626084888166=="
MIME-Version: 1.0
From: Muthukumar S <muthu.smk at gmail.com>
Subject: [tpm2] Re: NVRAM Write and Read using Esys API(s)
Date: Fri, 15 May 2020 18:28:08 +0530
Message-ID: <CANGCWd3deS9jFE-CW1oO=WaA4Y+Jxgs=qvrK+ySVfUHoC+AnYA@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EDDACA@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1225461626084888166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Williams C,
Thanks for your quick response. As you suggested , i have tried below
options

I tried to get the index of nvram of sim that am working using tpm2_getcap
tools API .Bellow are the tpm2_getcap capabilities that i found by reading
the tpm2_getcap code . Request you to share me some pointers of using
tpm2_getcap() .

*Available capability from tpm2_getcap.c*

*        .capability_string =3D "algorithms"*

*        .capability_string =3D "commands"*

*        .capability_string =3D "properties-fixed",*

*        .capability_string =3D "properties-variable",  *

*        .capability_string =3D "ecc-curves",*

*        .capability_string =3D "handles-transient",*

*        .capability_string =3D "handles-persistent",*

*        .capability_string =3D "handles-permanent",*

*        .capability_string =3D "handles-pcr",*

*        .capability_string =3D "handles-nv-index",*

*        .capability_string =3D "handles-loaded-session",*

*        .capability_string =3D "handles-saved-session",*


In the above list , i tried all "capability string " but i could't able to
see the below output given by *tpm2_nvlist *(which i used to get with
different tpm-tools version that i used earlier) .


*# tpm2_nvlist*

*O/P*

*1 NV indexes defined.*

* 0. NV Index: 0x1500015*

* {*

* Hash algorithm(nameAlg):11*

*The Index attributes(attributes):0x64014001*

*       The size of the data area(dataSize):32*

*          }*


*1) Even though this tpm2_nvlist that was there in my current tpm2-tools
version (tpm2-tools-3.X) ,by which it is not showing me any output .*

#tpm2_nvlist

#



*2) Tried get_cap of "handles-permanent" , which shows me below values as
shown below , but not sure how to get the index of particular tpm bank*

#/tpm2/tpm_evo/tpm2-tools-3.X/tools# ./tpm2_getcap
--capability=3D"handles-permanent"


*0x40000001*

*0x40000007*

*0x40000009*

*0x4000000a*

*0x4000000b*

*0x4000000c*

*0x4000000d*


*2)Also tried reading pcr list using tpm2_getcap . Is the below offset(s)
are stands for ? *

*# ./tpm2_getcap --capability=3D"handles-pcr"*

*0x00000000*

*0x00000001*

*0x00000002*

*0x00000003*

*0x00000004*

*0x00000005*
*0x00000006*

*2.1) Request you to share me few points on how to use the "tpm2_getcap()
and get the offset ? *


*Since none of the above tools API helped me or am i missing some thing to
read the output of NVRAM index ?*

*3) Without knowing the offset , tried to define offset from 0x1500015 and
trying to write and read back , here nvdefine works along with
nvwrite ..but nvread fails with "auth" issue. Please refere*
*below sequence and associated errors  *

*3.1) Tried defining nvram using tpm2_nvdefine - **Succeeded* with out* any
error  -- given -a 0x40000001 (TPM_RH_OWNER Access) , if i define with
0x4000000C (TPM_RH_OWNER , i got the same result during tpm2_nvread . Here
removing "-t 0x2000A" option and then doing nvdefine also throws me the
same error shown in point 3.3 during nvread  *

#./tpm2_nvdefine -x 0x1500016 -a 0x40000001 -s 32 -t 0x2000A

#


*3.2) Tried NVWRITE in the same offset 0x1500015  - Succeeded without any
error*

# ./tpm2_nvwrite -x 0x1500015 -L test_helloworld

#


*3.3) Reading back the same offset -x1500015 , which throws below error
stating TPM2_RC_NV_UNINITIALIZED. Since i have **initialized** it as said
above point 3.1  , what am i missing here ? *


Below are the OPTIONS I have by tpm2_nvread:

as you suggested  to use (*echo `tpm2_nvread -C o -s5 0x1500015*` command)

I cant see -C (this might be due to tools version 3.X ? . If it is not the
latest , can't we able to use the below APIs ?


# ./tpm2_nvread

Usage: tpm2_nvread [<options>]

Where <options> are:

    [ -x | --index=3D<value>] [ -a | --auth-handle=3D<value>] [ -f |
--output=3D<value>] [ -s | --size=3D<value>]

    [ -o | --offset=3D<value>] [ -P | --handle-passwd=3D<value>] [ -S |
--input-session-handle=3D<value>] [ -L | --set-list=3D<value>]

    [ -F | --pcr-input-file=3D<value>]


# ./tpm2_nvread -x 0x1500015 -a 0x40000001 -s 32

ERROR: Failed to read NVRAM area at index 0x1500015 (22020117). Error:0x14a

ERROR: Unable to run ./tpm2_nvread


# tpm2_rc_decode 0x14a

error layer

  hex: 0x0

  identifier: TSS2_TPM_RC_LAYER

  description: Error produced by the TPM

format 0 error code

  hex: 0x4a

  name: TPM2_RC_NV_UNINITIALIZED

  description: an NV Index is used before being initialized or the state
saved by TPM2_Shutdown(STATE) could not be restored


*3.4) Tried reading the same offset 0x1500015 without giving '-a'
(TPM2_RH_OWNER) access , but the results shown NV_AUTHORIZATION. So i
understood*

*if we defined with -a auth permission then we need to give the same
permission while reading the content from the same offset. Is my
understanding is correct ?*


# ./tpm2_nvread -x 0x1500015 -s 32

ERROR: Failed to read NVRAM area at index 0x1500015 (22020117). Error:0x149
ERROR: Unable to run ./tpm2_nvread

# tpm2_rc_decode 0x149
error layer
  hex: 0x0
  identifier: TSS2_TPM_RC_LAYER
  description: Error produced by the TPM
format 0 error code
  hex: 0x49
  name: TPM2_RC_NV_AUTHORIZATION
  description: NV access authorization fails in command actions (this
failure does not affect lockout.action)


*4) Tried to use tpm2_readpublic to read above written offset 0x1500015 ,
getting 0x184 (value is out of range or is not correct for the context)
what am i missing here ?*

# ./tpm2_readpublic
Usage: tpm2_readpublic [<options>]
Where <options> are:
    [ -H | --object=3D<value>] [ -o | --opu=3D<value>] [ -c |
--context-object=3D<value>] [ -f | --format=3D<value>]


# ./tpm2_readpublic -H 0x1500015
ERROR: TPM2_ReadPublic error: rval =3D 0x184
ERROR: Unable to run ./tpm2_readpublic
root(a)muthu-vb:~/work/tpm2/tpm_evo/install/bin# ./tpm2_readpublic -H
0x1500015 --opu file
ERROR: TPM2_ReadPublic error: rval =3D 0x184
ERROR: Unable to run ./tpm2_readpublic
root(a)muthu-vb:~/work/tpm2/tpm_evo/install/bin# ./tpm2_rc_decode 0x184
error layer
  hex: 0x0
  identifier: TSS2_TPM_RC_LAYER
  description: Error produced by the TPM
format 1 error code
  hex: 0x04
  identifier: TPM2_RC_VALUE
  description: value is out of range or is not correct for the context
handle
  hex:0x100
  identifier:  TPM2_RC_1
  description:  (null)

#


*5)Tried releasing the same offset using nvrelease that too works fine*

#./tpm2_nvrelease -x 0x1500015 -a 0x40000001

#


As per my request raised by yesterday . I need to define an offset in nv
ram then write content only once and read it back when ever required.
During every second write , i need to read the offset (you suggested to use
tpm2_nvreadpubic() , but i struck with usage of this "nvread public api"
command as well (results are just shown above)


As per today's experiments , i cant able able to achieve the (nvread) using
command line API . Let me know what am i missing here .


Looking forward for your valuable reply.


Thanks,

Muthukumar




On Thu, May 14, 2020 at 12:51 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> > -----Original Message-----
> > From: muthu.smk(a)gmail.com [mailto:muthu.smk(a)gmail.com]
> > Sent: Wednesday, May 13, 2020 12:51 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] NVRAM Write and Read using Esys API(s)
> >
> > Hi Williams,
> >
> > I am using the test code used to read and write in to NV ram.  I am
> facing below
> > challenges if i tried to read already written data from NVRAM.
> >
> > 1) Test code attached defined create the context (ectx) , create random
> number ,
> > define NV ram , write the random number in to NVRAM (offset 0x1000001)
> and
> > read it back from NV Ram (from same offset 0x1000001)
> >
> > 2) But if i try to run this code twice or thrise , am getting below
> NVRAM already
> > defined rc code. I can understand that we should not defined the nv ram
> space
> > which already defined and used.
> > How to avoid this ? by defining nvram ONLY once and write it ONLY once
> and
> > finally read it AS MUCH times we want ?  Below details are related to
> this request
>
> You can call Esys_GetCapability() and see what NV indices are defined. The
> command
> Line tool tpm2_getcap does this, like so:
> tpm2_getcap handles-nv-index
>
> You can use that tool as an example of how to do it.
>
> >
> > Error code:
> > 0x0000014c - description: NV Index or persistend object already defined
> > 0x00000284 - description: value is out of range or is not correct for
> the context
> >
> > 3) Query is : is it possible to define nvram "ONLY ONCE" with the API
> shared the
> > test code and then create a function "createrandom" number to use the
> same
>
> Call getcap, see if it's defined, if defined, don't define it....
>
> > context (ects) to generate randumnumber then call separate "write_nvram"
> > function with random number as input and ask to write in the same offset
> .
> > Finally calling another function "read_nvram" to read it back from the
> same
> > nvram's offset when ever we want ? i tried this approach but am getting
> segfault
> > with above error .
> > What am i missing here ?
>
> Segfaults are likely your code is just broken.
>
> >
> > 3.1) Ideally in single application , i need to achieve "tpm2_nvdefine",
> > "tpm2_nvwrite" and "tpm2_nvread() tools API(s) functionality" in
> different calls
> > or flow.
> > 3.2) Also how to check whether "write" already done (i tried checking
> nv_index is
> > true - means whether it already has some value) , but it failed ?
>
> If you do what the tool tpm2_nvreadpublic does, you can check for the
> written bit.
>
> >
> > 4) Also how to check what was the content that already present in the
> nvram
> > offset (0x1000001) before i do write the "random number" second time in
> to the
> > same offset ? this is to ensure the "random number" that i am planning
> to write
> > was valid one ?
>
> Read it out, if it's not what you want, write it.
>
> >
> > I remember studying that, once u write in to NVRAM offset , we cant able
> to RE-
> > WRITE it in the same offset(0x1000001). Whether that is the same case f=
or
> > SIMULATOR as well (or) this feature is only for real tpm hardware?
>
> No generally you can write as many times as you want... there are tricks
> you can do to make
> It locked after write (writelocked iirc)
>
> Below is a command line example of doing it...
>
> tpm2_nvdefine
> nv-index: 0x1000000
>
> tpm2_nvreadpublic 0x1000000
> 0x1000000:
>   name:
> 000b1195f36a21c8219055ad0803c39e7e81d06cdb2eee2b7cf93dd83e01d4273828
>   hash algorithm:
>     friendly: sha256
>     value: 0xB
>   attributes:
>     friendly: ownerwrite|authwrite|ownerread|authread
>     value: 0x6000600
>   size: 2048
>
> # you can do this as much as you want, but it can wear the memory in the
> TPM
> # depending on memory technology the vendor used.
> echo "hello" | tpm2_nvwrite -C o 0x1000000 -i-
> echo `tpm2_nvread -C o -s5 0x1000000`
> hello
>
> tpm2_nvreadpublic 0x1000000
> 0x1000000:
>   name:
> 000b287c9b1b06fab6e51bd26e98ea89460574e97a3d2ef995eb35f7e23db7e94f67
>   hash algorithm:
>     friendly: sha256
>     value: 0xB
>   attributes:
>     friendly: ownerwrite|authwrite|ownerread|authread|written
>     value: 0x6000620
>   size: 2048
>
> >
> > 6)After nvwrite i tried to use "tpm2_pcrlist" command line tool
> application, by
> > which it shows the nv ram memory location , tried using tpm2_nvread ()
> to read
> > the content but i could not able to see any data (random number) that i
> used to
> > write via this test application . dont know why ?
>
> tpm2_pcrlist is not for NVs.... you want:
> tpm2_getcap handles-nv-index
>
> >
> > 7) After i manually ran the below clear API , now the test code is
> working fine
> > (refer Test code log shown below..). This confirms we can reallocate
> already
> > defined nv ram memory.
> > #tpm2_nvrelease -x 0x1000001 -a 0x40000001
>
> Tpm2_clear will clear the owner hierarchy, including NV ram objects
> declared in that hierarchy,
> so define will work again, because you deleted it.
>
> >
> >
> > 8)If i try to read it manually via below tpm2_nvread command with offset
> > 0x1000001 am getting below error
> >
> > #tpm2_nvread -x 0x1000001 -a 0x40000001 -o 0 -s 20
> > ERROR: Failed to read NVRAM public area at index 0x1000001 (16777217).
> > Error:0x18b
> > ERROR: Unable to run tpm2_nvread
> >
> > /* Tried to use below tools command , am always getting the same error
> even if
> > we give the different nvram off set tpm2_nvwrite -x 0x1c00002 helloworld
> > ERROR: Reading the public part of the nv index failed with: 0x18b
> > ERROR: Unable to run tpm2_nvwrite
> >
> > tpm2_nvwrite -x 0x1c00012 -a 0x40000001 helloworld
> > ERROR: Reading the public part of the nv index failed with: 0x18b
> > ERROR: Unable to run tpm2_nvwrite
> >
> >
> > /* Try to read the nvlist of SIM , it returns nothing !!!
> > #tpm2_nvlist <returns nothing>
> >
> > Any points will be great help for me.
> >
> >
> -------------------------------------------------------------------------=
--------------------------
> > --------------------------------------------------------------
> > Test code log after above "tpm2_nvrelease":
> > Initializing
> > init_rand()
> > init_rsa()
> > init_ecc()
> > Engine name: TPM2-TSS engine for OpenSSL
> > Init result: 1
> > Setting owner auth to empty auth.
> > Setting parent auth to empty auth.
> > ERROR:tcti:src/tss2-tcti/tcti-device.c:440:Tss2_Tcti_Device_Init()
> Failed to open
> > device file /dev/tpm0: No such file or directory
> > WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for
> function
> > 0x7fc67376d18b failed with a000a
> > WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not
> initialize TCTI
> > named: tcti-device
> > ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not
> initialize TCTI
> > file: libtss2-tcti-default.so
> >  No of bytes written by GenRandom : 64
> > b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe
> > 8ece5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
> > Created NV Index: 0x1000001
> > ESYS_TR: 0x418367
> > ESYS_TR2: 0x418368
> > Writing the random number written in NV Ram
> > Data buffer size used to write into NVRam: 64
> > Reading the random number written in NV Ram
> > b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe
> > 8ece5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
> > *** SUCCESS ***
> > ---------------------
> >
> > TEST CODE :
> >
> > int nv_write_read()
> > {
> >
> >       ESYS_CONTEXT *ectx =3D NULL;
> >
> >       ESYS_TR nv_index =3D 0;
> >       ESYS_TR nv_index2 =3D 0;
> >
> >        int rc =3D 1;
> >
> >
> >       /*
> >        * create a connection to the TPM letting ESAPI choose how to get
> there.
> >        * If you need more control, you can use tcti and tcti-ldr
> libraries to
> >        * get a TCTI pointer to use for the tcti argument of
> Esys_Initialize.
> >        */
> >       rc =3D Esys_Initialize(&ectx,
> >                       NULL,  // let it find the TCTI
> >                       NULL); // Use whatever ABI
> >       if (rc !=3D TSS2_RC_SUCCESS) {
> >               printf("Esys_Initialize Failed: 0x%x\n", rc);
> >               return 1;
> >       }
> >
> >
> >         rc =3D Esys_GetRandom(ectx,
> >                         ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE,
> >                         64, &bytes);
> >         if (rc !=3D TSS2_RC_SUCCESS) {
> >                 printf("Esys_GetRandom Failed: %s\n",
> Tss2_RC_Decode(rc));
> >                 exit(1);
> >         }
> >
> >       printf(" No of bytes written by GenRandom : %d\n",bytes->size);
> >       size_t i;
> >       for (i =3D 0; i < bytes->size; i++) {
> >               printf("%02x", bytes->buffer[i]);
> >       }
> >
> >       printf("\n");
> >
> >       /* build a template for the NV index */
> >       TPM2B_NV_PUBLIC pub_templ =3D {
> >               /* this is counter intuitive, but it tells the TSS2
> library to calculate
> > this for us */
> >               .size =3D 0,
> >               /* The things that define what NV index we are creating */
> >               .nvPublic =3D {
> >                       /* uses sha256 to identify the tpm object by name
> */
> >                       .nameAlg =3D TPM2_ALG_SHA256,
> >                       /* allows the owner password or index password r/w
> > access */
> >                       .attributes =3D TPMA_NV_OWNERWRITE |
> >                               TPMA_NV_OWNERREAD            |
> >                               TPMA_NV_AUTHWRITE            |
> >                               TPMA_NV_AUTHREAD,
> >                       /* can hold 64 bytes of data */
> >                       .dataSize =3D 64,
> >                       /* Create at NV Index 1 or 0x1000001 */
> >                       .nvIndex =3D TPM2_HR_NV_INDEX + 1
> >               },
> >       };
> >
> >
> >       /* Ok, define the space and store the nv_index for future use */
> >       rc =3D Esys_NV_DefineSpace(
> >           ectx,
> >               ESYS_TR_RH_OWNER, /* create an NV index in the owner
> > hierarchy */
> >           ESYS_TR_PASSWORD, /* auth as the owner with a password, which
> is
> > empty */
> >           ESYS_TR_NONE,
> >           ESYS_TR_NONE,
> >           NULL,
> >           &pub_templ,
> >           &nv_index);
> >       if (rc !=3D TSS2_RC_SUCCESS) {
> >               printf("Esys_NV_DefineSpace Failed: 0x%x\n", rc);
> >               goto out;
> >       }
> >
> >       /* Note if you need to set the owner hierarchy auth value you use:
> >        * TSS2_RC Esys_TR_SetAuth(
> >        *     ESYS_CONTEXT *esysContext,
> >          *     ESYS_TR handle,
> >          *     TPM2B_AUTH const *authValue);
> >        */
> >
> >       printf("Created NV Index: 0x%x\n", pub_templ.nvPublic.nvIndex);
> >       printf("ESYS_TR: 0x%x\n", nv_index);
> >
> >       /*
> >        * Note: if we need to convert the nvIndex into an ESYS_TR, the
> below
> > will
> >        * do it. Its not required for this case, since Esys_NV_Define
> gives us an
> >        * ESYS_TR.
> >        */
> >       rc =3D Esys_TR_FromTPMPublic(
> >               ectx,
> >               TPM2_HR_NV_INDEX + 1,
> >               ESYS_TR_NONE,
> >               ESYS_TR_NONE,
> >               ESYS_TR_NONE,
> >               &nv_index2);
> >       if (rc !=3D TSS2_RC_SUCCESS) {
> >               printf("Esys_TR_FromTPMPublic Failed: 0x%x\n", rc);
> >               goto out;
> >       }
> >
> >       printf("ESYS_TR2: 0x%x\n", nv_index2);
> >
> >       /* copy some data into a buffer to send to the TPM */
> >       TPM2B_MAX_NV_BUFFER write_data =3D { 0 };
> >       memcpy(write_data.buffer, bytes->buffer, bytes->size);
> >       write_data.size =3D bytes->size;
> >
> >       printf("Writing the random number written in NV Ram\n");
> >       printf("Data buffer size used to write into NVRam:
> > %d\n",write_data.size);
> >       /*
> >        * Write the data to the TPM NV index at offset 0
> >        */
> >       rc =3D Esys_NV_Write(
> >           ectx,
> >           nv_index, /* authenticate to the NV index using the NV index
> > password */
> >           nv_index, /* the nv index to write to */
> >           ESYS_TR_PASSWORD,
> >               ESYS_TR_NONE,
> >               ESYS_TR_NONE,
> >           &write_data,
> >           0);
> >       if (rc !=3D TSS2_RC_SUCCESS) {
> >               printf("Esys_NV_Write Failed: 0x%x\n", rc);
> >               goto out;
> >       }
> >
> >       /* Read the data back, and just for fun, we will use nv_index2
> >        * to prove it's pointing to the same NV location in the TPM.
> >        */
> >       TPM2B_MAX_NV_BUFFER *read_data =3D NULL;
> >       rc =3D Esys_NV_Read(
> >           ectx,
> >           nv_index2, /* authenticate to the NV index using the NV index
> > password */
> >           nv_index2, /* the nv index to read from */
> >           ESYS_TR_PASSWORD,
> >           ESYS_TR_NONE,
> >           ESYS_TR_NONE,
> >           bytes->size,
> >           0,
> >           &read_data);
> >       if (rc !=3D TSS2_RC_SUCCESS) {
> >               printf("Esys_NV_Read Failed: 0x%x\n", rc);
> >               goto out;
> >       }
> >
> >       /* Print things as a string from the TPM carefully!
> >        * Injected traffic via MITM means that you cannot trust this
> >        * to be null terminated.
> >        */
> >       printf("Reading the random number written in NV Ram\n");
> >       for (i =3D 0; i < read_data->size; i++) {
> >               printf("%02x", read_data->buffer[i]);
> >       }
> >       printf("\n");
> >
> >       Esys_Free(read_data);
> >       rc =3D 0;
> >
> > out:
> >
> >       /* remove the NV space */
> >       if (nv_index) {
> >               int rc2 =3D Esys_NV_UndefineSpace(
> >                       ectx,
> >                       ESYS_TR_RH_OWNER,
> >                       nv_index,
> >                       ESYS_TR_PASSWORD,
> >                       ESYS_TR_NONE,
> >                       ESYS_TR_NONE);
> >               if (rc2 !=3D TSS2_RC_SUCCESS) {
> >                       printf("Esys_NV_UndefineSpace Failed: 0x%x\n",
> rc2);
> >                       rc =3D 1;
> >               }
> >       }
> >
> >       Esys_Finalize(&ectx);
> >
> >         printf("Exit from nv_write_read()\n");
> >       return rc;
> > }
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============1225461626084888166==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBXaWxsaWFtcyBDLDwvZGl2PlRoYW5rcyBmb3IgeW91ciBx
dWljayByZXNwb25zZS4gQXMgeW91IHN1Z2dlc3RlZCAsIGkgaGF2ZSB0cmllZCBiZWxvdyBvcHRp
b25zPGRpdj48YnI+PC9kaXY+PGRpdj48Zm9udCBzaXplPSI0Ij5JIHRyaWVkIHRvIGdldCB0aGUg
aW5kZXggb2YgbnZyYW0gb2Ygc2ltIHRoYXQgYW0gd29ya2luZyB1c2luZyB0cG0yX2dldGNhcCB0
b29scyBBUEkgLkJlbGxvdyBhcmUgdGhlIHRwbTJfZ2V0Y2FwIGNhcGFiaWxpdGllcyB0aGF0IGkg
Zm91bmQgYnkgcmVhZGluZyB0aGUgdHBtMl9nZXRjYXAgY29kZSAuIFJlcXVlc3QgeW91IHRvIHNo
YXJlIG1lIHNvbWUgcG9pbnRlcnMgb2YgdXNpbmcgdHBtMl9nZXRjYXAoKSAuPC9mb250PjwvZGl2
PjxkaXY+PGZvbnQgc2l6ZT0iNCI+PGJyPjwvZm9udD48L2Rpdj48ZGl2PjxwIGNsYXNzPSJNc29O
b3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7
YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNr
Z3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQt
b3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFz
ZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48Yj48
c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPkF2YWlsYWJsZSBjYXBhYmlsaXR5IGZyb20gdHBtMl9n
ZXRjYXAuYzwvc3Bhbj48L2I+PC9wPgoKPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdp
bjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmlu
aXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFs
O2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNr
Z3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFw
dDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJjb2xvcjpi
bGFjayI+wqDCoMKgwqDCoMKgwqAgLmNhcGFiaWxpdHlfc3RyaW5nCj0gJnF1b3Q7YWxnb3JpdGht
cyZxdW90Ozwvc3Bhbj48L2I+PC9wPgoKPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdp
bjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmlu
aXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFs
O2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNr
Z3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFw
dDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJjb2xvcjpi
bGFjayI+wqDCoMKgwqDCoMKgwqAgLmNhcGFiaWxpdHlfc3RyaW5nCj0gJnF1b3Q7Y29tbWFuZHMm
cXVvdDs8L3NwYW4+PC9iPjwvcD4KCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46
MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0
aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDti
YWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dy
b3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7
Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48Yj48c3BhbiBzdHlsZT0iY29sb3I6Ymxh
Y2siPsKgwqAgwqDCoMKgwqDCoC5jYXBhYmlsaXR5X3N0cmluZyA9CiZxdW90O3Byb3BlcnRpZXMt
Zml4ZWQmcXVvdDssPC9zcGFuPjwvYj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0i
bWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1h
Z2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmlu
aXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFs
O2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6
ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9ImNv
bG9yOmJsYWNrIj7CoMKgwqAgwqDCoMKgwqAuY2FwYWJpbGl0eV9zdHJpbmcgPQomcXVvdDtwcm9w
ZXJ0aWVzLXZhcmlhYmxlJnF1b3Q7LMKgIDwvc3Bhbj48L2I+PC9wPgoKPHAgY2xhc3M9Ik1zb05v
cm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDti
YWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tn
cm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1v
cmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNl
bGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxz
cGFuIHN0eWxlPSJjb2xvcjpibGFjayI+wqDCoMKgwqDCoMKgwqAKLmNhcGFiaWxpdHlfc3RyaW5n
ID0gJnF1b3Q7ZWNjLWN1cnZlcyZxdW90Oyw8L3NwYW4+PC9iPjwvcD4KCjxwIGNsYXNzPSJNc29O
b3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7
YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNr
Z3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQt
b3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFz
ZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48Yj48
c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPsKgwqDCoMKgwqDCoMKgCi5jYXBhYmlsaXR5X3N0cmlu
ZyA9ICZxdW90O2hhbmRsZXMtdHJhbnNpZW50JnF1b3Q7LDwvc3Bhbj48L2I+PC9wPgoKPHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0
Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0
aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFj
a2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1h
bGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2Vy
aWYiPjxiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+wqDCoMKgwqDCoMKgwqAKLmNhcGFiaWxp
dHlfc3RyaW5nID0gJnF1b3Q7aGFuZGxlcy1wZXJzaXN0ZW50JnF1b3Q7LDwvc3Bhbj48L2I+PC9w
PgoKPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xp
bmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3Np
dGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0Omlu
aXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2
ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJp
LHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+wqDCoMKgwqDCoMKgwqAg
LmNhcGFiaWxpdHlfc3RyaW5nCj0gJnF1b3Q7aGFuZGxlcy1wZXJtYW5lbnQmcXVvdDssPC9zcGFu
PjwvYj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4w
MDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3Jv
dW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1y
ZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDpp
bml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5
OkNhbGlicmksc2Fucy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj7CoMKgwqDC
oMKgwqDCoAouY2FwYWJpbGl0eV9zdHJpbmcgPSAmcXVvdDtoYW5kbGVzLXBjciZxdW90Oyw8L3Nw
YW4+PC9iPjwvcD4KCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAw
LjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tn
cm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5k
LXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlw
OmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1p
bHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48Yj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPsKgwqDC
oMKgwqDCoMKgCi5jYXBhYmlsaXR5X3N0cmluZyA9ICZxdW90O2hhbmRsZXMtbnYtaW5kZXgmcXVv
dDssPC9zcGFuPjwvYj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBj
bSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlh
bDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFj
a2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91
bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2Zv
bnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNr
Ij7CoMKgIMKgwqDCoMKgwqAuY2FwYWJpbGl0eV9zdHJpbmcgPSAmcXVvdDtoYW5kbGVzLWxvYWRl
ZC1zZXNzaW9uJnF1b3Q7LDwvc3Bhbj48L2I+PC9wPgoKPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5
bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5k
LWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6
ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5p
dGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250
LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxl
PSJjb2xvcjpibGFjayI+wqDCoCDCoMKgwqDCoMKgLmNhcGFiaWxpdHlfc3RyaW5nID0KJnF1b3Q7
aGFuZGxlcy1zYXZlZC1zZXNzaW9uJnF1b3Q7LDwvc3Bhbj48L2I+PC9wPjxwIGNsYXNzPSJNc29O
b3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7
YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNr
Z3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQt
b3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFz
ZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48Yj48
c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPjxicj48L3NwYW4+PC9iPjwvcD48cCBjbGFzcz0iTXNv
Tm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFs
O2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFj
a2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5k
LW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJh
c2VsaW5lIj48Zm9udCBzaXplPSI0Ij5JbiB0aGUgYWJvdmUgbGlzdCAsIGkgdHJpZWQgYWxsICZx
dW90O2NhcGFiaWxpdHnCoHN0cmluZyAmcXVvdDsgYnV0IGkgY291bGQmIzM5O3QgYWJsZSB0byBz
ZWUgdGhlIGJlbG93IG91dHB1dMKgPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZl
dGljYSxzYW5zLXNlcmlmIj5naXZlbiBieSA8Yj48dT50cG0yX252bGlzdCA8L3U+PC9iPih3aGlj
aCBpIHVzZWQgdG8gZ2V0IHdpdGggZGlmZmVyZW50IHRwbS10b29scyB2ZXJzaW9uIHRoYXQgaSB1
c2VkIGVhcmxpZXIpIC7CoDwvc3Bhbj48L2ZvbnQ+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0
eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3Vu
ZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNp
emU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmlu
aXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmUiPjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTpBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNp
emU6c21hbGwiPjxicj48L3NwYW4+PC9wPjxwIGNsYXNzPSJnbWFpbC1Nc29MaXN0UGFyYWdyYXBo
Q3hTcEZpcnN0IiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQgMThwdDt0ZXh0LWFsaWdu
Omp1c3RpZnk7bGluZS1oZWlnaHQ6MTA3JTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxp
YnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kOmxpbWUiPiMKdHBtMl9u
dmxpc3Q8L3NwYW4+PC9iPjwvcD48cCBjbGFzcz0iZ21haWwtTXNvTGlzdFBhcmFncmFwaEN4U3BN
aWRkbGUiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdCAxOHB0O3RleHQtYWxpZ246anVz
dGlmeTtsaW5lLWhlaWdodDoxMDclO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmks
c2Fucy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQ6eWVsbG93Ij5PL1A8L3NwYW4+
PC9iPjwvcD48cCBjbGFzcz0iZ21haWwtTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxl
PSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdCAxOHB0O3RleHQtYWxpZ246anVzdGlmeTtsaW5lLWhl
aWdodDoxMDclO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+
PGI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQ6bGltZSI+MSBOVgppbmRleGVzIGRlZmluZWQuPC9z
cGFuPjwvYj48L3A+PHAgY2xhc3M9ImdtYWlsLU1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBz
dHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQgMThwdDt0ZXh0LWFsaWduOmp1c3RpZnk7bGlu
ZS1oZWlnaHQ6MTA3JTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2Vy
aWYiPjxiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kOmxpbWUiPsKgMC4gTlYgSW5kZXg6IDB4MTUw
MDAxNTwvc3Bhbj48L2I+PC9wPjxwIGNsYXNzPSJnbWFpbC1Nc29MaXN0UGFyYWdyYXBoQ3hTcE1p
ZGRsZSIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0IDE4cHQ7dGV4dC1hbGlnbjpqdXN0
aWZ5O2xpbmUtaGVpZ2h0OjEwNyU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxz
YW5zLXNlcmlmIj48Yj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZDpsaW1lIj7CoHs8L3NwYW4+PC9i
PjwvcD48cCBjbGFzcz0iZ21haWwtTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxlPSJt
YXJnaW46MGNtIDBjbSAwLjAwMDFwdCAxOHB0O3RleHQtYWxpZ246anVzdGlmeTt0ZXh0LWluZGVu
dDoxOHB0O2xpbmUtaGVpZ2h0OjEwNyU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJy
aSxzYW5zLXNlcmlmIj48Yj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZDpsaW1lIj7CoEhhc2ggYWxn
b3JpdGhtKG5hbWVBbGcpOjExPC9zcGFuPjwvYj48L3A+PHAgY2xhc3M9ImdtYWlsLU1zb0xpc3RQ
YXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQgMThwdDt0
ZXh0LWFsaWduOmp1c3RpZnk7dGV4dC1pbmRlbnQ6MThwdDtsaW5lLWhlaWdodDoxMDclO2ZvbnQt
c2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9
ImJhY2tncm91bmQ6bGltZSI+VGhlIEluZGV4IGF0dHJpYnV0ZXMoYXR0cmlidXRlcyk6MHg2NDAx
NDAwMTwvc3Bhbj48L2I+PC9wPjxwIGNsYXNzPSJnbWFpbC1Nc29MaXN0UGFyYWdyYXBoQ3hTcExh
c3QiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdCAxOHB0O3RleHQtYWxpZ246anVzdGlm
eTtsaW5lLWhlaWdodDoxMDclO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fu
cy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQ6bGltZSI+wqDCoMKgwqDCoMKgIFRo
ZSBzaXplIG9mIHRoZSBkYXRhIGFyZWEoZGF0YVNpemUpOjMyPC9zcGFuPjwvYj48L3A+PHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0
Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0
aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFj
a2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1h
bGlnbjpiYXNlbGluZSI+CgoKCgoKCgoKCgoKCgoKCjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBz
dHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7dGV4dC1hbGlnbjpqdXN0aWZ5O2xpbmUtaGVp
Z2h0OjEwNyU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48
Yj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZDpsaW1lIj7CoMKgwqDCoMKgwqDCoMKgwqAgfTwvc3Bh
bj48L2I+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAw
MDFwdDt0ZXh0LWFsaWduOmp1c3RpZnk7bGluZS1oZWlnaHQ6MTA3JTtmb250LXNpemU6MTFwdDtm
b250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5k
OmxpbWUiPjxicj48L3NwYW4+PC9iPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFy
Z2luOjBjbSAwY20gMC4wMDAxcHQ7dGV4dC1hbGlnbjpqdXN0aWZ5O2xpbmUtaGVpZ2h0OjEwNyU7
Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48L3A+PHAgY2xh
c3M9ImdtYWlsLU1zb0xpc3RQYXJhZ3JhcGhDeFNwRmlyc3QiIHN0eWxlPSJtYXJnaW46MGNtIDBj
bSAwLjAwMDFwdCAxOHB0O3RleHQtYWxpZ246anVzdGlmeTtsaW5lLWhlaWdodDoxMDclO2ZvbnQt
c2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PC9wPjxwPjwvcD48cCBj
bGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWln
aHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmlu
aXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDti
YWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2Fs
LWFsaWduOmJhc2VsaW5lIj48YiBzdHlsZT0iIj48Zm9udCBzaXplPSI0Ij48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJiYWNr
Z3JvdW5kLWNvbG9yOnJnYigyNTUsMjU1LDApIj4xKSBFdmVuIHRob3VnaCB0aGlzIHRwbTJfbnZs
aXN0IHRoYXQgd2FzIHRoZXJlIGluIG15IGN1cnJlbnQgdHBtMi10b29scyB2ZXJzaW9uIDwvc3Bh
bj48dSBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMCwyNTUsMjU1KSI+KDwvdT48L3NwYW4+
PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmIj48dSBz
dHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMCwyNTUsMjU1KSI+dHBtMi10b29scy0zLlgpPC91
PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNTUsMjU1LDApIj7CoCxieSB3aGlj
aCBpdCBpczwvc3Bhbj48L3NwYW4+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6cmdiKDI1
NSwyNTUsMCk7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWYiPsKgbm90IHNo
b3dpbmcgbWUgYW55IG91dHB1dCAuPC9zcGFuPjwvZm9udD48L2I+PC9wPjxwIGNsYXNzPSJNc29O
b3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7
YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNr
Z3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQt
b3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFz
ZWxpbmUiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJp
Zjtmb250LXNpemU6c21hbGwiPiN0cG0yX252bGlzdDwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05v
cm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDti
YWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tn
cm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1v
cmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNl
bGluZSI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlm
O2ZvbnQtc2l6ZTpzbWFsbCI+Izwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWlt
YWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTpp
bml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlh
bDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZSI+PHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZTpz
bWFsbCI+PGJyPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjow
Y20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRp
YWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2Jh
Y2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3Jv
dW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZSI+PGJyPjwvcD48cCBjbGFz
cz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6
bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRp
YWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNr
Z3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFs
aWduOmJhc2VsaW5lO2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9
ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmIj48YiBzdHlsZT0iIj48Zm9u
dCBzaXplPSI0Ij4yKSBUcmllZCBnZXRfY2FwIG9mICZxdW90O2hhbmRsZXMtcGVybWFuZW50JnF1
b3Q7ICwgd2hpY2ggc2hvd3MgbWUgYmVsb3cgdmFsdWVzIGFzIHNob3duIGJlbG93ICwgYnV0IG5v
dCBzdXJlIGhvdyB0byBnZXQgdGhlIGluZGV4IG9mIHBhcnRpY3VsYXIgdHBtIGJhbms8L2ZvbnQ+
PC9iPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNt
IDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFj
a2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91
bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNs
aXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZSI+IzxzcGFuIHN0eWxlPSJmb250LWZh
bWlseTpDYWxpYnJpLHNhbnMtc2VyaWY7Zm9udC1zaXplOjExcHQ7Zm9udC13ZWlnaHQ6Ym9sZDtj
b2xvcjpibGFjayI+L3RwbTIvdHBtX2V2by90cG0yLXRvb2xzLTMuWC90b29scyMgLi90cG0yX2dl
dGNhcCAtLTxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kOnllbGxvdyI+Y2FwYWJpbGl0eT0mcXVvdDto
YW5kbGVzLXBlcm1hbmVudCZxdW90O8KgIMKgPC9zcGFuPjwvc3Bhbj48L3A+Cgo8cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9y
bWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7
YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3Jv
dW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWdu
OmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+
PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4weDQwMDAwMDAxPC9zcGFuPjwvYj48L3A+Cgo8
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1o
ZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9u
OmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlh
bDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRp
Y2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fu
cy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4weDQwMDAwMDA3PC9zcGFuPjwv
Yj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAx
cHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5k
LXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBl
YXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0
aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNh
bGlicmksc2Fucy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4weDQwMDAwMDA5
PC9zcGFuPjwvYj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAw
Y20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDti
YWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dy
b3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQt
Y2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQt
ZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4w
eDQwMDAwMDBhPC9zcGFuPjwvYj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFy
Z2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6
aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRp
YWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2Jh
Y2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZTox
MXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PGI+PHNwYW4gc3R5bGU9ImNvbG9y
OmJsYWNrIj4weDQwMDAwMDBiPC9zcGFuPjwvYj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBz
dHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91
bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1z
aXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjpp
bml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2Zv
bnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PGI+PHNwYW4gc3R5
bGU9ImNvbG9yOmJsYWNrIj4weDQwMDAwMDBjPC9zcGFuPjwvYj48L3A+Cgo8cCBjbGFzcz0iTXNv
Tm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFs
O2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFj
a2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5k
LW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJh
c2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PGI+
PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4weDQwMDAwMDBkPC9zcGFuPjwvYj48L3A+PHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0
Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0
aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFj
a2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1h
bGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2Vy
aWYiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtm
b250LXNpemU6c21hbGwiPjxicj48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxl
PSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1p
bWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6
aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRp
YWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1m
YW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48YiBzdHlsZT0iIj48Zm9udCBzaXplPSI0Ij48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWYiPjIpQWxzbyB0
cmllZCByZTwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPmFkaW5nIHBjciBsaXN0IHVz
aW5nIHRwbTJfZ2V0Y2FwIC4gSXMgdGhlIGJlbG93wqBvZmZzZXQocykgYXJlIHN0YW5kcyBmb3Ig
P8KgPC9zcGFuPjwvZm9udD48L2I+PC9wPgoKPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1h
cmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdl
OmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0
aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDti
YWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6
MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJjb2xv
cjpibGFjayI+IyAuL3RwbTJfZ2V0Y2FwIDxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kOnllbGxvdyI+
LS1jYXBhYmlsaXR5PSZxdW90O2hhbmRsZXMtcGNyJnF1b3Q7PC9zcGFuPjwvc3Bhbj48L2I+PC9w
PgoKPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xp
bmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3Np
dGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0Omlu
aXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2
ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJp
LHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+MHgwMDAwMDAwMDwvc3Bh
bj48L2I+PC9wPgoKPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAu
MDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dy
b3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQt
cmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6
aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWls
eTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+MHgwMDAw
MDAwMTwvc3Bhbj48L2I+PC9wPgoKPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjow
Y20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRp
YWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2Jh
Y2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3Jv
dW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtm
b250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFj
ayI+MHgwMDAwMDAwMjwvc3Bhbj48L2I+PC9wPgoKPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWlt
YWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTpp
bml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlh
bDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNp
emU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFuIHN0eWxlPSJj
b2xvcjpibGFjayI+MHgwMDAwMDAwMzwvc3Bhbj48L2I+PC9wPgoKPHAgY2xhc3M9Ik1zb05vcm1h
bCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNr
Z3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91
bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmln
aW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGlu
ZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxiPjxzcGFu
IHN0eWxlPSJjb2xvcjpibGFjayI+MHgwMDAwMDAwNDwvc3Bhbj48L2I+PC9wPgoKPHAgY2xhc3M9
Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5v
cm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFs
O2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dy
b3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGln
bjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYi
PjxiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+MHgwMDAwMDAwNTwvc3Bhbj48L2I+PC9wPgoK
PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0O2xpbmUtaGVpZ2h0OjEwNyU7Zm9udC1mYW1p
bHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj4weDAwMDAwMDA2PC9zcGFuPjwvYj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PjxiPjxmb250IHNpemU9IjQiPjIuMSkgUjxzcGFuIHN0eWxlPSJjb2xvcjpy
Z2IoMCwwLDApO2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+ZXF1ZXN0IHlvdSB0byBz
aGFyZSBtZSBmZXcgcG9pbnRzIG9uIGhvd8KgPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2Io
MCwwLDApO2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+dG8gdXNlIHRoZSAmcXVvdDt0
cG0yX2dldGNhcCgpIGFuZCBnZXQgdGhlIG9mZnNldCA/wqA8L3NwYW4+PC9mb250PjwvYj48L2Rp
dj4KCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDts
aW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9z
aXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDpp
bml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7
dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48
L3A+PGRpdj48Yj48YnI+PC9iPjwvZGl2PjxkaXY+PGI+U2luY2Ugbm9uZSBvZiB0aGUgYWJvdmUg
dG9vbHMgQVBJIGhlbHBlZCBtZSBvciBhbSBpIG1pc3Npbmcgc29tZSB0aGluZyB0byByZWFkIHRo
ZSBvdXRwdXQgb2YgTlZSQU0gaW5kZXggPzwvYj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxi
PjMpIFdpdGhvdXQga25vd2luZyB0aGUgb2Zmc2V0ICwgdHJpZWQgdG8gZGVmaW5lIG9mZnNldCBm
cm9tIDB4MTUwMDAxNSBhbmQgdHJ5aW5nIHRvIHdyaXRlIGFuZCByZWFkIGJhY2sgLCBoZXJlIG52
ZGVmaW5lIHdvcmtzIGFsb25nIHdpdGggbnZ3cml0ZcKgLi5idXQgbnZyZWFkIGZhaWxzIHdpdGgg
JnF1b3Q7YXV0aCZxdW90OyBpc3N1ZS4gUGxlYXNlIHJlZmVyZTwvYj48L2Rpdj48ZGl2PjxiPmJl
bG93IHNlcXVlbmNlIGFuZCBhc3NvY2lhdGVkIGVycm9yc8KgwqA8L2I+PGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc2l6ZT0iNCI+
PGIgc3R5bGU9IiI+My4xKSBUcmllZCBkZWZpbmluZyBudnJhbSB1c2luZyB0cG0yX252ZGVmaW5l
IC0gPC9iPjxiPlN1Y2NlZWRlZDwvYj48YiBzdHlsZT0iIj7CoDwvYj53aXRoIG91dDxiIHN0eWxl
PSIiPiBhbnkgZXJyb3LCoCAtLSBnaXZlbiAtYSAweDQwMDAwMDAxIChUUE1fUkhfT1dORVIgQWNj
ZXNzKSAsIGlmIGkgZGVmaW5lIHdpdGggMHg0MDAwMDAwQyAoVFBNX1JIX09XTkVSICwgaSBnb3Qg
dGhlIHNhbWUgcmVzdWx0IGR1cmluZyB0cG0yX252cmVhZCAuIEhlcmUgcmVtb3ZpbmcgJnF1b3Q7
LXQgMHgyMDAwQSZxdW90OyBvcHRpb24gYW5kIHRoZW4gZG9pbmcgbnZkZWZpbmUgYWxzbyB0aHJv
d3MgbWUgdGhlIHNhbWUgZXJyb3Igc2hvd24gaW4gcG9pbnQgMy4zIGR1cmluZyBudnJlYWTCoMKg
PC9iPjwvZm9udD48L2Rpdj48ZGl2PjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46
MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0
aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDti
YWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dy
b3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7
Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2si
PiMuL3RwbTJfbnZkZWZpbmUgLXggMHgxNTAwMDE2IC1hIDB4NDAwMDAwMDEgLXMgMzIgLXQgMHgy
MDAwQTwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNt
IDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFj
a2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91
bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNs
aXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZh
bWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+I8KgIMKg
PC9zcGFuPjwvcD4KCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAw
LjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tn
cm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5k
LXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlw
OmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1p
bHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPjxicj48L3Nw
YW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFw
dDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQt
cG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVh
dDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRp
YWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlm
Ij48Zm9udCBjb2xvcj0iIzAwMDAwMCIgc3R5bGU9IiIgc2l6ZT0iNCI+PGIgc3R5bGU9IiI+My4y
KSBUcmllZCBOVldSSVRFIGluIHRoZSBzYW1lIG9mZnNldCAweDE1MDAwMTXCoCAtIFN1Y2NlZWRl
ZCB3aXRob3V0IGFueSBlcnJvcjwvYj48L2ZvbnQ+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0
eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3Vu
ZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNp
emU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmlu
aXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9u
dC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOnNtYWxsIj4j
IC4vdHBtMl9udndyaXRlIC14CjB4MTUwMDAxNSAtTCB0ZXN0X2hlbGxvd29ybGTCoDwvc3Bhbj48
L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xp
bmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3Np
dGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0Omlu
aXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2
ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJp
LHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpBcmlhbCxIZWx2ZXRpY2Esc2Fu
cy1zZXJpZjtmb250LXNpemU6c21hbGwiPiM8L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwi
IHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dy
b3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5k
LXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2lu
OmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7
Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOnNtYWxs
Ij48YnI+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAw
Y20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDti
YWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dy
b3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQt
Y2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lIj48Zm9udCBzaXplPSI0Ij48YiBz
dHlsZT0iZm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWYiPjMuMykgUmVhZGlu
ZyBiYWNrIHRoZSBzYW1lIG9mZnNldCAteDE1MDAwMTUgLCB3aGljaCB0aHJvd3MgYmVsb3cgZXJy
b3Igc3RhdGluZyBUUE0yX1JDX05WX1VOSU5JVElBTElaRUQuIFNpbmNlIGkgaGF2ZSA8L2I+PGI+
aW5pdGlhbGl6ZWQ8L2I+PGIgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSxzYW5z
LXNlcmlmIj7CoGl0IGFzIHNhaWQgYWJvdmUgcG9pbnQgMy4xwqAgLCB3aGF0IGFtIGkgbWlzc2lu
ZyBoZXJlID/CoDwvYj48L2ZvbnQ+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJn
aW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTpp
bml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlh
bDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFj
a2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjEx
cHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1mYW1p
bHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOnNtYWxsIj48Yj48YnI+PC9i
Pjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAu
MDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dy
b3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQt
cmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6
aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWls
eTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjaztiYWNrZ3JvdW5k
LWNvbG9yOnJnYigyNTUsMjU1LDApIj5CZWxvdyBhcmUgdGhlIE9QVElPTlMgSSBoYXZlIGJ5IHRw
bTJfbnZyZWFkOsKgPC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2lu
OjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5p
dGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7
YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tn
cm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0
O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNr
O2JhY2tncm91bmQtY29sb3I6cmdiKDI1NSwyNTUsMCkiPmFzIHlvdSBzdWdnZXN0ZWTCoCB0byB1
c2UgKDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMt
c2VyaWY7Zm9udC1zaXplOnNtYWxsIj48Yj5lY2hvIGB0cG0yX252cmVhZCAtQyBvIC1zNSAweDE1
MDAwMTU8L2I+YCBjb21tYW5kKTwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWlt
YWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTpp
bml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlh
bDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNp
emU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xv
cjpibGFjaztiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNTUsMjU1LDApIj5JIGNhbnQgc2VlIC1DICh0
aGlzIG1pZ2h0IGJlIGR1ZSB0bzwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2s7YmFja2dy
b3VuZC1jb2xvcjpyZ2IoMCwyNTUsMjU1KSI+IHRvb2xzIHZlcnNpb24gMy5YPC9zcGFuPjxzcGFu
IHN0eWxlPSJjb2xvcjpibGFjaztiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNTUsMjU1LDApIj4gPyAu
IElmIGl0IGlzIG5vdCB0aGUgbGF0ZXN0ICwgY2FuJiMzOTt0IHdlIGFibGUgdG8gdXNlIHRoZSBi
ZWxvdyBBUElzID/CoDwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdp
bjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmlu
aXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFs
O2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNr
Z3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFw
dDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxicj48L3A+PHAgY2xhc3M9Ik1zb05v
cm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDti
YWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tn
cm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1v
cmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNl
bGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFu
IHN0eWxlPSJjb2xvcjpibGFjayI+IyAuL3RwbTJfbnZyZWFkPC9zcGFuPjwvcD48cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9y
bWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7
YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3Jv
dW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWdu
OmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+
PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5Vc2FnZTogdHBtMl9udnJlYWQgWyZsdDtvcHRpb25z
Jmd0O108L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBj
bSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2Jh
Y2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3Jv
dW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1j
bGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1m
YW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPldoZXJl
ICZsdDtvcHRpb25zJmd0OyBhcmU6PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHls
ZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQt
aW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXpl
OmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0
aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQt
c2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImNv
bG9yOmJsYWNrIj7CoMKgwqAgWyAteCB8IC0taW5kZXg9Jmx0O3ZhbHVlJmd0O10KWyAtYSB8IC0t
YXV0aC1oYW5kbGU9Jmx0O3ZhbHVlJmd0O10gWyAtZiB8IC0tb3V0cHV0PSZsdDt2YWx1ZSZndDtd
IFsgLXMgfAotLXNpemU9Jmx0O3ZhbHVlJmd0O108L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFj
a2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3Jv
dW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3Jp
Z2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxp
bmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBz
dHlsZT0iY29sb3I6YmxhY2siPsKgwqDCoCBbIC1vIHwgLS1vZmZzZXQ9Jmx0O3ZhbHVlJmd0O10K
WyAtUCB8IC0taGFuZGxlLXBhc3N3ZD0mbHQ7dmFsdWUmZ3Q7XSBbIC1TIHwKLS1pbnB1dC1zZXNz
aW9uLWhhbmRsZT0mbHQ7dmFsdWUmZ3Q7XSBbIC1MIHwgLS1zZXQtbGlzdD0mbHQ7dmFsdWUmZ3Q7
XTwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAu
MDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dy
b3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQt
cmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6
aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWls
eTpDYWxpYnJpLHNhbnMtc2VyaWYiPgoKCgoKCgoKCgo8L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIg
c3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3Jv
dW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQt
c2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46
aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtm
b250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxl
PSJjb2xvcjpibGFjayI+wqDCoMKgIFsgLUYgfAotLXBjci1pbnB1dC1maWxlPSZsdDt2YWx1ZSZn
dDtdPC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20g
MC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNr
Z3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3Vu
ZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xp
cDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFt
aWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj48YnI+PC9z
cGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAx
cHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5k
LXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBl
YXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0
aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJp
ZiI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrO2JhY2tncm91bmQtY29sb3I6cmdiKDI1NSwyNTUs
MCkiPjxmb250IHNpemU9IjQiPiMgLi90cG0yX252cmVhZCAteCAweDE1MDAwMTUgLWEgMHg0MDAw
MDAwMSAtcyAzMjwvZm9udD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJt
YXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFn
ZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5p
dGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7
YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXpl
OjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6
YmxhY2s7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj5FUlJPUjogRmFpbGVkIHRv
IHJlYWQgTlZSQU0gYXJlYSBhdCBpbmRleCAweDE1MDAwMTUgKDIyMDIwMTE3KS4KRXJyb3I6MHgx
NGE8L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAw
LjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tn
cm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5k
LXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlw
OmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1p
bHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2s7YmFja2dyb3Vu
ZC1jb2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj5FUlJPUjogVW5hYmxlIHRvIHJ1biAuL3RwbTJfbnZy
ZWFkPC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20g
MC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNr
Z3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3Vu
ZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xp
cDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFt
aWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrO2JhY2tncm91
bmQtY29sb3I6cmdiKDI1NSwyNTUsMCkiPjxicj48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFj
a2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3Jv
dW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3Jp
Z2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxp
bmU7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6Ymxh
Y2siPjxmb250IHNpemU9IjQiPiM8c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1
LDI1NSwwKSI+IHRwbTJfcmNfZGVjb2RlIDB4MTRhPC9zcGFuPjwvZm9udD48L3NwYW4+PC9wPjxw
IGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhl
aWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246
aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFs
O2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGlj
YWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5z
LXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2s7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjQ0
LDIwNCwyMDQpIj5lcnJvciBsYXllcjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5
bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5k
LWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6
ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5p
dGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250
LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJj
b2xvcjpibGFjaztiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNDQsMjA0LDIwNCkiPsKgIGhleDogMHgw
PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4w
MDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3Jv
dW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1y
ZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDpp
bml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5
OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrO2JhY2tncm91bmQt
Y29sb3I6cmdiKDI0NCwyMDQsMjA0KSI+wqAgaWRlbnRpZmllcjogVFNTMl9UUE1fUkNfTEFZRVI8
L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAw
MDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91
bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJl
cGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmlu
aXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6
Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2s7YmFja2dyb3VuZC1j
b2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj7CoCBkZXNjcmlwdGlvbjogRXJyb3IgcHJvZHVjZWQKYnkg
dGhlIFRQTTwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20g
MGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7
YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tn
cm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5k
LWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250
LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjaztiYWNr
Z3JvdW5kLWNvbG9yOnJnYigyNDQsMjA0LDIwNCkiPmZvcm1hdCAwIGVycm9yIGNvZGU8L3NwYW4+
PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDts
aW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9z
aXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDpp
bml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7
dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJy
aSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2s7YmFja2dyb3VuZC1jb2xvcjpy
Z2IoMjQ0LDIwNCwyMDQpIj7CoCBoZXg6IDB4NGE8L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFj
a2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3Jv
dW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3Jp
Z2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxp
bmU7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6Ymxh
Y2s7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDE1MywwKSI+PGZvbnQgc2l6ZT0iNCI+wqAgbmFt
ZToKVFBNMl9SQ19OVl9VTklOSVRJQUxJWkVEPC9mb250Pjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1z
b05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1h
bDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2Jh
Y2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3Vu
ZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpi
YXNlbGluZTtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPgoKCgoKCgoKCgoKCgoKCgoK
CgoKCgo8L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAw
MXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3Vu
ZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVw
ZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5p
dGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpD
YWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjaztiYWNrZ3JvdW5kLWNv
bG9yOnJnYigyNDQsMjA0LDIwNCkiPsKgIGRlc2NyaXB0aW9uOiBhbiBOViBJbmRleCBpcwp1c2Vk
IGJlZm9yZSBiZWluZyBpbml0aWFsaXplZCBvciB0aGUgc3RhdGUgc2F2ZWQgYnkgVFBNMl9TaHV0
ZG93bihTVEFURSkgY291bGQKbm90IGJlIHJlc3RvcmVkPC9zcGFuPjwvcD48cCBjbGFzcz0iTXNv
Tm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFs
O2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFj
a2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5k
LW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJh
c2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNw
YW4gc3R5bGU9ImNvbG9yOmJsYWNrIj48Yj48YnI+PC9iPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1z
b05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1h
bDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2Jh
Y2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3Vu
ZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpi
YXNlbGluZTtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xv
cjpibGFjayI+PGIgc3R5bGU9IiI+PGZvbnQgc2l6ZT0iNCI+My40KSBUcmllZCByZWFkaW5nIHRo
ZSBzYW1lIG9mZnNldCAweDE1MDAwMTUgd2l0aG91dCBnaXZpbmcgJiMzOTstYSYjMzk7IChUUE0y
X1JIX09XTkVSKSBhY2Nlc3MgLCBidXQgdGhlIHJlc3VsdHMgc2hvd24gTlZfQVVUSE9SSVpBVElP
Ti4gU28gaSB1bmRlcnN0b29kPC9mb250PjwvYj48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFj
a2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3Jv
dW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3Jp
Z2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxp
bmU7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29sb3I6Ymxh
Y2siPjxiIHN0eWxlPSIiPjxmb250IHNpemU9IjQiPmlmIHdlIGRlZmluZWQgd2l0aCAtYSBhdXRo
IHBlcm1pc3Npb24gdGhlbiB3ZSBuZWVkIHRvIGdpdmUgdGhlIHNhbWUgcGVybWlzc2lvbiB3aGls
ZSByZWFkaW5nIHRoZSBjb250ZW50IGZyb20gdGhlIHNhbWUgb2Zmc2V0LiBJcyBteSB1bmRlcnN0
YW5kaW5nIGlzIGNvcnJlY3QgPzwvZm9udD48L2I+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9y
bWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2Jh
Y2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dy
b3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9y
aWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2Vs
aW5lO2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImNvbG9yOmJs
YWNrIj48YiBzdHlsZT0iIj48Zm9udCBzaXplPSI0Ij48YnI+PC9mb250PjwvYj48L3NwYW4+PC9w
PjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5l
LWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRp
b246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0
aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVy
dGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3Bh
biBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwwKSI+PGZvbnQgc2l6ZT0iNCI+
IyAuL3RwbTJfbnZyZWFkIC14IDB4MTUwMDAxNSAtcyAzMjxicj48L2ZvbnQ+PC9zcGFuPjwvcD48
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1o
ZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9u
OmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlh
bDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRp
Y2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fu
cy1zZXJpZiI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6cmdiKDI0NCwyMDQsMjA0KSI+
RVJST1I6IEZhaWxlZCB0byByZWFkIE5WUkFNIGFyZWEgYXQgaW5kZXggMHgxNTAwMDE1ICgyMjAy
MDExNykuIEVycm9yOjB4MTQ5PGJyPkVSUk9SOiBVbmFibGUgdG8gcnVuIC4vdHBtMl9udnJlYWQ8
YnI+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20g
MC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNr
Z3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3Vu
ZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xp
cDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fu
cy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0O2JhY2tncm91bmQtY29sb3I6cmdi
KDI0NCwyMDQsMjA0KSI+IyB0cG0yX3JjX2RlY29kZSAweDE0OTwvc3Bhbj48YnI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMXB0O2JhY2tncm91bmQtY29sb3I6cmdiKDI0NCwyMDQsMjA0KSI+ZXJy
b3IgbGF5ZXI8L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDtiYWNrZ3JvdW5k
LWNvbG9yOnJnYigyNDQsMjA0LDIwNCkiPsKgIGhleDogMHgwPC9zcGFuPjxicj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExcHQ7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj7CoCBp
ZGVudGlmaWVyOiBUU1MyX1RQTV9SQ19MQVlFUjwvc3Bhbj48YnI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMXB0O2JhY2tncm91bmQtY29sb3I6cmdiKDI0NCwyMDQsMjA0KSI+wqAgZGVzY3JpcHRp
b246IEVycm9yIHByb2R1Y2VkIGJ5IHRoZSBUUE08L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTFwdDtiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNDQsMjA0LDIwNCkiPmZvcm1hdCAwIGVy
cm9yIGNvZGU8L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDtiYWNrZ3JvdW5k
LWNvbG9yOnJnYigyNDQsMjA0LDIwNCkiPsKgIGhleDogMHg0OTwvc3Bhbj48YnI+PHNwYW4gc3R5
bGU9ImJhY2tncm91bmQtY29sb3I6cmdiKDI1NSwxNTMsMCkiPjxmb250IHNpemU9IjQiPsKgIG5h
bWU6IFRQTTJfUkNfTlZfQVVUSE9SSVpBVElPTjxicj48L2ZvbnQ+PC9zcGFuPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTFwdDtiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNDQsMjA0LDIwNCkiPsKgIGRl
c2NyaXB0aW9uOiBOViBhY2Nlc3MgYXV0aG9yaXphdGlvbiBmYWlscyBpbiBjb21tYW5kIGFjdGlv
bnMgKHRoaXMgZmFpbHVyZSBkb2VzIG5vdCBhZmZlY3QgbG9ja291dC5hY3Rpb24pPC9zcGFuPjxi
cj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0
O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1w
b3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0
OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlh
bDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxp
YnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PGJyPjwvc3Bhbj48L3A+
PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUt
aGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlv
bjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRp
YWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0
aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFu
IHN0eWxlPSJjb2xvcjpibGFjaztiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNTUsMjU1LDApIj48YiBz
dHlsZT0iIj48Zm9udCBzaXplPSI0Ij40KSBUcmllZCB0byB1c2UgdHBtMl9yZWFkcHVibGljIHRv
IHJlYWQgYWJvdmUgd3JpdHRlbiBvZmZzZXQgMHgxNTAwMDE1ICwgZ2V0dGluZyAweDE4NCAodmFs
dWUgaXMgb3V0IG9mIHJhbmdlIG9yIGlzIG5vdCBjb3JyZWN0IGZvciB0aGUgY29udGV4dCkgd2hh
dCBhbSBpIG1pc3NpbmcgaGVyZSA/PC9mb250PjwvYj48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29O
b3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7
YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNr
Z3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQt
b3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFz
ZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj4jIC4v
dHBtMl9yZWFkcHVibGljIDxicj5Vc2FnZTogdHBtMl9yZWFkcHVibGljIFsmbHQ7b3B0aW9ucyZn
dDtdPGJyPldoZXJlICZsdDtvcHRpb25zJmd0OyBhcmU6PGJyPsKgIMKgIFsgLUggfCAtLW9iamVj
dD0mbHQ7dmFsdWUmZ3Q7XSBbIC1vIHwgLS1vcHU9Jmx0O3ZhbHVlJmd0O10gWyAtYyB8IC0tY29u
dGV4dC1vYmplY3Q9Jmx0O3ZhbHVlJmd0O10gWyAtZiB8IC0tZm9ybWF0PSZsdDt2YWx1ZSZndDtd
PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDts
aW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9z
aXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDpp
bml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7
dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJy
aSxzYW5zLXNlcmlmIj48YnI+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46
MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0
aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDti
YWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dy
b3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1mYW1pbHk6Q2Fs
aWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1
NSwwKSI+PGZvbnQgc2l6ZT0iNCI+IyAuL3RwbTJfcmVhZHB1YmxpYyAtSCAweDE1MDAwMTU8YnI+
PC9mb250Pjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7YmFja2dyb3VuZC1jb2xv
cjpyZ2IoMjQ0LDIwNCwyMDQpIj5FUlJPUjogVFBNMl9SZWFkUHVibGljIGVycm9yOiBydmFsID0g
MHgxODQ8L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDtiYWNrZ3JvdW5kLWNv
bG9yOnJnYigyNDQsMjA0LDIwNCkiPkVSUk9SOiBVbmFibGUgdG8gcnVuIC4vdHBtMl9yZWFkcHVi
bGljPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7YmFja2dyb3VuZC1jb2xv
cjpyZ2IoMjQ0LDIwNCwyMDQpIj5yb290QG11dGh1LXZiOn4vd29yay90cG0yL3RwbV9ldm8vaW5z
dGFsbC9iaW4jIC4vdHBtMl9yZWFkcHVibGljIC1IIDB4MTUwMDAxNSAtLW9wdSBmaWxlPC9zcGFu
Pjxicj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1
LDE1MywwKSI+RVJST1I6IFRQTTJfUmVhZFB1YmxpYyBlcnJvcjogcnZhbCA9IDB4MTg0PC9zcGFu
Pjxicj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjQ0
LDIwNCwyMDQpIj5FUlJPUjogVW5hYmxlIHRvIHJ1biAuL3RwbTJfcmVhZHB1YmxpYzwvc3Bhbj48
YnI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0O2JhY2tncm91bmQtY29sb3I6cmdiKDI0NCwy
MDQsMjA0KSI+cm9vdEBtdXRodS12Yjp+L3dvcmsvdHBtMi90cG1fZXZvL2luc3RhbGwvYmluIyAu
L3RwbTJfcmNfZGVjb2RlIDB4MTg0PC9zcGFuPjxicj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
cHQ7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj5lcnJvciBsYXllcjwvc3Bhbj48
YnI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0O2JhY2tncm91bmQtY29sb3I6cmdiKDI0NCwy
MDQsMjA0KSI+wqAgaGV4OiAweDA8L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFw
dDtiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNDQsMjA0LDIwNCkiPsKgIGlkZW50aWZpZXI6IFRTUzJf
VFBNX1JDX0xBWUVSPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7YmFja2dy
b3VuZC1jb2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj7CoCBkZXNjcmlwdGlvbjogRXJyb3IgcHJvZHVj
ZWQgYnkgdGhlIFRQTTwvc3Bhbj48YnI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0O2JhY2tn
cm91bmQtY29sb3I6cmdiKDI0NCwyMDQsMjA0KSI+Zm9ybWF0IDEgZXJyb3IgY29kZTwvc3Bhbj48
YnI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0O2JhY2tncm91bmQtY29sb3I6cmdiKDI0NCwy
MDQsMjA0KSI+wqAgaGV4OiAweDA0PC9zcGFuPjxicj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
cHQ7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj7CoCBpZGVudGlmaWVyOiBUUE0y
X1JDX1ZBTFVFPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7YmFja2dyb3Vu
ZC1jb2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj7CoCBkZXNjcmlwdGlvbjogdmFsdWUgaXMgb3V0IG9m
IHJhbmdlIG9yIGlzIG5vdCBjb3JyZWN0IGZvciB0aGUgY29udGV4dDwvc3Bhbj48YnI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMXB0O2JhY2tncm91bmQtY29sb3I6cmdiKDI0NCwyMDQsMjA0KSI+
aGFuZGxlPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7YmFja2dyb3VuZC1j
b2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj7CoCBoZXg6MHgxMDA8L3NwYW4+PGJyPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTFwdDtiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNDQsMjA0LDIwNCkiPsKgIGlk
ZW50aWZpZXI6IMKgVFBNMl9SQ18xPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
cHQ7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjQ0LDIwNCwyMDQpIj7CoCBkZXNjcmlwdGlvbjogwqAo
bnVsbCk8L3NwYW4+PGJyPjxicj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdp
bjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmlu
aXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFs
O2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNr
Z3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFw
dDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPiPCoDxzcGFuIHN0eWxlPSJjb2xvcjpi
bGFjayI+PGJyPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjow
Y20gMGNtIDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRp
YWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2Jh
Y2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3Jv
dW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtm
b250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+
PGJyPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNt
IDAuMDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFj
a2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91
bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNs
aXA6aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LWZhbWlseTpDYWxpYnJpLHNh
bnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PGIgc3R5bGU9IiI+PGZvbnQgc2l6
ZT0iNCI+NSlUcmllZCByZWxlYXNpbmcgdGhlIHNhbWUgb2Zmc2V0IHVzaW5nIG52cmVsZWFzZSB0
aGF0wqB0b28gd29ya3MgZmluZTwvZm9udD48L2I+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9y
bWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2Jh
Y2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dy
b3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9y
aWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2Vs
aW5lO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4g
c3R5bGU9ImNvbG9yOmJsYWNrIj4jLi90cG0yX252cmVsZWFzZSAteAoweDE1MDAwMTUgLWEgMHg0
MDAwMDAwMTwvc3Bhbj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBj
bSAwY20gMC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlh
bDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFj
a2dyb3VuZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91
bmQtY2xpcDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtc2l6ZToxMXB0O2Zv
bnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4j
PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4w
MDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3Jv
dW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1y
ZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDpp
bml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1z
ZXJpZiI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj48Zm9udCBzaXplPSI0Ij48YnI+PC9mb250
Pjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAu
MDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dy
b3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQt
cmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6
aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMt
c2VyaWYiPjxmb250IGNvbG9yPSIjMDAwMDAwIiBzaXplPSI0Ij5BcyBwZXIgbXkgcmVxdWVzdCBy
YWlzZWQgYnkgeWVzdGVyZGF5IC4gSSBuZWVkIHRvIGRlZmluZSBhbiBvZmZzZXQgaW4gbnYgcmFt
wqB0aGVuIHdyaXRlIGNvbnRlbnQgb25seSBvbmNlIGFuZCByZWFkIGl0IGJhY2sgd2hlbiBldmVy
wqByZXF1aXJlZC7CoCBEdXJpbmcgZXZlcnkgc2Vjb25kIHdyaXRlICwgaSBuZWVkIHRvIHJlYWQg
dGhlIG9mZnNldCAoeW91IHN1Z2dlc3RlZCB0byB1c2UgdHBtMl9udnJlYWRwdWJpYygpICwgYnV0
IGkgc3RydWNrIHdpdGggdXNhZ2Ugb2YgdGhpcyAmcXVvdDtudnJlYWQgcHVibGljIGFwaSZxdW90
OyBjb21tYW5kIGFzIHdlbGwgKHJlc3VsdHMgYXJlIGp1c3Qgc2hvd24gYWJvdmUpPC9mb250Pjwv
cD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGlu
ZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0
aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5p
dGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3Zl
cnRpY2FsLWFsaWduOmJhc2VsaW5lO2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PGZv
bnQgY29sb3I9IiMwMDAwMDAiIHNpemU9IjQiPjxicj48L2ZvbnQ+PC9wPjxwIGNsYXNzPSJNc29O
b3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7
YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNr
Z3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQt
b3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFz
ZWxpbmUiPjxmb250IGNvbG9yPSIjMDAwMDAwIiBzdHlsZT0iIiBzaXplPSI0Ij48Zm9udCBmYWNl
PSJDYWxpYnJpLCBzYW5zLXNlcmlmIj5BcyBwZXIgPC9mb250PnRvZGF5JiMzOTtzPGZvbnQgZmFj
ZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiI+IGV4cGVyaW1lbnRzICwgPC9mb250PmkgY2FudDxmb250
IGZhY2U9IkNhbGlicmksIHNhbnMtc2VyaWYiPiBhYmxlIGFibGUgdG8gYWNoaWV2ZcKgdGhlIChu
dnJlYWQpIHVzaW5nIGNvbW1hbmQgbGluZSBBUEkgLiBMZXQgbWUga25vdyB3aGF0IGFtIDwvZm9u
dD5pIG1pc3Npbmc8Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIj4gaGVyZSAuwqA8L2Zv
bnQ+PC9mb250PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20g
MC4wMDAxcHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNr
Z3JvdW5kLXBvc2l0aW9uOmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3Vu
ZC1yZXBlYXQ6aW5pdGlhbDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xp
cDppbml0aWFsO3ZlcnRpY2FsLWFsaWduOmJhc2VsaW5lIj48Zm9udCBjb2xvcj0iIzAwMDAwMCIg
c3R5bGU9IiI+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc2l6ZT0iNCI+PGJyPjwv
Zm9udD48L2ZvbnQ+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBj
bSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2Jh
Y2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3Jv
dW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1j
bGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmUiPjxmb250IGNvbG9yPSIjMDAwMDAw
IiBzdHlsZT0iIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzaXplPSI0Ij5Mb29r
aW5nIGZvcndhcmQgZm9yIHlvdXIgdmFsdWFibGUgcmVwbHkuPC9mb250PjwvZm9udD48L3A+PHAg
Y2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVp
Z2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjpp
bml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7
YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNh
bC1hbGlnbjpiYXNlbGluZSI+PGZvbnQgY29sb3I9IiMwMDAwMDAiIHN0eWxlPSIiPjxmb250IGZh
Y2U9IkNhbGlicmksIHNhbnMtc2VyaWYiIHNpemU9IjQiPjxicj48L2ZvbnQ+PC9mb250PjwvcD48
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7bGluZS1o
ZWlnaHQ6bm9ybWFsO2JhY2tncm91bmQtaW1hZ2U6aW5pdGlhbDtiYWNrZ3JvdW5kLXBvc2l0aW9u
OmluaXRpYWw7YmFja2dyb3VuZC1zaXplOmluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlh
bDtiYWNrZ3JvdW5kLW9yaWdpbjppbml0aWFsO2JhY2tncm91bmQtY2xpcDppbml0aWFsO3ZlcnRp
Y2FsLWFsaWduOmJhc2VsaW5lIj48Zm9udCBjb2xvcj0iIzAwMDAwMCIgc3R5bGU9IiI+PGZvbnQg
ZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc2l6ZT0iNCI+VGhhbmtzLDwvZm9udD48L2ZvbnQ+
PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDts
aW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9z
aXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDpp
bml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7
dmVydGljYWwtYWxpZ246YmFzZWxpbmUiPjxmb250IGNvbG9yPSIjMDAwMDAwIiBzdHlsZT0iIj48
Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzaXplPSI0Ij5NdXRodWt1bWFyPC9mb250
PjwvZm9udD48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAu
MDAwMXB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dy
b3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQt
cmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6
aW5pdGlhbDt2ZXJ0aWNhbC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWls
eTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxicj48L3A+PC9kaXY+PGRpdj48Yj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExcHQ7bGluZS1oZWlnaHQ6MTA3JTtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMt
c2VyaWYiPjxicj48L3NwYW4+PC9iPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9x
dW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFRodSwgTWF5IDE0LCAy
MDIwIGF0IDEyOjUxIEFNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndp
bGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9h
PiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIw
NCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4mZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tPGJyPgomZ3Q7IEZyb206IDxhIGhyZWY9Im1haWx0bzptdXRodS5zbWtAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+bXV0aHUuc21rQGdtYWlsLmNvbTwvYT4gW21haWx0bzo8YSBocmVmPSJt
YWlsdG86bXV0aHUuc21rQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm11dGh1LnNta0BnbWFp
bC5jb208L2E+XTxicj4KJmd0OyBTZW50OiBXZWRuZXNkYXksIE1heSAxMywgMjAyMCAxMjo1MSBQ
TTxicj4KJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9
Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFt0cG0yXSBO
VlJBTSBXcml0ZSBhbmQgUmVhZCB1c2luZyBFc3lzIEFQSShzKTxicj4KJmd0OyA8YnI+CiZndDsg
SGkgV2lsbGlhbXMsPGJyPgomZ3Q7IDxicj4KJmd0OyBJIGFtIHVzaW5nIHRoZSB0ZXN0IGNvZGUg
dXNlZCB0byByZWFkIGFuZCB3cml0ZSBpbiB0byBOViByYW0uwqAgSSBhbSBmYWNpbmcgYmVsb3c8
YnI+CiZndDsgY2hhbGxlbmdlcyBpZiBpIHRyaWVkIHRvIHJlYWQgYWxyZWFkeSB3cml0dGVuIGRh
dGEgZnJvbSBOVlJBTS48YnI+CiZndDsgPGJyPgomZ3Q7IDEpIFRlc3QgY29kZSBhdHRhY2hlZCBk
ZWZpbmVkIGNyZWF0ZSB0aGUgY29udGV4dCAoZWN0eCkgLCBjcmVhdGUgcmFuZG9tIG51bWJlciAs
PGJyPgomZ3Q7IGRlZmluZSBOViByYW0gLCB3cml0ZSB0aGUgcmFuZG9tIG51bWJlciBpbiB0byBO
VlJBTSAob2Zmc2V0IDB4MTAwMDAwMSkgYW5kPGJyPgomZ3Q7IHJlYWQgaXQgYmFjayBmcm9tIE5W
IFJhbSAoZnJvbSBzYW1lIG9mZnNldCAweDEwMDAwMDEpPGJyPgomZ3Q7IDxicj4KJmd0OyAyKSBC
dXQgaWYgaSB0cnkgdG8gcnVuIHRoaXMgY29kZSB0d2ljZSBvciB0aHJpc2UgLCBhbSBnZXR0aW5n
IGJlbG93IE5WUkFNIGFscmVhZHk8YnI+CiZndDsgZGVmaW5lZCByYyBjb2RlLiBJIGNhbiB1bmRl
cnN0YW5kIHRoYXQgd2Ugc2hvdWxkIG5vdCBkZWZpbmVkIHRoZSBudiByYW0gc3BhY2U8YnI+CiZn
dDsgd2hpY2ggYWxyZWFkeSBkZWZpbmVkIGFuZCB1c2VkLjxicj4KJmd0OyBIb3cgdG8gYXZvaWQg
dGhpcyA/IGJ5IGRlZmluaW5nIG52cmFtIE9OTFkgb25jZSBhbmQgd3JpdGUgaXQgT05MWSBvbmNl
IGFuZDxicj4KJmd0OyBmaW5hbGx5IHJlYWQgaXQgQVMgTVVDSCB0aW1lcyB3ZSB3YW50ID/CoCBC
ZWxvdyBkZXRhaWxzIGFyZSByZWxhdGVkIHRvIHRoaXMgcmVxdWVzdDxicj4KPGJyPgpZb3UgY2Fu
IGNhbGwgRXN5c19HZXRDYXBhYmlsaXR5KCkgYW5kIHNlZSB3aGF0IE5WIGluZGljZXMgYXJlIGRl
ZmluZWQuIFRoZSBjb21tYW5kPGJyPgpMaW5lIHRvb2wgdHBtMl9nZXRjYXAgZG9lcyB0aGlzLCBs
aWtlIHNvOjxicj4KdHBtMl9nZXRjYXAgaGFuZGxlcy1udi1pbmRleDxicj4KPGJyPgpZb3UgY2Fu
IHVzZSB0aGF0IHRvb2wgYXMgYW4gZXhhbXBsZSBvZiBob3cgdG8gZG8gaXQuPGJyPgo8YnI+CiZn
dDsgPGJyPgomZ3Q7IEVycm9yIGNvZGU6PGJyPgomZ3Q7IDB4MDAwMDAxNGMgLSBkZXNjcmlwdGlv
bjogTlYgSW5kZXggb3IgcGVyc2lzdGVuZCBvYmplY3QgYWxyZWFkeSBkZWZpbmVkPGJyPgomZ3Q7
IDB4MDAwMDAyODQgLSBkZXNjcmlwdGlvbjogdmFsdWUgaXMgb3V0IG9mIHJhbmdlIG9yIGlzIG5v
dCBjb3JyZWN0IGZvciB0aGUgY29udGV4dDxicj4KJmd0OyA8YnI+CiZndDsgMykgUXVlcnkgaXMg
OiBpcyBpdCBwb3NzaWJsZSB0byBkZWZpbmUgbnZyYW0gJnF1b3Q7T05MWSBPTkNFJnF1b3Q7IHdp
dGggdGhlIEFQSSBzaGFyZWQgdGhlPGJyPgomZ3Q7IHRlc3QgY29kZSBhbmQgdGhlbiBjcmVhdGUg
YSBmdW5jdGlvbiAmcXVvdDtjcmVhdGVyYW5kb20mcXVvdDsgbnVtYmVyIHRvIHVzZSB0aGUgc2Ft
ZTxicj4KPGJyPgpDYWxsIGdldGNhcCwgc2VlIGlmIGl0JiMzOTtzIGRlZmluZWQsIGlmIGRlZmlu
ZWQsIGRvbiYjMzk7dCBkZWZpbmUgaXQuLi4uPGJyPgo8YnI+CiZndDsgY29udGV4dCAoZWN0cykg
dG8gZ2VuZXJhdGUgcmFuZHVtbnVtYmVyIHRoZW4gY2FsbCBzZXBhcmF0ZSAmcXVvdDt3cml0ZV9u
dnJhbSZxdW90Ozxicj4KJmd0OyBmdW5jdGlvbiB3aXRoIHJhbmRvbSBudW1iZXIgYXMgaW5wdXQg
YW5kIGFzayB0byB3cml0ZSBpbiB0aGUgc2FtZSBvZmZzZXQgLjxicj4KJmd0OyBGaW5hbGx5IGNh
bGxpbmcgYW5vdGhlciBmdW5jdGlvbiAmcXVvdDtyZWFkX252cmFtJnF1b3Q7IHRvIHJlYWQgaXQg
YmFjayBmcm9tIHRoZSBzYW1lPGJyPgomZ3Q7IG52cmFtJiMzOTtzIG9mZnNldCB3aGVuIGV2ZXIg
d2Ugd2FudCA/IGkgdHJpZWQgdGhpcyBhcHByb2FjaCBidXQgYW0gZ2V0dGluZyBzZWdmYXVsdDxi
cj4KJmd0OyB3aXRoIGFib3ZlIGVycm9yIC48YnI+CiZndDsgV2hhdCBhbSBpIG1pc3NpbmcgaGVy
ZSA/PGJyPgo8YnI+ClNlZ2ZhdWx0cyBhcmUgbGlrZWx5IHlvdXIgY29kZSBpcyBqdXN0IGJyb2tl
bi48YnI+Cjxicj4KJmd0OyA8YnI+CiZndDsgMy4xKSBJZGVhbGx5IGluIHNpbmdsZSBhcHBsaWNh
dGlvbiAsIGkgbmVlZCB0byBhY2hpZXZlICZxdW90O3RwbTJfbnZkZWZpbmUmcXVvdDssPGJyPgom
Z3Q7ICZxdW90O3RwbTJfbnZ3cml0ZSZxdW90OyBhbmQgJnF1b3Q7dHBtMl9udnJlYWQoKSB0b29s
cyBBUEkocykgZnVuY3Rpb25hbGl0eSZxdW90OyBpbiBkaWZmZXJlbnQgY2FsbHM8YnI+CiZndDsg
b3IgZmxvdy48YnI+CiZndDsgMy4yKSBBbHNvIGhvdyB0byBjaGVjayB3aGV0aGVyICZxdW90O3dy
aXRlJnF1b3Q7IGFscmVhZHkgZG9uZSAoaSB0cmllZCBjaGVja2luZyBudl9pbmRleCBpczxicj4K
Jmd0OyB0cnVlIC0gbWVhbnMgd2hldGhlciBpdCBhbHJlYWR5IGhhcyBzb21lIHZhbHVlKSAsIGJ1
dCBpdCBmYWlsZWQgPzxicj4KPGJyPgpJZiB5b3UgZG8gd2hhdCB0aGUgdG9vbCB0cG0yX252cmVh
ZHB1YmxpYyBkb2VzLCB5b3UgY2FuIGNoZWNrIGZvciB0aGUgd3JpdHRlbiBiaXQuPGJyPgo8YnI+
CiZndDsgPGJyPgomZ3Q7IDQpIEFsc28gaG93IHRvIGNoZWNrIHdoYXQgd2FzIHRoZSBjb250ZW50
IHRoYXQgYWxyZWFkeSBwcmVzZW50IGluIHRoZSBudnJhbTxicj4KJmd0OyBvZmZzZXQgKDB4MTAw
MDAwMSkgYmVmb3JlIGkgZG8gd3JpdGUgdGhlICZxdW90O3JhbmRvbSBudW1iZXImcXVvdDsgc2Vj
b25kIHRpbWUgaW4gdG8gdGhlPGJyPgomZ3Q7IHNhbWUgb2Zmc2V0ID8gdGhpcyBpcyB0byBlbnN1
cmUgdGhlICZxdW90O3JhbmRvbSBudW1iZXImcXVvdDsgdGhhdCBpIGFtIHBsYW5uaW5nIHRvIHdy
aXRlPGJyPgomZ3Q7IHdhcyB2YWxpZCBvbmUgPzxicj4KPGJyPgpSZWFkIGl0IG91dCwgaWYgaXQm
IzM5O3Mgbm90IHdoYXQgeW91IHdhbnQsIHdyaXRlIGl0Ljxicj4KPGJyPgomZ3Q7IDxicj4KJmd0
OyBJIHJlbWVtYmVyIHN0dWR5aW5nIHRoYXQsIG9uY2UgdSB3cml0ZSBpbiB0byBOVlJBTSBvZmZz
ZXQgLCB3ZSBjYW50IGFibGUgdG8gUkUtPGJyPgomZ3Q7IFdSSVRFIGl0IGluIHRoZSBzYW1lIG9m
ZnNldCgweDEwMDAwMDEpLiBXaGV0aGVyIHRoYXQgaXMgdGhlIHNhbWUgY2FzZSBmb3I8YnI+CiZn
dDsgU0lNVUxBVE9SIGFzIHdlbGwgKG9yKSB0aGlzIGZlYXR1cmUgaXMgb25seSBmb3IgcmVhbCB0
cG0gaGFyZHdhcmU/PGJyPgo8YnI+Ck5vIGdlbmVyYWxseSB5b3UgY2FuIHdyaXRlIGFzIG1hbnkg
dGltZXMgYXMgeW91IHdhbnQuLi4gdGhlcmUgYXJlIHRyaWNrcyB5b3UgY2FuIGRvIHRvIG1ha2U8
YnI+Ckl0IGxvY2tlZCBhZnRlciB3cml0ZSAod3JpdGVsb2NrZWQgaWlyYyk8YnI+Cjxicj4KQmVs
b3cgaXMgYSBjb21tYW5kIGxpbmUgZXhhbXBsZSBvZiBkb2luZyBpdC4uLjxicj4KPGJyPgp0cG0y
X252ZGVmaW5lIDxicj4KbnYtaW5kZXg6IDB4MTAwMDAwMDxicj4KPGJyPgp0cG0yX252cmVhZHB1
YmxpYyAweDEwMDAwMDA8YnI+CjB4MTAwMDAwMDo8YnI+CsKgIG5hbWU6IDAwMGIxMTk1ZjM2YTIx
YzgyMTkwNTVhZDA4MDNjMzllN2U4MWQwNmNkYjJlZWUyYjdjZjkzZGQ4M2UwMWQ0MjczODI4PGJy
PgrCoCBoYXNoIGFsZ29yaXRobTo8YnI+CsKgIMKgIGZyaWVuZGx5OiBzaGEyNTY8YnI+CsKgIMKg
IHZhbHVlOiAweEI8YnI+CsKgIGF0dHJpYnV0ZXM6PGJyPgrCoCDCoCBmcmllbmRseTogb3duZXJ3
cml0ZXxhdXRod3JpdGV8b3duZXJyZWFkfGF1dGhyZWFkPGJyPgrCoCDCoCB2YWx1ZTogMHg2MDAw
NjAwPGJyPgrCoCBzaXplOiAyMDQ4PGJyPgo8YnI+CiMgeW91IGNhbiBkbyB0aGlzIGFzIG11Y2gg
YXMgeW91IHdhbnQsIGJ1dCBpdCBjYW4gd2VhciB0aGUgbWVtb3J5IGluIHRoZSBUUE08YnI+CiMg
ZGVwZW5kaW5nIG9uIG1lbW9yeSB0ZWNobm9sb2d5IHRoZSB2ZW5kb3IgdXNlZC48YnI+CmVjaG8g
JnF1b3Q7aGVsbG8mcXVvdDsgfCB0cG0yX252d3JpdGUgLUMgbyAweDEwMDAwMDAgLWktPGJyPgpl
Y2hvIGB0cG0yX252cmVhZCAtQyBvIC1zNSAweDEwMDAwMDBgPGJyPgpoZWxsbzxicj4KPGJyPgp0
cG0yX252cmVhZHB1YmxpYyAweDEwMDAwMDA8YnI+CjB4MTAwMDAwMDo8YnI+CsKgIG5hbWU6IDAw
MGIyODdjOWIxYjA2ZmFiNmU1MWJkMjZlOThlYTg5NDYwNTc0ZTk3YTNkMmVmOTk1ZWIzNWY3ZTIz
ZGI3ZTk0ZjY3PGJyPgrCoCBoYXNoIGFsZ29yaXRobTo8YnI+CsKgIMKgIGZyaWVuZGx5OiBzaGEy
NTY8YnI+CsKgIMKgIHZhbHVlOiAweEI8YnI+CsKgIGF0dHJpYnV0ZXM6PGJyPgrCoCDCoCBmcmll
bmRseTogb3duZXJ3cml0ZXxhdXRod3JpdGV8b3duZXJyZWFkfGF1dGhyZWFkfHdyaXR0ZW48YnI+
CsKgIMKgIHZhbHVlOiAweDYwMDA2MjA8YnI+CsKgIHNpemU6IDIwNDg8YnI+Cjxicj4KJmd0OyA8
YnI+CiZndDsgNilBZnRlciBudndyaXRlIGkgdHJpZWQgdG8gdXNlICZxdW90O3RwbTJfcGNybGlz
dCZxdW90OyBjb21tYW5kIGxpbmUgdG9vbCBhcHBsaWNhdGlvbiwgYnk8YnI+CiZndDsgd2hpY2gg
aXQgc2hvd3MgdGhlIG52IHJhbSBtZW1vcnkgbG9jYXRpb24gLCB0cmllZCB1c2luZyB0cG0yX252
cmVhZCAoKSB0byByZWFkPGJyPgomZ3Q7IHRoZSBjb250ZW50IGJ1dCBpIGNvdWxkIG5vdCBhYmxl
IHRvIHNlZSBhbnkgZGF0YSAocmFuZG9tIG51bWJlcikgdGhhdCBpIHVzZWQgdG88YnI+CiZndDsg
d3JpdGUgdmlhIHRoaXMgdGVzdCBhcHBsaWNhdGlvbiAuIGRvbnQga25vdyB3aHkgPzxicj4KPGJy
Pgp0cG0yX3Bjcmxpc3QgaXMgbm90IGZvciBOVnMuLi4uIHlvdSB3YW50Ojxicj4KdHBtMl9nZXRj
YXAgaGFuZGxlcy1udi1pbmRleDxicj4KPGJyPgomZ3Q7IDxicj4KJmd0OyA3KSBBZnRlciBpIG1h
bnVhbGx5IHJhbiB0aGUgYmVsb3cgY2xlYXIgQVBJICwgbm93IHRoZSB0ZXN0IGNvZGUgaXMgd29y
a2luZyBmaW5lPGJyPgomZ3Q7IChyZWZlciBUZXN0IGNvZGUgbG9nIHNob3duIGJlbG93Li4pLiBU
aGlzIGNvbmZpcm1zIHdlIGNhbiByZWFsbG9jYXRlIGFscmVhZHk8YnI+CiZndDsgZGVmaW5lZCBu
diByYW0gbWVtb3J5Ljxicj4KJmd0OyAjdHBtMl9udnJlbGVhc2UgLXggMHgxMDAwMDAxIC1hIDB4
NDAwMDAwMDE8YnI+Cjxicj4KVHBtMl9jbGVhciB3aWxsIGNsZWFyIHRoZSBvd25lciBoaWVyYXJj
aHksIGluY2x1ZGluZyBOViByYW0gb2JqZWN0cyBkZWNsYXJlZCBpbiB0aGF0IGhpZXJhcmNoeSw8
YnI+CnNvIGRlZmluZSB3aWxsIHdvcmsgYWdhaW4sIGJlY2F1c2UgeW91IGRlbGV0ZWQgaXQuPGJy
Pgo8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA4KUlmIGkgdHJ5IHRvIHJlYWQgaXQgbWFu
dWFsbHkgdmlhIGJlbG93IHRwbTJfbnZyZWFkIGNvbW1hbmQgd2l0aCBvZmZzZXQ8YnI+CiZndDsg
MHgxMDAwMDAxIGFtIGdldHRpbmcgYmVsb3cgZXJyb3I8YnI+CiZndDsgPGJyPgomZ3Q7ICN0cG0y
X252cmVhZCAteCAweDEwMDAwMDEgLWEgMHg0MDAwMDAwMSAtbyAwIC1zIDIwPGJyPgomZ3Q7IEVS
Uk9SOiBGYWlsZWQgdG8gcmVhZCBOVlJBTSBwdWJsaWMgYXJlYSBhdCBpbmRleCAweDEwMDAwMDEg
KDE2Nzc3MjE3KS48YnI+CiZndDsgRXJyb3I6MHgxOGI8YnI+CiZndDsgRVJST1I6IFVuYWJsZSB0
byBydW4gdHBtMl9udnJlYWQ8YnI+CiZndDsgPGJyPgomZ3Q7IC8qIFRyaWVkIHRvIHVzZSBiZWxv
dyB0b29scyBjb21tYW5kICwgYW0gYWx3YXlzIGdldHRpbmcgdGhlIHNhbWUgZXJyb3IgZXZlbiBp
Zjxicj4KJmd0OyB3ZSBnaXZlIHRoZSBkaWZmZXJlbnQgbnZyYW0gb2ZmIHNldCB0cG0yX252d3Jp
dGUgLXggMHgxYzAwMDAyIGhlbGxvd29ybGQ8YnI+CiZndDsgRVJST1I6IFJlYWRpbmcgdGhlIHB1
YmxpYyBwYXJ0IG9mIHRoZSBudiBpbmRleCBmYWlsZWQgd2l0aDogMHgxOGI8YnI+CiZndDsgRVJS
T1I6IFVuYWJsZSB0byBydW4gdHBtMl9udndyaXRlPGJyPgomZ3Q7IDxicj4KJmd0OyB0cG0yX252
d3JpdGUgLXggMHgxYzAwMDEyIC1hIDB4NDAwMDAwMDEgaGVsbG93b3JsZDxicj4KJmd0OyBFUlJP
UjogUmVhZGluZyB0aGUgcHVibGljIHBhcnQgb2YgdGhlIG52IGluZGV4IGZhaWxlZCB3aXRoOiAw
eDE4Yjxicj4KJmd0OyBFUlJPUjogVW5hYmxlIHRvIHJ1biB0cG0yX252d3JpdGU8YnI+CiZndDsg
PGJyPgomZ3Q7IDxicj4KJmd0OyAvKiBUcnkgdG8gcmVhZCB0aGUgbnZsaXN0IG9mIFNJTSAsIGl0
IHJldHVybnMgbm90aGluZyAhISE8YnI+CiZndDsgI3RwbTJfbnZsaXN0ICZsdDtyZXR1cm5zIG5v
dGhpbmcmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyBBbnkgcG9pbnRzIHdpbGwgYmUgZ3JlYXQgaGVs
cCBmb3IgbWUuPGJyPgomZ3Q7IDxicj4KJmd0OyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS08YnI+CiZndDsgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08YnI+CiZndDsgVGVzdCBjb2RlIGxvZyBhZnRl
ciBhYm92ZSAmcXVvdDt0cG0yX252cmVsZWFzZSZxdW90Ozo8YnI+CiZndDsgSW5pdGlhbGl6aW5n
PGJyPgomZ3Q7IGluaXRfcmFuZCgpPGJyPgomZ3Q7IGluaXRfcnNhKCk8YnI+CiZndDsgaW5pdF9l
Y2MoKTxicj4KJmd0OyBFbmdpbmUgbmFtZTogVFBNMi1UU1MgZW5naW5lIGZvciBPcGVuU1NMPGJy
PgomZ3Q7IEluaXQgcmVzdWx0OiAxPGJyPgomZ3Q7IFNldHRpbmcgb3duZXIgYXV0aCB0byBlbXB0
eSBhdXRoLjxicj4KJmd0OyBTZXR0aW5nIHBhcmVudCBhdXRoIHRvIGVtcHR5IGF1dGguPGJyPgom
Z3Q7IEVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpLWRldmljZS5jOjQ0MDpUc3MyX1RjdGlf
RGV2aWNlX0luaXQoKSBGYWlsZWQgdG8gb3Blbjxicj4KJmd0OyBkZXZpY2UgZmlsZSAvZGV2L3Rw
bTA6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnk8YnI+CiZndDsgV0FSTklORzp0Y3RpOnNyYy90
c3MyLXRjdGkvdGN0aWxkci5jOjYyOnRjdGlfZnJvbV9pbml0KCkgVENUSSBpbml0IGZvciBmdW5j
dGlvbjxicj4KJmd0OyAweDdmYzY3Mzc2ZDE4YiBmYWlsZWQgd2l0aCBhMDAwYTxicj4KJmd0OyBX
QVJOSU5HOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLmM6OTI6dGN0aV9mcm9tX2luZm8oKSBD
b3VsZCBub3QgaW5pdGlhbGl6ZSBUQ1RJPGJyPgomZ3Q7IG5hbWVkOiB0Y3RpLWRldmljZTxicj4K
Jmd0OyBFUlJPUjp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aWxkci1kbC5jOjE1MDp0Y3RpX2Zyb21f
ZmlsZSgpIENvdWxkIG5vdCBpbml0aWFsaXplIFRDVEk8YnI+CiZndDsgZmlsZTogbGlidHNzMi10
Y3RpLWRlZmF1bHQuc288YnI+CiZndDvCoCBObyBvZiBieXRlcyB3cml0dGVuIGJ5IEdlblJhbmRv
bSA6IDY0PGJyPgomZ3Q7IGI2YzllMWQwMjhmMmM4OTNjNTZhMDg5MTY1ZjlmMzhjMDkyMzIxODBi
YTViYjY2YjM1YzU2NTJjYjUxYWI2MWIyMzdlY2ZlPGJyPgomZ3Q7IDhlY2U1ZDdmMTRhMzMyM2Zl
ZTFkY2EwZTY0MWEwZjIwYzc2ODkxMDBlM2M4MDRiODJkNmEyNDk3Zjxicj4KJmd0OyBDcmVhdGVk
IE5WIEluZGV4OiAweDEwMDAwMDE8YnI+CiZndDsgRVNZU19UUjogMHg0MTgzNjc8YnI+CiZndDsg
RVNZU19UUjI6IDB4NDE4MzY4PGJyPgomZ3Q7IFdyaXRpbmcgdGhlIHJhbmRvbSBudW1iZXIgd3Jp
dHRlbiBpbiBOViBSYW08YnI+CiZndDsgRGF0YSBidWZmZXIgc2l6ZSB1c2VkIHRvIHdyaXRlIGlu
dG8gTlZSYW06IDY0PGJyPgomZ3Q7IFJlYWRpbmcgdGhlIHJhbmRvbSBudW1iZXIgd3JpdHRlbiBp
biBOViBSYW08YnI+CiZndDsgYjZjOWUxZDAyOGYyYzg5M2M1NmEwODkxNjVmOWYzOGMwOTIzMjE4
MGJhNWJiNjZiMzVjNTY1MmNiNTFhYjYxYjIzN2VjZmU8YnI+CiZndDsgOGVjZTVkN2YxNGEzMzIz
ZmVlMWRjYTBlNjQxYTBmMjBjNzY4OTEwMGUzYzgwNGI4MmQ2YTI0OTdmPGJyPgomZ3Q7ICoqKiBT
VUNDRVNTICoqKjxicj4KJmd0OyAtLS0tLS0tLS0tLS0tLS0tLS0tLS08YnI+CiZndDsgPGJyPgom
Z3Q7IFRFU1QgQ09ERSA6PGJyPgomZ3Q7IDxicj4KJmd0OyBpbnQgbnZfd3JpdGVfcmVhZCgpPGJy
PgomZ3Q7IHs8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBFU1lTX0NPTlRFWFQgKmVjdHgg
PSBOVUxMOzxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoEVTWVNfVFIgbnZfaW5kZXggPSAw
Ozxicj4KJmd0O8KgIMKgIMKgIMKgRVNZU19UUiBudl9pbmRleDIgPSAwOzxicj4KJmd0OyA8YnI+
CiZndDvCoCDCoCDCoCDCoCBpbnQgcmMgPSAxOzxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7
wqAgwqAgwqAgwqAvKjxicj4KJmd0O8KgIMKgIMKgIMKgICogY3JlYXRlIGEgY29ubmVjdGlvbiB0
byB0aGUgVFBNIGxldHRpbmcgRVNBUEkgY2hvb3NlIGhvdyB0byBnZXQgdGhlcmUuPGJyPgomZ3Q7
wqAgwqAgwqAgwqAgKiBJZiB5b3UgbmVlZCBtb3JlIGNvbnRyb2wsIHlvdSBjYW4gdXNlIHRjdGkg
YW5kIHRjdGktbGRyIGxpYnJhcmllcyB0bzxicj4KJmd0O8KgIMKgIMKgIMKgICogZ2V0IGEgVENU
SSBwb2ludGVyIHRvIHVzZSBmb3IgdGhlIHRjdGkgYXJndW1lbnQgb2YgRXN5c19Jbml0aWFsaXpl
Ljxicj4KJmd0O8KgIMKgIMKgIMKgICovPGJyPgomZ3Q7wqAgwqAgwqAgwqByYyA9IEVzeXNfSW5p
dGlhbGl6ZSgmYW1wO2VjdHgsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBOVUxMLMKgIC8vIGxldCBpdCBmaW5kIHRoZSBUQ1RJPGJyPgomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBOVUxMKTsgLy8gVXNlIHdoYXRldmVyIEFCSTxicj4KJmd0
O8KgIMKgIMKgIMKgaWYgKHJjICE9IFRTUzJfUkNfU1VDQ0VTUykgezxicj4KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcHJpbnRmKCZxdW90O0VzeXNfSW5pdGlhbGl6ZSBGYWlsZWQ6IDB4JXhc
biZxdW90OywgcmMpOzxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIDE7PGJy
PgomZ3Q7wqAgwqAgwqAgwqB9PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDC
oCDCoHJjID0gRXN5c19HZXRSYW5kb20oZWN0eCw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJfTk9ORSwgRVNZU19UUl9OT05FLCBFU1lTX1RSX05P
TkUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA2NCwgJmFt
cDtieXRlcyk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBpZiAocmMgIT0gVFNTMl9SQ19TVUNDRVNT
KSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7RXN5c19H
ZXRSYW5kb20gRmFpbGVkOiAlc1xuJnF1b3Q7LCBUc3MyX1JDX0RlY29kZShyYykpOzxicj4KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZXhpdCgxKTs8YnI+CiZndDvCoCDCoCDCoCDCoCDC
oH08YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7IE5vIG9mIGJ5dGVz
IHdyaXR0ZW4gYnkgR2VuUmFuZG9tIDogJWRcbiZxdW90OyxieXRlcy0mZ3Q7c2l6ZSk7PGJyPgom
Z3Q7wqAgwqAgwqAgwqBzaXplX3QgaTs8YnI+CiZndDvCoCDCoCDCoCDCoGZvciAoaSA9IDA7IGkg
Jmx0OyBieXRlcy0mZ3Q7c2l6ZTsgaSsrKSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBwcmludGYoJnF1b3Q7JTAyeCZxdW90OywgYnl0ZXMtJmd0O2J1ZmZlcltpXSk7PGJyPgomZ3Q7
wqAgwqAgwqAgwqB9PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgcHJpbnRmKCZxdW90O1xu
JnF1b3Q7KTs8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAvKiBidWlsZCBhIHRlbXBsYXRl
IGZvciB0aGUgTlYgaW5kZXggKi88YnI+CiZndDvCoCDCoCDCoCDCoFRQTTJCX05WX1BVQkxJQyBw
dWJfdGVtcGwgPSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiB0aGlzIGlzIGNv
dW50ZXIgaW50dWl0aXZlLCBidXQgaXQgdGVsbHMgdGhlIFRTUzIgbGlicmFyeSB0byBjYWxjdWxh
dGU8YnI+CiZndDsgdGhpcyBmb3IgdXMgKi88YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC5zaXplID0gMCw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIFRoZSB0aGluZ3Mg
dGhhdCBkZWZpbmUgd2hhdCBOViBpbmRleCB3ZSBhcmUgY3JlYXRpbmcgKi88YnI+CiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoC5udlB1YmxpYyA9IHs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoC8qIHVzZXMgc2hhMjU2IHRvIGlkZW50aWZ5IHRoZSB0cG0gb2Jq
ZWN0IGJ5IG5hbWUgKi88YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC5uYW1lQWxnID0gVFBNMl9BTEdfU0hBMjU2LDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLyogYWxsb3dzIHRoZSBvd25lciBwYXNzd29yZCBvciBpbmRleCBwYXNz
d29yZCByL3c8YnI+CiZndDsgYWNjZXNzICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAuYXR0cmlidXRlcyA9IFRQTUFfTlZfT1dORVJXUklURSB8PGJyPgomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUUE1BX05WX09X
TkVSUkVBRMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRQTUFfTlZfQVVUSFdSSVRFwqAgwqAgwqAgwqAgwqAg
wqAgfDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgVFBNQV9OVl9BVVRIUkVBRCw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIGNhbiBob2xkIDY0IGJ5dGVzIG9mIGRhdGEgKi88YnI+CiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5kYXRhU2l6ZSA9IDY0LDxicj4KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogQ3JlYXRlIGF0IE5WIEluZGV4IDEgb3IgMHgx
MDAwMDAxICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubnZJ
bmRleCA9IFRQTTJfSFJfTlZfSU5ERVggKyAxPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9LDxicj4KJmd0O8KgIMKgIMKgIMKgfTs8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0O8Kg
IMKgIMKgIMKgLyogT2ssIGRlZmluZSB0aGUgc3BhY2UgYW5kIHN0b3JlIHRoZSBudl9pbmRleCBm
b3IgZnV0dXJlIHVzZSAqLzxicj4KJmd0O8KgIMKgIMKgIMKgcmMgPSBFc3lzX05WX0RlZmluZVNw
YWNlKDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgZWN0eCw8YnI+CiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoEVTWVNfVFJfUkhfT1dORVIsIC8qIGNyZWF0ZSBhbiBOViBpbmRleCBpbiB0aGUg
b3duZXI8YnI+CiZndDsgaGllcmFyY2h5ICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqBFU1lT
X1RSX1BBU1NXT1JELCAvKiBhdXRoIGFzIHRoZSBvd25lciB3aXRoIGEgcGFzc3dvcmQsIHdoaWNo
IGlzPGJyPgomZ3Q7IGVtcHR5ICovPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqBFU1lTX1RSX05P
TkUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqBFU1lTX1RSX05PTkUsPGJyPgomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqBOVUxMLDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgJmFtcDtwdWJfdGVtcGws
PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAmYW1wO252X2luZGV4KTs8YnI+CiZndDvCoCDCoCDC
oCDCoGlmIChyYyAhPSBUU1MyX1JDX1NVQ0NFU1MpIHs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHByaW50ZigmcXVvdDtFc3lzX05WX0RlZmluZVNwYWNlIEZhaWxlZDogMHgleFxuJnF1
b3Q7LCByYyk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIG91dDs8YnI+CiZn
dDvCoCDCoCDCoCDCoH08YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAvKiBOb3RlIGlmIHlv
dSBuZWVkIHRvIHNldCB0aGUgb3duZXIgaGllcmFyY2h5IGF1dGggdmFsdWUgeW91IHVzZTo8YnI+
CiZndDvCoCDCoCDCoCDCoCAqIFRTUzJfUkMgRXN5c19UUl9TZXRBdXRoKDxicj4KJmd0O8KgIMKg
IMKgIMKgICrCoCDCoCDCoEVTWVNfQ09OVEVYVCAqZXN5c0NvbnRleHQsPGJyPgomZ3Q7wqAgwqAg
wqAgwqAgwqAgKsKgIMKgIMKgRVNZU19UUiBoYW5kbGUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAg
KsKgIMKgIMKgVFBNMkJfQVVUSCBjb25zdCAqYXV0aFZhbHVlKTs8YnI+CiZndDvCoCDCoCDCoCDC
oCAqLzxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtDcmVhdGVkIE5W
IEluZGV4OiAweCV4XG4mcXVvdDssIHB1Yl90ZW1wbC5udlB1YmxpYy5udkluZGV4KTs8YnI+CiZn
dDvCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtFU1lTX1RSOiAweCV4XG4mcXVvdDssIG52X2luZGV4
KTs8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAvKjxicj4KJmd0O8KgIMKgIMKgIMKgICog
Tm90ZTogaWYgd2UgbmVlZCB0byBjb252ZXJ0IHRoZSBudkluZGV4IGludG8gYW4gRVNZU19UUiwg
dGhlIGJlbG93PGJyPgomZ3Q7IHdpbGw8YnI+CiZndDvCoCDCoCDCoCDCoCAqIGRvIGl0LiBJdHMg
bm90IHJlcXVpcmVkIGZvciB0aGlzIGNhc2UsIHNpbmNlIEVzeXNfTlZfRGVmaW5lIGdpdmVzIHVz
IGFuPGJyPgomZ3Q7wqAgwqAgwqAgwqAgKiBFU1lTX1RSLjxicj4KJmd0O8KgIMKgIMKgIMKgICov
PGJyPgomZ3Q7wqAgwqAgwqAgwqByYyA9IEVzeXNfVFJfRnJvbVRQTVB1YmxpYyg8YnI+CiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVjdHgsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBUUE0yX0hSX05WX0lOREVYICsgMSw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEVT
WVNfVFJfTk9ORSw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJfTk9ORSw8
YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJfTk9ORSw8YnI+CiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7bnZfaW5kZXgyKTs8YnI+CiZndDvCoCDCoCDCoCDCoGlm
IChyYyAhPSBUU1MyX1JDX1NVQ0NFU1MpIHs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHByaW50ZigmcXVvdDtFc3lzX1RSX0Zyb21UUE1QdWJsaWMgRmFpbGVkOiAweCV4XG4mcXVvdDss
IHJjKTs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gb3V0Ozxicj4KJmd0O8Kg
IMKgIMKgIMKgfTxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtFU1lT
X1RSMjogMHgleFxuJnF1b3Q7LCBudl9pbmRleDIpOzxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDC
oCDCoC8qIGNvcHkgc29tZSBkYXRhIGludG8gYSBidWZmZXIgdG8gc2VuZCB0byB0aGUgVFBNICov
PGJyPgomZ3Q7wqAgwqAgwqAgwqBUUE0yQl9NQVhfTlZfQlVGRkVSIHdyaXRlX2RhdGEgPSB7IDAg
fTs8YnI+CiZndDvCoCDCoCDCoCDCoG1lbWNweSh3cml0ZV9kYXRhLmJ1ZmZlciwgYnl0ZXMtJmd0
O2J1ZmZlciwgYnl0ZXMtJmd0O3NpemUpOzxicj4KJmd0O8KgIMKgIMKgIMKgd3JpdGVfZGF0YS5z
aXplID0gYnl0ZXMtJmd0O3NpemU7PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgcHJpbnRm
KCZxdW90O1dyaXRpbmcgdGhlIHJhbmRvbSBudW1iZXIgd3JpdHRlbiBpbiBOViBSYW1cbiZxdW90
Oyk7PGJyPgomZ3Q7wqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7RGF0YSBidWZmZXIgc2l6ZSB1c2Vk
IHRvIHdyaXRlIGludG8gTlZSYW06PGJyPgomZ3Q7ICVkXG4mcXVvdDssd3JpdGVfZGF0YS5zaXpl
KTs8YnI+CiZndDvCoCDCoCDCoCDCoC8qPGJyPgomZ3Q7wqAgwqAgwqAgwqAgKiBXcml0ZSB0aGUg
ZGF0YSB0byB0aGUgVFBNIE5WIGluZGV4IGF0IG9mZnNldCAwPGJyPgomZ3Q7wqAgwqAgwqAgwqAg
Ki88YnI+CiZndDvCoCDCoCDCoCDCoHJjID0gRXN5c19OVl9Xcml0ZSg8YnI+CiZndDvCoCDCoCDC
oCDCoCDCoCDCoGVjdHgsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqBudl9pbmRleCwgLyogYXV0
aGVudGljYXRlIHRvIHRoZSBOViBpbmRleCB1c2luZyB0aGUgTlYgaW5kZXg8YnI+CiZndDsgcGFz
c3dvcmQgKi88YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoG52X2luZGV4LCAvKiB0aGUgbnYgaW5k
ZXggdG8gd3JpdGUgdG8gKi88YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJfUEFTU1dP
UkQsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBFU1lTX1RSX05PTkUsPGJyPgomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBFU1lTX1RSX05PTkUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAmYW1wO3dyaXRlX2RhdGEsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAwKTs8YnI+CiZn
dDvCoCDCoCDCoCDCoGlmIChyYyAhPSBUU1MyX1JDX1NVQ0NFU1MpIHs8YnI+CiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtFc3lzX05WX1dyaXRlIEZhaWxlZDogMHgleFxu
JnF1b3Q7LCByYyk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIG91dDs8YnI+
CiZndDvCoCDCoCDCoCDCoH08YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAvKiBSZWFkIHRo
ZSBkYXRhIGJhY2ssIGFuZCBqdXN0IGZvciBmdW4sIHdlIHdpbGwgdXNlIG52X2luZGV4Mjxicj4K
Jmd0O8KgIMKgIMKgIMKgICogdG8gcHJvdmUgaXQmIzM5O3MgcG9pbnRpbmcgdG8gdGhlIHNhbWUg
TlYgbG9jYXRpb24gaW4gdGhlIFRQTS48YnI+CiZndDvCoCDCoCDCoCDCoCAqLzxicj4KJmd0O8Kg
IMKgIMKgIMKgVFBNMkJfTUFYX05WX0JVRkZFUiAqcmVhZF9kYXRhID0gTlVMTDs8YnI+CiZndDvC
oCDCoCDCoCDCoHJjID0gRXN5c19OVl9SZWFkKDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgZWN0
eCw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoG52X2luZGV4MiwgLyogYXV0aGVudGljYXRlIHRv
IHRoZSBOViBpbmRleCB1c2luZyB0aGUgTlYgaW5kZXg8YnI+CiZndDsgcGFzc3dvcmQgKi88YnI+
CiZndDvCoCDCoCDCoCDCoCDCoCDCoG52X2luZGV4MiwgLyogdGhlIG52IGluZGV4IHRvIHJlYWQg
ZnJvbSAqLzxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgRVNZU19UUl9QQVNTV09SRCw8YnI+CiZn
dDvCoCDCoCDCoCDCoCDCoCDCoEVTWVNfVFJfTk9ORSw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDC
oEVTWVNfVFJfTk9ORSw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoGJ5dGVzLSZndDtzaXplLDxi
cj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgMCw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCZhbXA7
cmVhZF9kYXRhKTs8YnI+CiZndDvCoCDCoCDCoCDCoGlmIChyYyAhPSBUU1MyX1JDX1NVQ0NFU1Mp
IHs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtFc3lzX05WX1Jl
YWQgRmFpbGVkOiAweCV4XG4mcXVvdDssIHJjKTs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdvdG8gb3V0Ozxicj4KJmd0O8KgIMKgIMKgIMKgfTxicj4KJmd0OyA8YnI+CiZndDvCoCDC
oCDCoCDCoC8qIFByaW50IHRoaW5ncyBhcyBhIHN0cmluZyBmcm9tIHRoZSBUUE0gY2FyZWZ1bGx5
ITxicj4KJmd0O8KgIMKgIMKgIMKgICogSW5qZWN0ZWQgdHJhZmZpYyB2aWEgTUlUTSBtZWFucyB0
aGF0IHlvdSBjYW5ub3QgdHJ1c3QgdGhpczxicj4KJmd0O8KgIMKgIMKgIMKgICogdG8gYmUgbnVs
bCB0ZXJtaW5hdGVkLjxicj4KJmd0O8KgIMKgIMKgIMKgICovPGJyPgomZ3Q7wqAgwqAgwqAgwqBw
cmludGYoJnF1b3Q7UmVhZGluZyB0aGUgcmFuZG9tIG51bWJlciB3cml0dGVuIGluIE5WIFJhbVxu
JnF1b3Q7KTs8YnI+CiZndDvCoCDCoCDCoCDCoGZvciAoaSA9IDA7IGkgJmx0OyByZWFkX2RhdGEt
Jmd0O3NpemU7IGkrKykgezxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRmKCZx
dW90OyUwMngmcXVvdDssIHJlYWRfZGF0YS0mZ3Q7YnVmZmVyW2ldKTs8YnI+CiZndDvCoCDCoCDC
oCDCoH08YnI+CiZndDvCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtcbiZxdW90Oyk7PGJyPgomZ3Q7
IDxicj4KJmd0O8KgIMKgIMKgIMKgRXN5c19GcmVlKHJlYWRfZGF0YSk7PGJyPgomZ3Q7wqAgwqAg
wqAgwqByYyA9IDA7PGJyPgomZ3Q7IDxicj4KJmd0OyBvdXQ6PGJyPgomZ3Q7IDxicj4KJmd0O8Kg
IMKgIMKgIMKgLyogcmVtb3ZlIHRoZSBOViBzcGFjZSAqLzxicj4KJmd0O8KgIMKgIMKgIMKgaWYg
KG52X2luZGV4KSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnQgcmMyID0gRXN5
c19OVl9VbmRlZmluZVNwYWNlKDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZWN0eCw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEVT
WVNfVFJfUkhfT1dORVIsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBudl9pbmRleCw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEVT
WVNfVFJfUEFTU1dPUkQsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBFU1lTX1RSX05PTkUsPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBFU1lTX1RSX05PTkUpOzxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJjMiAh
PSBUU1MyX1JDX1NVQ0NFU1MpIHs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHByaW50ZigmcXVvdDtFc3lzX05WX1VuZGVmaW5lU3BhY2UgRmFpbGVkOiAweCV4XG4m
cXVvdDssIHJjMik7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
YyA9IDE7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPgomZ3Q7wqAgwqAgwqAg
wqB9PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgRXN5c19GaW5hbGl6ZSgmYW1wO2VjdHgp
Ozxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtFeGl0IGZyb20g
bnZfd3JpdGVfcmVhZCgpXG4mcXVvdDspOzxicj4KJmd0O8KgIMKgIMKgIMKgcmV0dXJuIHJjOzxi
cj4KJmd0OyB9PGJyPgomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fPGJyPgomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0
cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxi
cj4KJmd0OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0
cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMu
MDEub3JnPC9hPjxicj4KJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUo
X2ludGVybmFsX25hbWUpczxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============1225461626084888166==--

