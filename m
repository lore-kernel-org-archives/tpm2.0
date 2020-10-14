Content-Type: multipart/mixed; boundary="===============4053492704265966155=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] Re: QUEMU and TPM2 device emulation
Date: Wed, 14 Oct 2020 16:39:53 +0100
Message-ID: <CAKrSGQSY=ney+-UeKYaJ2e4T-0W7P83sMh3D=OZz54HX3NhbMw@mail.gmail.com>
In-Reply-To: SN6PR11MB34372D6EA769E056632095CFB8050@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4053492704265966155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is how I do it in a container;

https://gist.github.com/lukehinds/f7338fe3bd13687e2600fa70a2055e1c

If you want to do the same in a VM you could just drop the container part
(where you're just doing a volume mount from the host into the container).

Or if you really need to use QEMU, libvirt will let you hook in the vtpm

https://libvirt.org/formatdomain.html#tpm-device

Main thing is you point TCTI to the kernel resource manager

export TPM2TOOLS_TCTI=3Ddevice:/dev/tpmrm0


On Wed, Oct 14, 2020 at 4:28 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> Has anyone ever setup a QUEMU instance with a virtualized TPM? I need to
> try and replicate an issue with the in-kernel Resource manager. My goal is
> to use the integrated QUEMU support
> To bring up an emulated TPM device and it's associated RM node @
> /dev/tpmrm0.
>
> I am looking at:
>
> https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/=
docs/specs/tpm.txt
>
> Which shows this command:
>
> qemu-system-x86_64 -display sdl -enable-kvm \
>   -m 1024 -boot d -bios bios-256k.bin -boot menu=3Don \
>   -chardev socket,id=3Dchrtpm,path=3D/tmp/mytpm1/swtpm-sock \
>   -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
>   -device tpm-tis,tpmdev=3Dtpm0 test.img
>
> <snip>
> #> dmesg | grep -i tpm
> [    0.711310] tpm_tis 00:06: 1.2 TPM (device=3Did 0x1, rev-id 1)
>
> I have a few questions around this that I cannot seem to dig up any
> documentation on:
> 1. How to specify TPM2.0 device? The project
> https://github.com/stefanberger/swtpm/wiki seems to indicate it would be
> supported.
>
> 2. Does anyone know the minimum QUEMU version for this support? I looked
> in the CHANGELOG here, https://wiki.qemu.org/ChangeLog from version 2.8
> to 5.2 and never saw anything
> Call out TPM 2.0 specifically.
>
> 3. Does anyone have or know of better documentation to set this up? If
> their isn't better documentation, should we (read I) create it? This seems
> like a pretty handy feature.
>
> Thanks,
> Bill
>
>

--===============4053492704265966155==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5UaGlzIGlzIGhvdyBJIGRvIGl0IGluIGEgY29udGFpbmVyOzwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20v
bHVrZWhpbmRzL2Y3MzM4ZmUzYmQxMzY4N2UyNjAwZmE3MGEyMDU1ZTFjIj5odHRwczovL2dpc3Qu
Z2l0aHViLmNvbS9sdWtlaGluZHMvZjczMzhmZTNiZDEzNjg3ZTI2MDBmYTcwYTIwNTVlMWM8L2E+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JZiB5b3Ugd2FudCB0byBkbyB0aGUgc2FtZSBpbiBh
IFZNIHlvdSBjb3VsZCBqdXN0IGRyb3AgdGhlIGNvbnRhaW5lciBwYXJ0ICh3aGVyZSB5b3UmIzM5
O3JlIGp1c3QgZG9pbmcgYSB2b2x1bWUgbW91bnQgZnJvbSB0aGUgaG9zdCBpbnRvIHRoZSBjb250
YWluZXIpLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+T3IgaWYgeW91IHJlYWxseSBuZWVkIHRv
IHVzZSBRRU1VLCBsaWJ2aXJ0IHdpbGwgbGV0IHlvdSBob29rIGluIHRoZSB2dHBtPC9kaXY+PGRp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vbGlidmlydC5vcmcvZm9ybWF0
ZG9tYWluLmh0bWwjdHBtLWRldmljZSI+aHR0cHM6Ly9saWJ2aXJ0Lm9yZy9mb3JtYXRkb21haW4u
aHRtbCN0cG0tZGV2aWNlPC9hPiA8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk1haW4g
dGhpbmcgaXMgeW91IHBvaW50IFRDVEkgdG8gdGhlIGtlcm5lbCByZXNvdXJjZSBtYW5hZ2VyPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5leHBvcnQgVFBNMlRPT0xTX1RDVEk9ZGV2aWNlOi9kZXYv
dHBtcm0wPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1
b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCBPY3QgMTQsIDIw
MjAgYXQgNDoyOCBQTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxs
aWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4m
Z3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+SGFzIGFueW9uZSBldmVyIHNldHVwIGEgUVVFTVUg
aW5zdGFuY2Ugd2l0aCBhIHZpcnR1YWxpemVkIFRQTT8gSSBuZWVkIHRvIHRyeSBhbmQgcmVwbGlj
YXRlIGFuIGlzc3VlIHdpdGggdGhlIGluLWtlcm5lbCBSZXNvdXJjZSBtYW5hZ2VyLiBNeSBnb2Fs
IGlzIHRvIHVzZSB0aGUgaW50ZWdyYXRlZCBRVUVNVSBzdXBwb3J0PGJyPgpUbyBicmluZyB1cCBh
biBlbXVsYXRlZCBUUE0gZGV2aWNlIGFuZCBpdCYjMzk7cyBhc3NvY2lhdGVkIFJNIG5vZGUgQCAv
ZGV2L3RwbXJtMC48YnI+Cjxicj4KSSBhbSBsb29raW5nIGF0Ojxicj4KPGEgaHJlZj0iaHR0cHM6
Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20vcGxhdGZvcm0vZXh0ZXJuYWwvcWVtdS8rL2VtdS1t
YXN0ZXItZGV2L2RvY3Mvc3BlY3MvdHBtLnR4dCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20vcGxhdGZvcm0vZXh0ZXJuYWwv
cWVtdS8rL2VtdS1tYXN0ZXItZGV2L2RvY3Mvc3BlY3MvdHBtLnR4dDwvYT48YnI+Cjxicj4KV2hp
Y2ggc2hvd3MgdGhpcyBjb21tYW5kOjxicj4KPGJyPgpxZW11LXN5c3RlbS14ODZfNjQgLWRpc3Bs
YXkgc2RsIC1lbmFibGUta3ZtIFw8YnI+CsKgIC1tIDEwMjQgLWJvb3QgZCAtYmlvcyBiaW9zLTI1
NmsuYmluIC1ib290IG1lbnU9b24gXDxicj4KwqAgLWNoYXJkZXYgc29ja2V0LGlkPWNocnRwbSxw
YXRoPS90bXAvbXl0cG0xL3N3dHBtLXNvY2sgXDxicj4KwqAgLXRwbWRldiBlbXVsYXRvcixpZD10
cG0wLGNoYXJkZXY9Y2hydHBtIFw8YnI+CsKgIC1kZXZpY2UgdHBtLXRpcyx0cG1kZXY9dHBtMCB0
ZXN0LmltZzxicj4KPGJyPgombHQ7c25pcCZndDs8YnI+CiMmZ3Q7IGRtZXNnIHwgZ3JlcCAtaSB0
cG08YnI+ClvCoCDCoCAwLjcxMTMxMF0gdHBtX3RpcyAwMDowNjogMS4yIFRQTSAoZGV2aWNlPWlk
IDB4MSwgcmV2LWlkIDEpPGJyPgo8YnI+CkkgaGF2ZSBhIGZldyBxdWVzdGlvbnMgYXJvdW5kIHRo
aXMgdGhhdCBJIGNhbm5vdCBzZWVtIHRvIGRpZyB1cCBhbnkgZG9jdW1lbnRhdGlvbiBvbjo8YnI+
CjEuIEhvdyB0byBzcGVjaWZ5IFRQTTIuMCBkZXZpY2U/IFRoZSBwcm9qZWN0IDxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS9zdGVmYW5iZXJnZXIvc3d0cG0vd2lraSIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3N0ZWZhbmJlcmdlci9zd3RwbS93
aWtpPC9hPiBzZWVtcyB0byBpbmRpY2F0ZSBpdCB3b3VsZCBiZSBzdXBwb3J0ZWQuPGJyPgo8YnI+
CjIuIERvZXMgYW55b25lIGtub3cgdGhlIG1pbmltdW0gUVVFTVUgdmVyc2lvbiBmb3IgdGhpcyBz
dXBwb3J0PyBJIGxvb2tlZCBpbiB0aGUgQ0hBTkdFTE9HIGhlcmUsIDxhIGhyZWY9Imh0dHBzOi8v
d2lraS5xZW11Lm9yZy9DaGFuZ2VMb2ciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHBzOi8vd2lraS5xZW11Lm9yZy9DaGFuZ2VMb2c8L2E+IGZyb20gdmVyc2lvbiAyLjggdG8g
NS4yIGFuZCBuZXZlciBzYXcgYW55dGhpbmc8YnI+CkNhbGwgb3V0IFRQTSAyLjAgc3BlY2lmaWNh
bGx5Ljxicj4KPGJyPgozLiBEb2VzIGFueW9uZSBoYXZlIG9yIGtub3cgb2YgYmV0dGVyIGRvY3Vt
ZW50YXRpb24gdG8gc2V0IHRoaXMgdXA/IElmIHRoZWlyIGlzbiYjMzk7dCBiZXR0ZXIgZG9jdW1l
bnRhdGlvbiwgc2hvdWxkIHdlIChyZWFkIEkpIGNyZWF0ZSBpdD8gVGhpcyBzZWVtcyBsaWtlIGEg
cHJldHR5IGhhbmR5IGZlYXR1cmUuPGJyPgo8YnI+ClRoYW5rcyw8YnI+CkJpbGw8YnI+Cjxicj4K
PC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============4053492704265966155==--

