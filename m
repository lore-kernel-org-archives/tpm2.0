Content-Type: multipart/mixed; boundary="===============7520010526466406710=="
MIME-Version: 1.0
From: John Connett <jrc at skylon.me.uk>
Subject: [tpm2] Re: Installing on FreeBSD?
Date: Thu, 31 Mar 2022 14:24:02 +0100
Message-ID: <ea69b90d-be59-3d8b-426c-43d5a1a4a480@skylon.me.uk>
In-Reply-To: AS8P194MB16694511F3CB4C3A21A5D48AA6E19@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7520010526466406710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 31/03/2022 12:16, Fuchs, Andreas wrote:

> Could you give us the complete Error message ?
>
> Typical fault No1 is that the tpm pseudo-file is not accessible by the cu=
rrent user.
>
> Under linux this is /dev/tpm0 I don't know if it's the same on FreeBSD.

Looks like that is the problem! It has been a while since I used =

FreeBSD. I think the equivalent of udev in Linux is devd?

Script started on Thu Mar 31 14:16:08 2022
$ ls -l /dev/tpm*
crw-------=C2=A0 1 root=C2=A0 wheel=C2=A0 0x52 Mar 31 10:52 /dev/tpm0
$ tpm2_getrandom 32 | hd

** (process:3209): =1B[1;33mWARNING=1B[0m **: =1B[34m14:16:37.199=1B[0m: Fa=
iled =

to create connection with service: =

GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name =

com.intel.tss2.Tabrmd was not provided by any .service files
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not =

initialize TCTI file: libtss2-tcti-tabrmd.so.0
ERROR:tcti:src/tss2-tcti/tcti-device.c:443:Tss2_Tcti_Device_Init() =

Failed to open specified TCTI device file /dev/tpmrm0: No such file or =

directory
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not =

initialize TCTI file: libtss2-tcti-device.so.0
ERROR:tcti:src/tss2-tcti/tcti-device.c:443:Tss2_Tcti_Device_Init() =

Failed to open specified TCTI device file /dev/tpm0: Permission denied
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not =

initialize TCTI file: libtss2-tcti-device.so.0
WARNING:tcti:src/util/io.c:253:socket_connect() Failed to connect to =

host 127.0.0.1, port 2321: errno 61: Connection refused
ERROR:tcti:src/tss2-tcti/tcti-swtpm.c:591:Tss2_Tcti_Swtpm_Init() Cannot =

connect to swtpm TPM socket
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not =

initialize TCTI file: libtss2-tcti-swtpm.so.0
WARNING:tcti:src/util/io.c:253:socket_connect() Failed to connect to =

host 127.0.0.1, port 2321: errno 61: Connection refused
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not =

initialize TCTI file: libtss2-tcti-mssim.so.0
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:254:tctildr_get_default() No =

standard TCTI could be loaded
ERROR:tcti:src/tss2-tcti/tctildr.c:428:Tss2_TctiLdr_Initialize_Ex() =

Failed to instantiate TCTI
ERROR: Could not load tcti, got: "(null)"
$ exit

Script done on Thu Mar 31 14:16:39 2022

> Cheers,
> Andreas
>
> ________________________________________
> Von: John Connett <jrc(a)skylon.me.uk>
> Gesendet: Donnerstag, 31. M=C3=A4rz 2022 12:55
> An: tpm2(a)lists.01.org
> Betreff: [tpm2] Installing on FreeBSD?
>
> Is there a simple, step-by-step guide for installing tpm2 on FreeBSD?
>
> I started with a FreeBSD 13.0-RELEASE-p10 installation on x86_64 and inst=
alled the following with "pkg install":
>
>    *   tpm2-abrmd-2.4.0
>    *   tpm2-tools-5.2
>    *   tpm2-tss-3.1.0
>
> then added tpm2_abrmd_enable=3D"YES" and dbus_enable=3D"YES" to /etc/rc.c=
onf. The user includes "_tss" in its groups.
>
> Attempts to run tpm2_getrandom fail with "Could not initialize TCTI file".
>
> It appears that I have missed some important steps!
>
> The equivalent on Ubuntu just works.
>
> Thanks
> --
> John

--===============7520010526466406710==
Content-Type: application/pgp-keys
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="OpenPGP_0x8F3115112EB8DB54.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4c0JOQkY2K3VVRUJDQUR0QmMz
UHlPUXh1TnlOTkFEYzNIOE82UmpUbzNvcVFnVk9iNUhhRnRVT3AzSUFzWDRrCng5ZWZIRm5CRGtX
ZDBoOVRNQk5PSkJmcTVXR0xVT21yR3JkSVJrUUZFS1ptNDZKQ2ZUQ2VOSyt3N1VNcWIzQmsKZjF3
R21HY1M0YkVzZDNSQmUxWm5CK0JMa1ljWG1EcUhNT1drejdqMS9UdnM4NkJ0eHlQRlBHQW5rT1BD
d1JDdQpwZk12cHltVUIvdGppblg1Yi91SitjN0NaUmo3MVNPMUdndnFPMFE4VkN4WU5kTnJyeStu
eXN5Mm5XTXNWekF1CmZUQjlxQis3ZjM2ZjhMcGJhT0FvRllFOVliYWtxbCtRYUM4Q2IvMVppNy9B
Ty94S2ZoOTV4Q2tIUllwV29iUk0KMjBYNndiRkFrcFVETU1xcU9yL3duVHhWaUNLZDAwUkpES0xK
QUJFQkFBSE5IMHB2YUc0Z1EyOXVibVYwZENBOAphbkpqUUhOcmVXeHZiaTV0WlM1MWF6N0N3STRF
RXdFS0FEZ1dJUVRIQTVxcXVqbHlLY1owVDllUE1SVVJMcmpiClZBVUNYcjY1UVFJYkF3VUxDUWdI
QWdZVkNna0lDd0lFRmdJREFRSWVBUUlYZ0FBS0NSQ1BNUlVSTHJqYlZBWDEKQ0FEaE5EL09YU3Bx
WDN2Wm84Wm5SWFRHUnhGVEt3aEJYK2tMV3F3VWd0Tm5ST3RTbE9uaGxLMlNpUzZEcEpNYgpKWnE5
Vm83K2tERXYwTnc0VXh0Qk1POTRuZVBPWTVhN0dKVTBpZk11TmNNbi9UVGdRT002L2VFRUZzeHlM
QjVDCjBuK1dkOXBTQ0dpQU5DRTNwYkpnY2w3UlYrclQyaDJDY0hnRGRQanRKOUFDM2xqRXk2RUVC
NHNGRU9JZzF2K04KMjFMWml2Unk3WmI4ZDNkTnJ6cmVHS2RrS1IyNm1acFdXWEVTN0JENzgwQ1Jx
QmpUSGtaRmZILzExSVlXK3psQgo0a25VYVExVDZBcTdzRGltNCt6Z285TzROSExabSsycmNiY2ZV
Ym92NE91eENoQnRCU3VpRFRCWkl4czN1Y1NOCnRZVU5YeURRanFubStjSFJlZHpaaXB2QndzQnpC
Qk1CQ0FBZEZpRUVMYXprWllyVjlFU1VHUm1UaXZ4eEFkSEkKY3Y0RkFsN0FCUVFBQ2drUWl2eHhB
ZEhJY3Y0bkxRZ0FxVHdIWkZsVFVRaDJPMHpGRWRMcnVOVjYxZXMzbktiTwpSSlQ3Qy9FY0p0WkEz
MGV2YUdoOWRibDNmL0RERUpwNzJ0VFNiMlR2QkdzT2xXY3FsYjYyck1Za3dKTDM0WXVRCkpHY1hN
VFhrL2NWUk16VUZHcktEaGlCdWVCRmxzWXVEWk45WGRSU25Ba3ZKNjVqeGhPeXg1cFZJTXJMZjEy
NXIKOUNjbTU3TW1LYzJOMmNNY3BoNlpPTngrN1doTjcyZzFtdkI3aUduTzhMY3VtUTR4VEk5cWcr
bWcySXR3L3hMRwpEUHpudWU0ZEpoVGMvdzI5YnlONTBTdHRHeVFlQUdmRzBPRFJON1g5VUlUbUNw
Tmg1bjZJamJseDRmSXRJZkYxCncyaGxlZjAyWHZVY0RqK1hVdzhMUGxJMEMvbHRhdGNMWXJDVlo3
aFVCMy9WcnBLbDYra1lqczdBVFFSZXZybEIKQVFnQW85bkJZWFQ5TXZLQ1VoR0VjNlJPOEU2WWs0
dzVabmJqV2crZy8zY1djRTd3dCtaeHVSd3B4NERvdUNWWgovcDE3enJpeDIzNGFlcHRmNk9iV3Uz
dlhxUmVrOFE4TnI3Wjhnd0J2cHMvaWQ0RDA3WEVkTmkzdkNLREpHZFJ6CkJZQkxUQkFCU0ZlSXJr
WUNtK05haVJnRThYT0JlSnRBSzdvNTl6LzRMMDFNeHlvMDZNakw2R094c0lTVjBSS3MKVnVIR1NS
WmMzSXNpbHJGaExUbTd2ZzhrSVgzWGk2dmlOb0drbmV0MXNxYTEwMVBuTlYrVjhGczVDTnVEOTZx
agpJWVkyUHM4U1JmUzBYOTljYWJUYU9CRVNzZUZqenQ5TjhEOUFRR0RIWVo1Ti9DMXcxUGx3T0dx
TFlmZDFZdDQwCnMzZFUzdkpYVnJVYUpjUmxEV2NrNnhKK3Z3QVJBUUFCd3NCMkJCZ0JDZ0FnRmlF
RXh3T2Fxcm81Y2luR2RFL1gKanpFVkVTNjQyMVFGQWw2K3VVRUNHd3dBQ2drUWp6RVZFUzY0MjFR
NVpRZ0E3QndIS1ZOK0dUYUdzSWpQOWlJbwo1aG16YnNJZldxcmRvQm9xVkVJSXNSbkp5NXhtT2tT
azdlNEIvNGM1Y0F4QUZobTJjVCtIQVBGUWJMV0FSVUExCnRtUXAxcUtLUkdQdDVwM0tzNU9lNmFM
ay9teXJmbStxVnFuYytmZk1oaGM5YVhuVUdnMjRucUhteWVjK3VwdDMKZWUrZDdVc2lpTkNmVnlB
cEVWZmt5OFFtMm1IUDhBbEs0ZmdUV0k1UUdNTkFqSXVQTDl5ZjEyNzdHSXBBUTA3agpkYUx3OVhK
TDVLaDRyYWVwV284VUoxbkRuaWF6TUNJUWlkUlFoZnFVb1B6eW1sWEhMQ3lra3Rhempwd1IzZmR1
CktiUmgzY1Z2YzdIakU1NDJmSUM2NEx2WTNMUVpqYk5KRHlwK1RFd3hhcnBPYXBSQmN6dC9waVlx
VUV2MDJveXgKckE9PQo9RENyegotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCg==

--===============7520010526466406710==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="OpenPGP_signature.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCndzQjVCQUFCQ0FBakZpRUV4d09hcXJvNWNp
bkdkRS9YanpFVkVTNjQyMVFGQW1KRnEzSUZBd0FBQUFBQUNna1FqekVWRVM2NDIxUzIKV3dnQTNG
eGg2V3lZT3JVaWp6YW9IeENwTVl0ZlprTXMyLzdxSjJxQVhGOVB1UU0rcWJpU01TMHBpVytVVDZs
dENjbVBvaWhST2xXWgozYTNNRm0vL1Q2K1FzTkZWZDFBckZUQjNkZzdJYXgxc1oxNVJXVThyK3E0
OWw2RFk4SWN6dk5XTTR0T1JLZ2Q3aElQOTMxWHFFNDc1CktJQTd3TTg3V1RLS3FtZjVzNENjSXly
UkJpb1VnK0tpTDQ5RW1FZEw1SEtLRXl0Q1BuaXRJdExIYlprLzYrb3paQWF1TW1jMjFyRHMKU25T
dEw5ZTROTGdQclEvN3hrTGU3NThuMkthbkNNcU9YQWNOSXNWWS9VbUhYMHBPQ3VaVk5ldzJIbTVU
WXRNZ0UyVWZueGQvbk5aTQovRkVHbmVNK0RZa2VNd2VjalNScWpCUlM3ZUc3aW9tZnRBZW5EdXhN
TWc9PQo9M2pyYQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============7520010526466406710==--

