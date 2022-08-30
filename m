Content-Type: multipart/mixed; boundary="===============8345197232950632062=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: Lifecycle of handles and contexts
Date: Tue, 30 Aug 2022 18:11:12 +0000
Message-ID: <
 <BN8PR15MB2753F98AFBCEE05EC56DACA8F2799@BN8PR15MB2753.namprd15.prod.outlook.com>>
In-Reply-To: ab025685a774450f457da79fc1df289bdbd08f40.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8345197232950632062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Windows was with one process not exiting.  =


BTW, I do this with scripts by running through the TPM proxy.

AFAIK, only the Intel RM is somewhat TCG compliant.  Even then,
the interface is proprietary to the Intel SAPI.  Neither the Windows
RM nor the Linux RM comply with abrmd or any TCG spec.

Windows, as you see, can create a large number of objects for
each process.

The Linux RM can create 3 objects per process, but many processes
can create 3 objects.


> -----Original Message-----
> From: Roberts, William C <william.c.roberts(a)intel.com>
> Sent: Monday, July 25, 2022 2:57 PM
> To: tpm2(a)bitzap.e4ward.com; Kenneth Goldman <kgoldman(a)us.ibm.com>;
> tpm2(a)lists.01.org
> Subject: [EXTERNAL] Re: [tpm2] Re: Lifecycle of handles and contexts
> =

> On Tue, 2022-07-19 at 22:17 +0000, Kenneth Goldman wrote:
> > > On Mon, 2022-07-18 at 17:36 +0000, Kenneth Goldman wrote:
> > > > It depends.
> > > >
> > > > Windows seems to have a large keystore, so you probably don't have
> > > > to ever flush.
> > > >
> > > > Linux in kernel RM manages keys across processes but not within
> > > > processes, so you still have to flush.
> > >
> > > This is also how TBS works on Windows.
> >
> > Not on my Windows 10.  I just created 32 keys with one process.  Now
> > there are
> > 32 loaded keys.
> =

> Did the process exit? I always thought TBS was spec compliant:
> "The RM also monitors connections, and removes table entries and
> ContextFlushes leftover sessions when the caller closes a connection." fr=
om
> Section 2.3.3 of:

> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__trustedcomputinggroup.org_wp-2Dcontent_uploads_TSS-5F2p0-5FTAB-
> 5FResourceManager-5Fv1p0-5Fr18-5F04082019-
> 5Fpub.pdf&d=3DDwIGaQ&c=3Djf_iaSHvJObTbx-
> siA1ZOg&r=3DDZCVG43VcL8GTneMZb8k8lEwb-O1GZktFfre1-
> mlmiA&m=3DMEqMRdEayqeSC_C_e9M_iXINVdIi7f1gunYT4cXhKxkUh0rqaGP1W
> SR150eCjLz7&s=3DR6HfwGLoJJyp923npcfsGOh6-VhE_Iha47FJ_5vtGQ4&e=3D
> =

> The table entries include transient handles and their associated virtual
> mapping.
> =

> > OK, the Windows RM swaps them out, but the application never sees
> > that.
> >
> > I don't know what the RM limit is, but it's certainly far more than
> > the TPM itself.
> >
> > getcapability.exe -cap 1 -pr 80000000
> > 32 handles
> >         80ffffe0
> >         80ffffe1
> >         80ffffe2
> >         80ffffe3
> >         80ffffe4
> >         80ffffe5
> >         80ffffe6
> >         80ffffe7
> >         80ffffe8
> >         80ffffe9
> >         80ffffea
> >         80ffffeb
> >         80ffffec
> >         80ffffed
> >         80ffffee
> >         80ffffef
> >         80fffff0
> >         80fffff1
> >         80fffff2
> >         80fffff3
> >         80fffff4
> >         80fffff5
> >         80fffff6
> >         80fffff7
> >         80fffff8
> >         80fffff9
> >         80fffffa
> >         80fffffb
> >         80fffffc
> >         80fffffd
> >         80fffffe
> >         80ffffff
> =

> These look like virtual handles. The spec also states, "In responses that=
 return
> handles, these handles MUST be virtualized before returning the response =
to
> the caller:
> =EF=82=A7 These virtual handles MUST be unique per connection".
> I don't think anyone actually makes them unique per connection.


--===============8345197232950632062==
Content-Type: application/pkcs7-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
gQYDVR0fBHoweDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJl
ZElEUm9vdEcyLmNybDA6oDigNoY0aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNz
dXJlZElEUm9vdEcyLmNybDCB0wYDVR0gBIHLMIHIMIHFBglghkgBhv1sBQIwgbcwKAYIKwYBBQUH
AgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4MfEFueSB1c2Ug
b2YgdGhpcyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5n
IFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9ycGEt
dWEwKAYDVR0RBCEwH6QdMBsxGTAXBgNVBAMTEERpZ2lDZXJ0UEtJLTMtNDgwDQYJKoZIhvcNAQEL
BQADggEBAJQkB9tihpEuaP+KP49Zl4LZ4sAEfM3T153RZQ2ebyFYyOL2cG6Vz6oT4BkjdZ62zilQ
XS3Q3nO9FAaWoKFcBKUuO3UPzx/tdrw1ENLHLeadDl85kxBGhfL1lqLyEJ83qCb8CPcRRzd1xb3u
EJmTMVRm1V0PurTBu5U6NMOOtW/dk64zrkNELAH/jvASFwCGIZC+DNi96hCqYDg+8QchO9HkvoDH
pcxbI7EqI+vk5LacMFCKqvd1YGaA5MjGhy6ntl6OBYKUiMaThiRnJZhHmkK9/52NYyfE4NpHZjhz
qt17QTcc/Upp6l3s1tr5D+4Lno/6dbNVim/aXfj0WCUjajswggaeMIIFhqADAgECAhAIxvQO238o
+mzGDhiyT2YoMA0GCSqGSIb3DQEBCwUAMIGtMQswCQYDVQQGEwJVUzE0MDIGA1UEChMrSW50ZXJu
YXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyBDb3Jwb3JhdGlvbjE/MD0GA1UECxM2Q2xhc3MgMiBE
aWdpQ2VydCBQS0kgUGxhdGZvcm0gSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMScwJQYDVQQDEx5J
Qk0gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgRzQwHhcNMjIwNzA1MDAwMDAwWhcNMjMwNzA1MjM1
OTU5WjBhMRgwFgYDVQQDDA9LZW5uZXRoIEdvbGRtYW4xDzANBgNVBAsMBlMvTUlNRTE0MDIGA1UE
CgwrSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyBDb3Jwb3JhdGlvbjCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBALpe1pY2YowTGF3JJeWrlGWJmqLkuPdfCZowx6SHnoE5PZU1
hsF/t3+dV+NM+ef1sV5MXCvzGRklxuf9jph4jXPDClx1xW6CY+DEYQnwwu8A2P4RiNyVJxoDZ2wH
Pfd6rvgPeRPtWrIR644ccJzwf6sFOYmOyfM2Yb4p/YwMZv1jp7P3NuxseHvnXZw6Z62Oh7q7Xyfv
Oh+CHqJyfjBqoVDPfV039FZDFITt4TXJNRJGSkdBscVjrro/qlC7R9qNn6LHtksQ2ChaM7fGPfgc
cASy3wOct++pIGEbasv7/G/WZ/jk/a3n8e5V3S123YAaJSJoASjdngg6Xj/UEJe1YuUCAwEAAaOC
AwMwggL/MAwGA1UdEwEB/wQCMAAwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUF
BwMEMB0GA1UdDgQWBBRWhUpoLXEQ8H0RYqrd1avCyQi5+TAeBgNVHREEFzAVgRNrZ29sZG1hbkB1
cy5pYm0uY29tMIGDBggrBgEFBQcBAQR3MHUwKAYIKwYBBQUHMAGGHGh0dHA6Ly9wa2ktb2NzcC5k
aWdpY2VydC5jb20wSQYIKwYBBQUHMAKGPWh0dHA6Ly9jYWNlci5zeW1hdXRoLmNvbS9tcGtpL0lC
TUNlcnRpZmljYXRpb25BdXRob3JpdHlHNC5jcnQwgdMGA1UdIASByzCByDCBxQYJYIZIAYb9bAUC
MIG3MCgGCCsGAQUFBwIBFhxodHRwczovL3d3dy5kaWdpY2VydC5jb20vQ1BTMIGKBggrBgEFBQcC
AjB+DHxBbnkgdXNlIG9mIHRoaXMgQ2VydGlmaWNhdGUgY29uc3RpdHV0ZXMgYWNjZXB0YW5jZSBv
ZiB0aGUgUmVseWluZyBQYXJ0eSBBZ3JlZW1lbnQgbG9jYXRlZCBhdCBodHRwczovL3d3dy5kaWdp
Y2VydC5jb20vcnBhLXVhMF0GA1UdHwRWMFQwUqBQoE6GTGh0dHA6Ly9wa2ktY3JsLnN5bWF1dGgu
Y29tL2NhXzZhYjg1YjU0ZTllMTVjN2I0N2NlMWQwOGUyYzllZGM1L0xhdGVzdENSTC5jcmwwHwYD
VR0jBBgwFoAU5wbss3RwhmwxJE2mTffUMm1gJoUwQgYJKoZIhvcNAQkPBDUwMzAKBggqhkiG9w0D
BzALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBKjAtBgpghkgBhvhFARADBB8w
HQYTYIZIAYb4RQEQAQICAQGC7o/qYhYGNTc4MDQ4MDkGCmCGSAGG+EUBEAUEKzApAgEAFiRhSFIw
Y0hNNkx5OXdhMmt0Y21FdWMzbHRZWFYwYUM1amIyMD0wDQYJKoZIhvcNAQELBQADggEBAANxo37I
2rZG7qI3Tr5/An+k/xR4Jcg4myFC32PpI9T/2tPRiApY/JX1kYfjaz/IiBbcU+eIH123TtsyNltV
1R7gkjLWo/GpRp2WuTgnStRfaXMHOG80wbQ2u7URFy61Qhh0CWWqp3xWYMKxok35dUhzXnQRfdCm
csq7tLSUkhIgZruHN5eZWCATSuKB31p+NdoAvC81/OvQC404/d+0FNn54vOwy/+M5p7RKMqNik/F
0VYNfG1roePvi2RNvmYoRzSCgypvcuxZtBQBSSUIb6R0m1Bj1U1TTMAw8xLwG2D1TJrz262jhlhy
SmuA/3v0808KXIKurzaDH7Lka0YzgNcxggSfMIIEmwIBATCBwjCBrTELMAkGA1UEBhMCVVMxNDAy
BgNVBAoTK0ludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgQ29ycG9yYXRpb24xPzA9BgNV
BAsTNkNsYXNzIDIgRGlnaUNlcnQgUEtJIFBsYXRmb3JtIEluZGl2aWR1YWwgU3Vic2NyaWJlciBD
QTEnMCUGA1UEAxMeSUJNIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IEc0AhAIxvQO238o+mzGDhiy
T2YoMA0GCWCGSAFlAwQCAQUAoIICrTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3
DQEJBTEPFw0yMjA4MzAxODExMTFaMC8GCSqGSIb3DQEJBDEiBCDCsemXc3+16CzcnapT1jfgpx81
Pt1fy4JTFXo5mu8odjCBkwYJKoZIhvcNAQkPMYGFMIGCMAsGCWCGSAFlAwQBKjALBglghkgBZQME
ARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIB
QDALBglghkgBZQMEAgEwCwYJYIZIAWUDBAIDMAsGCWCGSAFlAwQCAjAHBgUrDgMCGjCB0wYJKwYB
BAGCNxAEMYHFMIHCMIGtMQswCQYDVQQGEwJVUzE0MDIGA1UEChMrSW50ZXJuYXRpb25hbCBCdXNp
bmVzcyBNYWNoaW5lcyBDb3Jwb3JhdGlvbjE/MD0GA1UECxM2Q2xhc3MgMiBEaWdpQ2VydCBQS0kg
UGxhdGZvcm0gSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMScwJQYDVQQDEx5JQk0gQ2VydGlmaWNh
dGlvbiBBdXRob3JpdHkgRzQCEAjG9A7bfyj6bMYOGLJPZigwgdUGCyqGSIb3DQEJEAILMYHFoIHC
MIGtMQswCQYDVQQGEwJVUzE0MDIGA1UEChMrSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5l
cyBDb3Jwb3JhdGlvbjE/MD0GA1UECxM2Q2xhc3MgMiBEaWdpQ2VydCBQS0kgUGxhdGZvcm0gSW5k
aXZpZHVhbCBTdWJzY3JpYmVyIENBMScwJQYDVQQDEx5JQk0gQ2VydGlmaWNhdGlvbiBBdXRob3Jp
dHkgRzQCEAjG9A7bfyj6bMYOGLJPZigwDQYJKoZIhvcNAQEBBQAEggEAtDXmM0Mwy79somjUdrdp
AWStQZwOvi95f7aKrnatJmJwOht/lp2sHUNWoSMq9uCSTVBVx9CIQyDduWHBCWrwZOfY3fNF6VDO
Z97jb3Qrjq600HVOSX0rlJMeTOMJhxuZlD72ca4tFjEUtbxn2XH+B764Z0UL02JWF7DLqL/9QD65
4p1tBWZV9eWOverHEvjhkj1qW3fvsjQESyNtBmSw50HojknvEZ8f37yZT2PRWh2bfLIktLyG4i5T
sNbs/opHi+k/k6vA6WxFq4MgvHW/iuWAo577iS/Qq6+i2BE0EH55CqxzHNy+aC5le7XEIycQsRHj
XGpUPylFLGRSmlYL6QAAAAAAAA==
--===============8345197232950632062==--

