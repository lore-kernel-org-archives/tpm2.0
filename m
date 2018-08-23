Content-Type: multipart/mixed; boundary="===============6354914756104159719=="
MIME-Version: 1.0
From: Stuart Yoder <stuart.yoder at arm.com>
Subject: Re: [tpm2] AIK Enrollment Process implementations using tpm2-tools or
 similar
Date: Thu, 23 Aug 2018 16:44:35 -0500
Message-ID: <b1004831-05cd-42d8-d18e-8e2993330f26@arm.com>
In-Reply-To: CANtcRX5B9dJG_tHS+dkjG6cLD8pw+dJyy-SGg4pW78VOtYAi2w@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6354914756104159719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BTW-- have you seen the IBM Attestation Client/Sever project for TPM 2.0:
https://sourceforge.net/projects/ibmtpm20acs/

One potentially helpful doc show a provisioning flow:
https://sourceforge.net/projects/ibmtpm20acs/files/Tutorials/AttestProv.pdf=
/download

Thanks,
Stuart

On 8/3/18 6:02 AM, Peter Magnusson wrote:
> Thanks!
>
> Does it seem like a correct understanding of that the proof of
> possession process is something like follows;
>
> 1. Client -> CA.identityRequestGetChallenge( AIK, EKCert )
>
> 2. Client receives challenge [RSA encrypted AES key, AES encrypted data]
>
> 3. Client uses endorsement key and tool/command
> tpm2_activatecredential to decrypt RSA blob (the AES key)
>
> 4. Client decrypt the AES block using the AES key, yielding the proper
> response (proof of possession)
>
> 5. Client -> CA.identityRequestSubmitResponse ( response )
>
> 6. Client receive the AIKCert
>
> (Based my understanding on HisPrivacyCAWebService2Impl.java and
> various threads about tpm2_activetecredential being involved in how to
> proving ownership.)
>
> https://github.com/OpenAttestation/OpenAttestation/blob/e34fa3be4a4ce199d=
348f12e62265ec853b4d5fa/trust-agent/HisPrivacyCAWebServices2/src/main/java/=
gov/niarl/his/webservices/hisPrivacyCAWebService2/server/HisPrivacyCAWebSer=
vice2Impl.java
>
> Presumably the AES operations in Open Attestation are very
> implementation specific and could be replaced with more modern modes
> of operations.
>
> //P
> On Wed, Aug 1, 2018 at 6:38 PM Agerstam, Mats G
> <mats.g.agerstam(a)intel.com> wrote:
>> I think Open CIT (Cloud Integrity Technology) supersedes OpenAttestation=
. More details on that can be found here:
>> https://github.com/opencit/opencit/wiki/Open-CIT-3.2-Product-Guide
>>
>> -----Original Message-----
>> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Roberts, Wi=
lliam C
>> Sent: Wednesday, August 1, 2018 9:29 AM
>> To: Peter Magnusson <blaufish.public.email(a)gmail.com>; tpm2(a)lists.01=
.org
>> Subject: Re: [tpm2] AIK Enrollment Process implementations using tpm2-to=
ols or similar
>>
>> I dug around and someone pointed me to this:
>> https://github.com/OpenAttestation/OpenAttestation
>>
>> Unfortunately, I know nothing beyond that (typical problem for me).
>>
>>> -----Original Message-----
>>> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Peter Magn=
usson
>>> Sent: Wednesday, August 1, 2018 3:55 AM
>>> To: tpm2(a)lists.01.org
>>> Subject: [tpm2] AIK Enrollment Process implementations using tpm2-tools=
 or
>>> similar
>>>
>>> Hello,
>>>
>>> TL;DR:
>>> Is there any AIK Enrollment / POP examples available using tpm2-tools (=
or other
>>> open source tools, code bases)?
>>>
>>> Long version:
>>>
>>> I had some success with tpm2-tools based attestation, e.g. generating A=
IK,
>>> extracting EKpub and EKCert from TPM, performing the tpm2 quotation, et=
c.
>>>
>>> However, my understanding of the relevant spec's is that for TPM2 User =
Devices
>>> (and many other devices), the EK is limited to performing the Enrolment
>>> Processes (Proof of Possession). So to complete a meaningful Remote
>>> Attestation flow, there is a need to get AIKCert externally using AIK E=
nrollment
>>> Process[1] against an Attestation CA (formerly known as Privacy CA).
>>>
>>> I fail to find public examples (tools, example code, etc) of the enrolm=
ent step.
>>> Most of what I find when googling, for example strongswan's TPM pages,
>>> appears to skip the AIK Enrollment Process / POP and just issue the the=
 certificate
>>> without any proof of possession.
>>>
>>> Any links or insights would be appreciated =3D)
>>>
>>>
>>> [1]. Section 2.3.
>>> https://trustedcomputinggroup.org/wp-
>>> content/uploads/IWG_CMC_Profile_Cert_Enrollment_v1_r7.pdf
>>> _______________________________________________
>>> tpm2 mailing list
>>> tpm2(a)lists.01.org
>>> https://lists.01.org/mailman/listinfo/tpm2
>> _______________________________________________
>> tpm2 mailing list
>> tpm2(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/tpm2
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2


--===============6354914756104159719==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgQlRXLS0gaGF2ZSB5b3Ugc2VlbiB0aGUgSUJN
IEF0dGVzdGF0aW9uIENsaWVudC9TZXZlciBwcm9qZWN0IGZvciBUUE0KICAgIDIuMDo8YnI+CiAg
ICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL3NvdXJjZWZv
cmdlLm5ldC9wcm9qZWN0cy9pYm10cG0yMGFjcy8iPmh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3By
b2plY3RzL2libXRwbTIwYWNzLzwvYT48YnI+CiAgICA8YnI+CiAgICBPbmUgcG90ZW50aWFsbHkg
aGVscGZ1bCBkb2Mgc2hvdyBhIHByb3Zpc2lvbmluZyBmbG93Ojxicj4KPGEgY2xhc3M9Im1vei10
eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMv
aWJtdHBtMjBhY3MvZmlsZXMvVHV0b3JpYWxzL0F0dGVzdFByb3YucGRmL2Rvd25sb2FkIj5odHRw
czovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9pYm10cG0yMGFjcy9maWxlcy9UdXRvcmlhbHMv
QXR0ZXN0UHJvdi5wZGYvZG93bmxvYWQ8L2E+PGJyPgogICAgPGJyPgogICAgVGhhbmtzLDxicj4K
ICAgIFN0dWFydDxicj4KICAgIDxicj4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+
T24gOC8zLzE4IDY6MDIgQU0sIFBldGVyIE1hZ251c3NvbgogICAgICB3cm90ZTo8YnI+CiAgICA8
L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCmNpdGU9Im1pZDpDQU50Y1JYNUI5ZEpH
X3RIUytka2pHNmNMRDhwdytkSnl5LVNHZzRwVzc4Vk90WUFpMndAbWFpbC5nbWFpbC5jb20iPgog
ICAgICA8cHJlIHdyYXA9IiI+VGhhbmtzIQoKRG9lcyBpdCBzZWVtIGxpa2UgYSBjb3JyZWN0IHVu
ZGVyc3RhbmRpbmcgb2YgdGhhdCB0aGUgcHJvb2Ygb2YKcG9zc2Vzc2lvbiBwcm9jZXNzIGlzIHNv
bWV0aGluZyBsaWtlIGZvbGxvd3M7CgoxLiBDbGllbnQgLSZndDsgQ0EuaWRlbnRpdHlSZXF1ZXN0
R2V0Q2hhbGxlbmdlKCBBSUssIEVLQ2VydCApCgoyLiBDbGllbnQgcmVjZWl2ZXMgY2hhbGxlbmdl
IFtSU0EgZW5jcnlwdGVkIEFFUyBrZXksIEFFUyBlbmNyeXB0ZWQgZGF0YV0KCjMuIENsaWVudCB1
c2VzIGVuZG9yc2VtZW50IGtleSBhbmQgdG9vbC9jb21tYW5kCnRwbTJfYWN0aXZhdGVjcmVkZW50
aWFsIHRvIGRlY3J5cHQgUlNBIGJsb2IgKHRoZSBBRVMga2V5KQoKNC4gQ2xpZW50IGRlY3J5cHQg
dGhlIEFFUyBibG9jayB1c2luZyB0aGUgQUVTIGtleSwgeWllbGRpbmcgdGhlIHByb3BlcgpyZXNw
b25zZSAocHJvb2Ygb2YgcG9zc2Vzc2lvbikKCjUuIENsaWVudCAtJmd0OyBDQS5pZGVudGl0eVJl
cXVlc3RTdWJtaXRSZXNwb25zZSAoIHJlc3BvbnNlICkKCjYuIENsaWVudCByZWNlaXZlIHRoZSBB
SUtDZXJ0CgooQmFzZWQgbXkgdW5kZXJzdGFuZGluZyBvbiBIaXNQcml2YWN5Q0FXZWJTZXJ2aWNl
MkltcGwuamF2YSBhbmQKdmFyaW91cyB0aHJlYWRzIGFib3V0IHRwbTJfYWN0aXZldGVjcmVkZW50
aWFsIGJlaW5nIGludm9sdmVkIGluIGhvdyB0bwpwcm92aW5nIG93bmVyc2hpcC4pCgo8YSBjbGFz
cz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vT3BlbkF0
dGVzdGF0aW9uL09wZW5BdHRlc3RhdGlvbi9ibG9iL2UzNGZhM2JlNGE0Y2UxOTlkMzQ4ZjEyZTYy
MjY1ZWM4NTNiNGQ1ZmEvdHJ1c3QtYWdlbnQvSGlzUHJpdmFjeUNBV2ViU2VydmljZXMyL3NyYy9t
YWluL2phdmEvZ292L25pYXJsL2hpcy93ZWJzZXJ2aWNlcy9oaXNQcml2YWN5Q0FXZWJTZXJ2aWNl
Mi9zZXJ2ZXIvSGlzUHJpdmFjeUNBV2ViU2VydmljZTJJbXBsLmphdmEiPmh0dHBzOi8vZ2l0aHVi
LmNvbS9PcGVuQXR0ZXN0YXRpb24vT3BlbkF0dGVzdGF0aW9uL2Jsb2IvZTM0ZmEzYmU0YTRjZTE5
OWQzNDhmMTJlNjIyNjVlYzg1M2I0ZDVmYS90cnVzdC1hZ2VudC9IaXNQcml2YWN5Q0FXZWJTZXJ2
aWNlczIvc3JjL21haW4vamF2YS9nb3YvbmlhcmwvaGlzL3dlYnNlcnZpY2VzL2hpc1ByaXZhY3lD
QVdlYlNlcnZpY2UyL3NlcnZlci9IaXNQcml2YWN5Q0FXZWJTZXJ2aWNlMkltcGwuamF2YTwvYT4K
ClByZXN1bWFibHkgdGhlIEFFUyBvcGVyYXRpb25zIGluIE9wZW4gQXR0ZXN0YXRpb24gYXJlIHZl
cnkKaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgYW5kIGNvdWxkIGJlIHJlcGxhY2VkIHdpdGggbW9y
ZSBtb2Rlcm4gbW9kZXMKb2Ygb3BlcmF0aW9ucy4KCi8vUApPbiBXZWQsIEF1ZyAxLCAyMDE4IGF0
IDY6MzggUE0gQWdlcnN0YW0sIE1hdHMgRwo8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZF
IiBocmVmPSJtYWlsdG86bWF0cy5nLmFnZXJzdGFtQGludGVsLmNvbSI+Jmx0O21hdHMuZy5hZ2Vy
c3RhbUBpbnRlbC5jb20mZ3Q7PC9hPiB3cm90ZToKPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5
cGU9ImNpdGUiPgogICAgICAgIDxwcmUgd3JhcD0iIj4KSSB0aGluayBPcGVuIENJVCAoQ2xvdWQg
SW50ZWdyaXR5IFRlY2hub2xvZ3kpIHN1cGVyc2VkZXMgT3BlbkF0dGVzdGF0aW9uLiBNb3JlIGRl
dGFpbHMgb24gdGhhdCBjYW4gYmUgZm91bmQgaGVyZToKPGEgY2xhc3M9Im1vei10eHQtbGluay1m
cmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5jaXQvb3BlbmNpdC93aWtpL09w
ZW4tQ0lULTMuMi1Qcm9kdWN0LUd1aWRlIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmNpdC9vcGVu
Y2l0L3dpa2kvT3Blbi1DSVQtMy4yLVByb2R1Y3QtR3VpZGU8L2E+CgotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQpGcm9tOiB0cG0yIFs8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBo
cmVmPSJtYWlsdG86dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZyI+bWFpbHRvOnRwbTItYm91bmNl
c0BsaXN0cy4wMS5vcmc8L2E+XSBPbiBCZWhhbGYgT2YgUm9iZXJ0cywgV2lsbGlhbSBDClNlbnQ6
IFdlZG5lc2RheSwgQXVndXN0IDEsIDIwMTggOToyOSBBTQpUbzogUGV0ZXIgTWFnbnVzc29uIDxh
IGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpibGF1ZmlzaC5wdWJs
aWMuZW1haWxAZ21haWwuY29tIj4mbHQ7YmxhdWZpc2gucHVibGljLmVtYWlsQGdtYWlsLmNvbSZn
dDs8L2E+OyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86
dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPgpTdWJqZWN0OiBSZTogW3Rw
bTJdIEFJSyBFbnJvbGxtZW50IFByb2Nlc3MgaW1wbGVtZW50YXRpb25zIHVzaW5nIHRwbTItdG9v
bHMgb3Igc2ltaWxhcgoKSSBkdWcgYXJvdW5kIGFuZCBzb21lb25lIHBvaW50ZWQgbWUgdG8gdGhp
czoKPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL09wZW5BdHRlc3RhdGlvbi9PcGVuQXR0ZXN0YXRpb24iPmh0dHBzOi8vZ2l0aHViLmNvbS9P
cGVuQXR0ZXN0YXRpb24vT3BlbkF0dGVzdGF0aW9uPC9hPgoKVW5mb3J0dW5hdGVseSwgSSBrbm93
IG5vdGhpbmcgYmV5b25kIHRoYXQgKHR5cGljYWwgcHJvYmxlbSBmb3IgbWUpLgoKPC9wcmU+CiAg
ICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICA8cHJlIHdyYXA9IiI+LS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogdHBtMiBbPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1mcmVldGV4dCIgaHJlZj0ibWFpbHRvOnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmciPm1haWx0
bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnPC9hPl0gT24gQmVoYWxmIE9mIFBldGVyIE1hZ251
c3NvbgpTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxLCAyMDE4IDM6NTUgQU0KVG86IDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9y
ZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ClN1YmplY3Q6IFt0cG0yXSBBSUsgRW5yb2xsbWVudCBQ
cm9jZXNzIGltcGxlbWVudGF0aW9ucyB1c2luZyB0cG0yLXRvb2xzIG9yCnNpbWlsYXIKCkhlbGxv
LAoKVEw7RFI6CklzIHRoZXJlIGFueSBBSUsgRW5yb2xsbWVudCAvIFBPUCBleGFtcGxlcyBhdmFp
bGFibGUgdXNpbmcgdHBtMi10b29scyAob3Igb3RoZXIKb3BlbiBzb3VyY2UgdG9vbHMsIGNvZGUg
YmFzZXMpPwoKTG9uZyB2ZXJzaW9uOgoKSSBoYWQgc29tZSBzdWNjZXNzIHdpdGggdHBtMi10b29s
cyBiYXNlZCBhdHRlc3RhdGlvbiwgZS5nLiBnZW5lcmF0aW5nIEFJSywKZXh0cmFjdGluZyBFS3B1
YiBhbmQgRUtDZXJ0IGZyb20gVFBNLCBwZXJmb3JtaW5nIHRoZSB0cG0yIHF1b3RhdGlvbiwgZXRj
LgoKSG93ZXZlciwgbXkgdW5kZXJzdGFuZGluZyBvZiB0aGUgcmVsZXZhbnQgc3BlYydzIGlzIHRo
YXQgZm9yIFRQTTIgVXNlciBEZXZpY2VzCihhbmQgbWFueSBvdGhlciBkZXZpY2VzKSwgdGhlIEVL
IGlzIGxpbWl0ZWQgdG8gcGVyZm9ybWluZyB0aGUgRW5yb2xtZW50ClByb2Nlc3NlcyAoUHJvb2Yg
b2YgUG9zc2Vzc2lvbikuIFNvIHRvIGNvbXBsZXRlIGEgbWVhbmluZ2Z1bCBSZW1vdGUKQXR0ZXN0
YXRpb24gZmxvdywgdGhlcmUgaXMgYSBuZWVkIHRvIGdldCBBSUtDZXJ0IGV4dGVybmFsbHkgdXNp
bmcgQUlLIEVucm9sbG1lbnQKUHJvY2Vzc1sxXSBhZ2FpbnN0IGFuIEF0dGVzdGF0aW9uIENBIChm
b3JtZXJseSBrbm93biBhcyBQcml2YWN5IENBKS4KCkkgZmFpbCB0byBmaW5kIHB1YmxpYyBleGFt
cGxlcyAodG9vbHMsIGV4YW1wbGUgY29kZSwgZXRjKSBvZiB0aGUgZW5yb2xtZW50IHN0ZXAuCk1v
c3Qgb2Ygd2hhdCBJIGZpbmQgd2hlbiBnb29nbGluZywgZm9yIGV4YW1wbGUgc3Ryb25nc3dhbidz
IFRQTSBwYWdlcywKYXBwZWFycyB0byBza2lwIHRoZSBBSUsgRW5yb2xsbWVudCBQcm9jZXNzIC8g
UE9QIGFuZCBqdXN0IGlzc3VlIHRoZSB0aGUgY2VydGlmaWNhdGUKd2l0aG91dCBhbnkgcHJvb2Yg
b2YgcG9zc2Vzc2lvbi4KCkFueSBsaW5rcyBvciBpbnNpZ2h0cyB3b3VsZCBiZSBhcHByZWNpYXRl
ZCA9KQoKClsxXS4gU2VjdGlvbiAyLjMuCjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQi
IGhyZWY9Imh0dHBzOi8vdHJ1c3RlZGNvbXB1dGluZ2dyb3VwLm9yZy93cCI+aHR0cHM6Ly90cnVz
dGVkY29tcHV0aW5nZ3JvdXAub3JnL3dwPC9hPi0KY29udGVudC91cGxvYWRzL0lXR19DTUNfUHJv
ZmlsZV9DZXJ0X0Vucm9sbG1lbnRfdjFfcjcucGRmCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCnRwbTIgbWFpbGluZyBsaXN0CjxhIGNsYXNzPSJtb3otdHh0
LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBs
aXN0cy4wMS5vcmc8L2E+CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0
dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiI+aHR0cHM6Ly9saXN0cy4w
MS5vcmcvbWFpbG1hbi9saXN0aW5mby90cG0yPC9hPgo8L3ByZT4KICAgICAgICA8L2Jsb2NrcXVv
dGU+CiAgICAgICAgPHByZSB3cmFwPSIiPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCnRwbTIgbWFpbGluZyBsaXN0CjxhIGNsYXNzPSJtb3otdHh0LWxpbmst
YWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8v
bGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiI+aHR0cHM6Ly9saXN0cy4wMS5vcmcv
bWFpbG1hbi9saXN0aW5mby90cG0yPC9hPgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAg
ICA8cHJlIHdyYXA9IiI+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KdHBtMiBtYWlsaW5nIGxpc3QKPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRl
ZCIgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4K
PGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5v
cmcvbWFpbG1hbi9saXN0aW5mby90cG0yIj5odHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3RwbTI8L2E+CjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogIDwvYm9k
eT4KPC9odG1sPgo=

--===============6354914756104159719==--

