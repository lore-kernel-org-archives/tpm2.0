Content-Type: multipart/mixed; boundary="===============1016932440367115520=="
MIME-Version: 1.0
From: Tomasz Przybysz <tomaszp at mikronika.pl>
Subject: [tpm2] tpm2-tss and /dev/urandom seed
Date: Wed, 24 Oct 2018 08:32:34 +0000
Message-ID: <7843db61-0eec-488e-867a-3a42dca7e326@mikronika.pl>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1016932440367115520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I have found that there is a problem with tpm2-tss and /dev/urandom.
On our company embedded cpu board there is Infineon TPM-2.0 device and we w=
ant to have access to the TPM device immediately after board reboot.
As I found tpm2-tss library is based on libgcrypt library.

TSS2_RC iesys_cryptogcry_random2b(TPM2B_NONCE * nonce, size_t num_bytes)
{
    if (num_bytes =3D=3D 0) {
        nonce->size =3D sizeof(TPMU_HA);
    } else {
        nonce->size =3D num_bytes;
    }
    /*
     * possible values for random level:
     *  GCRY_WEAK_RANDOM GCRY_STRONG_RANDOM  GCRY_VERY_STRONG_RANDOM
     */
    gcry_randomize(&nonce->buffer[0], nonce->size, GCRY_STRONG_RANDOM);
    return TSS2_RC_SUCCESS;
}

The problem is that with the new kernel Linux buildroot 4.14.74-xilinx
/dev/urandom seed is ready after 120 secs from system reboot.
It's not acceptable for us to wait such long to get TPM device ready.

I test it on Zynq cpu:
processor       : 0
model name      : ARMv7 Processor rev 0 (v7l)
BogoMIPS        : 666.66
Features        : half thumb fastmult vfp edsp neon vfpv3 tls vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x3
CPU part        : 0xc09
CPU revision    : 0

processor       : 1
model name      : ARMv7 Processor rev 0 (v7l)
BogoMIPS        : 666.66
Features        : half thumb fastmult vfp edsp neon vfpv3 tls vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x3
CPU part        : 0xc09
CPU revision    : 0

I think that there is no problem with cpu  performance.

I looked into kernel sources:
drivers/char/random.c
and it changed on april 2018

Previous it was:
#define crng_ready() (likely(crng_init > 0))

Now It's:
#define crng_ready() (likely(crng_init > 1))

 * crng_init =3D  0 --> Uninitialized
 *        1 --> Initialized
 *        2 --> Initialized from input_pool


Is it possible that random level of gcry_randomize in tss library could be =
configurable, not fixed ?
Please add such functionality, maybe it could be determined while compilati=
on.

Thanks,
Tomasz Przybysz


--===============1016932440367115520==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KSGksPGJyPg0KPGJyPg0KSSBoYXZlIGZvdW5kIHRoYXQgdGhl
cmUgaXMgYSBwcm9ibGVtIHdpdGggdHBtMi10c3MgYW5kIC9kZXYvdXJhbmRvbS48YnI+DQpPbiBv
dXIgY29tcGFueSBlbWJlZGRlZCBjcHUgYm9hcmQgdGhlcmUgaXMgSW5maW5lb24gVFBNLTIuMCBk
ZXZpY2UgYW5kIHdlIHdhbnQgdG8gaGF2ZSBhY2Nlc3MgdG8gdGhlIFRQTSBkZXZpY2UgaW1tZWRp
YXRlbHkgYWZ0ZXIgYm9hcmQgcmVib290Ljxicj4NCkFzIEkgZm91bmQgdHBtMi10c3MgbGlicmFy
eSBpcyBiYXNlZCBvbiBsaWJnY3J5cHQgbGlicmFyeS48YnI+DQo8YnI+DQpUU1MyX1JDIGllc3lz
X2NyeXB0b2djcnlfcmFuZG9tMmIoVFBNMkJfTk9OQ0UgKiBub25jZSwgc2l6ZV90IG51bV9ieXRl
cyk8YnI+DQp7PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChudW1fYnl0ZXMgPT0gMCkgezxi
cj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBub25jZS0mZ3Q7
c2l6ZSA9IHNpemVvZihUUE1VX0hBKTs8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsgfSBlbHNlIHs8
YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgbm9uY2UtJmd0
O3NpemUgPSBudW1fYnl0ZXM7PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+DQombmJzcDsm
bmJzcDsmbmJzcDsgLyo8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKiBwb3NzaWJsZSB2
YWx1ZXMgZm9yIHJhbmRvbSBsZXZlbDo8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKiZu
YnNwOyBHQ1JZX1dFQUtfUkFORE9NIEdDUllfU1RST05HX1JBTkRPTSZuYnNwOyBHQ1JZX1ZFUllf
U1RST05HX1JBTkRPTTxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAqLzxicj4NCiZuYnNw
OyZuYnNwOyZuYnNwOyBnY3J5X3JhbmRvbWl6ZSgmYW1wO25vbmNlLSZndDtidWZmZXJbMF0sIG5v
bmNlLSZndDtzaXplLCBHQ1JZX1NUUk9OR19SQU5ET00pOzxicj4NCiZuYnNwOyZuYnNwOyZuYnNw
OyByZXR1cm4gVFNTMl9SQ19TVUNDRVNTOzxicj4NCn0gPGJyPg0KPGJyPg0KVGhlIHByb2JsZW0g
aXMgdGhhdCB3aXRoIHRoZSBuZXcga2VybmVsIExpbnV4IGJ1aWxkcm9vdCA0LjE0Ljc0LXhpbGlu
eDxicj4NCi9kZXYvdXJhbmRvbSBzZWVkIGlzIHJlYWR5IGFmdGVyIDEyMCBzZWNzIGZyb20gc3lz
dGVtIHJlYm9vdC48YnI+DQpJdCdzIG5vdCBhY2NlcHRhYmxlIGZvciB1cyB0byB3YWl0IHN1Y2gg
bG9uZyB0byBnZXQgVFBNIGRldmljZSByZWFkeS48YnI+DQo8YnI+DQpJIHRlc3QgaXQgb24gWnlu
cSBjcHU6PGJyPg0KcHJvY2Vzc29yJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IDogMDxicj4NCm1vZGVsIG5hbWUmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgOiBBUk12
NyBQcm9jZXNzb3IgcmV2IDAgKHY3bCk8YnI+DQpCb2dvTUlQUyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA6IDY2Ni42Njxicj4NCkZlYXR1cmVzJm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDogaGFsZiB0aHVtYiBmYXN0bXVsdCB2ZnAg
ZWRzcCBuZW9uIHZmcHYzIHRscyB2ZnBkMzI8YnI+DQpDUFUgaW1wbGVtZW50ZXIgOiAweDQxPGJy
Pg0KQ1BVIGFyY2hpdGVjdHVyZTogNzxicj4NCkNQVSB2YXJpYW50Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IDogMHgzPGJyPg0KQ1BVIHBhcnQmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgOiAweGMwOTxicj4NCkNQVSByZXZpc2lvbiZuYnNwOyZuYnNwOyZuYnNwOyA6
IDA8YnI+DQo8YnI+DQpwcm9jZXNzb3ImbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgOiAxPGJyPg0KbW9kZWwgbmFtZSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA6IEFS
TXY3IFByb2Nlc3NvciByZXYgMCAodjdsKTxicj4NCkJvZ29NSVBTJm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDogNjY2LjY2PGJyPg0KRmVhdHVyZXMmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgOiBoYWxmIHRodW1iIGZhc3RtdWx0IHZm
cCBlZHNwIG5lb24gdmZwdjMgdGxzIHZmcGQzMjxicj4NCkNQVSBpbXBsZW1lbnRlciA6IDB4NDE8
YnI+DQpDUFUgYXJjaGl0ZWN0dXJlOiA3PGJyPg0KQ1BVIHZhcmlhbnQmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgOiAweDM8YnI+DQpDUFUgcGFydCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyA6IDB4YzA5PGJyPg0KQ1BVIHJldmlzaW9uJm5ic3A7Jm5ic3A7Jm5ic3A7
IDogMDxicj4NCjxicj4NCkkgdGhpbmsgdGhhdCB0aGVyZSBpcyBubyBwcm9ibGVtIHdpdGggY3B1
Jm5ic3A7IHBlcmZvcm1hbmNlLjxicj4NCjxicj4NCkkgbG9va2VkIGludG8ga2VybmVsIHNvdXJj
ZXM6PGJyPg0KZHJpdmVycy9jaGFyL3JhbmRvbS5jPGJyPg0KYW5kIGl0IGNoYW5nZWQgb24gYXBy
aWwgMjAxODxicj4NCjxicj4NClByZXZpb3VzIGl0IHdhczo8YnI+DQojZGVmaW5lIGNybmdfcmVh
ZHkoKSAobGlrZWx5KGNybmdfaW5pdCAmZ3Q7IDApKTxicj4NCjxicj4NCk5vdyBJdCdzOjxicj4N
CiNkZWZpbmUgY3JuZ19yZWFkeSgpIChsaWtlbHkoY3JuZ19pbml0ICZndDsgMSkpPGJyPg0KPGJy
Pg0KJm5ic3A7KiBjcm5nX2luaXQgPSZuYnNwOyAwIC0tJmd0OyBVbmluaXRpYWxpemVkPGJyPg0K
Jm5ic3A7KiZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgMSAtLSZndDsgSW5p
dGlhbGl6ZWQ8YnI+DQombmJzcDsqJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNw
OyAyIC0tJmd0OyBJbml0aWFsaXplZCBmcm9tIGlucHV0X3Bvb2w8YnI+DQo8YnI+DQo8YnI+DQpJ
cyBpdCBwb3NzaWJsZSB0aGF0IHJhbmRvbSBsZXZlbCBvZiBnY3J5X3JhbmRvbWl6ZSBpbiB0c3Mg
bGlicmFyeSBjb3VsZCBiZSBjb25maWd1cmFibGUsIG5vdCBmaXhlZCA/PGJyPg0KUGxlYXNlIGFk
ZCBzdWNoIGZ1bmN0aW9uYWxpdHksIG1heWJlIGl0IGNvdWxkIGJlIGRldGVybWluZWQgd2hpbGUg
Y29tcGlsYXRpb24uPGJyPg0KPGJyPg0KVGhhbmtzLDxzbWFsbD48Yj48YnI+DQpUb21hc3ogUHJ6
eWJ5c3o8L2I+IDwvc21hbGw+PGJyPg0KPGRpdiBjbGFzcz0ibW96LXNpZ25hdHVyZSI+PGJyPg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--===============1016932440367115520==--

