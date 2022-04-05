Content-Type: multipart/mixed; boundary="===============6725040957415151881=="
MIME-Version: 1.0
From: John Connett <jrc at skylon.me.uk>
Subject: [tpm2] Re: Installing on FreeBSD?
Date: Tue, 05 Apr 2022 18:03:15 +0100
Message-ID: <8f99596f-56bd-c34f-d9b2-ce0782c9f11b@skylon.me.uk>
In-Reply-To: 813027f8-b232-62b0-a8fc-fa5618a832ba@gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6725040957415151881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/04/2022 15:42, Tadeusz Struk wrote:

> On 4/4/22 03:50, John Connett wrote:
>> I have built a debug kernel and am attempting to debug the tpm =

>> module. However, the tpm dtrace probes and symbols are not available =

>> until "kldload=C2=A0tpm"=C2=A0has=C2=A0run=C2=A0by=C2=A0which=C2=A0time=
=C2=A0the=C2=A0ENXIO=C2=A0error=C2=A0has=C2=A0occurred.
>>
>> I could pepper the tpm driver code with kernel printf calls but was =

>> wondering=C2=A0if=C2=A0there=C2=A0is=C2=A0an=C2=A0eaier=C2=A0way?
>
> There are only two spots where I would suspect it to fail and return =

> ENXIO
> from attach. One is on tpmcrb_request_locality():
> https://github.com/freebsd/freebsd-src/blob/main/sys/dev/tpm/tpm_crb.c#L1=
71

It's ths one! I added a printf to output the value of "timeout" at:
https://github.com/freebsd/freebsd-src/blob/main/sys/dev/tpm/tpm_crb.c#L259

It counts down until timeout <=3D 0 (in steps of 10000) then ENXIO is =

returned.

I've had a quick look at:
https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Respons=
e-Buffer-Interface-v2-r12-Specification_FINAL2.pdf

If polling isn't working perhaps interrupt control or some other form of =

notification is required?

Is there anything I could dig out of the control structures that would =

help identify the problem?

Thanks
--
John


--===============6725040957415151881==
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

--===============6725040957415151881==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="OpenPGP_signature.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCndzQjVCQUFCQ0FBakZpRUV4d09hcXJvNWNp
bkdkRS9YanpFVkVTNjQyMVFGQW1KTWRsTUZBd0FBQUFBQUNna1FqekVWRVM2NDIxUjQKUFFmL2Z4
NkN6QS9GaENpM0NiVGc0bzdJM2xPUFlWcnZxOTRhWllyM3IxdGxwWld3cDhsN0laTmpQZlc1ckFV
SXY1dmg2V3ZFdkY1SwpyYnBRQ0pISmFUN3NDanNIU3hWRzJzZll4T2M3a0ExakpuUnRHaktibk05
dmlTTTA5RFYxWEJvellwVkl4WlRvVDUvcFpac1kyZlg2CmVMYjMyZVpBOHFKbm1VU3lEazBlcTBC
MHJtdGx1dFZQUmlVdmNJaUpDQ1hLRnRoR09iQzRVYzQ0MWtxcStRMFVtcGpraFFGT055enoKRzFr
V2EwMUJXNi9Sc05xUVBFRno1WnJ4cFMzNjZrN25VNXkzQ0EwU1pNa3YweG9wc0NnclRISUV5d01F
KzF3VzBVWkRDZUw3VFM1awpSdXBscHBJSjFwdEJvanphTkFJR0NGRDEwaDdjWFRlNithTWljUkp2
K2c9PQo9LzVBVgotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============6725040957415151881==--

