Content-Type: multipart/mixed; boundary="===============4573535587083429915=="
MIME-Version: 1.0
From: Tim K <tpm2 at bitzap.e4ward.com>
Subject: [tpm2] Re: How to initialize a used TPM2 module and thoughts on clevis
Date: Wed, 13 Jul 2022 15:59:13 +0000
Message-ID: <20220713155913.2570.91658@ml01.vlan13.01.org>
In-Reply-To: 741ff3ee9707c1f3502d48e97496e1a47edfbb6d.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4573535587083429915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

My goal is to automate a cron job that requires credentials by keeping the =
credentials in a file that is encrypted using TPM2 via clevis. I am fully a=
ware this does not add much protection if someone gets access to the OS, it=
 is just so credentials do not sit in plain text in a file on disk, just pr=
otected by file permissions and it somewhat protects me from accidentally s=
ync'ing the file to cloud or to some other backup (the file would at least =
be encrypted).

In order to do this, I don't think I can password protect the TPM2 hierarch=
ies, otherwise there would be no way to automate it, I'd have to put the TP=
M2 passwords in the script for clevis to use (assuming clevis adds the opti=
on or that I just call the tpm2_* commands myself).

Any other suggestions how to make this better? My original idea was to use =
systemd-creds but it is not available in systemd v249 that Ubuntu 22.04 LTS=
 ships with.
--===============4573535587083429915==--

