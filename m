Content-Type: multipart/mixed; boundary="===============4479766235279203370=="
MIME-Version: 1.0
From: muthu.smk at gmail.com
Subject: [tpm2] writing in to NVRAM by using Tss2_Sys_NV_Write()API and create
 a C library
Date: Tue, 14 Apr 2020 07:53:30 +0000
Message-ID: <20200414075330.2799.86716@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4479766235279203370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi @William Roberts,
As you suggested i tired using "Tss2_Sys_NV_Write () API to write a data bu=
ffer to NV RAM. I make the code working and am getting core dump issue in s=
etting up the argument of "Tss2_Sys_NV_Write()" . Please find below code sn=
ippet that am currently working and throws "coredump" error after below pri=
nt statement .
*********NV INDEX TESTS*************
 As i said above , the issue might be the args that am not setting up prope=
rly (except data buffer) . Can you guide on what am i missing here and make=
 this code working . Also i need to read the same buffer using "Tss2_Sys_NV=
_Read() API .

NOTE : Right now am using SIM to test this TPM stuff. =



TPM2B_DIGEST *bytes =3D NULL;

/* In main function iam using Esys_GetRandom() API to generate a Random num=
ber and passing that Esys_GetRandom()API output buffer
as input to my another function tpm2_nv_write() to what that buffer in to N=
VRAM */ =

void main()
{
 TSS2_RC rc =3D Esys_Initialize(&ectx, NULL, NULL);
        if (rc !=3D TSS2_RC_SUCCESS) {
                fprintf(stderr, "Esys_Initialize: %s\n", Tss2_RC_Decode(rc)=
);
                exit(1);
        }

        rc =3D Esys_GetRandom(ectx,
                        ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE,
                        64, &bytes);
        if (rc !=3D TSS2_RC_SUCCESS) {
                fprintf(stderr, "Esys_GetRandom: %s\n", Tss2_RC_Decode(rc));
                exit(1);
        }

    size_t i;
    for (i =3D 0; i < bytes->size; i++) {
        printf("%02x", bytes->buffer[i]);
    }

    printf("\n");

    printf("Writing the RandomKey in to TPM using nvwrite API\n");
    //tpm2_nvwrite -x 0x1c00002

    printf("***********Performing MemCopy to nv_write_data.buffer\n");
    memcpy(nv_write_data.buffer, bytes->buffer,
               sizeof(bytes->buffer));

    /*Calling my own below function to write the newly generated random num=
ber to nvRam*/
    tpm2_nv_write(&nv_write_data.buffer);
..
...
}


/* my tpm2_nv_write funcation , which takes the input as "data buffer" . By=
 which this "buffer" data has to be written in to NVRAM" */
void tpm2_nv_write(TPM2B_MAX_NV_BUFFER *nvWriteData)
{
    UINT32 rval;
    TSS2_SYS_CONTEXT *sysContext;
    TPM2B_NV_PUBLIC publicInfo;
    TPM2B_AUTH  nvAuth;
    TSS2L_SYS_AUTH_RESPONSE sessionsDataOut;
    int i;
   TPM2B_MAX_NV_BUFFER nvData;

    TPM2B_NV_PUBLIC nvPublic;
    TPM2B_NAME nvName;

    TSS2L_SYS_AUTH_COMMAND sessionsData =3D { .count =3D 1, .auths =3D {{
        .sessionHandle =3D TPM2_RS_PW,
        .sessionAttributes =3D 0,
        .nonce =3D {.size =3D 0},
        .hmac =3D {.size =3D 0}}}};

    printf("*********NV INDEX TESTS*************\n" );

    nvAuth.size =3D 20;

        rval =3D Tss2_Sys_NV_Write( sysContext, TPM2_RH_PLATFORM, TPM20_IND=
EX_TEST1, &sessionsData, &nvWriteData, 0, &sessionsDataOut );


}
--===============4479766235279203370==--

