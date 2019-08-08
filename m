Content-Type: multipart/mixed; boundary="===============2129991660418713453=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] how to upgrade the TPM access control policy when a
 particular PCR is changed.
Date: Thu, 08 Aug 2019 14:26:37 +0000
Message-ID: <56D28929-1ED1-4DBA-814A-0100F2194F61@intel.com>
In-Reply-To: A3DEEEBB19900C48B49572CB9C2891C98791046B@SHSMSX108.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2129991660418713453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bing, refer the example section in man page

https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policyauth=
orize.1.md


On Aug 7, 2019, at 10:49 PM, Zhu, Bing <bing.zhu(a)intel.com<mailto:bing.zh=
u(a)intel.com>> wrote:

Hi,

I have a use case like this:

We create a TPM2.0 NV index, provision a secret into that NV index in TPM, =
and gate its access control with PCR[7] policy, which means that only when =
PCR[7] value matches the expected value, the read access to this NV index i=
s allowed.

In a PC compliant machine, PCR[7] is used by BIOS to extend Secure Boot pol=
icies/configurations, and verification public key db settings (PK, KEK, DB/=
DBx). The reason that we do it like this because we would like to set acces=
s control to the secret value stored in that NV index. When someone (attack=
er) is going to disable secure boot, then PCR[7] value changes and doesn't =
match the value that the original policy was created on that NV index, then=
 accessing to that secret value will be denied. This is expected behavior t=
hat I want.

Now the problem is that when secure boot configurations (like DB/DBx) are c=
hanged due to OS software upgrade, the PCR[7] will be changed too, then acc=
ess to that secret in NV index will be denied too.

So we'd like to figure out how to upgrade the associated PCR[7] policy on t=
hat NV Index, in order to make sure the access to this NV index is still be=
 available after upgrade (because this is a legitimate upgrade usage).

we don't know how exactly to do that although I'm aware of that the API TPM=
2_PolicyAuthorize() would probably do this. However, I didn't see anyone wh=
o ever did this before somewhere.

So is this possible for someone to implement this as a sample in TPM usage?=
 Just give me a clue to do that, then we can contribute it.

Any comment is appreciated! Thanks.


Bing


--===============2129991660418713453==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjwvaGVhZD4KPGJvZHkgZGlyPSJhdXRvIj4KSGkg
QmluZywgcmVmZXIgdGhlIGV4YW1wbGUgc2VjdGlvbiBpbiBtYW4gcGFnZQo8ZGl2Pjxicj4KPC9k
aXY+CjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10
b29scy9ibG9iL21hc3Rlci9tYW4vdHBtMl9wb2xpY3lhdXRob3JpemUuMS5tZCI+aHR0cHM6Ly9n
aXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9ibG9iL21hc3Rlci9tYW4vdHBtMl9w
b2xpY3lhdXRob3JpemUuMS5tZDwvYT48L2Rpdj4KPGRpdj4KPGRpdiBkaXI9Imx0ciI+CjxkaXY+
PGJyPgo8L2Rpdj4KPC9kaXY+CjxkaXYgZGlyPSJsdHIiPjxicj4KT24gQXVnIDcsIDIwMTksIGF0
IDEwOjQ5IFBNLCBaaHUsIEJpbmcgJmx0OzxhIGhyZWY9Im1haWx0bzpiaW5nLnpodUBpbnRlbC5j
b20iPmJpbmcuemh1QGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KPGJyPgo8L2Rpdj4KPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSI+CjxkaXYgZGlyPSJsdHIiPjxzcGFuPkhpLDwvc3Bhbj48YnI+
CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPkkgaGF2ZSBhIHVzZSBjYXNlIGxpa2UgdGhpczogPC9z
cGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+V2UgY3JlYXRlIGEgVFBNMi4wIE5WIGlu
ZGV4LCBwcm92aXNpb24gYSBzZWNyZXQgaW50byB0aGF0IE5WIGluZGV4IGluIFRQTSwgYW5kIGdh
dGUgaXRzIGFjY2VzcyBjb250cm9sIHdpdGggUENSWzddIHBvbGljeSwgd2hpY2ggbWVhbnMgdGhh
dCBvbmx5IHdoZW4gUENSWzddIHZhbHVlIG1hdGNoZXMgdGhlIGV4cGVjdGVkIHZhbHVlLCB0aGUg
cmVhZCBhY2Nlc3MgdG8gdGhpcyBOViBpbmRleCBpcyBhbGxvd2VkLgo8L3NwYW4+PGJyPgo8c3Bh
bj48L3NwYW4+PGJyPgo8c3Bhbj5JbiBhIFBDIGNvbXBsaWFudCBtYWNoaW5lLCBQQ1JbN10gaXMg
dXNlZCBieSBCSU9TIHRvIGV4dGVuZCBTZWN1cmUgQm9vdCBwb2xpY2llcy9jb25maWd1cmF0aW9u
cywgYW5kIHZlcmlmaWNhdGlvbiBwdWJsaWMga2V5IGRiIHNldHRpbmdzIChQSywgS0VLLCBEQi9E
QngpLiBUaGUgcmVhc29uIHRoYXQgd2UgZG8gaXQgbGlrZSB0aGlzIGJlY2F1c2Ugd2Ugd291bGQg
bGlrZSB0byBzZXQgYWNjZXNzIGNvbnRyb2wgdG8gdGhlIHNlY3JldCB2YWx1ZQogc3RvcmVkIGlu
IHRoYXQgTlYgaW5kZXguIFdoZW4gc29tZW9uZSAoYXR0YWNrZXIpIGlzIGdvaW5nIHRvIGRpc2Fi
bGUgc2VjdXJlIGJvb3QsIHRoZW4gUENSWzddIHZhbHVlIGNoYW5nZXMgYW5kIGRvZXNuJ3QgbWF0
Y2ggdGhlIHZhbHVlIHRoYXQgdGhlIG9yaWdpbmFsIHBvbGljeSB3YXMgY3JlYXRlZCBvbiB0aGF0
IE5WIGluZGV4LCB0aGVuIGFjY2Vzc2luZyB0byB0aGF0IHNlY3JldCB2YWx1ZSB3aWxsIGJlIGRl
bmllZC4gVGhpcyBpcyBleHBlY3RlZAogYmVoYXZpb3IgdGhhdCBJIHdhbnQuPC9zcGFuPjxicj4K
PHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+Tm93IHRoZSBwcm9ibGVtIGlzIHRoYXQgd2hlbiBzZWN1
cmUgYm9vdCBjb25maWd1cmF0aW9ucyAobGlrZSBEQi9EQngpIGFyZSBjaGFuZ2VkIGR1ZSB0byBP
UyBzb2Z0d2FyZSB1cGdyYWRlLCB0aGUgUENSWzddIHdpbGwgYmUgY2hhbmdlZCB0b28sIHRoZW4g
YWNjZXNzIHRvIHRoYXQgc2VjcmV0IGluIE5WIGluZGV4IHdpbGwgYmUgZGVuaWVkIHRvby4KPC9z
cGFuPjxicj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+U28gd2UnZCBsaWtlIHRvIGZpZ3VyZSBv
dXQgaG93IHRvIHVwZ3JhZGUgdGhlIGFzc29jaWF0ZWQgUENSWzddIHBvbGljeSBvbiB0aGF0IE5W
IEluZGV4LCBpbiBvcmRlciB0byBtYWtlIHN1cmUgdGhlIGFjY2VzcyB0byB0aGlzIE5WIGluZGV4
IGlzIHN0aWxsIGJlIGF2YWlsYWJsZSBhZnRlciB1cGdyYWRlIChiZWNhdXNlIHRoaXMgaXMgYSBs
ZWdpdGltYXRlIHVwZ3JhZGUgdXNhZ2UpLjwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+Cjxz
cGFuPndlIGRvbid0IGtub3cgaG93IGV4YWN0bHkgdG8gZG8gdGhhdCBhbHRob3VnaCBJJ20gYXdh
cmUgb2YgdGhhdCB0aGUgQVBJIFRQTTJfUG9saWN5QXV0aG9yaXplKCkgd291bGQgcHJvYmFibHkg
ZG8gdGhpcy4gSG93ZXZlciwgSSBkaWRuJ3Qgc2VlIGFueW9uZSB3aG8gZXZlciBkaWQgdGhpcyBi
ZWZvcmUgc29tZXdoZXJlLgo8L3NwYW4+PGJyPgo8c3Bhbj48L3NwYW4+PGJyPgo8c3Bhbj5TbyBp
cyB0aGlzIHBvc3NpYmxlIGZvciBzb21lb25lIHRvIGltcGxlbWVudCB0aGlzIGFzIGEgc2FtcGxl
IGluIFRQTSB1c2FnZT8gSnVzdCBnaXZlIG1lIGEgY2x1ZSB0byBkbyB0aGF0LCB0aGVuIHdlIGNh
biBjb250cmlidXRlIGl0Ljwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48YnI+CjxzcGFuPkFueSBj
b21tZW50IGlzIGFwcHJlY2lhdGVkISBUaGFua3MuPC9zcGFuPjxicj4KPHNwYW4+PC9zcGFuPjxi
cj4KPHNwYW4+PC9zcGFuPjxicj4KPHNwYW4+QmluZzwvc3Bhbj48YnI+CjxzcGFuPjwvc3Bhbj48
YnI+CjwvZGl2Pgo8L2Jsb2NrcXVvdGU+CjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K

--===============2129991660418713453==--

