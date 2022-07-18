Content-Type: multipart/mixed; boundary="===============1863819418771786435=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Lifecycle of handles and contexts
Date: Mon, 18 Jul 2022 14:45:31 +0000
Message-ID: <add83f20e790263ea0f2e7e07ced371036613fac.camel@intel.com>
In-Reply-To: 20220716142045.2570.9096@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1863819418771786435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 2022-07-16 at 14:20 +0000, Tim K wrote:
> Is there a good resource that describes the lifecycle of handles and
> contexts, in easy to understand terms?

Not great, but the TPM spec does have a section on it:
  - Section 15 of =

https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-Arc=
hitecture-01.38.pdf


They key to know when you get a Handle the high byte determines the
type of handle, when you know the type you can know the lifecycle.

> =

> For example, if I create a primary key and then create a key and seal
> some data, I can keep unsealing the data without reloading the key.
> But if I reboot the computer, I have to create the primary key again
> and reload the key then I can unseal multiple times. So these keys
> get stored in the TPM until reboot it seems.

Correct, they are both transient objects with a high byte of 0x80.
 =

> =

> Is there a way to flush them out of the TPM or even list what's
> stored? =


TPM2 Command TPM2_GetCap can show you what's loaded and
TPM2_FlushContext will flush them. Their are matching APIs and tools in
the tpm2-tss and tpm2-tools project. NOTE that when using a resource
manager like tpm2-abrmd or /dev/tpmrm0 that transient objects are
flushed when the application exits or closes the connection with the
resource manager.

> =

> Is there a way to list what's stored, what keys are loaded? =


For example with the tpm2-tools NOT USING A RESOURCE MANAGER:

# create
tpm2 createprimary

# list
tpm2 getcap --tcti=3Dmssim handles-transient
- 0x80000000

# note 0x80 start, so transient
tpm2 flushcontext --tcti=3Dmssim 0x80000000

tpm2 getcap --tcti=3Dmssim handles-transient
# gone

> What about flushing them out without rebooting?

flushcontext

> =

> Thanks!
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============1863819418771786435==--

