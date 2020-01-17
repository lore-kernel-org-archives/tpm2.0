Content-Type: multipart/mixed; boundary="===============4771720550940536702=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: Made an ZFS root pool auto-unlock,
 please give review of method
Date: Fri, 17 Jan 2020 01:04:26 +0000
Message-ID: <20200117010426.2574.11391@ml01.vlan13.01.org>
In-Reply-To: CA++-fmvrrqtoogiJOxGTN=eDfbn4XJ7Q=Sn2XXYmQT4K5S2BFA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4771720550940536702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Garret,

Did you explored clevis (https://github.com/latchset/clevis) as an alternat=
ive for this?
I have a very simple example in a gist, using tpm secrets sealed with a sta=
tic PCR policy. https://gist.github.com/dnoliver/7259f2648e60e9a1e2d370641c=
991ad3

I am not sure if TPM PCR policy + Password is supported by clevis today, bu=
t should be easy to add.

It also support an early boot unlocker with Dracut: https://github.com/latc=
hset/clevis#unlocker-dracut which apparently prompt for a password. I am no=
t sure if it is support both TPM key and user pin.
--===============4771720550940536702==--

