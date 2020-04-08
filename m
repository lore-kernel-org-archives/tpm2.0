Content-Type: multipart/mixed; boundary="===============5039940739950589497=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How to use tpm2_getrandom() as API and create a C library
Date: Wed, 08 Apr 2020 20:54:23 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EBBBF6@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200408182635.2799.81092@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5039940739950589497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here is a full program with FAPI and ESAPI implementations.

gcc -o go main.c -ltss2-esys -ltss2-fapi -ltss2-rc

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <tss2/tss2_esys.h>
#include <tss2/tss2_fapi.h>
#include <tss2/tss2_rc.h>

void random_fapi(void) {

	FAPI_CONTEXT  *context =3D NULL;
	TSS2_RC rc =3D Fapi_Initialize(
	    &context,
	    NULL);
	if (rc !=3D TSS2_RC_SUCCESS) {
		fprintf(stderr, "Fapi_Initialize: %s\n", Tss2_RC_Decode(rc));
		exit(1);
	}

	/*
	 * This is typically done once via the tpm2-tools tool: tss2_provision
	 *
	 * So this may fail, because it's already been provisioned. SO just log a =
warning
	 * and plod ahead....
	 */
	rc =3D Fapi_Provision(context, NULL, NULL, NULL);
	if (rc !=3D TSS2_RC_SUCCESS) {
		fprintf(stderr, "WARN: Fapi_Provision: %s\n", Tss2_RC_Decode(rc));
	}

	uint8_t *bytes =3D NULL;
	rc =3D Fapi_GetRandom(context, 8, &bytes);
	if (rc !=3D TSS2_RC_SUCCESS) {
		fprintf(stderr, "Fapi_GetRandom: %s\n", Tss2_RC_Decode(rc));
		exit(1);
	}

    size_t i;
    for (i =3D 0; i < sizeof(bytes); i++) {
        printf("%02x", bytes[i]);
    }
    printf("\n");

    Fapi_Free(bytes);

	Fapi_Finalize(&context);
}

void random_esys(void) {

	ESYS_CONTEXT *context =3D NULL;
	TSS2_RC rc =3D Esys_Initialize(&context, NULL, NULL);
	if (rc !=3D TSS2_RC_SUCCESS) {
		fprintf(stderr, "Esys_Initialize: %s\n", Tss2_RC_Decode(rc));
		exit(1);
	}

	TPM2B_DIGEST *bytes =3D NULL;
	rc =3D Esys_GetRandom(context,
			ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE,
			8, &bytes);
	if (rc !=3D TSS2_RC_SUCCESS) {
		fprintf(stderr, "Esys_GetRandom: %s\n", Tss2_RC_Decode(rc));
		exit(1);
	}

    size_t i;
    for (i =3D 0; i < bytes->size; i++) {
        printf("%02x", bytes->buffer[i]);
    }
    printf("\n");

    Esys_Free(bytes);

	Esys_Finalize(&context);
}

int main(int argc, char *argv[]) {

	if (argc =3D=3D 1 || strcmp(argv[1], "esapi")) {
		random_esys();
	}

	if (argc =3D=3D 1 || strcmp(argv[1], "fapi")) {
		random_fapi();
	}

	return 0;
}

> -----Original Message-----
> From: muthu.smk(a)gmail.com [mailto:muthu.smk(a)gmail.com]
> Sent: Wednesday, April 8, 2020 1:27 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] How to use tpm2_getrandom() as API and create a C library
> =

> As a continuation of below thread , and suggested by @williamcroberts her=
e i am
> sharing my observation on feedback shared by @willams
> https://github.com/tpm2-software/tpm2-tools/issues/1971
> =

> Thanks a lot @williamcroberts for your quick response. Regarding your sam=
ple
> code , i cant able to use linux 'system' API or popen call to trigger the=
 executable.
> Basically its an limitation for me to use these two methods inside my apl=
ication.
> =

> Coming to the below 3 methods , it was quite interesting and i have tried=
 last two
> (Esys_GenRandom and Fapi_GetRandom() i could able to link it to my app wi=
th
> respective library and my application is compiled properly . But when i t=
ry to run it
> , am getting 'context' set with NULL (refer below error log for more info=
) . Can
> you please guide me how and what to fill in the 'context' argument .
> =

> ERROR:fapi:src/tss2-fapi/api/Fapi_GetRandom.c:66:Fapi_GetRandom() context=
 is
> NULL: BAD_REFERENCE Get Random Number got Failed , the reason has been
> shared below Failure reason : context or data is NULL
> =

> (good) Tss2_Sys_GetRandom
> (better) Esys_GetRandom
> (best) Fapi_GetRandom
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============5039940739950589497==--

