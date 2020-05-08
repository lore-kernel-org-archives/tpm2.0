Content-Type: multipart/mixed; boundary="===============3025319235956852704=="
MIME-Version: 1.0
From: muthu.smk at gmail.com
Subject: [tpm2] How CreateCsr using openssl API flow works ,
 when is passes via tpm2-tss-engine
Date: Fri, 08 May 2020 08:00:56 +0000
Message-ID: <20200508080056.2843.63913@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3025319235956852704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have below openssl command with tpmengine which generate csr using the pr=
ivate key generated using tpm2tss-genkey.

/* Generating private using below tpm2tss-genkey API*/
tpm2tss-genkey -a rsa -s 2048 tpm2tss_rsa_genkey_2048
/* using below openssl API creating a csr with input key (private key gener=
ated by tpm2tss)  , via engine tpm2tss */
openssl req -new -engine tpm2tss -keyform engine -out openssl_created_mod_r=
sa_key.csr -key  tpm2tss_rsa_genkey_2048

While creating the similar application what the above tpm2-genkey creation =
and openssl does using tpm2/tpm2-tss api , am getting my app crash in below=
 signing API . I tried checking the tpm2-tss-engine code which works for op=
enssl to perform tpm2 tss task . But i could not able to get any clue regar=
ding where this "sign" is happening .  Since this "sign" is part of csr gen=
eration , am not sure how come the command line above openssl api works . C=
an any one give me some inputs on this .

X509_REQ_sign ()

Thanks
--===============3025319235956852704==--

