Content-Type: multipart/mixed; boundary="===============0027509583687002194=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: How Is This Possible If There Are No Keys ? ? ?
Date: Thu, 05 Dec 2019 14:17:23 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163C1D4D1@exch2010c.sit.fraunhofer.de>
In-Reply-To: CALtZhhPiiEHCwBoB1zVHA5X-600Y6gvdSDzU5oyX3i=UbZxPyQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0027509583687002194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

try 0x81000002
0x81010000 and following are endorsement hierarchy handles...
if that's not enough, try specifying the owner hierarchy via parameter

see https://github.com/tpm2-software/tpm2-tss-engine/blob/8acc6181f27c1b602=
63ab9ad5e28f4638e0460ed/test/rsasign_persistent.sh#L33
for a working example...
________________________________________
From: Frederick Gotham [cauldwell.thomas(a)gmail.com]
Sent: Thursday, December 05, 2019 15:11
To: Fuchs, Andreas; tpm2
Subject: Re: [tpm2] How Is This Possible If There Are No Keys ? ? ?

On 12/5/19, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de> wrote:
> No, you take your object context file and _choose_ the persistent handle =
to
> store it under.


I tried this:

    tpm2_loadexternal -G rsa -u public.pem -c key_context_file_for_tpm2
    tpm2_evictcontrol -c key_context_file_for_tpm2 0x81010002

And here's how the output I got:

    WARNING:esys:src/tss2-esys/api/Esys_EvictControl.c:326:Esys_EvictContro=
l_Finish()
Received TPM Error
    ERROR:esys:src/tss2-esys/api/Esys_EvictControl.c:114:Esys_EvictControl()
Esys Finish ErrorCode (0x00000282)
    ERROR: Esys_EvictControl(0x282) - tpm:handle(2):inconsistent attributes
    ERROR:esys:src/tss2-esys/esys_tr.c:357:Esys_TR_Close() Error: Esys
handle does not exist (70018).
    ERROR: Esys_TR_Close(0x70018) - esapi:0x18
    ERROR: Unable to run tpm2_evictcontrol

I've tried leaving out the "0x81010002" at the end but I get the same
error output.

--===============0027509583687002194==--

