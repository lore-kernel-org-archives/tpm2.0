Content-Type: multipart/mixed; boundary="===============2779374990400298037=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Question: standardized development environment for TPM2
 testing, regressions, etc.
Date: Tue, 20 Oct 2020 15:01:18 +0000
Message-ID: <SN6PR11MB3437EEC1BFD83CADBD13AB25B81F0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20201019162023.2812.6730@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2779374990400298037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Matthew Giassa <matthew(a)giassa.net>
> Sent: Monday, October 19, 2020 11:20 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Question: standardized development environment for TP=
M2
> testing, regressions, etc.
> =

> One particular test I was thinking of was injecting bogus messages into t=
he TPM2
> event log, and then using tpm2-tools to parse it (i.e. binary =3D=3D> ASC=
II) and then
> validate (i.e. TPM_GENERATED) against each entry. Also, throwing in an OS=
CP
> responder container into the mix and doing some remote attestation tests
> (including failing cases where we deliberate revoke certs in the responde=
r).

You could actually add a libfuzzer test, we do it pkcs11 and tss for exampl=
es.
We add them as unit tests, they run fast.


> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============2779374990400298037==--

