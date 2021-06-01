Content-Type: multipart/mixed; boundary="===============8307798418616184668=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Lost/blocked when trying to setup a symmetric
 decryption/encryption scheme using the tpm...
Date: Tue, 01 Jun 2021 14:45:07 +0000
Message-ID: <SN6PR11MB3437EED5D84922AE861FE978B83E9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 5627ff076acbafb56d940e1dd85bdff6@kngnt.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8307798418616184668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For symmetric encryption, it would use tpm2_encryptdecrypt command.
Then for the data, just pass whatever to encrypt, in this case your ASCII s=
tring.

But I am not really sure I follow your use case or that using symmetric enc=
ryption gives you
a better set of security properties or even what you want. Also note, that =
not all TPMs support
symmetric encryption. So you would want to check tpm2_getcap commands, whic=
h I think for
version 3.X offhand would be tpm2_getcap -c commands.

I think it would be better to look at more complex policies and tie it to a=
 policy signed command
so as PCR states change you can re-sign policies corresponding to that. You=
 could also do a policy
OR approach, and say something like this PCR state or this password, and th=
en use the password
to re-create the object with your sealed data as needed to the new PCR's.

Bear in mind that when you do policy signed, that nothing prevents old poli=
cies by default from being used.
So you want to ensure you do something like policyauthorizenv or an nv inde=
x counter you can increment.

From: Felix Rubio <felix(a)kngnt.org>
Sent: Saturday, May 29, 2021 2:14 AM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Lost/blocked when trying to setup a symmetric decryption/en=
cryption scheme using the tpm... =

=C2=A0
Hi everybody!

I am giving a try in setting up an encryption system for one of my =

computers, by making use of the TPM 2.0. I am completely stuck for two =

days now, and... maybe somebody can give me a hand?

My first experiment was to seal the disk encryption key, using a PCR =

policy. This worked:

a) To seal the key
=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_takeownership -c
=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_pcrlist -L sha1:0,1,7 -o pcr_state.bin
=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_createpolicy -P -L sha1:0,1,7 -F pcr_state.bi=
n -f policy.bin
=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_createprimary -H e -g sha1 -G rsa
=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_create -g sha256 -G keyedhash -u key.pub -r k=
ey.priv -H =

0x80000000 -L policy.bin -A "fixedtpm|fixedparent|noda|adminwithpolicy" =

-I /dev/shm/key.bin
=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_load -H 0x80000000 -u key.pub -r key.priv
=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_evictcontrol -A o -H 0x80000001 -S 0x81010002

b) to unseal it:
=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_unseal -H 0x81010002 -L sha1:0,1,7 > key.bin

However, in case the TPM has an issue (or I need to restore a backup,=C2=A0 =

use a rescue disk, etc.), I want to give it another twist: to use the =

TPM to encrypt/decrypt a regular ascii string... still tying it to the =

pcr registers. And... I do not manage to get it right. I have been =

looking for two days around on the internet, and I do not get to find an =

example doing something similar to what I need (I am running tpm2-tools =

3.1 on debian stable). I know I can just seal an ascii passphrase and =

use my previous approach... but I'd really like to understand how it =

should be done.

Regards!
Felix
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8307798418616184668==--

