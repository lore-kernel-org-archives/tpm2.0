Content-Type: multipart/mixed; boundary="===============2177605954772620579=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Re: How Is This Possible If There Are No Keys ? ? ?
Date: Thu, 05 Dec 2019 14:11:19 +0000
Message-ID: <CALtZhhPiiEHCwBoB1zVHA5X-600Y6gvdSDzU5oyX3i=UbZxPyQ@mail.gmail.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0163C1D477@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2177605954772620579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
--===============2177605954772620579==--

