Content-Type: multipart/mixed; boundary="===============2004683914230788622=="
MIME-Version: 1.0
From: Markus Willhelm Schmid <willhelm.schmid at gmail.com>
Subject: [tpm2] Re: How do I use Microsoft's sim (TSS.MSR) with lib tss2-esys
Date: Thu, 10 Mar 2022 07:44:45 -0800
Message-ID: <CAMs2GAqF=oqPqqC53+QCA0xySrwbdR-wgwDD2DZj1-2DZGDQdw@mail.gmail.com>
In-Reply-To: BN8PR15MB2753FE8D012956322D17D3ABF20B9@BN8PR15MB2753.namprd15.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2004683914230788622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I made an error in my previous email, I pasted in the URL to IBM's TCC
stack and not to IBM's SW TPM. This is what I am trying to compile.
https://sourceforge.net/projects/ibmswtpm2/

On Windows, my OpenSSL version is 3.0.1 and on Linux, it's 1.1.1f  (31 Mar
2020). The version number triggers when I compile SW TPM on Windows and
when I bypass this version check, the following fails:
#if    defined THIRTY_TWO_BIT && (RADIX_BITS !=3D 32) \
    || ((defined SIXTY_FOUR_BIT_LONG || defined SIXTY_FOUR_BIT) \
&& (RADIX_BITS !=3D 64))
#   error Ossl library is using different radix
#endif

The above compiles after changing the Visual Studio project from 32 bit to
64 bit. In other words, there appears to be a problem with this project
file.

So I managed to compile for both Linux and Windows. When I run the
simulator on Linux and try the test program I mentioned in my first email,
I see this being printed by the simulator:

Command IPv4 client accepted
Platform IPv4 client accepted

However, the client still prints:
ERROR:tcti:src/tss2-tcti/tcti-device.c:439:Tss2_Tcti_Device_Init() Failed
to open device file /dev/tpmrm0: No such file or directory
WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for
function 0x7f56f5701fb0 failed with a000a
WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not
initialize TCTI named: tcti-device
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not
initialize TCTI file: libtss2-tcti-device.so.0
ERROR:tcti:src/tss2-tcti/tcti-device.c:439:Tss2_Tcti_Device_Init() Failed
to open device file /dev/tpm0: No such file or directory
WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for
function 0x7f56f5701fb0 failed with a000a
WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not
initialize TCTI named: tcti-device
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not
initialize TCTI file: libtss2-tcti-device.so.0
WARNING:esys:src/tss2-esys/api/Esys_GetRandom.c:277:Esys_GetRandom_Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_GetRandom.c:95:Esys_GetRandom() Esys
Finish ErrorCode (0x00000100)
Error: Esys_GetRandom

The last error is from my test program:
    Esys_Initialize ..... *this seems to be OK*
    r =3D Esys_GetRandom(ctx, ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE, 20,
                       &random_bytes);

    if (r !=3D TSS2_RC_SUCCESS){
        printf("\n*Error: Esys_GetRandom*\n");
        exit(1);
    }

Questions:
How do I make the test program work (Esys_GetRandom) with the simulator?
if the IBM simulator is required (IBM SW TPM), why does the documentation
state that I have to use the Microsoft simulator (ref:
https://github.com/tpm2-software/tpm2-tss/blob/master/README.md)?
If tpm2-tss library is compliant, should the stack not work with any
compatible TPM 2.0 simulator, including Microsoft's simulator and IBM's
simulator?

On Thu, Mar 10, 2022 at 6:11 AM Kenneth Goldman <kgoldman(a)us.ibm.com> wro=
te:

>
>
>
>
> *From:* Markus Willhelm Schmid <willhelm.schmid(a)gmail.com>
> *Sent:* Wednesday, March 9, 2022 4:08 PM
> *Cc:* tpm2(a)lists.01.org
> *Subject:* [EXTERNAL] [tpm2] Re: How do I use Microsoft's sim (TSS.MSR)
> with lib tss2-esys
>
>
>
> When you say IBM simulator, are you referring to:
> https://sourceforge.net/projects/ibmtpm20tss/
>
> If so, this code will not compile on Windows or Linux. I tried to bypass
> the ifdef for OpenSSL version check in the headers, but I then got a lot =
of
> errors. I believe this code requires an ancient (unspecified) OpenSSL
> version. Also, I could not find anything pre-built.
>
> [kgold]
>
> [kgold] I support the IBM SW TPM.  I test it on Windows and many Linux,
> with various OpenSS, gcc, mingw, Visual Studio.  If something doesn't wor=
k,
> file a bug report, email me, post here, but don't just give up.  It's
> widely used.
>

--===============2004683914230788622==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SSBtYWRlIGFuIGVycm9yIGluIG15IHByZXZpb3VzIGVtYWlsLCBJIHBh
c3RlZCBpbiB0aGUgVVJMIHRvIElCTSYjMzk7cyBUQ0Mgc3RhY2sgYW5kIG5vdCB0byBJQk0mIzM5
O3MgU1cgVFBNLiBUaGlzIGlzIHdoYXQgSSBhbSB0cnlpbmcgdG8gY29tcGlsZS48YnI+PGEgaHJl
Zj0iaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMvaWJtc3d0cG0yLyI+aHR0cHM6Ly9z
b3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMvaWJtc3d0cG0yLzwvYT48ZGl2Pjxicj5PbiBXaW5kb3dz
LCBteSBPcGVuU1NMIHZlcnNpb24gaXMgMy4wLjEgYW5kIG9uIExpbnV4LCBpdCYjMzk7cyAxLjEu
MWYgwqAoMzEgTWFyIDIwMjApLiBUaGUgdmVyc2lvbiBudW1iZXIgdHJpZ2dlcnMgd2hlbiBJIGNv
bXBpbGUgU1cgVFBNIG9uIFdpbmRvd3MgYW5kIHdoZW4gSSBieXBhc3MgdGhpcyB2ZXJzaW9uIGNo
ZWNrLCB0aGUgZm9sbG93aW5nIGZhaWxzOjwvZGl2PjxkaXY+I2lmIMKgIMKgZGVmaW5lZCBUSElS
VFlfVFdPX0JJVCAmYW1wOyZhbXA7IChSQURJWF9CSVRTICE9IDMyKQkJCVw8YnI+wqAgwqAgfHwg
KChkZWZpbmVkIFNJWFRZX0ZPVVJfQklUX0xPTkcgfHwgZGVmaW5lZCBTSVhUWV9GT1VSX0JJVCkJ
CVw8YnI+CSZhbXA7JmFtcDsgKFJBRElYX0JJVFMgIT0gNjQpKTxicj4jIMKgIGVycm9yIE9zc2wg
bGlicmFyeSBpcyB1c2luZyBkaWZmZXJlbnQgcmFkaXg8YnI+I2VuZGlmPGJyPjxicj5UaGUgYWJv
dmUgY29tcGlsZXMgYWZ0ZXIgY2hhbmdpbmcgdGhlIFZpc3VhbCBTdHVkaW8gcHJvamVjdCBmcm9t
IDMyIGJpdCB0byA2NCBiaXQuIEluIG90aGVyIHdvcmRzLCB0aGVyZSBhcHBlYXJzIHRvIGJlIGEg
cHJvYmxlbSB3aXRoIHRoaXMgcHJvamVjdCBmaWxlLjxicj48YnI+U28gSSBtYW5hZ2VkIHRvIGNv
bXBpbGUgZm9yIGJvdGggTGludXggYW5kIFdpbmRvd3MuIFdoZW4gSSBydW4gdGhlIHNpbXVsYXRv
ciBvbiBMaW51eCBhbmQgdHJ5IHRoZSB0ZXN0IHByb2dyYW0gSSBtZW50aW9uZWQgaW4gbXkgZmly
c3QgZW1haWwsIEkgc2VlIHRoaXMgYmVpbmcgcHJpbnRlZCBieSB0aGUgc2ltdWxhdG9yOjxicj48
YnI+Q29tbWFuZCBJUHY0IGNsaWVudCBhY2NlcHRlZDxicj5QbGF0Zm9ybSBJUHY0IGNsaWVudCBh
Y2NlcHRlZDxicj48YnI+SG93ZXZlciwgdGhlIGNsaWVudCBzdGlsbCBwcmludHM6PGJyPkVSUk9S
OnRjdGk6c3JjL3RzczItdGN0aS90Y3RpLWRldmljZS5jOjQzOTpUc3MyX1RjdGlfRGV2aWNlX0lu
aXQoKSBGYWlsZWQgdG8gb3BlbiBkZXZpY2UgZmlsZSAvZGV2L3RwbXJtMDogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeTxicj5XQVJOSU5HOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLmM6NjI6
dGN0aV9mcm9tX2luaXQoKSBUQ1RJIGluaXQgZm9yIGZ1bmN0aW9uIDB4N2Y1NmY1NzAxZmIwIGZh
aWxlZCB3aXRoIGEwMDBhPGJyPldBUk5JTkc6dGN0aTpzcmMvdHNzMi10Y3RpL3RjdGlsZHIuYzo5
Mjp0Y3RpX2Zyb21faW5mbygpIENvdWxkIG5vdCBpbml0aWFsaXplIFRDVEkgbmFtZWQ6IHRjdGkt
ZGV2aWNlPGJyPkVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLWRsLmM6MTUwOnRjdGlf
ZnJvbV9maWxlKCkgQ291bGQgbm90IGluaXRpYWxpemUgVENUSSBmaWxlOiBsaWJ0c3MyLXRjdGkt
ZGV2aWNlLnNvLjA8YnI+RVJST1I6dGN0aTpzcmMvdHNzMi10Y3RpL3RjdGktZGV2aWNlLmM6NDM5
OlRzczJfVGN0aV9EZXZpY2VfSW5pdCgpIEZhaWxlZCB0byBvcGVuIGRldmljZSBmaWxlIC9kZXYv
dHBtMDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTxicj5XQVJOSU5HOnRjdGk6c3JjL3RzczIt
dGN0aS90Y3RpbGRyLmM6NjI6dGN0aV9mcm9tX2luaXQoKSBUQ1RJIGluaXQgZm9yIGZ1bmN0aW9u
IDB4N2Y1NmY1NzAxZmIwIGZhaWxlZCB3aXRoIGEwMDBhPGJyPldBUk5JTkc6dGN0aTpzcmMvdHNz
Mi10Y3RpL3RjdGlsZHIuYzo5Mjp0Y3RpX2Zyb21faW5mbygpIENvdWxkIG5vdCBpbml0aWFsaXpl
IFRDVEkgbmFtZWQ6IHRjdGktZGV2aWNlPGJyPkVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3Rp
bGRyLWRsLmM6MTUwOnRjdGlfZnJvbV9maWxlKCkgQ291bGQgbm90IGluaXRpYWxpemUgVENUSSBm
aWxlOiBsaWJ0c3MyLXRjdGktZGV2aWNlLnNvLjA8YnI+V0FSTklORzplc3lzOnNyYy90c3MyLWVz
eXMvYXBpL0VzeXNfR2V0UmFuZG9tLmM6Mjc3OkVzeXNfR2V0UmFuZG9tX0ZpbmlzaCgpIFJlY2Vp
dmVkIFRQTSBFcnJvcjxicj5FUlJPUjplc3lzOnNyYy90c3MyLWVzeXMvYXBpL0VzeXNfR2V0UmFu
ZG9tLmM6OTU6RXN5c19HZXRSYW5kb20oKSBFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4MDAwMDAx
MDApPGJyPkVycm9yOiBFc3lzX0dldFJhbmRvbTxicj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBs
YXN0IGVycm9yIGlzIGZyb20gbXkgdGVzdCBwcm9ncmFtOjwvZGl2PjxkaXY+wqAgwqAgRXN5c19J
bml0aWFsaXplIC4uLi4uIDxiPnRoaXMgc2VlbXMgdG8gYmUgT0s8L2I+PGJyPsKgIMKgIHIgPSBF
c3lzX0dldFJhbmRvbShjdHgsIEVTWVNfVFJfTk9ORSwgRVNZU19UUl9OT05FLCBFU1lTX1RSX05P
TkUsIDIwLDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7cmFuZG9t
X2J5dGVzKTs8YnI+PGJyPsKgIMKgIGlmIChyICE9IFRTUzJfUkNfU1VDQ0VTUyl7PGJyPsKgIMKg
IMKgIMKgIHByaW50ZigmcXVvdDtcbjxiPkVycm9yOiBFc3lzX0dldFJhbmRvbTwvYj5cbiZxdW90
Oyk7PGJyPsKgIMKgIMKgIMKgIGV4aXQoMSk7PGJyPsKgIMKgIH08YnI+PGJyPlF1ZXN0aW9uczog
PGJyPkhvdyBkbyBJIG1ha2UgdGhlIHRlc3QgcHJvZ3JhbSB3b3JrIChFc3lzX0dldFJhbmRvbSkg
d2l0aCB0aGUgc2ltdWxhdG9yPzxicj5pZiB0aGUgSUJNIHNpbXVsYXRvciBpcyByZXF1aXJlZCAo
SUJNIFNXIFRQTSksIHdoeSBkb2VzIHRoZSBkb2N1bWVudGF0aW9uIHN0YXRlIHRoYXQgSSBoYXZl
IHRvIHVzZSB0aGUgTWljcm9zb2Z0IHNpbXVsYXRvciAocmVmOiA8YSBocmVmPSJodHRwczovL2dp
dGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9ibG9iL21hc3Rlci9SRUFETUUubWQiPmh0
dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzL2Jsb2IvbWFzdGVyL1JFQURN
RS5tZDwvYT4pPzxicj5JZiB0cG0yLXRzcyBsaWJyYXJ5IGlzIGNvbXBsaWFudCwgc2hvdWxkIHRo
ZSBzdGFjayBub3Qgd29yayB3aXRoIGFueSBjb21wYXRpYmxlIFRQTSAyLjAgc2ltdWxhdG9yLCBp
bmNsdWRpbmcgTWljcm9zb2Z0JiMzOTtzIHNpbXVsYXRvciBhbmQgSUJNJiMzOTtzIHNpbXVsYXRv
cj88YnI+PC9kaXY+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2
IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCBNYXIgMTAsIDIwMjIgYXQgNjox
MSBBTSBLZW5uZXRoIEdvbGRtYW4gJmx0OzxhIGhyZWY9Im1haWx0bzprZ29sZG1hbkB1cy5pYm0u
Y29tIj5rZ29sZG1hbkB1cy5pYm0uY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1
b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDti
b3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4K
CgoKCgo8ZGl2IGxhbmc9IkVOLVVTIiBzdHlsZT0ib3ZlcmZsb3ctd3JhcDogYnJlYWstd29yZDsi
Pgo8ZGl2IGNsYXNzPSJnbWFpbC1tXy05MDU0NTY5MjE2OTYyNTM4ODM1V29yZFNlY3Rpb24xIj4K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0RlamFW
dSBTYW5zJnF1b3Q7LHNhbnMtc2VyaWYiPjx1PjwvdT7CoDx1PjwvdT48L3NwYW4+PC9wPgo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7RGVqYVZ1IFNh
bnMmcXVvdDssc2Fucy1zZXJpZiI+PHU+PC91PsKgPHU+PC91Pjwvc3Bhbj48L3A+CjxkaXY+Cjxk
aXYgc3R5bGU9ImJvcmRlci1yaWdodDpub25lO2JvcmRlci1ib3R0b206bm9uZTtib3JkZXItbGVm
dDpub25lO2JvcmRlci10b3A6MXB0IHNvbGlkIHJnYigyMjUsMjI1LDIyNSk7cGFkZGluZzozcHQg
MGluIDBpbiI+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDowLjVpbiI+
PGI+RnJvbTo8L2I+IE1hcmt1cyBXaWxsaGVsbSBTY2htaWQgJmx0OzxhIGhyZWY9Im1haWx0bzp3
aWxsaGVsbS5zY2htaWRAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGhlbG0uc2NobWlk
QGdtYWlsLmNvbTwvYT4mZ3Q7Cjxicj4KPGI+U2VudDo8L2I+IFdlZG5lc2RheSwgTWFyY2ggOSwg
MjAyMiA0OjA4IFBNPGJyPgo8Yj5DYzo8L2I+IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KPGI+U3ViamVj
dDo8L2I+IFtFWFRFUk5BTF0gW3RwbTJdIFJlOiBIb3cgZG8gSSB1c2UgTWljcm9zb2Z0JiMzOTtz
IHNpbSAoVFNTLk1TUikgd2l0aCBsaWIgdHNzMi1lc3lzPHU+PC91Pjx1PjwvdT48L3A+CjwvZGl2
Pgo8L2Rpdj4KPGRpdj4KPGRpdj4KPGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1h
cmdpbi1sZWZ0OjAuNWluIj48dT48L3U+wqA8dT48L3U+PC9wPgo8L2Rpdj4KPGRpdj4KPHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjAuNWluIj5XaGVuIHlvdcKgc2F5IElC
TSBzaW11bGF0b3IsIGFyZSB5b3UgcmVmZXJyaW5nIHRvOsKgPGEgaHJlZj0iaHR0cHM6Ly9zb3Vy
Y2Vmb3JnZS5uZXQvcHJvamVjdHMvaWJtdHBtMjB0c3MvIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMvaWJtdHBtMjB0c3MvPC9hPjx1PjwvdT48dT48L3U+
PC9wPgo8L2Rpdj4KPGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0
OjAuNWluIj5JZiBzbywgdGhpcyBjb2RlIHdpbGwgbm90IGNvbXBpbGUgb24gV2luZG93cyBvciBM
aW51eC4gSSB0cmllZCB0byBieXBhc3MgdGhlIGlmZGVmIGZvciBPcGVuU1NMIHZlcnNpb24gY2hl
Y2sgaW4gdGhlIGhlYWRlcnMsIGJ1dCBJIHRoZW4gZ290IGEgbG90IG9mIGVycm9ycy4gSSBiZWxp
ZXZlIHRoaXMgY29kZSByZXF1aXJlcyBhbiBhbmNpZW50ICh1bnNwZWNpZmllZCnCoE9wZW5TU0wK
IHZlcnNpb24uIEFsc28sIEkgY291bGQgbm90IGZpbmQgYW55dGhpbmcgcHJlLWJ1aWx0Ljx1Pjwv
dT48dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1mYW1p
bHk6JnF1b3Q7RGVqYVZ1IFNhbnMmcXVvdDssc2Fucy1zZXJpZiI+W2tnb2xkXSA8dT48L3U+Cjx1
PjwvdT48L3NwYW4+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6JnF1b3Q7RGVqYVZ1IFNhbnMmcXVvdDssc2Fucy1zZXJpZiI+W2tnb2xkXSBJIHN1cHBv
cnQgdGhlIElCTSBTVyBUUE0uwqAgSSB0ZXN0IGl0IG9uIFdpbmRvd3MgYW5kIG1hbnkgTGludXgs
IHdpdGggdmFyaW91cyBPcGVuU1MsIGdjYywgbWluZ3csIFZpc3VhbCBTdHVkaW8uwqAgSWYgc29t
ZXRoaW5nIGRvZXNuJiMzOTt0IHdvcmssIGZpbGUgYSBidWcgcmVwb3J0LCBlbWFpbCBtZSwgcG9z
dCBoZXJlLAogYnV0IGRvbiYjMzk7dCBqdXN0IGdpdmUgdXAuwqAgSXQmIzM5O3Mgd2lkZWx5IHVz
ZWQuPHU+PC91Pjx1PjwvdT48L3NwYW4+PC9wPgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4K
PC9kaXY+Cgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============2004683914230788622==--

