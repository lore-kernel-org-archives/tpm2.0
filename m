Content-Type: multipart/mixed; boundary="===============2940557916428744533=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Trying to make a script to store keys
Date: Wed, 04 Dec 2019 09:37:57 +0000
Message-ID: <CALtZhhNBB-nm5df5k_aVp7CFKViNA=Lard1CL_ftkEgvyXVj3g@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2940557916428744533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here's what I've got in my script so far;

- - - - - - - - Begin Script - - - - - - - -
#!/bin/sh

ABC_LABEL=3D`uuidgen -r`
export TPM2_PKCS11_TCTI=3Ddevice:/dev/tpmrm0

rm /root/private.pem > /dev/null 2>&1

openssl genrsa -out /root/private.pem 2048

# Not sure what the next line does but I'll do it anyway
tpm2_clear

# Clear out the objects in the TPM2's RAM
tpm2_flushcontext -t
tpm2_flushcontext -l
tpm2_flushcontext -s

# Clear out all persistent objects in cold storage
tpm2_getcap handles-persistent | xargs -r -t -n1 tpm2_evictcontrol -c

# We may as well clear it again (not sure what this does)
tpm2_clear

init() {
   ./tpm2_ptool init | rev | cut -d ' ' -f 1 | rev
}

ABC_PID=3D"$(init)"

./tpm2_ptool addtoken --pid=3D${ABC_PID} --sopin=3Dmysopin
--userpin=3D123456 --label ${ABC_LABEL}

./tpm2_ptool import --userpin 123456 --privkey /root/private.pem
--label ${ABC_LABEL} --algorithm rsa

ssh-keygen -D libtpm2_pkcs11.so
- - - - - - - - - End Script - - - - - - - - -


The first problem I'm having here is that "flushcontext" isn't
working. If I call it three times with three different argument
(t,l,s), and then call ssh-keygen immediately afterward, then it shows
that those transient keys are still in there.
--===============2940557916428744533==--

