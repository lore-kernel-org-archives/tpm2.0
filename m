Content-Type: multipart/mixed; boundary="===============6357855577684391751=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: NVRAM Write and Read using Esys API(s)
Date: Wed, 13 May 2020 19:21:20 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDDACA@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200513175058.2843.8771@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6357855577684391751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: muthu.smk(a)gmail.com [mailto:muthu.smk(a)gmail.com]
> Sent: Wednesday, May 13, 2020 12:51 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] NVRAM Write and Read using Esys API(s)
> =

> Hi Williams,
> =

> I am using the test code used to read and write in to NV ram.  I am facin=
g below
> challenges if i tried to read already written data from NVRAM.
> =

> 1) Test code attached defined create the context (ectx) , create random n=
umber ,
> define NV ram , write the random number in to NVRAM (offset 0x1000001) and
> read it back from NV Ram (from same offset 0x1000001)
> =

> 2) But if i try to run this code twice or thrise , am getting below NVRAM=
 already
> defined rc code. I can understand that we should not defined the nv ram s=
pace
> which already defined and used.
> How to avoid this ? by defining nvram ONLY once and write it ONLY once and
> finally read it AS MUCH times we want ?  Below details are related to thi=
s request

You can call Esys_GetCapability() and see what NV indices are defined. The =
command
Line tool tpm2_getcap does this, like so:
tpm2_getcap handles-nv-index

You can use that tool as an example of how to do it.

> =

> Error code:
> 0x0000014c - description: NV Index or persistend object already defined
> 0x00000284 - description: value is out of range or is not correct for the=
 context
> =

> 3) Query is : is it possible to define nvram "ONLY ONCE" with the API sha=
red the
> test code and then create a function "createrandom" number to use the same

Call getcap, see if it's defined, if defined, don't define it....

> context (ects) to generate randumnumber then call separate "write_nvram"
> function with random number as input and ask to write in the same offset .
> Finally calling another function "read_nvram" to read it back from the sa=
me
> nvram's offset when ever we want ? i tried this approach but am getting s=
egfault
> with above error .
> What am i missing here ?

Segfaults are likely your code is just broken.

> =

> 3.1) Ideally in single application , i need to achieve "tpm2_nvdefine",
> "tpm2_nvwrite" and "tpm2_nvread() tools API(s) functionality" in differen=
t calls
> or flow.
> 3.2) Also how to check whether "write" already done (i tried checking nv_=
index is
> true - means whether it already has some value) , but it failed ?

If you do what the tool tpm2_nvreadpublic does, you can check for the writt=
en bit.
 =

> =

> 4) Also how to check what was the content that already present in the nvr=
am
> offset (0x1000001) before i do write the "random number" second time in t=
o the
> same offset ? this is to ensure the "random number" that i am planning to=
 write
> was valid one ?

Read it out, if it's not what you want, write it.

> =

> I remember studying that, once u write in to NVRAM offset , we cant able =
to RE-
> WRITE it in the same offset(0x1000001). Whether that is the same case for
> SIMULATOR as well (or) this feature is only for real tpm hardware?

No generally you can write as many times as you want... there are tricks yo=
u can do to make
It locked after write (writelocked iirc)

Below is a command line example of doing it...

tpm2_nvdefine =

nv-index: 0x1000000

tpm2_nvreadpublic 0x1000000
0x1000000:
  name: 000b1195f36a21c8219055ad0803c39e7e81d06cdb2eee2b7cf93dd83e01d4273828
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: ownerwrite|authwrite|ownerread|authread
    value: 0x6000600
  size: 2048

# you can do this as much as you want, but it can wear the memory in the TPM
# depending on memory technology the vendor used.
echo "hello" | tpm2_nvwrite -C o 0x1000000 -i-
echo `tpm2_nvread -C o -s5 0x1000000`
hello

tpm2_nvreadpublic 0x1000000
0x1000000:
  name: 000b287c9b1b06fab6e51bd26e98ea89460574e97a3d2ef995eb35f7e23db7e94f67
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: ownerwrite|authwrite|ownerread|authread|written
    value: 0x6000620
  size: 2048

> =

> 6)After nvwrite i tried to use "tpm2_pcrlist" command line tool applicati=
on, by
> which it shows the nv ram memory location , tried using tpm2_nvread () to=
 read
> the content but i could not able to see any data (random number) that i u=
sed to
> write via this test application . dont know why ?

tpm2_pcrlist is not for NVs.... you want:
tpm2_getcap handles-nv-index

> =

> 7) After i manually ran the below clear API , now the test code is workin=
g fine
> (refer Test code log shown below..). This confirms we can reallocate alre=
ady
> defined nv ram memory.
> #tpm2_nvrelease -x 0x1000001 -a 0x40000001

Tpm2_clear will clear the owner hierarchy, including NV ram objects declare=
d in that hierarchy,
so define will work again, because you deleted it.

> =

> =

> 8)If i try to read it manually via below tpm2_nvread command with offset
> 0x1000001 am getting below error
> =

> #tpm2_nvread -x 0x1000001 -a 0x40000001 -o 0 -s 20
> ERROR: Failed to read NVRAM public area at index 0x1000001 (16777217).
> Error:0x18b
> ERROR: Unable to run tpm2_nvread
> =

> /* Tried to use below tools command , am always getting the same error ev=
en if
> we give the different nvram off set tpm2_nvwrite -x 0x1c00002 helloworld
> ERROR: Reading the public part of the nv index failed with: 0x18b
> ERROR: Unable to run tpm2_nvwrite
> =

> tpm2_nvwrite -x 0x1c00012 -a 0x40000001 helloworld
> ERROR: Reading the public part of the nv index failed with: 0x18b
> ERROR: Unable to run tpm2_nvwrite
> =

> =

> /* Try to read the nvlist of SIM , it returns nothing !!!
> #tpm2_nvlist <returns nothing>
> =

> Any points will be great help for me.
> =

> -------------------------------------------------------------------------=
--------------------------
> --------------------------------------------------------------
> Test code log after above "tpm2_nvrelease":
> Initializing
> init_rand()
> init_rsa()
> init_ecc()
> Engine name: TPM2-TSS engine for OpenSSL
> Init result: 1
> Setting owner auth to empty auth.
> Setting parent auth to empty auth.
> ERROR:tcti:src/tss2-tcti/tcti-device.c:440:Tss2_Tcti_Device_Init() Failed=
 to open
> device file /dev/tpm0: No such file or directory
> WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for fu=
nction
> 0x7fc67376d18b failed with a000a
> WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not initia=
lize TCTI
> named: tcti-device
> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not init=
ialize TCTI
> file: libtss2-tcti-default.so
>  No of bytes written by GenRandom : 64
> b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe
> 8ece5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
> Created NV Index: 0x1000001
> ESYS_TR: 0x418367
> ESYS_TR2: 0x418368
> Writing the random number written in NV Ram
> Data buffer size used to write into NVRam: 64
> Reading the random number written in NV Ram
> b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe
> 8ece5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
> *** SUCCESS ***
> ---------------------
> =

> TEST CODE :
> =

> int nv_write_read()
> {
> =

> 	ESYS_CONTEXT *ectx =3D NULL;
> =

> 	ESYS_TR nv_index =3D 0;
> 	ESYS_TR nv_index2 =3D 0;
> =

> 	 int rc =3D 1;
> =

> =

> 	/*
> 	 * create a connection to the TPM letting ESAPI choose how to get there.
> 	 * If you need more control, you can use tcti and tcti-ldr libraries to
> 	 * get a TCTI pointer to use for the tcti argument of Esys_Initialize.
> 	 */
> 	rc =3D Esys_Initialize(&ectx,
> 			NULL,  // let it find the TCTI
> 			NULL); // Use whatever ABI
> 	if (rc !=3D TSS2_RC_SUCCESS) {
> 		printf("Esys_Initialize Failed: 0x%x\n", rc);
> 		return 1;
> 	}
> =

> =

>         rc =3D Esys_GetRandom(ectx,
>                         ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE,
>                         64, &bytes);
>         if (rc !=3D TSS2_RC_SUCCESS) {
>                 printf("Esys_GetRandom Failed: %s\n", Tss2_RC_Decode(rc));
>                 exit(1);
>         }
> =

>     	printf(" No of bytes written by GenRandom : %d\n",bytes->size);
>     	size_t i;
>     	for (i =3D 0; i < bytes->size; i++) {
>         	printf("%02x", bytes->buffer[i]);
>     	}
> =

>     	printf("\n");
> =

> 	/* build a template for the NV index */
> 	TPM2B_NV_PUBLIC pub_templ =3D {
> 		/* this is counter intuitive, but it tells the TSS2 library to calculate
> this for us */
> 		.size =3D 0,
> 		/* The things that define what NV index we are creating */
> 		.nvPublic =3D {
> 			/* uses sha256 to identify the tpm object by name */
> 			.nameAlg =3D TPM2_ALG_SHA256,
> 			/* allows the owner password or index password r/w
> access */
> 			.attributes =3D TPMA_NV_OWNERWRITE |
> 				TPMA_NV_OWNERREAD            |
> 				TPMA_NV_AUTHWRITE            |
> 				TPMA_NV_AUTHREAD,
> 			/* can hold 64 bytes of data */
> 			.dataSize =3D 64,
> 			/* Create at NV Index 1 or 0x1000001 */
> 			.nvIndex =3D TPM2_HR_NV_INDEX + 1
> 		},
> 	};
> =

> =

> 	/* Ok, define the space and store the nv_index for future use */
> 	rc =3D Esys_NV_DefineSpace(
> 	    ectx,
> 		ESYS_TR_RH_OWNER, /* create an NV index in the owner
> hierarchy */
> 	    ESYS_TR_PASSWORD, /* auth as the owner with a password, which is
> empty */
> 	    ESYS_TR_NONE,
> 	    ESYS_TR_NONE,
> 	    NULL,
> 	    &pub_templ,
> 	    &nv_index);
> 	if (rc !=3D TSS2_RC_SUCCESS) {
> 		printf("Esys_NV_DefineSpace Failed: 0x%x\n", rc);
> 		goto out;
> 	}
> =

> 	/* Note if you need to set the owner hierarchy auth value you use:
> 	 * TSS2_RC Esys_TR_SetAuth(
> 	 *     ESYS_CONTEXT *esysContext,
>          *     ESYS_TR handle,
>          *     TPM2B_AUTH const *authValue);
> 	 */
> =

> 	printf("Created NV Index: 0x%x\n", pub_templ.nvPublic.nvIndex);
> 	printf("ESYS_TR: 0x%x\n", nv_index);
> =

> 	/*
> 	 * Note: if we need to convert the nvIndex into an ESYS_TR, the below
> will
> 	 * do it. Its not required for this case, since Esys_NV_Define gives us =
an
> 	 * ESYS_TR.
> 	 */
> 	rc =3D Esys_TR_FromTPMPublic(
> 		ectx,
> 		TPM2_HR_NV_INDEX + 1,
> 		ESYS_TR_NONE,
> 		ESYS_TR_NONE,
> 		ESYS_TR_NONE,
> 		&nv_index2);
> 	if (rc !=3D TSS2_RC_SUCCESS) {
> 		printf("Esys_TR_FromTPMPublic Failed: 0x%x\n", rc);
> 		goto out;
> 	}
> =

> 	printf("ESYS_TR2: 0x%x\n", nv_index2);
> =

> 	/* copy some data into a buffer to send to the TPM */
> 	TPM2B_MAX_NV_BUFFER write_data =3D { 0 };
> 	memcpy(write_data.buffer, bytes->buffer, bytes->size);
> 	write_data.size =3D bytes->size;
> =

> 	printf("Writing the random number written in NV Ram\n");
>     	printf("Data buffer size used to write into NVRam:
> %d\n",write_data.size);
> 	/*
> 	 * Write the data to the TPM NV index at offset 0
> 	 */
> 	rc =3D Esys_NV_Write(
> 	    ectx,
> 	    nv_index, /* authenticate to the NV index using the NV index
> password */
> 	    nv_index, /* the nv index to write to */
> 	    ESYS_TR_PASSWORD,
> 		ESYS_TR_NONE,
> 		ESYS_TR_NONE,
> 	    &write_data,
> 	    0);
> 	if (rc !=3D TSS2_RC_SUCCESS) {
> 		printf("Esys_NV_Write Failed: 0x%x\n", rc);
> 		goto out;
> 	}
> =

> 	/* Read the data back, and just for fun, we will use nv_index2
> 	 * to prove it's pointing to the same NV location in the TPM.
> 	 */
> 	TPM2B_MAX_NV_BUFFER *read_data =3D NULL;
> 	rc =3D Esys_NV_Read(
> 	    ectx,
> 	    nv_index2, /* authenticate to the NV index using the NV index
> password */
> 	    nv_index2, /* the nv index to read from */
> 	    ESYS_TR_PASSWORD,
> 	    ESYS_TR_NONE,
> 	    ESYS_TR_NONE,
> 	    bytes->size,
> 	    0,
> 	    &read_data);
> 	if (rc !=3D TSS2_RC_SUCCESS) {
> 		printf("Esys_NV_Read Failed: 0x%x\n", rc);
> 		goto out;
> 	}
> =

> 	/* Print things as a string from the TPM carefully!
> 	 * Injected traffic via MITM means that you cannot trust this
> 	 * to be null terminated.
> 	 */
> 	printf("Reading the random number written in NV Ram\n");
>     	for (i =3D 0; i < read_data->size; i++) {
>         	printf("%02x", read_data->buffer[i]);
>     	}
> 	printf("\n");
> =

> 	Esys_Free(read_data);
> 	rc =3D 0;
> =

> out:
> =

> 	/* remove the NV space */
> 	if (nv_index) {
> 		int rc2 =3D Esys_NV_UndefineSpace(
> 			ectx,
> 			ESYS_TR_RH_OWNER,
> 			nv_index,
> 			ESYS_TR_PASSWORD,
> 			ESYS_TR_NONE,
> 			ESYS_TR_NONE);
> 		if (rc2 !=3D TSS2_RC_SUCCESS) {
> 			printf("Esys_NV_UndefineSpace Failed: 0x%x\n", rc2);
> 			rc =3D 1;
> 		}
> 	}
> =

> 	Esys_Finalize(&ectx);
> =

>         printf("Exit from nv_write_read()\n");
> 	return rc;
> }
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6357855577684391751==--

