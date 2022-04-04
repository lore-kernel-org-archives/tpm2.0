Content-Type: multipart/mixed; boundary="===============6411786075640902374=="
MIME-Version: 1.0
From: John Connett <jrc at skylon.me.uk>
Subject: [tpm2] Re: Installing on FreeBSD?
Date: Mon, 04 Apr 2022 11:50:12 +0100
Message-ID: <00bf924f-2b55-ceba-36a5-e256364f23bc@skylon.me.uk>
In-Reply-To: 407dd8bf-734d-34e0-e3c2-677dca3ba040@gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6411786075640902374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/04/2022 02:46, Tadeusz Struk wrote:

> On 3/31/22 15:04, John Connett wrote:
>>> did you "sudo kldload tpm" ?
>> I hadn't (on bare hardware the TPM was found automatically). Here's =

>> the output:
>>
>> =C2=A0=C2=A0=C2=A0 root(a)atelier2:~ # kldload tpm
>> =C2=A0=C2=A0=C2=A0 tpmcrb0: <Trusted Platform Module 2.0, CRB mode> iome=
m =

>> 0xfed40000-0xfed40fff
>> =C2=A0=C2=A0=C2=A0 on acpi0
>> =C2=A0=C2=A0=C2=A0 device_attach: tpmcrb0 attach returned 6
>> =C2=A0=C2=A0=C2=A0 tpmcrb0: <Trusted Platform Module 2.0, CRB mode> iome=
m =

>> 0xfed40000-0xfed40fff
>> =C2=A0=C2=A0=C2=A0 on acpi0
>> =C2=A0=C2=A0=C2=A0 device_attach: tpmcrb0 attach returned 6
>> =C2=A0=C2=A0=C2=A0 root(a)atelier2:~ #
>>
>> Still no /dev/tpm0
>
> 6 - ENXIO Device not configured. There is something wrong with that =

> device.
> You need to debug that first.
>
> https://www.freebsd.org/cgi/man.cgi?query=3Derrno&sektion=3D2&manpath=3Df=
reebsd-release-ports =

>
>
> Thanks,
> Tadeusz

I have built a debug kernel and am attempting to debug the tpm module. =

However, the tpm dtrace probes and symbols are not available until =

"kldload tpm" has run by which time the ENXIO error has occurred.

I could pepper the tpm driver code with kernel printf calls but was =

wondering if there is an eaier way?

Thanks
--
John


--===============6411786075640902374==
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

--===============6411786075640902374==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="OpenPGP_signature.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCndzQjVCQUFCQ0FBakZpRUV4d09hcXJvNWNp
bkdkRS9YanpFVkVTNjQyMVFGQW1KS3pXUUZBd0FBQUFBQUNna1FqekVWRVM2NDIxVFcKV1FmK01y
Q1hoczR4QzhocGwrbU5BWTJXU1pNenVCMUZENEVFTTlVaXpad1JKM0ZQcTdoU3ZLbENJZGFWemVQ
em5haVBQWjJLeFFVYwpmTVFGbXBzUFVCRTM5VzREcnRpNW12aEczTmo5V1BRUXBXZm9ZZVVWekwz
anREVERBY2JvcUxKN3JjbEEvZUNuYXFXN2hUWTZDWloyCnlwcWl2U3VLakRLL3pCK1J5aFp2azIy
NHRWQWZPOXZQNFNqVFNNQXRBL3RqSmlDSUYvMnNqWHh5V0ZHUnVIeVRFS3k2dGdiVHNZSVQKUVpP
cWJwbzRHbTdpdnlWYzF0ZGNZMkxZdjF4eTI2SFlTNSt0a3NxS2F5am9xK2NmSlU0VGIxNVIzWEhX
azlUUTd6cVZZWkcvWDN2bAo4U0lUMWQzdFNMdzJuSUFMT3BLVUFCbVhNMVNtS01oNUxuVGoyd2pF
ZVE9PQo9YWZDWQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============6411786075640902374==--

