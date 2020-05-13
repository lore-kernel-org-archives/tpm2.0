Content-Type: multipart/mixed; boundary="===============3501127088215538777=="
MIME-Version: 1.0
From: muthu.smk at gmail.com
Subject: [tpm2] NVRAM Write and Read using Esys API(s)
Date: Wed, 13 May 2020 17:50:58 +0000
Message-ID: <20200513175058.2843.8771@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3501127088215538777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Williams,

I am using the test code used to read and write in to NV ram.  I am facing =
below challenges if i tried to read already written data from NVRAM.

1) Test code attached defined create the context (ectx) , create random num=
ber , define NV ram , write the random number in to NVRAM (offset 0x1000001=
) and read it back from NV Ram (from same offset 0x1000001)

2) But if i try to run this code twice or thrise , am getting below NVRAM a=
lready defined rc code. I can understand that we should not defined the nv =
ram space which already defined and used. =

How to avoid this ? by defining nvram ONLY once and write it ONLY once and =
finally read it AS MUCH times we want ?  Below details are related to this =
request

Error code:
0x0000014c - description: NV Index or persistend object already defined
0x00000284 - description: value is out of range or is not correct for the c=
ontext

3) Query is : is it possible to define nvram "ONLY ONCE" with the API share=
d the test code
and then create a function "createrandom" number to use the same context (e=
cts) to generate randumnumber
then call separate "write_nvram" function with random number as input and a=
sk to write in the same offset .  Finally calling another function "read_nv=
ram" to read it back from the same nvram's offset when ever we want ? i tri=
ed this approach but am getting segfault with above error . =

What am i missing here ?

3.1) Ideally in single application , i need to achieve "tpm2_nvdefine", "tp=
m2_nvwrite" and "tpm2_nvread() tools API(s) functionality" in different cal=
ls or flow.
3.2) Also how to check whether "write" already done (i tried checking nv_in=
dex is true - means whether it already has some value) , but it failed ?

4) Also how to check what was the content that already present in the nvram=
 offset (0x1000001) before i do write the "random number" second time in to=
 the same offset ? this is to ensure the "random number" that i am planning=
 to write was valid one ?

I remember studying that, once u write in to NVRAM offset , we cant able to=
 RE-WRITE it in the same offset(0x1000001). Whether that is the same case f=
or SIMULATOR as well (or) this feature is only for real tpm hardware?

6)After nvwrite i tried to use "tpm2_pcrlist" command line tool application=
, by which it shows the nv ram memory location , tried using tpm2_nvread ()=
 to read the content but i could not able to see any data (random number) t=
hat i used to write via this test application . dont know why ?

7) After i manually ran the below clear API , now the test code is working =
fine (refer Test code log shown below..). This confirms we can reallocate a=
lready defined nv ram memory.
#tpm2_nvrelease -x 0x1000001 -a 0x40000001


8)If i try to read it manually via below tpm2_nvread command with offset 0x=
1000001 am getting below error

#tpm2_nvread -x 0x1000001 -a 0x40000001 -o 0 -s 20
ERROR: Failed to read NVRAM public area at index 0x1000001 (16777217). Erro=
r:0x18b
ERROR: Unable to run tpm2_nvread

/* Tried to use below tools command , am always getting the same error even=
 if we give the different nvram off set
tpm2_nvwrite -x 0x1c00002 helloworld =

ERROR: Reading the public part of the nv index failed with: 0x18b
ERROR: Unable to run tpm2_nvwrite

tpm2_nvwrite -x 0x1c00012 -a 0x40000001 helloworld =

ERROR: Reading the public part of the nv index failed with: 0x18b
ERROR: Unable to run tpm2_nvwrite


/* Try to read the nvlist of SIM , it returns nothing !!!
#tpm2_nvlist <returns nothing>

Any points will be great help for me.

---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
Test code log after above "tpm2_nvrelease":
Initializing
init_rand()
init_rsa()
init_ecc()
Engine name: TPM2-TSS engine for OpenSSL
Init result: 1 =

Setting owner auth to empty auth.
Setting parent auth to empty auth.
ERROR:tcti:src/tss2-tcti/tcti-device.c:440:Tss2_Tcti_Device_Init() Failed t=
o open device file /dev/tpm0: No such file or directory =

WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for func=
tion 0x7fc67376d18b failed with a000a =

WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not initiali=
ze TCTI named: tcti-device =

ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not initia=
lize TCTI file: libtss2-tcti-default.so =

 No of bytes written by GenRandom : 64
b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe8ece=
5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
Created NV Index: 0x1000001
ESYS_TR: 0x418367
ESYS_TR2: 0x418368
Writing the random number written in NV Ram
Data buffer size used to write into NVRam: 64
Reading the random number written in NV Ram
b6c9e1d028f2c893c56a089165f9f38c09232180ba5bb66b35c5652cb51ab61b237ecfe8ece=
5d7f14a3323fee1dca0e641a0f20c7689100e3c804b82d6a2497f
*** SUCCESS ***
---------------------

TEST CODE : =


int nv_write_read()
{

	ESYS_CONTEXT *ectx =3D NULL;

	ESYS_TR nv_index =3D 0;
	ESYS_TR nv_index2 =3D 0;

	 int rc =3D 1;


	/*
	 * create a connection to the TPM letting ESAPI choose how to get there.
	 * If you need more control, you can use tcti and tcti-ldr libraries to
	 * get a TCTI pointer to use for the tcti argument of Esys_Initialize.
	 */
	rc =3D Esys_Initialize(&ectx,
			NULL,  // let it find the TCTI =

			NULL); // Use whatever ABI =

	if (rc !=3D TSS2_RC_SUCCESS) {
		printf("Esys_Initialize Failed: 0x%x\n", rc);
		return 1;
	}


        rc =3D Esys_GetRandom(ectx,
                        ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE,
                        64, &bytes);
        if (rc !=3D TSS2_RC_SUCCESS) {
                printf("Esys_GetRandom Failed: %s\n", Tss2_RC_Decode(rc));
                exit(1);
        }

    	printf(" No of bytes written by GenRandom : %d\n",bytes->size);
    	size_t i;
    	for (i =3D 0; i < bytes->size; i++) {
        	printf("%02x", bytes->buffer[i]);
    	}

    	printf("\n");

	/* build a template for the NV index */
	TPM2B_NV_PUBLIC pub_templ =3D {
		/* this is counter intuitive, but it tells the TSS2 library to calculate =
this for us */
		.size =3D 0,
		/* The things that define what NV index we are creating */
		.nvPublic =3D {
			/* uses sha256 to identify the tpm object by name */
			.nameAlg =3D TPM2_ALG_SHA256,
			/* allows the owner password or index password r/w access */
			.attributes =3D TPMA_NV_OWNERWRITE |
				TPMA_NV_OWNERREAD            |
				TPMA_NV_AUTHWRITE            |
				TPMA_NV_AUTHREAD,
			/* can hold 64 bytes of data */
			.dataSize =3D 64,
			/* Create at NV Index 1 or 0x1000001 */
			.nvIndex =3D TPM2_HR_NV_INDEX + 1
		},
	};


	/* Ok, define the space and store the nv_index for future use */
	rc =3D Esys_NV_DefineSpace(
	    ectx,
		ESYS_TR_RH_OWNER, /* create an NV index in the owner hierarchy */
	    ESYS_TR_PASSWORD, /* auth as the owner with a password, which is empty=
 */
	    ESYS_TR_NONE,
	    ESYS_TR_NONE,
	    NULL,
	    &pub_templ,
	    &nv_index);
	if (rc !=3D TSS2_RC_SUCCESS) {
		printf("Esys_NV_DefineSpace Failed: 0x%x\n", rc);
		goto out;
	}

	/* Note if you need to set the owner hierarchy auth value you use:
	 * TSS2_RC Esys_TR_SetAuth(
	 *     ESYS_CONTEXT *esysContext,
         *     ESYS_TR handle,
         *     TPM2B_AUTH const *authValue);
	 */

	printf("Created NV Index: 0x%x\n", pub_templ.nvPublic.nvIndex);
	printf("ESYS_TR: 0x%x\n", nv_index);

	/*
	 * Note: if we need to convert the nvIndex into an ESYS_TR, the below will
	 * do it. Its not required for this case, since Esys_NV_Define gives us an
	 * ESYS_TR.
	 */
	rc =3D Esys_TR_FromTPMPublic(
		ectx,
		TPM2_HR_NV_INDEX + 1,
		ESYS_TR_NONE,
		ESYS_TR_NONE,
		ESYS_TR_NONE,
		&nv_index2);
	if (rc !=3D TSS2_RC_SUCCESS) {
		printf("Esys_TR_FromTPMPublic Failed: 0x%x\n", rc);
		goto out;
	}

	printf("ESYS_TR2: 0x%x\n", nv_index2);

	/* copy some data into a buffer to send to the TPM */
	TPM2B_MAX_NV_BUFFER write_data =3D { 0 };
	memcpy(write_data.buffer, bytes->buffer, bytes->size);
	write_data.size =3D bytes->size;

	printf("Writing the random number written in NV Ram\n");
    	printf("Data buffer size used to write into NVRam: %d\n",write_data.si=
ze);
	/*
	 * Write the data to the TPM NV index at offset 0
	 */
	rc =3D Esys_NV_Write(
	    ectx,
	    nv_index, /* authenticate to the NV index using the NV index password =
*/
	    nv_index, /* the nv index to write to */
	    ESYS_TR_PASSWORD,
		ESYS_TR_NONE,
		ESYS_TR_NONE,
	    &write_data,
	    0);
	if (rc !=3D TSS2_RC_SUCCESS) {
		printf("Esys_NV_Write Failed: 0x%x\n", rc);
		goto out;
	}

	/* Read the data back, and just for fun, we will use nv_index2
	 * to prove it's pointing to the same NV location in the TPM.
	 */
	TPM2B_MAX_NV_BUFFER *read_data =3D NULL;
	rc =3D Esys_NV_Read(
	    ectx,
	    nv_index2, /* authenticate to the NV index using the NV index password=
 */
	    nv_index2, /* the nv index to read from */
	    ESYS_TR_PASSWORD,
	    ESYS_TR_NONE,
	    ESYS_TR_NONE,
	    bytes->size,
	    0,
	    &read_data);
	if (rc !=3D TSS2_RC_SUCCESS) {
		printf("Esys_NV_Read Failed: 0x%x\n", rc);
		goto out;
	}

	/* Print things as a string from the TPM carefully!
	 * Injected traffic via MITM means that you cannot trust this
	 * to be null terminated.
	 */
	printf("Reading the random number written in NV Ram\n");
    	for (i =3D 0; i < read_data->size; i++) {
        	printf("%02x", read_data->buffer[i]);
    	}
	printf("\n");

	Esys_Free(read_data);
	rc =3D 0;

out:

	/* remove the NV space */
	if (nv_index) {
		int rc2 =3D Esys_NV_UndefineSpace(
			ectx,
			ESYS_TR_RH_OWNER,
			nv_index,
			ESYS_TR_PASSWORD,
			ESYS_TR_NONE,
			ESYS_TR_NONE);
		if (rc2 !=3D TSS2_RC_SUCCESS) {
			printf("Esys_NV_UndefineSpace Failed: 0x%x\n", rc2);
			rc =3D 1;
		}
	}

	Esys_Finalize(&ectx);

        printf("Exit from nv_write_read()\n");
	return rc;
}
--===============3501127088215538777==--

