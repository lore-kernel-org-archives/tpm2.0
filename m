Content-Type: multipart/mixed; boundary="===============1038186009555940609=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_quote - unexpected TPM commands - from where?
Date: Thu, 13 May 2021 18:17:44 +0000
Message-ID: <SN6PR11MB3437506BD677AC872DB8E33FB8519@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: OF00EF9886.41B16198-ON002586D3.00792A71-852586D3.007AB406@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1038186009555940609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TL;DR
So it likes like tpm2-abrmd issues a:
ContextLoad before running a transient handle command
ContextSave, Flush after a transient handle command
Seems more chatty than it needs to be.

I ran these commands for testing, and traced the tpm2_quote with pcap tcti.=
 It was running against abrmd with the ibm1628 simulator.

The tools version is (git describe output, so you can just checkout the com=
mit 4a4ff211fdd3):
5.1-rc0-1-g4a4ff211fdd3

tpm2_createprimary -C e -G rsa2048 -c primary.ctx
tpm2_create -C primary.ctx -u key.pub -r key.priv -Grsa2048 -p password
tpm2_load -C primary.ctx -u key.pub -r key.priv -c key.ctx

# trace this guy
tpm2_quote --tcti=3Dpcap -c key.ctx -l sha256:15,16,22 -p password -m msg -=
s sig -o out -g sha256

StartAuthSession [0x02000000] (HMAC Session as the tools never send a passw=
ord)
ContextLoad [key.ctx transient]
GetCapability [TPM2_CAP_PCRS] (Verifying PCR selections for better error me=
ssages to user)
ReadPublic [Figuring out a signature scheme from public object details]
Quote =

FlushContext[0x02000000] (clean up the hmac session in case non-rm used)

For the heck of it, I also traced tpm2-abrmd, which is a bit harder as we s=
ee all the commands. So to avoid this,
I ran all the commands, backed up the pcap file in that state and then ran =
quote. This way I can drop the N commands
off the head and get just what occurred in the context of quote.

Example abrmd command:
tpm2-abrmd --tcti=3Dpcap:mssim

Example of isolating the pcap files
# run all commands to quote
cp /home/wcrobert/tpm2_log.pcap /home/wcrobert/tpm2_log.pcap.old

# wireshark shows tpm2_log.pcap.old at command/response number 90, so great=
er than 90 is from quote.

# no pcap tcti
tpm2_quote -c key.ctx -l sha256:15,16,22 -p password -m msg -s sig -o out -=
g sha256

StartAuthSession --> 0x20000
ContextSave [0x20000]
ContextLoad [key.ctx] --> 0x80000000
ContextSave [0x80000000]
tpm2_flushcontext [0x80000]
GetCapability [TPM2_CAP_PCRS]
ContextLoad --> 0x80000000
ReadPublic
ContextSave [0x80000000]
tpm2_flushcontext [0x80000]
ContextLoad --> 0x80000000
Quote
ContextSave [0x80000000]
tpm2_flushcontext [0x80000]
PCR Read
FlushContext[0x20000]

So it likes like tpm2-abrmd issues a:
ContextLoad before running a transient handle command
ContextSave, Flush after a transient handle command

Seems more chatty than it needs to be.

From: Kenneth Goldman <kgoldman(a)us.ibm.com>
Sent: Wednesday, May 12, 2021 5:20 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] tpm2_quote - unexpected TPM commands - from where? =

=C2=A0
The application is running a quote with this (python wrapped) command:

['tpm2_quote', '-c', '/var/lib/keylime/secure/tmpptoera_c', '-l', 'sha256:1=
5,16,22', '-q', '645442426a4c3456786a4b767465424432357659', '-m', '/tmp/tmp=
rc17whih', '-s', '/tmp/tmp9vlpv1k2', '-o', '/tmp/tmpd3tl0nxn', '-g', 'sha25=
6', '-p', 'T5dKvXj1wGIFbp5brLUz']

Even with the implicit HMAC session, I would expect

startauthsession 02000000
loadcontext 80000000 (the quote key)
quote with session 02000000 and key 80000000
flushcontext 80000000
flushcontext 02000000

I see this. Is there something wrong with the call, is there a lot more imp=
licit in the quote tool, or is abrmd doing a lot of extra calls?

1 - It keeps loading and flushing the key and the session.
2 - It contextsave the key a few times, but it was already context saved be=
fore the command started
3 - There's an unexpected getcapability, and a really unexpected readpublic
4 - A PCR read at the end

StartAuthSession: 02000000 OK
ContextSave: 02000000 ???
ContextLoad: 80000000 OK
ContextSave: 80000000 ???
FlushContext: 80000000 really unexpected
GetCapability: 00000005 unexpected
ContextLoad: 80000000 ??? because of the flushcontext
ReadPublic: objectHandle 80000000 really unexpected
ContextSave: 80000000 ???
FlushContext: 80000000 really unexpected
ContextLoad: 80000000 ??? because of the flushcontext
ContextLoad: 02000000 ??? because of the save
Quote with Session 0 handle 02000000 OK
signHandle 80000000
ContextSave: 02000000 ??? =

ContextSave: 80000000 ???
FlushContext: 80000000 OK
PCR_Read: unexpected
FlushContext: 02000000 OK

--
Ken Goldman kgoldman(a)us.ibm.com =

914-945-2415 (862-2415)

--===============1038186009555940609==--

