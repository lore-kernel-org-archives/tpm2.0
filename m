Content-Type: multipart/mixed; boundary="===============3432707070665593651=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Design for Secrets Encryption
Date: Wed, 28 Sep 2022 14:51:40 +0000
Message-ID: <1805d5c56015983cc4ebdee5f2f46d7ed206ecef.camel@intel.com>
In-Reply-To: fYPnYNhBp-T2NJbufHcLy_ghr5nUgil-fSR-DCBm1O-wHQVJsMEnMhNVMzvh6fTbm_ZuT03DNsaTH2_ZY0qkTEF-iNbliDXcofYuN5SlnRM=@protonmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3432707070665593651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-09-28 at 13:18 +0000, accounts wrote:
> I am working a Linux IoT integration with TPM 2.0, and have a
> requirement to use the TPM for encrypting secrets.  Unfortunately,
> disk encryption is not an option.  I=E2=80=99m using the tss2 and tpm2 to=
ols
> found here.  https://tpm2-tools.readthedocs.io/en/latest/ =

> =

> I=E2=80=99m new to TPM and have some questions regarding the
> implementation.  It appears as I can use two approaches.  The first
> approach uses tss2_createkey and tss2_encrypt to encrypt the secrets
> during device provisioning.  tss2_decrypt would then be used to
> decrypt the secrets at boot.  When using tss2_createkey, where is the
> private key stored?  Is the private key encrypted by the SRK which
> would allow it to be stored on an unencrypted disk? =


tss2_createkey can be used to create a key under the SRK. It depends
on the --path option, but the examples in the man page show it being
made under the SRK. The TPM generates a key, and then TPM protected
blobs are stored on disk in the FAPI store. The path can be used to
resolve those key blobs later for use in other tools. The blobs are
protected by the SRK as defined in the architecture spec [1] section
23.3.2 "Protections". TL;DR is that the key is protected by the SRK.


1. =

https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_Part1_A=
rchitecture_pub.pdf

> =

> The other option is to generate a key pair (using open ssl) and store
> the private key in the TPM NV index.  Assuming the first option
> stores the private key outside of the TPM, are there any security
> benefits to this approach? =


No, generally if you want to symmetric encryption, ie AES, the TPM is a
bad choice for performing the actual encryption/decryption operations.
Generally use seal and unseal to save and retrive an AES key. Then the
actual encryption operations are perfomed on the host cpu in software
or wherever the application decides to send the key. Sealing and
unsealing can be done with tss2_createseal and tss2_unseal.

tss2_encrypt, may use the TPM but the spec doesn't require it. I think
if it's doing a bulk encryption it will use that key to protect an AES
key that it keeps on disk, but others know FAPI internals better than
I. =


With FAPI based tools, tss2_ prefix things, you get a very nice
property. Encrypted sessions are established for you. This means that
anyone Man In The Middling (MiTM) your bus won't see the key. Only
things that have the ability to see the process address space can see
the key in the clear, think of the host kernel as an example. Thus
doing something in an enclave has benefits here. However, considering
that the kernel could see the plaintext message, you're not really
gaining anything a lot by going to the TPM for the key operations.

> =

> As a side note, the key will be tied to a PCR based auth policy.  It
> should only be released if the valid software configuration boots on
> the device.

Thats the general configuration for the disk encryption key, adding a
pin or other auth mechanism to it prevents attacks on the TPM where the
attacker replays the events to establish the same PCR and steals your
key.

> =

> Thanks for the help!
> =

> Dan Burns
> =

> =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3432707070665593651==--

