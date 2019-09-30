Content-Type: multipart/mixed; boundary="===============3142280333948204553=="
MIME-Version: 1.0
From: Arun Sudhir <arunsudhir19 at gmail.com>
Subject: [tpm2] Re: Error Running tpm2-tools in windows against MSSIM
Date: Mon, 30 Sep 2019 11:21:33 -0700
Message-ID: <CAJLNp_Xo2YexQuXnt_H6=X+JtMneYFiQ6D4xPfEwS9=Ch0j=nA@mail.gmail.com>
In-Reply-To: CAJLNp_Uv2=i7SKZDYAFbipuwepY=Ek3Y3+CaxLZ7AzsZsAWEJQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3142280333948204553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That fixed it!

Thanks a lot Tadeusz!

On Mon, Sep 30, 2019, 11:06 AM Arun Sudhir <arunsudhir19(a)gmail.com> wrote:

> Oh got it.. use the tpm2_startup command from tpm_tools.. ok. I'll try th=
at
>
> On Mon, Sep 30, 2019, 11:05 AM Arun Sudhir <arunsudhir19(a)gmail.com> wro=
te:
>
>> I started the server with tpm_server &
>>
>> How do I start it up and issue the command that you are mentioning?
>>
>> On Mon, Sep 30, 2019, 11:01 AM Tadeusz Struk <tadeusz.struk(a)intel.com>
>> wrote:
>>
>>> On 9/30/19 10:28 AM, Arun Sudhir wrote:
>>> > WARNING:esys:api\Esys_GetCapability.c:303:Esys_GetCapability_Finish()
>>> Received TPM Error
>>> > ERROR:esys:api\Esys_GetCapability.c:107:Esys_GetCapability() Esys
>>> Finish ErrorCode (0x00000100)
>>> > ERROR: Esys_GetCapability(0x100) - tpm:error(2.0): TPM not initialized
>>> by TPM2_Startup or already initialized
>>> > ERROR: Unable to run
>>> C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\x64\Debug\tpm2-getr=
andom.exe
>>>
>>> As the above error states the TPM simulator needs to be initialized
>>> first.
>>> Try "tpm2_startup -c" first, before sending other commands.
>>>
>>> --
>>> Tadeusz
>>>
>>

--===============3142280333948204553==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPlRoYXQgZml4ZWQgaXQhwqA8ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2
PjxkaXYgZGlyPSJhdXRvIj5UaGFua3MgYSBsb3QgVGFkZXVzeiE8L2Rpdj48L2Rpdj48YnI+PGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5P
biBNb24sIFNlcCAzMCwgMjAxOSwgMTE6MDYgQU0gQXJ1biBTdWRoaXIgJmx0OzxhIGhyZWY9Im1h
aWx0bzphcnVuc3VkaGlyMTlAZ21haWwuY29tIj5hcnVuc3VkaGlyMTlAZ21haWwuY29tPC9hPiZn
dDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVm
dDoxZXgiPjxkaXYgZGlyPSJhdXRvIj5PaCBnb3QgaXQuLiB1c2UgdGhlIHRwbTJfc3RhcnR1cCBj
b21tYW5kIGZyb20gdHBtX3Rvb2xzLi4gb2suIEkmIzM5O2xsIHRyeSB0aGF0PC9kaXY+PGJyPjxk
aXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+
T24gTW9uLCBTZXAgMzAsIDIwMTksIDExOjA1IEFNIEFydW4gU3VkaGlyICZsdDs8YSBocmVmPSJt
YWlsdG86YXJ1bnN1ZGhpcjE5QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZl
cnJlciI+YXJ1bnN1ZGhpcjE5QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3Jk
ZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0iYXV0byI+
SSBzdGFydGVkIHRoZSBzZXJ2ZXIgd2l0aCB0cG1fc2VydmVyICZhbXA7PGRpdiBkaXI9ImF1dG8i
Pjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SG93IGRvIEkgc3RhcnQgaXQgdXAgYW5kIGlzc3Vl
IHRoZSBjb21tYW5kIHRoYXQgeW91IGFyZSBtZW50aW9uaW5nPzwvZGl2PjwvZGl2Pjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9u
IE1vbiwgU2VwIDMwLCAyMDE5LCAxMTowMSBBTSBUYWRldXN6IFN0cnVrICZsdDs8YSBocmVmPSJt
YWlsdG86dGFkZXVzei5zdHJ1a0BpbnRlbC5jb20iIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+dGFkZXVzei5zdHJ1a0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAg
MCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+T24g
OS8zMC8xOSAxMDoyOCBBTSwgQXJ1biBTdWRoaXIgd3JvdGU6PGJyPgomZ3Q7IFdBUk5JTkc6ZXN5
czphcGlcRXN5c19HZXRDYXBhYmlsaXR5LmM6MzAzOkVzeXNfR2V0Q2FwYWJpbGl0eV9GaW5pc2go
KSBSZWNlaXZlZCBUUE0gRXJyb3I8YnI+CiZndDsgRVJST1I6ZXN5czphcGlcRXN5c19HZXRDYXBh
YmlsaXR5LmM6MTA3OkVzeXNfR2V0Q2FwYWJpbGl0eSgpIEVzeXMgRmluaXNoIEVycm9yQ29kZSAo
MHgwMDAwMDEwMCk8YnI+CiZndDsgRVJST1I6IEVzeXNfR2V0Q2FwYWJpbGl0eSgweDEwMCkgLSB0
cG06ZXJyb3IoMi4wKTogVFBNIG5vdCBpbml0aWFsaXplZCBieSBUUE0yX1N0YXJ0dXAgb3IgYWxy
ZWFkeSBpbml0aWFsaXplZDxicj4KJmd0OyBFUlJPUjogVW5hYmxlIHRvIHJ1biBDOlxVc2Vyc1xh
cnVuc3Vcc291cmNlXHJlcG9zXHRwbTItdG9vbHMtNC4wXHZzdHVkaW9ceDY0XERlYnVnXHRwbTIt
Z2V0cmFuZG9tLmV4ZTxicj4KPGJyPgpBcyB0aGUgYWJvdmUgZXJyb3Igc3RhdGVzIHRoZSBUUE0g
c2ltdWxhdG9yIG5lZWRzIHRvIGJlIGluaXRpYWxpemVkIGZpcnN0Ljxicj4KVHJ5ICZxdW90O3Rw
bTJfc3RhcnR1cCAtYyZxdW90OyBmaXJzdCwgYmVmb3JlIHNlbmRpbmcgb3RoZXIgY29tbWFuZHMu
PGJyPgo8YnI+Ci0tIDxicj4KVGFkZXVzejxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo8L2Jsb2Nr
cXVvdGU+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============3142280333948204553==--

