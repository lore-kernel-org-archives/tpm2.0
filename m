Content-Type: multipart/mixed; boundary="===============3754061556207436737=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Protecting symmetric keys / symmetric algorithms
Date: Mon, 06 Apr 2020 15:14:27 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB8810@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200404214437.2692.62906@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3754061556207436737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: John S [mailto:sedigj(a)gmail.com]
> Sent: Saturday, April 4, 2020 4:45 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Protecting symmetric keys / symmetric algorithms
> =

> Other questions for which I am hopeful folks here can give some guidance =
on.
> =

> A little background on context/use cases. My Linux device which has the T=
PM2.0
> on it, will be participating in communication protocols with other device=
s on the
> network. Think user-less, embedded devices and protocols. The different
> devices will be performing key agreement and then authenticating their
> communication messages.
> We expect to involve CMAC for both key derivation and also MACing the
> messages, which is using AES128 keys. We are familiar with CMAC and other
> devices have support for this already.
> =

> In general too, having AES encypt/decrypt is useful for a wide variety of=
 use
> cases.
> =

> The problem:
> It appears my TPM2.0 device does not have support for symmetric operation=
s.
> Reading other threads here indicates only a minority of TPM2.0 devices do=
 have
> symmetric support.
> I can see how I can involve the TPM to share secrets between devices on t=
he
> network in a trusted and secure way. But once the TPM decrypts the secret
> (using asymmetric), what are my options for hardware protection of my AES
> keys? I guess they can be encrypted at rest / until time of use by a TPM =
key. But
> when they're actually in use it seems I'm stuck with them in software.
> Any other ideas I'm not thinking of?

You can seal arbitrary bytes (like an aes key) to the TPM in an object.
However, you will release the key to software so it will be exposed in
memory and over the bus. So you would want encrypted sessions to
prevent the bus exposure. You would probably want to authorize
release of the symmetric key from the TPM based on a signed policy
and PCR values. So you have some assurance the key is being released into a
known good environment. This also assumes that you have some type of secure
/trusted boot. You want a signed policy, so you can update the policy when
The PCR values change on valid updates.

tpm2_create has the ability to seal arbitrary data to the TPM via the -i op=
tion.

Tpm2_create has the ability to accept sessions via -S, so you can start an
encrypted session with tpm2_startauthsession.

> =

> -----Behavior on my specific TPM----
> --I concluded my tpm does not support symmetric because these sequences
> have failed:
> =

> tpm2_getcap commands : output has nothing to do with 'sym' or 'aes'
> =

> tpm2_createprimary -Grsa2048:aes128cfb -C o -c parent.ctx dd if=3D/dev/ur=
andom
> of=3Dsym.key bs=3D1 count=3D16 tpm2_import -C parent.ctx -i sym.key -u ke=
y.pub -r
> key.priv -G aes
> WARNING:esys:src/tss2-esys/api/Esys_Import.c:323:Esys_Import_Finish()
> Received TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_Import.c:110:Esys_Import() Esys Finish
> ErrorCode (0x000002c9)
> ERROR: Esys_HMAC(0x2C9) - tpm:parameter(2):mode of operation not
> supported
> ERROR: Unable to run tpm2_import
> =

> tpm2_createprimary -o primary.ctx
> tpm2_create -C primary.ctx -Ghmac -c hmac.key
> WARNING:esys:src/tss2-
> esys/api/Esys_CreateLoaded.c:355:Esys_CreateLoaded_Finish() Received TPM
> Error
> ERROR:esys:src/tss2-esys/api/Esys_CreateLoaded.c:129:Esys_CreateLoaded()
> Esys Finish ErrorCode (0x000b0143)
> ERROR: Esys_CreateLoaded(0xB0143) - rmt:error(2.0): command code not
> supported
> =

> --From tpm2_getcap algorithms, I see I have:
> aes, hmac, and cfb which all indicate they are symmetric.
> But I have no way to use them? (They are just for tpm sessions?)
> =

> --From tpm2_getcap algorithms, I see 2 of my algorithms are:
> kdf1_sp800_56a
> kdf1_sp800_108
> Both are noted as type 'hash'.
> Would I use tpm2_hash to use these? If so, how would the key for the kdf =
be
> provided?

I'm not sure exactly how these get used. I know in some algorithms there is=
 a KDF
That can be specified. Perhaps someone else will know.

> =

> Thanks much in advance,
> -John
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============3754061556207436737==--

