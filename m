Content-Type: multipart/mixed; boundary="===============3125641740512798017=="
MIME-Version: 1.0
From: ray at 3econtrols.com
Subject: [tpm2] curl TLS session using tpm encoded keyfile.
Date: Wed, 01 Apr 2020 19:14:32 +0000
Message-ID: <20200401191432.2692.3511@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3125641740512798017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Does anyone know how to use a tpm keyfile generated with:
tpm2tss-genkey -a rsa -s 2048 /home/pi/certs/client.key

I have a program that uses curl and openSSL to log into a website using a c=
ert file signed by the tpm client key.
In my program, I can load and use the key with the tpm2 library to encode/d=
ecode messages.
However, I am having trouble getting a TLS session going using libcurl.

My curl --engine list output is:
          Build-time engines:
            dynamic
            tpm2tss

The basic code I am using to generate the curl session is:
                curl_easy_setopt(curl, CURLOPT_URL, url);
		curl_easy_setopt(curl, CURLOPT_POST, 1L);
		curl_easy_setopt(curl, CURLOPT_USERNAME, username);
		curl_easy_setopt(curl, CURLOPT_PASSWORD, password);
		curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, CONNECTION_TIMEOUT);
                curl_easy_setopt(curl, CURLOPT_SSLENGINE, "tpm2tss");
                curl_easy_setopt(curl, CURLOPT_SSLENGINE_DEFAULT, 1L);
                curl_easy_setopt(curl, CURLOPT_SSLCERTTYPE, "ENG");

When initiating the session (with curl tracing & my program tracing turned =
on) I get the following messages:
[2020-04-01 18:50:19] - [VERBOSE] - httpclient-http_post_json--Setting cURL=
 to use TPM as SSL Engine tpm2tss


[LIBCURL4] --- Setting CURLOPT_SSLENGINE to : tpm2tss
[LIBCURL4] --- Curl_setstropt result : 0
[LIBCURL] ---- Curl_ssl_set_engine is call.
[LIBCURL4] --- Curl_ssl_set_engine result : 0

[2020-04-01 18:50:19] - [VERBOSE] - httpclient-http_post_json--Setting cURL=
 to use TPM as the default SSL Engine tpm2tss
[2020-04-01 18:50:19] - [VERBOSE] - httpclient-http_post_json--Setting cURL=
 to have keytype as engine
[2020-04-01 18:50:19] - [TRACE]   - httpclient-http_post_json-Setting trust=
Store to /home/pi/certs/trust.store
[2020-04-01 18:50:19] - [TRACE]   - httpclient-http_post_json-Setting clien=
tCert to /home/pi/certs/client.crt
[2020-04-01 18:50:19] - [TRACE]   - httpclient-http_post_json-Setting clien=
tKey to /home/pi/certs/client.key
* STATE: INIT =3D> CONNECT handle 0x4cabb8; line 1623 (connection #-5000)
* Added connection 0. The cache now contains 1 members
* STATE: CONNECT =3D> WAITRESOLVE handle 0x4cabb8; line 1664 (connection #0)
* family0 =3D=3D v4, family1 =3D=3D v6
*   Trying 52.167.122.10:443...
* STATE: WAITRESOLVE =3D> WAITCONNECT handle 0x4cabb8; line 1743 (connectio=
n #0)
* Connected to product.thedemodrive.com (52.167.122.10) port 443 (#0)
* STATE: WAITCONNECT =3D> SENDPROTOCONNECT handle 0x4cabb8; line 1799 (conn=
ection #0)
* Marked for [keep alive]: HTTP default
WARNING:esys:src/tss2-esys/esys_tcti_default.c:134:tcti_from_file() Could n=
ot load TCTI file: libtss2-tcti-default.so
WARNING:esys:src/tss2-esys/esys_tcti_default.c:134:tcti_from_file() Could n=
ot load TCTI file: libtss2-tcti-default.so
WARNING:esys:src/tss2-esys/esys_tcti_default.c:134:tcti_from_file() Could n=
ot load TCTI file: libtss2-tcti-default.so
WARNING:esys:src/tss2-esys/esys_tcti_default.c:134:tcti_from_file() Could n=
ot load TCTI file: libtss2-tcti-default.so
* ALPN, offering http/1.1
* ssl engine didn't initialized the certificate properly.
* Marked for [closure]: Failed HTTPS connection
* multi_done
* Closing connection 0
* The cache now contains 0 members
* Expire cleared (transfer 0x4cabb8)
[2020-04-01 18:50:19] - [TRACE]   - httpclient-http_post_json--libcurl: (58)
[2020-04-01 18:50:19] - [TRACE]   - httpclient-http_post_json--ssl engine d=
idn't initialized the certificate properly.

[2020-04-01 18:50:19] - [ERROR]   - httpclient-http_post_json-http-WriteMem=
oryCallback-Problem with the local SSL certificate
[2020-04-01 18:50:19] - [VERBOSE] - session-register_session-Session Respon=
se:
[2020-04-01 18:50:19] - [VERBOSE] - (null)
[2020-04-01 18:50:19] - [ERROR]   - session-register_session-Session regist=
ration failed with error code 58

Can anyone assist me?
Has anyone programmed curl with a TSS engine?

Cheers --
Ray
--===============3125641740512798017==--

