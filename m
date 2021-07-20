Content-Type: multipart/mixed; boundary="===============4987271072792005348=="
MIME-Version: 1.0
From: scott.r.eisele at gmail.com
Subject: [tpm2] TPM for SSH authentication
Date: Tue, 20 Jul 2021 03:36:18 +0000
Message-ID: <20210720033618.2743.54921@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4987271072792005348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everyone!
I'm trying to use a TPM to secure ssh keys, following the example here: htt=
ps://incenp.org/notes/2020/tpm-based-ssh-key.html
First, is this a standard way to secure ssh keys? Or is there another metho=
d that is preferred? =


Assuming this method is acceptable, I made it to the point of extracting th=
e public key from the PKCS11 token but ran into an issue.

$ ssh-keygen -vvv -D /usr/local/lib/libtpm2_pkcs11.so > tpm2key1.pub
WARNING:fapi:src/tss2-fapi/api/Fapi_List.c:226:Fapi_List_Finish() Profile o=
f path not provisioned: /HS/SRK =

ERROR:fapi:src/tss2-fapi/api/Fapi_List.c:81:Fapi_List() ErrorCode (0x000600=
34) Entities_List =

ERROR: Listing FAPI token objects failed.
debug1: provider /usr/local/lib/libtpm2_pkcs11.so: manufacturerID <tpm2-sof=
tware.github.io> cryptokiVersion 2.40 libraryDescription <TPM2.0 Cryptoki> =
libraryVersion 0.0
debug1: provider /usr/local/lib/libtpm2_pkcs11.so slot 0: label <firstToken=
> manufacturerID <Infineon> model <SLB9670> serial <000000000000000> flags =
0x40d
debug1: have 1 keys
debug2: pkcs11_register_provider: ignoring uninitialised token in provider =
/usr/local/lib/libtpm2_pkcs11.so slot 1
debug1: pkcs11_k11_free: parent 0xaaaaf0703630 ptr 0xaaaaf06ed350 idx 1
debug1: pkcs11_provider_unref: 0xaaaaf0692300 refcount 2
debug1: pkcs11_provider_finalize: 0xaaaaf0692300 refcount 1 valid 1
debug1: pkcs11_provider_unref: 0xaaaaf0692300 refcount 1

I then tried running Fapi_List() directly:

$ sudo tss2_list
WARNING:fapi:src/tss2-fapi/api/Fapi_List.c:216:Fapi_List_Finish() Path not =
found:  =

ERROR:fapi:src/tss2-fapi/api/Fapi_List.c:81:Fapi_List() ErrorCode (0x000600=
34) Entities_List =

Fapi_List(0x60034) - fapi:Provisioning was not executed.

And assumed that provisioning was required. So I attempted that:

$ sudo tss2_provision =

ERROR:fapi:src/tss2-fapi/api/Fapi_Provision.c:520:Fapi_Provision_Finish() E=
rrorCode (0x0006000b) SRK persistent handle already defined =

ERROR:fapi:src/tss2-fapi/api/Fapi_Provision.c:168:Fapi_Provision() ErrorCod=
e (0x0006000b) Provision =

Fapi_Provision(0x6000B) - fapi:A parameter has a bad value

At this point, I'm at a loss as to what the state of the TPM is and how to =
properly provision it and establish the Storage Hierarchy. =

I've looked at https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM=
-v2.0-Provisioning-Guidance-Published-v1r1.pdf
but it's not clear to me how to apply it. =


Any help would be great. Thanks!

My platform configuration is: =

raspberry pi 3b+
Infineon OPTIGA=E2=84=A2 TPM SLx 9670
ubuntu 20.04
tpm2-tss-3.1.0
tpm2-tools-5.1.1
tpm2-abrmd-2.4.0
tpm2-pkcs11-1.6.0
--===============4987271072792005348==--

