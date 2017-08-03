Content-Type: multipart/mixed; boundary="===============9180768399793076885=="
MIME-Version: 1.0
From: Raveau, Sebastien <sebastien.raveau at baesystems.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Thu, 03 Aug 2017 10:33:54 +0000
Message-ID: <1FEB6BE5D027454BAEDB8EA7F2D809DED80C27E6@UKDC1CSUEXMV01.CSU.LOCAL>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563EAA945D@ORSMSX103.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9180768399793076885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Javier, Robert, everyone,

I very much appreciate the effort but I believe there are problems with thi=
s particular approach:

> >> Do you think what I described is the correct approach? Specially I
> >> would like to know your opinion about storing not only the pub but
> >> also the priv key in the LUKS volume header (since both are needed
> >> for unsealing)

I would not store anything in the LUKS header because it needs to be measur=
ed and tightly coupled with the mounting process to ensure that you are not=
 being tricked. For example if I copy your exact /boot onto another disk, c=
opy your LUKS header into a tiny partition just for your initrd to retrieve=
 the sealed keys, and add my own root partition unencrypted but with the sa=
me UUID as that of your crypt_root then I am likely to end up with a fully =
functional system of my own where your keys are unsealed.

It is also crucial to remove access to unsealed data or unlocked NVRAM indi=
ces as soon as they are not needed anymore. For example if your initrd take=
s issue with my trick above, I imagine it would drop to a root shell which =
would still give me access to your unsealed keys unless you remove access a=
sap. This is very easily achieved with a NVRAM index by defining it with th=
e READ_STCLEAR flag and a size 0 read right after the normal read, but you =
could achieve the same result by further extending (with whatever measureme=
nt just to invalidate it) one of the PCRs the data is sealed/locked with; o=
f course in both cases you also have to make sure to wipe asap all copies o=
f unlocked/unsealed data that you might have made.

Personally I would recommend using NVRAM indices as opposed to sealed data,=
 for three reasons:
1/ No need to write to the encrypted storage medium, so that for example yo=
u can have TPM(s) unlock a live CD like https://lists.debian.org/debian-liv=
e/2007/02/msg00090.html
2/ Chicken & egg problem if you store sealed data files into the places tha=
t need to be measured, e.g. my own original approach was to store inside th=
e initrd but I needed to measure that. Granted, nowadays I could add the se=
aled data as an initrd overlay and you could measure only chosen parts of t=
he LUKS header but meh, it feels like leaving the door ajar for vulnerabili=
ties.
3/ I can't seem to find a reason justifying the unnecessary risk added by i=
ntroducing a key pair between the TPM's Hardware Security Module function a=
nd LUKS's key derivation function; why not have the TPM decrypt the LUKS ma=
ster key for you, or simply hold in NVRAM a (fully random) passphrase for o=
ne of the LUKS key slots? Both usable only when the right conditions are me=
t of course.

To be completely honest I have to warn that NVRAM size is not infinite; per=
sonally I have always found there to be plenty of space (kilobytes vs 32 by=
tes per fully-random "passphrase" to match the entropy of AES-256 keys) lef=
t but I don't know if there are TPMs out there with too little NVRAM (depen=
ding on how many combinations of bootstraps and LUKS root partitions your u=
sers might want to support) or none at all.

Best regards,

Sebastien
Please consider the environment before printing this email. This message sh=
ould be regarded as confidential. If you have received this email in error =
please notify the sender and destroy it immediately. Statements of intent s=
hall only become binding when confirmed in hard copy by an authorised signa=
tory. The contents of this email may relate to dealings with other companie=
s under the control of BAE Systems Applied Intelligence Limited, details of=
 which can be found at http://www.baesystems.com/Businesses/index.htm.

--===============9180768399793076885==--

