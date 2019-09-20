Content-Type: multipart/mixed; boundary="===============0708623759463021965=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] Putting a persistant string into the tpm2 using tpm2_tools.
Date: Fri, 20 Sep 2019 21:33:37 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FF967B992C@fmsmsx107.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0708623759463021965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@treyweaver, the issue you are seeing is that all contexts are invalidated =
after TPM restart. As @tadeusz suggests you can either make the object pers=
istent using the evict control tool.
If you do this please remember the persistent handle you specify or the one=
 used by the evictcontrol tool like 0x81000000 and now you can unseal with =
tpm2_unseal -c 0x81000000 even after TPM restarts.
Alternatively you can also repeat the key loading step which gives you a va=
lid key.ctx context file.

Thanks and Regards,

Imran Desai
________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of tpm2-request(a)lists.=
01.org [tpm2-request(a)lists.01.org]
Sent: Friday, September 20, 2019 12:00 PM
To: tpm2(a)lists.01.org
Subject: tpm2 Digest, Vol 27, Issue 23

Send tpm2 mailing list submissions to
        tpm2(a)lists.01.org

To subscribe or unsubscribe via the World Wide Web, visit
        https://lists.01.org/mailman/listinfo/tpm2
or, via email, send a message with subject or body 'help' to
        tpm2-request(a)lists.01.org

You can reach the person managing the list at
        tpm2-owner(a)lists.01.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of tpm2 digest..."


Today's Topics:

   1. Putting a persistant string into the tpm2 using tpm2_tools.
      (Trey Weaver)
   2. Re: Putting a persistant string into the tpm2 using
      tpm2_tools. (Tadeusz Struk)


----------------------------------------------------------------------

Message: 1
Date: Fri, 20 Sep 2019 10:34:51 -0400
From: "Trey Weaver" <treyweaver(a)fastmail.net>
To: tpm2(a)lists.01.org
Subject: [tpm2] Putting a persistant string into the tpm2 using
        tpm2_tools.
Message-ID: <62b22807-115d-444b-af44-b1c0ab16daf9(a)www.fastmail.com>
Content-Type: text/plain; charset=3D"us-ascii"

I want to put a small string into the TPM2 and be able to recall it over re=
starts. Here is what I have tried:

# put data in file that is to be sealed
echo "my sealed data" > seal.dat

# create a primary key
tpm2_createprimary -c primary.ctx

# create a child key in public and private parts
tpm2_create -C primary.ctx -u obj.pub -r obj.priv

# create a sealed object
tpm2_create -C primary.ctx -i seal.dat -u obj.pub -r obj.priv

# load the private and public portions into the TPM
tpm2_load -C primary.ctx -u obj.pub -r obj.priv -c key.ctx

# unseal the data
tpm2_unseal -c key.ctx

But after a power cycle if I run '*tpm2_unseal -c key.ctx*' I get this erro=
r:

*WARNING:esys:src/tss2-esys/api/Esys_ContextLoad.c:279:Esys_ContextLoad_Fin=
ish() Received TPM Error ERROR:esys:src/tss2-esys/api/Esys_ContextLoad.c:93=
:Esys_ContextLoad() Esys Finish ErrorCode (0x000001df) ERROR: Esys_ContextL=
oad(0x1DF) - tpm:parameter(1):integrity check failed ERROR: Invalid item ha=
ndle authorization ERROR: Unable to run tpm2_unseal*

I am using the tpm_server (emulator) if that makes any difference.

So what is the best way to load a small string into the tpm2 and be able to=
 pull it out anytime in the future, even after power loss.


Thanks


--===============0708623759463021965==--

