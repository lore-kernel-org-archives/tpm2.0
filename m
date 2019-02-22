Content-Type: multipart/mixed; boundary="===============0150706685629828498=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 20, Issue 17
Date: Fri, 22 Feb 2019 21:19:09 +0000
Message-ID: <D707E35E-98C6-4463-87B5-B6F787A3CE98@intel.com>
In-Reply-To: mailman.1696.1550852468.2117.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0150706685629828498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@Petko Manolov here is the output from my platform with fTPM or PTT as the =
TPM and I found everything functional

openssl genrsa -out signing_key_private.pem 2048
Generating RSA private key, 2048 bit long modulus
..+++
............+++
e is 65537 (0x10001)

openssl rsa -in signing_key_private.pem -out signing_key_public.pem -pubout
writing RSA key

tpm2_loadexternal -G rsa -a o -u signing_key_public.pem -o signing_key.ctx =
-n signing_key.name
handle: 0x800000FF
name: 0x000b4edf4140b498c3ef6a496f98f0d034712786753e5677a22663816b612b075dba

tpm2_pcrlist -L sha256:0 -o pcr0.sha256
sha256:
  0 : 0x16F10FB8CDE64A05CF2CED6B30F35FF063E3CF1F4A9E95A99A98FA1F4D3A42CF

tpm2_startauthsession -S session.ctx
session-handle: 0x3000000

tpm2_policypcr -S session.ctx -L sha256:0 -F pcr0.sha256 -f pcr.policy
policy-digest: 0x31FDC9AA71500875760FC2FF37862C932FDFF48E10F1A648D1EAFDD49B=
35F015

tpm2_flushcontext -S session.ctx

openssl dgst -sha256 -sign signing_key_private.pem -out pcr.signature pcr.p=
olicy

tpm2_startauthsession -S session.ctx
session-handle: 0x3000000

tpm2_policyauthorize -S session.ctx -o authorized.policy -f pcr.policy -n s=
igning_key.name
b09780f1e8afcb441ce7ba2bd040114ce5c062f7325b9c49dfb21a86bf8a4531

tpm2_flushcontext -S session.ctx

tpm2_createprimary -Q -a o -g sha256 -G rsa -o prim.ctx -P owner

tpm2_create -Q -g sha256 -u sealing_pubkey.pub -r sealing_prikey.pub -I- -C=
 prim.ctx -L authorized.policy <<< "secret to seal"

tpm2_verifysignature -c signing_key.ctx -G sha256 -m pcr.policy -s pcr.sign=
ature -t verification.tkt -f rsassa

tpm2_startauthsession -a -S session.ctx
session-handle: 0x3000000

tpm2_policypcr -Q -S session.ctx -L sha256:0 -f pcr.policy

tpm2_policyauthorize -S session.ctx -o authorized.policy -f pcr.policy -n s=
igning_key.name -t verification.tkt
b09780f1e8afcb441ce7ba2bd040114ce5c062f7325b9c49dfb21a86bf8a4531

tpm2_load -Q -C prim.ctx -u sealing_pubkey.pub -r sealing_prikey.pub -o sea=
ling_key.ctx

unsealed=3D`tpm2_unseal -p "session:session.ctx" -c sealing_key.ctx`

echo $unsealed =

secret to seal

tpm2_flushcontext -S session.ctx

tpm2_getcap -c properties-fixed | grep -i vendor_string -A2
TPM2_PT_VENDOR_STRING_1:
  raw: 0x496E7465
  value: "Inte"
TPM2_PT_VENDOR_STRING_2:
  raw: 0x6C000000
  value: "l"
TPM2_PT_VENDOR_STRING_3:
  raw: 0x0
  value: ""
TPM2_PT_VENDOR_STRING_4:
  raw: 0x0
  value: ""
tpm2_getcap --version
tool=3D"tpm2_getcap" version=3D"3.0.2-734-g253e290" tctis=3D"dynamic" tcti-=
default=3Dtabrmd dlclose=3Denabled

=EF=BB=BFOn 2/22/19, 9:21 AM, "tpm2 on behalf of tpm2-request(a)lists.01.or=
g" <tpm2-bounces(a)lists.01.org on behalf of tpm2-request(a)lists.01.org> w=
rote:

    Send tpm2 mailing list submissions to
    	tpm2(a)lists.01.org
    =

    To subscribe or unsubscribe via the World Wide Web, visit
    	https://lists.01.org/mailman/listinfo/tpm2
    or, via email, send a message with subject or body 'help' to
    	tpm2-request(a)lists.01.org
    =

    You can reach the person managing the list at
    	tpm2-owner(a)lists.01.org
    =

    When replying, please edit your Subject line so it is more specific
    than "Re: Contents of tpm2 digest..."
    =

    =

    Today's Topics:
    =

       1. Re: tpm2 Digest, Vol 20, Issue 16 (Desai, Imran)
       2. tpm2-tss-engine (for OpenSSL) v1.0.0-rc0 (Fuchs, Andreas)
       3. tpm2-totp v0.1.0-rc0 (Fuchs, Andreas)
       4. tpm2_encryptdecrypt : other mode than the persistent key
          (Gael GUEGAN)
    =

    =

    ----------------------------------------------------------------------
    =

    Message: 1
    Date: Thu, 21 Feb 2019 20:18:25 +0000
    From: "Desai, Imran" <imran.desai(a)intel.com>
    To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
    Subject: Re: [tpm2] tpm2 Digest, Vol 20, Issue 16
    Message-ID:
    	<688D07BB9E3A9E4A852BA1336D1910FF83EFCBCB(a)fmsmsx104.amr.corp.intel.c=
om>
    	=

    Content-Type: text/plain; charset=3D"us-ascii"
    =

    Persistent handles start with hex 81xxxxxx
    ________________________________________
    From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of tpm2-request(a)li=
sts.01.org [tpm2-request(a)lists.01.org]
    Sent: Thursday, February 21, 2019 1:00 PM
    To: tpm2(a)lists.01.org
    Subject: tpm2 Digest, Vol 20, Issue 16
    =

    Send tpm2 mailing list submissions to
            tpm2(a)lists.01.org
    =

    To subscribe or unsubscribe via the World Wide Web, visit
            https://lists.01.org/mailman/listinfo/tpm2
    or, via email, send a message with subject or body 'help' to
            tpm2-request(a)lists.01.org
    =

    You can reach the person managing the list at
            tpm2-owner(a)lists.01.org
    =

    When replying, please edit your Subject line so it is more specific
    than "Re: Contents of tpm2 digest..."
    =

    =

    Today's Topics:
    =

       1. Roadblock using TPM2 for mounting filesystems (martin doc)
       2. Re: facilitating BIOS update with seamless PCR policy change
          (Petko Manolov)
    =

    =

    ----------------------------------------------------------------------
    =

    Message: 1
    Date: Thu, 21 Feb 2019 01:18:10 +0000
    From: martin doc <db1280(a)hotmail.com>
    To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
    Subject: [tpm2] Roadblock using TPM2 for mounting filesystems
    Message-ID:
            <SL2P216MB0266A71D9099EBA6243311BCC27E0(a)SL2P216MB0266.KORP216=
.PROD.OUTLOOK.COM>
    =

    Content-Type: text/plain; charset=3D"iso-8859-1"
    =

    I'm trying to get TPM2 working with encrypted filesystems on CentOS 7.
    =

    I started out using this page as a guide:
    https://threat.tevora.com/secure-boot-tpm-2/
    =

    but some of the CLI has changed. The commands I've used are:
    =

    =

    # dmesg | grep tpm_tis
    [    1.919443] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1B, rev-id 16)
    # tpm2_createpolicy -P -L sha1:0,2,3,7 -F pcrs.bin -f policy.digest
    =

    # tpm2_createprimary -H e -g sha1 -G rsa -C primary.context
    =

    ObjectAttribute: 0x00030072
    CreatePrimary Succeed ! Handle: 0x800000ff
    =

    =

    # dd if=3D/dev/urandom of=3D/tmp/secret.bin bs=3D32 count=3D1
    # tpm2_create -g sha256 -G keyedhash -u obj.pub -r obj.priv -c primary.=
context -L policy.digest -A "noda|adminwithpolicy|fixedparent|fixedtpm" -I =
/tmp/secret.bin
    =

    Load object into the TPM
    =

    # tpm2_load -c primary.context -u obj.pub -r obj.priv -C load.context
    Load succ.
    LoadedHandle: 0x80000100
    =

    But the final step fails:
    =

    # tpm2_evictcontrol -A o -c load.context -S 0x80000100
    persistentHandle: 0x80000100
    ERROR: EvictControl failed, error code: 0x1c4
    # tpm2_rc_decode 0x1c4
    error layer
    hex: 0x0
    identifier: TSS2_TPM_ERROR_LEVEL
    description: Error produced by the TPM
    format 1 error code
    hex: 0x04
    identifier: TPM_RC_VALUE
    description: value is out of range or is not correct for the context
    parameter
    hex: 0x100
    identifier: TPM_RC_1
    description: (null)
    =

    =

    The error description is a clue that the "-S #" is not right.
    It also doens't work if I use the handle value for the primary.
    Is there another step in here that I'm missing?
    =

    =

    -------------- next part --------------
    An HTML attachment was scrubbed...
    URL: <http://lists.01.org/pipermail/tpm2/attachments/20190221/124e306a/=
attachment-0001.html>
    =

    ------------------------------
    =

    Message: 2
    Date: Thu, 21 Feb 2019 15:12:45 +0200
    From: Petko Manolov <sti(a)nucleusys.com>
    To: "Roberts, William C" <william.c.roberts(a)intel.com>
    Cc: "Desai, Imran" <imran.desai(a)intel.com>, "tpm2(a)lists.01.org"
            <tpm2(a)lists.01.org>
    Subject: Re: [tpm2] facilitating BIOS update with seamless PCR policy
            change
    Message-ID: <20190221131245.GA2213(a)p310>
    Content-Type: text/plain; charset=3Dus-ascii
    =

            Hi,
    =

    Yet another update: the same script works fine on dTPM, regardless of t=
he type
    of PCR bank used - sha1 or sha256.
    =

    I am currently trying to debug Esys_Unseal(0x8F) - invalid nonce size o=
r nonce
    value mismatch problem.  Any suggestions where shall i start looking at?
    =

    =

    thanks,
    Petko
    =

    =

    On 19-02-20 15:05:33, Petko Manolov wrote:
    >       Hello,
    >
    > Just FYI - another fTPM is giving me the same error:
    >
    > WARNING:esys:src/tss2-esys/api/Esys_Unseal.c:295:Esys_Unseal_Finish()=
 Received TPM Error
    > ERROR:esys:src/tss2-esys/api/Esys_Unseal.c:101:Esys_Unseal() Esys Fin=
ish ErrorCode (0x0000008f)
    > ERROR: Esys_Unseal(0x8F) - tpm:handle(unk):invalid nonce size or nonc=
e value mismatch
    > ERROR: Unseal failed!
    > ERROR: Unable to run tpm2_unseal
    >
    > The machine is LENOVO P310, BIOS FWKT97A 11/08/2018, Sunrise Point-H =
chipset.
    > Could you please give me some pointers as to how this could be worked=
 around?
    >
    >
    > thanks,
    > Petko
    >
    >
    > On 19-02-18 10:20:26, Petko Manolov wrote:
    > > I am sorry that this didn't go through because of the attached scri=
pt.  I'm
    > > embedding it to this email so i'd like to apologize about the bloat.
    > >
    > > ---
    > >
    > > #!/bin/bash
    > >
    > > source common.sh
    > >
    > > #   Create a signing authority
    > > openssl genrsa -out signing_key_private.pem 2048
    > > openssl rsa -in signing_key_private.pem -out signing_key_public.pem=
 -pubout
    > > tpm2_loadexternal -G rsa -a o -u signing_key_public.pem -o signing_=
key.ctx \
    > >     -n signing_key.name
    > >
    > > echo "Signing authority created"
    > >
    > > #   Create a policy to be authorized like a pcr policy:
    > > tpm2_pcrlist -L $PCRS -o pcrs.sha256
    > > tpm2_startauthsession -S session.ctx
    > > tpm2_policypcr -S session.ctx -L $PCRS -F pcrs.sha256 -f pcr.policy
    > > tpm2_flushcontext -S session.ctx
    > > rm -f session.ctx
    > >
    > > echo "pcr policy created"
    > >
    > > #   Sign the policy
    > > openssl dgst -sha256 -sign signing_key_private.pem -out pcr.signatu=
re pcr.policy
    > >
    > > echo "policy is signed"
    > >
    > > #   Authorize the policy in the policy digest:
    > > tpm2_startauthsession -S session.ctx
    > > tpm2_policyauthorize -S session.ctx -o authorized.policy -f pcr.pol=
icy \
    > >     -n signing_key.name
    > > tpm2_flushcontext -S session.ctx
    > > rm -f session.ctx
    > >
    > > echo "policy authorized"
    > >
    > > #   Create a TPM object like a sealing object with the authorized p=
olicy
    > > #   based authentication:
    > > echo "secret to seal 123" > secret_file
    > > tpm2_createprimary -Q -a o -g sha256 -G rsa -o prim.ctx
    > > tpm2_create -Q -g sha256 -u sealing_pubkey.pub -r sealing_prikey.pu=
b \
    > >     -I secret_file -C prim.ctx -L authorized.policy
    > >
    > > echo "sealing object created"
    > >
    > > #   Satisfy policy and unseal the secret:
    > > tpm2_verifysignature -c signing_key.ctx -G sha256 -m pcr.policy \
    > >     -s pcr.signature -t verification.tkt -f rsassa
    > > tpm2_startauthsession -a -S session.ctx
    > > tpm2_policypcr -Q -S session.ctx -L $PCRS -f pcr.policy
    > > tpm2_policyauthorize -S session.ctx -o authorized.policy -f pcr.pol=
icy \
    > >     -n signing_key.name -t verification.tkt
    > > tpm2_load -Q -C prim.ctx -u sealing_pubkey.pub -r sealing_prikey.pu=
b \
    > >     -o sealing_key.ctx
    > > tpm2_unseal -p "session:session.ctx" -c sealing_key.ctx -o unsealed
    > > cat unsealed
    > > tpm2_flushcontext -S session.ctx
    > > rm -f session.ctx unsealed
    > >
    > > echo "the end"
    > >
    > > ---
    > >
    > >
    > > thanks,
    > > Petko
    > >
    > >
    > > On 19-02-18 09:48:37, Petko Manolov wrote:
    > > >   Hello again,
    > > >
    > > > I managed to get authorized PCR policies to work for me.  The att=
ached script
    > > > works fine on my thinkpad and on rpi3 with Infineon's SLB9670 SPI=
 TPM2.
    > > >
    > > > However, i stumbled upon a problem with an fTPM implementation in=
 a very recent
    > > > AMI BIOS.  Everything seems to be working properly, until i get t=
pm2_unseal to
    > > > give me the error below.  The tpm2-tools is built with at-the-tim=
e tip of git
    > > > commit id:
    > > >
    > > >   872076e1b31f22b18391c6761d47575a93891cd7
    > > >
    > > > tpm2_unseal -v:
    > > >
    > > >   tool=3D"tpm2_unseal" version=3D"3.0.2-858-g88956e75" tctis=3D"d=
ynamic" tcti-default=3Dtabrmd dlclose=3Denabled
    > > >
    > > > tpm-tss is v2.1.0 and tpm-abrmd is v2.0.3.  Unfortunately the err=
or message does
    > > > not mean much for me so any help will be greatly appreciated.
    > > >
    > > >
    > > > thanks,
    > > > Petko
    > > >
    > > >
    > > >
    > > > ---
    > > >
    > > > Generating RSA private key, 2048 bit long modulus
    > > > ..............................+++++
    > > > ...........................................+++++
    > > > e is 65537 (0x10001)
    > > > writing RSA key
    > > > transient-context: signing_key.ctx
    > > > name: 0x000b5e069ba4b591842c25155d812f635970dabe7cee663aff1210889=
40f88e2da80
    > > > Signing authority created
    > > > sha256:
    > > >   0 : 0x647992CBC9EEBF49D367559D870620C324B1A4307EB2A6166F1ACEC0D=
C186AEA
    > > >   1 : 0x519B03509291B643DA7FEC4407FFC47C1C18AF706A611ECA1C159D460=
8342338
    > > >   2 : 0x369BB94CEB4A1DF8E76720141B64C57EC70E6C620F07B27E335E70AD2=
DDC25DB
    > > >   3 : 0x369BB94CEB4A1DF8E76720141B64C57EC70E6C620F07B27E335E70AD2=
DDC25DB
    > > > session-context: session.ctx
    > > > policy-digest: 0x22035897291FE4681D7800685BFC5C73EBCBB88C7A579AB2=
0C2E345A9815FDFE
    > > > pcr policy created
    > > > policy is signed
    > > > session-context: session.ctx
    > > > 45a41a53c9f74f09b72151af6ffdd199fe1129eff2b749b8e481b6b21f2281f1
    > > > policy authorized
    > > > sealing object created
    > > > session-context: session.ctx
    > > > 45a41a53c9f74f09b72151af6ffdd199fe1129eff2b749b8e481b6b21f2281f1
    > > > WARNING:esys:../tpm2-tss/src/tss2-esys/api/Esys_Unseal.c:295:Esys=
_Unseal_Finish() Received TPM Error
    > > > ERROR:esys:../tpm2-tss/src/tss2-esys/api/Esys_Unseal.c:101:Esys_U=
nseal() Esys Finish ErrorCode (0x0000008f)
    > > > ERROR: Esys_Unseal(0x8F) - tpm:handle(unk):invalid nonce size or =
nonce value mismatch
    > > > ERROR: Unseal failed!
    > > > ERROR: Unable to run tpm2_unseal
    > > > cat: unsealed: No such file or directory
    > > > the end
    > >
    > >
    > > _______________________________________________
    > > tpm2 mailing list
    > > tpm2(a)lists.01.org
    > > https://lists.01.org/mailman/listinfo/tpm2
    > >
    > _______________________________________________
    > tpm2 mailing list
    > tpm2(a)lists.01.org
    > https://lists.01.org/mailman/listinfo/tpm2
    >
    =

    =

    ------------------------------
    =

    Subject: Digest Footer
    =

    _______________________________________________
    tpm2 mailing list
    tpm2(a)lists.01.org
    https://lists.01.org/mailman/listinfo/tpm2
    =

    =

    ------------------------------
    =

    End of tpm2 Digest, Vol 20, Issue 16
    ************************************
    =

    =

    ------------------------------
    =

    Message: 2
    Date: Fri, 22 Feb 2019 11:02:39 +0000
    From: "Fuchs, Andreas" <andreas.fuchs(a)sit.fraunhofer.de>
    To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
    Subject: [tpm2] tpm2-tss-engine (for OpenSSL) v1.0.0-rc0
    Message-ID:
    	<9F48E1A823B03B4790B7E6E69430724D0162E56DED(a)exch2010c.sit.fraunhofer=
.de>
    	=

    Content-Type: text/plain; charset=3D"us-ascii"
    =

    Hello all,
    =

    the first release candidate for the first stable version of the tpm2-ts=
s-engine 1.0.0-rc0 is out:
    https://github.com/tpm2-software/tpm2-tss-engine/releases/tag/v1.0.0-rc0
    =

    Please give it some rigorous testing and review, given that it is the f=
irst stable version to appear.
    Any feedback is highly appreciated.
    =

    Thanks a lot,
    Andreas
    =

    ------------------------------
    =

    Message: 3
    Date: Fri, 22 Feb 2019 11:02:42 +0000
    From: "Fuchs, Andreas" <andreas.fuchs(a)sit.fraunhofer.de>
    To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
    Subject: [tpm2] tpm2-totp v0.1.0-rc0
    Message-ID:
    	<9F48E1A823B03B4790B7E6E69430724D0162E56DF4(a)exch2010c.sit.fraunhofer=
.de>
    	=

    Content-Type: text/plain; charset=3D"us-ascii"
    =

    Hello all,
    =

    the first release candidate for the first unstable version of tpm2-totp=
 0.1.0-rc0 is out:
    https://github.com/tpm2-software/tpm2-totp/releases/tag/v0.1.0-rc0
    =

    Please give it some rigorous testing and review, given that it is the f=
irst version to appear.
    Any feedback is highly appreciated.
    =

    Thanks a lot,
    Andreas
    =

    ------------------------------
    =

    Message: 4
    Date: Fri, 22 Feb 2019 16:21:04 +0000
    From: Gael GUEGAN <Gael.Guegan(a)non.se.com>
    To: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
    Subject: [tpm2] tpm2_encryptdecrypt : other mode than the persistent
    	key
    Message-ID:
    	<VI1PR04MB5424E6EB722498DFF8B16B54DC7F0(a)VI1PR04MB5424.eurprd04.prod.=
outlook.com>
    	=

    Content-Type: text/plain; charset=3D"us-ascii"
    =

    When using the command : **tpm2_encryptdecrypt**, should we be able to =
cipher with a different mode than the one specified in the key ?
    =

    For example, if I have created a persistent **aes256cfb** :
    =

    ```shell
    Tpm2_listpersistent
    - handle: 0x81000001
      name-alg:
        value: sha256
        raw: 0xb
      attributes:
        value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decryp=
t|sign
        raw: 0x60072
      type:
        value: symcipher
        raw: 0x25
      sym-alg:
        value: aes
        raw: 0x6
      sym-mode:
        value: ctr
        raw: 0x40
      sym-keybits: 128
      symcipher: 873f743994e47004602011039322b108b49318c305b4f5eeace36b1fe6=
34e36d
    =

    tpm2_encryptdecrypt -c 0x81000001 -I data.txt -o enc_data.txt -G cbc
    ERROR: Esys_EncryptDecrypt(0x2C9) - tpm:parameter(2):mode of operation =
not supported
    ```
    =

    This does not work ...
    =

    ```shell
    tpm2_encryptdecrypt -c 0x8100001 -I data.txt -o enc_data.txt -G cfb
    ```
    =

    This works ...
    =

    Why the option -G exists, if it is to specified a mode already present =
in the key ?
    -------------- next part --------------
    An HTML attachment was scrubbed...
    URL: <http://lists.01.org/pipermail/tpm2/attachments/20190222/9161c08b/=
attachment.html>
    =

    ------------------------------
    =

    Subject: Digest Footer
    =

    _______________________________________________
    tpm2 mailing list
    tpm2(a)lists.01.org
    https://lists.01.org/mailman/listinfo/tpm2
    =

    =

    ------------------------------
    =

    End of tpm2 Digest, Vol 20, Issue 17
    ************************************
    =



--===============0150706685629828498==--

