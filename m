Content-Type: multipart/mixed; boundary="===============5538400093846015402=="
MIME-Version: 1.0
From: Petr Vandrovec <petr at vmware.com>
Subject: Re: [tpm2] Incomplete TPM event log on Linux?
Date: Wed, 18 Sep 2019 18:14:32 +0000
Message-ID: <334055b1-da45-1b31-3aa5-69bec9c5dcf3@vmware.com>
In-Reply-To: CANKkrzH5Amhgp+J=xAuMMye+FGLmWPVqCvzXTiQzR2+i21YM7w@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5538400093846015402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Matthew Dempsky wrote on 9/18/2019 10:20 AM:
> On Wed, Sep 18, 2019 at 4:21 AM Luke Hinds <lhinds(a)redhat.com =

> <mailto:lhinds(a)redhat.com>> wrote:
> =

>     PCR 7 is various components of secure boo in the context of the shim:

Hi,
   it was a bit of luck, but it seems that event at offset 17938 ('Shim' =

EFI variable authority) is being extended twice to the PCR7 - if I =

extend computed PCR7 with its hash once more, I get your hardware PCR7.

I'm not sure if it is another variable with same content measured but =

not extended, or bug in your BIOS's/EFI's code extending entry twice.

Petr

....
PCR7=3D75c9009d58fa5f82cca20c002d8dbb7bac030c2b
Event at 17938
   PCR                7
   Event Type         EV_EFI_VARIABLE_AUTHORITY (0x800000E0)
   Digests            1
     Digest SHA-1     c1a72b91de2c31d2cdd3041dfbf69bd62e144b18
   Event Data         {605dab50-e046-4300-abb6-3dd810dd8b23}
                      Name: u'Shim'
                      Value: b'\x30\x82..\x39\x0F'
                      BAD, unexpected, u'\0\0\u0100'
PCR7=3D37a1a97d5f0be67fbd544a1604c843bcee4ee3b2
Extending event once more just for fun
PCR7=3Ddb9cfc01dcc5c88acbe9c6e2db0e6bc4ea231ac6
Event at 18946
   PCR                4
   Event Type         EV_EFI_BOOT_SERVICES_APPLICATION (0x80000003)
   Digests            1
     Digest SHA-1     081f2db6630b24d7925f2cf645634c2061eaadf0
   Event Data         0 bytes at 0x0000000000000000, linked at =

0x0000000000000000
     Device Path      None
                      BAD, unexpected data, =

b'\x80\x65\x50\x00\x80\x67\x50\x00\x61'
PCR7=3Ddb9cfc01dcc5c88acbe9c6e2db0e6bc4ea231ac6
Computed PCRs 0: 2365d6ab190cc51fd04911a36a6620578f5a15b7
  1: 90cda14dcfa4b62cde2898625606298c71a94f7c
  2: b2a83b0ebf2f8374299a5b2bdfc31ea955ad7236
  3: b2a83b0ebf2f8374299a5b2bdfc31ea955ad7236
  4: 9c27a66c20926b86ea3120fa36cc75d0ee870e0d
  5: a842c2c96b7d8813837174751aeadb5314316acb
  6: b2a83b0ebf2f8374299a5b2bdfc31ea955ad7236
  7: db9cfc01dcc5c88acbe9c6e2db0e6bc4ea231ac6
  8: 0000000000000000000000000000000000000000
  9: 0000000000000000000000000000000000000000
10: 0000000000000000000000000000000000000000
11: 0000000000000000000000000000000000000000
12: 0000000000000000000000000000000000000000
13: 0000000000000000000000000000000000000000
14: 0000000000000000000000000000000000000000
15: 0000000000000000000000000000000000000000
16: 0000000000000000000000000000000000000000
17: ffffffffffffffffffffffffffffffffffffffff
18: ffffffffffffffffffffffffffffffffffffffff
19: ffffffffffffffffffffffffffffffffffffffff
20: ffffffffffffffffffffffffffffffffffffffff
21: ffffffffffffffffffffffffffffffffffffffff
22: ffffffffffffffffffffffffffffffffffffffff
23: 0000000000000000000000000000000000000000


--===============5538400093846015402==--

