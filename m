Content-Type: multipart/mixed; boundary="===============6401698083394599607=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: OpenSSL TLS using tpm2-pkcs11 doesn't work on newer
 versions
Date: Thu, 23 Jan 2020 19:35:43 +0000
Message-ID: <20200123193543.2993.48888@ml01.vlan13.01.org>
In-Reply-To: bc792ae09d144aa2943754e0f238afea@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6401698083394599607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have the same problem in Fedora 30, this are my versions:

1. tpm2-tss(a)2.3.0
2. tpm2-tools(a)4.0.1
3. tpm2-pkcs11(a)1.0
4. openssl(a)1.1

The radius log reports the same issue as Ignacio:

(13) eap_tls: TLS_accept: SSLv3/TLS read client certificate
(13) eap_tls: <<< recv TLS 1.2  [length 0046] =

(13) eap_tls: TLS_accept: SSLv3/TLS read client key exchange
(13) eap_tls: <<< recv TLS 1.2  [length 0108] =

(13) eap_tls: >>> send TLS 1.2  [length 0002] =

(13) eap_tls: ERROR: TLS Alert write:fatal:decrypt error
tls: TLS_accept: Error in error
(13) eap_tls: ERROR: Failed in __FUNCTION__ (SSL_read)
(13) eap_tls: ERROR: error:0407E088:rsa routines:RSA_verify_PKCS1_PSS_mgf1:=
salt length check failed
(13) eap_tls: ERROR: error:1417B07B:SSL routines:tls_process_cert_verify:ba=
d signature
(13) eap_tls: ERROR: System call (I/O) error (-1)
(13) eap_tls: ERROR: TLS receive handshake failed during operation
(13) eap_tls: ERROR: [eaptls process] =3D fail
(13) eap: ERROR: Failed continuing EAP TLS (13) session.  EAP sub-module fa=
iled
(13) eap: Sending EAP Failure (code 4) ID 6 length 4
(13) eap: Failed in EAP select
(13)     [eap] =3D invalid
(13)   } # authenticate =3D invalid
(13) Failed to authenticate the user

My tpm2_pkcs11 ldd output is

[root(a)localhost ~]# ldd /usr/lib64/pkcs11/libtpm2_pkcs11.so
        linux-vdso.so.1 (0x00007ffe2f3e7000)
        libtss2-esys.so.0 =3D> /usr/local/lib/libtss2-esys.so.0 (0x00007f95=
a2714000)
        libtss2-sys.so.0 =3D> /usr/local/lib/libtss2-sys.so.0 (0x00007f95a2=
6eb000)
        libtss2-mu.so.0 =3D> /usr/local/lib/libtss2-mu.so.0 (0x00007f95a26a=
3000)
        libtss2-tctildr.so.0 =3D> /usr/local/lib/libtss2-tctildr.so.0 (0x00=
007f95a269a000)
        libtss2-rc.so.0 =3D> /usr/local/lib/libtss2-rc.so.0 (0x00007f95a269=
0000)
        libsqlite3.so.0 =3D> /lib64/libsqlite3.so.0 (0x00007f95a2571000)
        libcrypto.so.1.1 =3D> /lib64/libcrypto.so.1.1 (0x00007f95a228f000)
        libyaml-0.so.2 =3D> /lib64/libyaml-0.so.2 (0x00007f95a226d000)
        libdl.so.2 =3D> /lib64/libdl.so.2 (0x00007f95a2267000)
        libpthread.so.0 =3D> /lib64/libpthread.so.0 (0x00007f95a2246000)
        libc.so.6 =3D> /lib64/libc.so.6 (0x00007f95a2080000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f95a27d5000)
        libm.so.6 =3D> /lib64/libm.so.6 (0x00007f95a1f3a000)
        libz.so.1 =3D> /lib64/libz.so.1 (0x00007f95a1f1e000)

Could this be confirmed by compiling the tpm2_pkcs11 module with openssl 1.=
0.2?
--===============6401698083394599607==--

