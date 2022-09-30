Content-Type: multipart/mixed; boundary="===============6396430615012659114=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Clearing TPM
Date: Fri, 30 Sep 2022 17:20:49 +0000
Message-ID: <0389a2458d13073e1e9ce34e99f17e90307cc93c.camel@intel.com>
In-Reply-To: 20220930162656.2030.79430@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6396430615012659114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-09-30 at 16:26 +0000, burnsds.accounts(a)protonmail.com
wrote:
> I am working a Linux IoT integration with TPM 2.0 and want to write a
> provisioning script for ensuring the TPM is setup consistently on the
> device.  The script uses tpm2_clear and tpm2_changeauth.  Some of my
> devices show the following error message when calling tpm2_clear:
> =

> dhub(a)dhub336:~$ sudo tpm2_clear
> [sudo] password for dhub:
> WARNING:esys:src/tss2-esys/api/Esys_Clear.c:291:Esys_Clear_Finish()
> Received TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_Clear.c:97:Esys_Clear() Esys Finish
> ErrorCode (0x00000921)
> ERROR: Esys_Clear(0x921) - tpm:warn(2.0): authorizations for objects
> subject to DA protection are not allowed at this time because the TPM
> is in DA lockout mode
> ERROR: Unable to run tpm2_clear
> =

> This makes me nervous as some of the devices need to be provisioned
> in the field.  Why is the DA lockout preventing me from clearing the
> TPM?  This is occurring on a NUC10 where the TPM is implemented in
> the PTT.

Something has gotten auth wrong enough times on a DA protected object
to trigger DA lockout. Why, I can't tell you. You'd have to investigate
the reason it got into that state. tpm2_dictionarylockout -c will clear
it and requires owner or lockout password.

> =

> Thanks,
> Dan Burns
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6396430615012659114==--

