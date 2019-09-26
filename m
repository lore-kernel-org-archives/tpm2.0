Content-Type: multipart/mixed; boundary="===============6819661563270903019=="
MIME-Version: 1.0
From: ZhengYu Tsai <kalohomulder at gmail.com>
Subject: Re: [tpm2] How to generate the statically linked executable
Date: Thu, 26 Sep 2019 09:40:32 +0800
Message-ID: <CAAG8Em3Y1OajU5gDiYZSn6vnVs=WLPCHX0naNyeuEj7LSqpPOw@mail.gmail.com>
In-Reply-To: 7a67cb43-69cb-785c-259c-7d908a0d773e@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6819661563270903019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tadeusz :
Thanks for your reply.

*./configure "LDFLAGS=3D--static" --disable-shared *
it will hang at :
checking whether the linker accepts -shared... yes
checking whether C compiler accepts -fPIE... yes
checking whether the linker accepts -pie... no
configure: error: Cannot enable -pie, consider configuring with
--disable-hardening

so I adjusted it :
* ./configure "LDFLAGS=3D--static" --disable-shared --disable-hardening ;
make*
The problem is the same as before :
/home/derek/workdir/tpm2-tss/src/tss2-tcti/tctildr-dl.c:84: warning: Using
'dlopen' in statically linked applications requires at runtime the shared
libraries from the glibc version used for linking
  CC       tools/tools_tpm2_getekcertificate-tpm2_getekcertificate.o
  CC       tools/tools_tpm2_getekcertificate-tpm2_tool.o
  CCLD     tools/tpm2_getekcertificate
/usr/local/lib/libtss2-esys.a(src_tss2_esys_libtss2_esys_la-tctildr-dl.o):
In function `handle_from_name':
/home/derek/workdir/tpm2-tss/src/tss2-tcti/tctildr-dl.c:84: warning: Using
'dlopen' in statically linked applications requires at runtime the shared
libraries from the glibc version used for linking
/usr/bin/ld: attempted static link of dynamic object
`/usr/lib/i386-linux-gnu/libcurl-gnutls.so'
collect2: error: ld returned 1 exit status
Makefile:2170: recipe for target 'tools/tpm2_getekcertificate' failed
make: *** [tools/tpm2_getekcertificate] Error 1

I also found the tpm2-tss configure *--enable-shared=3Dno,*
This option is necessary, it will affect the compilation tpm2-tools.



Tadeusz Struk <tadeusz.struk(a)intel.com> =E6=96=BC 2019=E5=B9=B49=E6=9C=88=
26=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:55=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On 9/24/19 1:50 AM, ZhengYu Tsai wrote:
>
> > /usr/bin/ld: attempted static link of dynamic object
> `/usr/lib/i386-linux-gnu/libcurl-gnutls.so'
> > collect2: error: ld returned 1 exit status
> > Makefile:2170: recipe for target 'tools/tpm2_getekcertificate' failed
> > make: *** [tools/tpm2_getekcertificate] Error 1
> >
> >   *
> >
> >     Steps to Reproduce
> >     // install tpm2-tss
> >     ./configure "CFLAGS=3D--static" --enable-shared=3Dno
> >     make
> >     sudo make install
> >     // Install tpm2-tools
> >     ./configure "CFLAGS=3D--static" --enable-shared=3Dno --disable-hard=
ening
>
> Don't you need to set LDFLAGS instead of CFLAGS:
>
> ./configure "LDFLAGS=3D--static" --disable-shared
>
> Thanks,
> --
> Tadeusz
>

--===============6819661563270903019==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGZvbnQgY29sb3I9IiMwMDAwZmYiPkhpIFRh
ZGV1c3ogOjwvZm9udD48ZGl2Pjxmb250IGNvbG9yPSIjMDAwMGZmIj5UaGFua3MgZm9yIHlvdXLC
oHJlcGx5LjwvZm9udD48L2Rpdj48ZGl2PjxiPjxicj48L2I+PC9kaXY+PGRpdj48Yj4uL2NvbmZp
Z3VyZSAmcXVvdDtMREZMQUdTPS0tc3RhdGljJnF1b3Q7IC0tZGlzYWJsZS1zaGFyZWTCoDwvYj48
L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMDAwMGZmIj5pdCB3aWxsIGhhbmcgYXQgOjwvZm9udD48
L2Rpdj48ZGl2PmNoZWNraW5nIHdoZXRoZXIgdGhlIGxpbmtlciBhY2NlcHRzIC1zaGFyZWQuLi4g
eWVzPGJyPmNoZWNraW5nIHdoZXRoZXIgQyBjb21waWxlciBhY2NlcHRzIC1mUElFLi4uIHllczxi
cj5jaGVja2luZyB3aGV0aGVyIHRoZSBsaW5rZXIgYWNjZXB0cyAtcGllLi4uIG5vPGJyPmNvbmZp
Z3VyZTogZXJyb3I6IENhbm5vdCBlbmFibGUgLXBpZSwgY29uc2lkZXIgY29uZmlndXJpbmcgd2l0
aCAtLWRpc2FibGUtaGFyZGVuaW5nPGJyPjwvZGl2PjxkaXY+wqA8YnI+PC9kaXY+PC9kaXY+PGZv
bnQgY29sb3I9IiMwMDAwZmYiPnNvIEkgYWRqdXN0ZWQgaXQgOjwvZm9udD48ZGl2PjxiPgoKLi9j
b25maWd1cmUgJnF1b3Q7TERGTEFHUz0tLXN0YXRpYyZxdW90OyAtLWRpc2FibGUtc2hhcmVkIC0t
ZGlzYWJsZS1oYXJkZW5pbmcgOyBtYWtlPC9iPjwvZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMwMDAw
ZmYiPlRoZSBwcm9ibGVtIGlzIHRoZSBzYW1lIGFzIGJlZm9yZSA6PC9mb250Pjxicj48L2Rpdj48
ZGl2Pi9ob21lL2RlcmVrL3dvcmtkaXIvdHBtMi10c3Mvc3JjL3RzczItdGN0aS90Y3RpbGRyLWRs
LmM6ODQ6IHdhcm5pbmc6IFVzaW5nICYjMzk7ZGxvcGVuJiMzOTsgaW4gc3RhdGljYWxseSBsaW5r
ZWQgYXBwbGljYXRpb25zIHJlcXVpcmVzIGF0IHJ1bnRpbWUgdGhlIHNoYXJlZCBsaWJyYXJpZXMg
ZnJvbSB0aGUgZ2xpYmMgdmVyc2lvbiB1c2VkIGZvciBsaW5raW5nPGJyPsKgIENDIMKgIMKgIMKg
IHRvb2xzL3Rvb2xzX3RwbTJfZ2V0ZWtjZXJ0aWZpY2F0ZS10cG0yX2dldGVrY2VydGlmaWNhdGUu
bzxicj7CoCBDQyDCoCDCoCDCoCB0b29scy90b29sc190cG0yX2dldGVrY2VydGlmaWNhdGUtdHBt
Ml90b29sLm88YnI+wqAgQ0NMRCDCoCDCoCB0b29scy90cG0yX2dldGVrY2VydGlmaWNhdGU8YnI+
L3Vzci9sb2NhbC9saWIvbGlidHNzMi1lc3lzLmEoc3JjX3RzczJfZXN5c19saWJ0c3MyX2VzeXNf
bGEtdGN0aWxkci1kbC5vKTogSW4gZnVuY3Rpb24gYGhhbmRsZV9mcm9tX25hbWUmIzM5Ozo8YnI+
L2hvbWUvZGVyZWsvd29ya2Rpci90cG0yLXRzcy9zcmMvdHNzMi10Y3RpL3RjdGlsZHItZGwuYzo4
NDogd2FybmluZzogVXNpbmcgJiMzOTtkbG9wZW4mIzM5OyBpbiBzdGF0aWNhbGx5IGxpbmtlZCBh
cHBsaWNhdGlvbnMgcmVxdWlyZXMgYXQgcnVudGltZSB0aGUgc2hhcmVkIGxpYnJhcmllcyBmcm9t
IHRoZSBnbGliYyB2ZXJzaW9uIHVzZWQgZm9yIGxpbmtpbmc8YnI+L3Vzci9iaW4vbGQ6IGF0dGVt
cHRlZCBzdGF0aWMgbGluayBvZiBkeW5hbWljIG9iamVjdCBgL3Vzci9saWIvaTM4Ni1saW51eC1n
bnUvbGliY3VybC1nbnV0bHMuc28mIzM5Ozxicj5jb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVk
IDEgZXhpdCBzdGF0dXM8YnI+TWFrZWZpbGU6MjE3MDogcmVjaXBlIGZvciB0YXJnZXQgJiMzOTt0
b29scy90cG0yX2dldGVrY2VydGlmaWNhdGUmIzM5OyBmYWlsZWQ8YnI+bWFrZTogKioqIFt0b29s
cy90cG0yX2dldGVrY2VydGlmaWNhdGVdIEVycm9yIDE8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj48Zm9udCBjb2xvcj0iIzAwMDBmZiI+SSBhbHNvIGZvdW5kIHRoZSB0cG0yLXRzcyBjb25m
aWd1cmXCoDxiPi0tZW5hYmxlLXNoYXJlZD1ubyw8L2I+PC9mb250PjwvZGl2PjxkaXY+PGZvbnQg
Y29sb3I9IiMwMDAwZmYiPlRoaXMgb3B0aW9uIGlzIG5lY2Vzc2FyeSwgaXQgd2lsbCBhZmZlY3Qg
dGhlIGNvbXBpbGF0aW9uIHRwbTItdG9vbHMuPC9mb250PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0i
bHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+VGFkZXVzeiBTdHJ1ayAmbHQ7PGEgaHJlZj0ibWFpbHRv
OnRhZGV1c3ouc3RydWtAaW50ZWwuY29tIj50YWRldXN6LnN0cnVrQGludGVsLmNvbTwvYT4mZ3Q7
IOaWvCAyMDE55bm0OeaciDI25pelIOmAseWbmyDkuIrljYg0OjU15a+r6YGT77yaPGJyPjwvZGl2
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4Ij5PbiA5LzI0LzE5IDE6NTAgQU0sIFpoZW5nWXUgVHNhaSB3cm90ZTo8YnI+Cjxicj4K
Jmd0OyAvdXNyL2Jpbi9sZDogYXR0ZW1wdGVkIHN0YXRpYyBsaW5rIG9mIGR5bmFtaWMgb2JqZWN0
IGAvdXNyL2xpYi9pMzg2LWxpbnV4LWdudS9saWJjdXJsLWdudXRscy5zbyYjMzk7PGJyPgomZ3Q7
IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1czxicj4KJmd0OyBNYWtl
ZmlsZToyMTcwOiByZWNpcGUgZm9yIHRhcmdldCAmIzM5O3Rvb2xzL3RwbTJfZ2V0ZWtjZXJ0aWZp
Y2F0ZSYjMzk7IGZhaWxlZDxicj4KJmd0OyBtYWtlOiAqKiogW3Rvb2xzL3RwbTJfZ2V0ZWtjZXJ0
aWZpY2F0ZV0gRXJyb3IgMTxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCo8YnI+CiZndDsgPGJyPgom
Z3Q7wqAgwqAgwqBTdGVwcyB0byBSZXByb2R1Y2U8YnI+CiZndDvCoCDCoCDCoC8vIGluc3RhbGwg
dHBtMi10c3M8YnI+CiZndDvCoCDCoCDCoC4vY29uZmlndXJlICZxdW90O0NGTEFHUz0tLXN0YXRp
YyZxdW90OyAtLWVuYWJsZS1zaGFyZWQ9bm88YnI+CiZndDvCoCDCoCDCoG1ha2U8YnI+CiZndDvC
oCDCoCDCoHN1ZG8gbWFrZSBpbnN0YWxsPGJyPgomZ3Q7wqAgwqAgwqAvLyBJbnN0YWxsIHRwbTIt
dG9vbHM8YnI+CiZndDvCoCDCoCDCoC4vY29uZmlndXJlICZxdW90O0NGTEFHUz0tLXN0YXRpYyZx
dW90OyAtLWVuYWJsZS1zaGFyZWQ9bm8gLS1kaXNhYmxlLWhhcmRlbmluZzxicj4KPGJyPgpEb24m
IzM5O3QgeW91IG5lZWQgdG8gc2V0IExERkxBR1MgaW5zdGVhZCBvZiBDRkxBR1M6PGJyPgo8YnI+
Ci4vY29uZmlndXJlICZxdW90O0xERkxBR1M9LS1zdGF0aWMmcXVvdDsgLS1kaXNhYmxlLXNoYXJl
ZDxicj4KPGJyPgpUaGFua3MsPGJyPgotLSA8YnI+ClRhZGV1c3o8YnI+CjwvYmxvY2txdW90ZT48
L2Rpdj48L2Rpdj48L2Rpdj4K

--===============6819661563270903019==--

