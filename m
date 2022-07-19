Content-Type: multipart/mixed; boundary="===============1289664204463847240=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Need help: Nginx and TPM2 Connection Problem
Date: Tue, 19 Jul 2022 18:53:14 +0000
Message-ID: <075f4d064844a695ac738509b2d276ae5e4e14d8.camel@intel.com>
In-Reply-To: CADu5HqycgfoU-6nF6M=3Az_7O4ten+B0e7nj5D6e9QEKkG=zEg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1289664204463847240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-07-19 at 20:32 +0530, Rajkumar K Sivasamy wrote:
> Team
> =

> We are running Ngnix which uses TPM 2.0 Engine through Ngnix config
> option "ssl_engine tpm2tss"; now when Ngnix trying to make use of the
> tpm2tss engine it is hitting following error:
> The 'nginx' worker process is unable to access the 'dbus' exposed by
> the 'tabrmd' process. Looking into the 'nginx' error log, the
> following errors are seen:
> ** (process:8020): CRITICAL **: failed to allocate dbus proxy object:
> Timeout was reached
> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not
> initialize TCTI file: libtss2-tcti-tabrmd.so.0
> =

> =E2=80=98dbus=E2=80=99 shows warnings with the following logs:
> dbus[1928]: [system] Connection has not authenticated soon enough,
> closing it (auth_timeout=3D30000ms, elapsed: 30001ms)
> =

> Whenever 'nginx' is trying to connect to backend server, it is
> closing the connection. In the logs, SSL handshake failure messages
> are seen. The SSL connection is not working, it is getting closed.
> nginx: [info] 8020#0: *2 peer closed connection in SSL handshake
> while SSL handshaking, client: <IP_Address>, server: 0.0.0.0:443
>  =

> Version of packages:
> kernel 4.14.76
> nginx 1.14.0
> openssl 1.1.1
> tpm2-abrmd 2.3.2
> =

> Note that the openssl when executed directly it is able to make use
> of TPM2.0 engine and we have other processes which makes use of
> tpm2tss and they are all working fine, the problem is only with
> Ngnix. We would need your help here, can you let us know how to
> resolve this "failed to allocate dbus proxy object" error?

I really have no idea, but I did find this related thread:
- https://github.com/tpm2-software/tpm2-abrmd/issues/541

Never seemed to be formally closed outside of use /dev/tpmrm0.

> =

> Thanks
> Raj
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============1289664204463847240==--

