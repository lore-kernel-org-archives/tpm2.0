Content-Type: multipart/mixed; boundary="===============2852194720695841960=="
MIME-Version: 1.0
From: bgercken at gmail.com
Subject: [tpm2] Retrieving Context/Object attributes
Date: Tue, 06 Oct 2020 14:16:28 +0000
Message-ID: <20201006141628.2619.82668@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2852194720695841960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, I am currently working on a version of tpm_sealdata for TPM2 as a drop =
in replacement for an existing work flow.

The original code has sections where they are able to access attributes of =
the sealing context directly as shown below. =


Does the current SAPI provide a way to retrieve the encKey and sealKey equi=
valents? =


I have been unable to find the equivalent of Tspi_GetAttribData() in the cu=
rrent API.

Thanks,
-bill

```
 /* Encrypt and seal the symmetric key */  // Calls: Tspi_Data_Seal()
 if (dataSeal
      (hEncdata, hKey, EVP_CIPHER_key_length(EVP_aes_256_cbc()),
             randKey, hPcrs) !=3D TSS_SUCCESS)
                goto out_close;

 if (getAttribData(hEncdata, TSS_TSPATTRIB_ENCDATA_BLOB,
                          TSS_TSPATTRIB_ENCDATABLOB_BLOB, &encLen,
                          &encKey) !=3D TSS_SUCCESS)
                goto out_close;    // Calls Tspi_GetAttribData()

 if (getAttribData
      (hKey, TSS_TSPATTRIB_KEY_BLOB, TSS_TSPATTRIB_KEYBLOB_BLOB,
             &sealKeyLen, &sealKey) !=3D TSS_SUCCESS)
                goto out_close;

```
--===============2852194720695841960==--

