Content-Type: multipart/mixed; boundary="===============3180897094035432136=="
MIME-Version: 1.0
From: Arun Sudhir <arunsudhir19 at gmail.com>
Subject: [tpm2] Re: Error Running tpm2-tools in windows against MSSIM
Date: Mon, 30 Sep 2019 11:06:05 -0700
Message-ID: <CAJLNp_Uv2=i7SKZDYAFbipuwepY=Ek3Y3+CaxLZ7AzsZsAWEJQ@mail.gmail.com>
In-Reply-To: CAJLNp_UyY+-=CsgZL85Evp6wEUB95TAypCP7mszvm6fjzABhrg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3180897094035432136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oh got it.. use the tpm2_startup command from tpm_tools.. ok. I'll try that

On Mon, Sep 30, 2019, 11:05 AM Arun Sudhir <arunsudhir19(a)gmail.com> wrote:

> I started the server with tpm_server &
>
> How do I start it up and issue the command that you are mentioning?
>
> On Mon, Sep 30, 2019, 11:01 AM Tadeusz Struk <tadeusz.struk(a)intel.com>
> wrote:
>
>> On 9/30/19 10:28 AM, Arun Sudhir wrote:
>> > WARNING:esys:api\Esys_GetCapability.c:303:Esys_GetCapability_Finish()
>> Received TPM Error
>> > ERROR:esys:api\Esys_GetCapability.c:107:Esys_GetCapability() Esys
>> Finish ErrorCode (0x00000100)
>> > ERROR: Esys_GetCapability(0x100) - tpm:error(2.0): TPM not initialized
>> by TPM2_Startup or already initialized
>> > ERROR: Unable to run
>> C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\x64\Debug\tpm2-getra=
ndom.exe
>>
>> As the above error states the TPM simulator needs to be initialized firs=
t.
>> Try "tpm2_startup -c" first, before sending other commands.
>>
>> --
>> Tadeusz
>>
>

--===============3180897094035432136==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPk9oIGdvdCBpdC4uIHVzZSB0aGUgdHBtMl9zdGFydHVwIGNvbW1hbmQg
ZnJvbSB0cG1fdG9vbHMuLiBvay4gSSYjMzk7bGwgdHJ5IHRoYXQ8L2Rpdj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24s
IFNlcCAzMCwgMjAxOSwgMTE6MDUgQU0gQXJ1biBTdWRoaXIgJmx0OzxhIGhyZWY9Im1haWx0bzph
cnVuc3VkaGlyMTlAZ21haWwuY29tIj5hcnVuc3VkaGlyMTlAZ21haWwuY29tPC9hPiZndDsgd3Jv
dGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgi
PjxkaXYgZGlyPSJhdXRvIj5JIHN0YXJ0ZWQgdGhlIHNlcnZlciB3aXRoIHRwbV9zZXJ2ZXIgJmFt
cDs8ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5Ib3cgZG8gSSBzdGFy
dCBpdCB1cCBhbmQgaXNzdWUgdGhlIGNvbW1hbmQgdGhhdCB5b3UgYXJlIG1lbnRpb25pbmc/PC9k
aXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFz
cz0iZ21haWxfYXR0ciI+T24gTW9uLCBTZXAgMzAsIDIwMTksIDExOjAxIEFNIFRhZGV1c3ogU3Ry
dWsgJmx0OzxhIGhyZWY9Im1haWx0bzp0YWRldXN6LnN0cnVrQGludGVsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+dGFkZXVzei5zdHJ1a0BpbnRlbC5jb208L2E+Jmd0OyB3
cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFl
eCI+T24gOS8zMC8xOSAxMDoyOCBBTSwgQXJ1biBTdWRoaXIgd3JvdGU6PGJyPgomZ3Q7IFdBUk5J
Tkc6ZXN5czphcGlcRXN5c19HZXRDYXBhYmlsaXR5LmM6MzAzOkVzeXNfR2V0Q2FwYWJpbGl0eV9G
aW5pc2goKSBSZWNlaXZlZCBUUE0gRXJyb3I8YnI+CiZndDsgRVJST1I6ZXN5czphcGlcRXN5c19H
ZXRDYXBhYmlsaXR5LmM6MTA3OkVzeXNfR2V0Q2FwYWJpbGl0eSgpIEVzeXMgRmluaXNoIEVycm9y
Q29kZSAoMHgwMDAwMDEwMCk8YnI+CiZndDsgRVJST1I6IEVzeXNfR2V0Q2FwYWJpbGl0eSgweDEw
MCkgLSB0cG06ZXJyb3IoMi4wKTogVFBNIG5vdCBpbml0aWFsaXplZCBieSBUUE0yX1N0YXJ0dXAg
b3IgYWxyZWFkeSBpbml0aWFsaXplZDxicj4KJmd0OyBFUlJPUjogVW5hYmxlIHRvIHJ1biBDOlxV
c2Vyc1xhcnVuc3Vcc291cmNlXHJlcG9zXHRwbTItdG9vbHMtNC4wXHZzdHVkaW9ceDY0XERlYnVn
XHRwbTItZ2V0cmFuZG9tLmV4ZTxicj4KPGJyPgpBcyB0aGUgYWJvdmUgZXJyb3Igc3RhdGVzIHRo
ZSBUUE0gc2ltdWxhdG9yIG5lZWRzIHRvIGJlIGluaXRpYWxpemVkIGZpcnN0Ljxicj4KVHJ5ICZx
dW90O3RwbTJfc3RhcnR1cCAtYyZxdW90OyBmaXJzdCwgYmVmb3JlIHNlbmRpbmcgb3RoZXIgY29t
bWFuZHMuPGJyPgo8YnI+Ci0tIDxicj4KVGFkZXVzejxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo8
L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============3180897094035432136==--

