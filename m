Content-Type: multipart/mixed; boundary="===============6165858459963301719=="
MIME-Version: 1.0
From: Oleksii Moisieiev <Oleksii_Moisieiev at epam.com>
Subject: [tpm2] Sharing TPM 2.0 between containers with access policy
Date: Fri, 05 Jun 2020 07:52:37 +0000
Message-ID: <
 <AM0PR03MB4162166A604E7966236ABBCCE3860@AM0PR03MB4162.eurprd03.prod.outlook.com>>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6165858459963301719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

I have an embedded device, with Docker containers based architecture.
This device is operating by software, installed in separate containers.


I would like to share TPM2.0 access between this containers with the follow=
ing restrictions:

1) Forbid Clear TPM command for the containers;
2) Each container should have an access only to the set of keys it owns.
3) Each container can create keys, but not overwrite existing keys that doe=
s not related to this container.

According to the "TCG TSS 2.0 TAB and Resource Manager Specification" - TPM=
 Resource manager doesn't implement access restrictions right now.

So the question is: Could you suggest some existing solution on top of the =
TPM Resource Manager, which provides access restrictions and can isolate ea=
ch container as a TPM user.

Best regards,

Oleksii

--===============6165858459963301719==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+IFAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fSA8L3N0
eWxlPgo8L2hlYWQ+Cjxib2R5IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENh
bGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPgo8c3Bhbj5IZWxsbyBhbGwsPGJyPgo8L3NwYW4+CjxkaXY+PGJy
Pgo8L2Rpdj4KPGRpdj5JIGhhdmUgYW4gZW1iZWRkZWQgZGV2aWNlLCB3aXRoIERvY2tlciBjb250
YWluZXJzIGJhc2VkIGFyY2hpdGVjdHVyZS48YnI+CjwvZGl2Pgo8ZGl2PlRoaXMgZGV2aWNlIGlz
IG9wZXJhdGluZyBieSBzb2Z0d2FyZSwgaW5zdGFsbGVkIGluIHNlcGFyYXRlIGNvbnRhaW5lcnMu
PGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSB3b3Vs
ZCBsaWtlIHRvIHNoYXJlIFRQTTIuMCBhY2Nlc3MgYmV0d2VlbiB0aGlzIGNvbnRhaW5lcnMgd2l0
aCB0aGUgZm9sbG93aW5nIHJlc3RyaWN0aW9uczoKPGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2
Pgo8ZGl2PjEpIEZvcmJpZCBDbGVhciBUUE0gY29tbWFuZCBmb3IgdGhlIGNvbnRhaW5lcnM7PGJy
Pgo8L2Rpdj4KPGRpdj4yKSBFYWNoIGNvbnRhaW5lciBzaG91bGQgaGF2ZSBhbiBhY2Nlc3Mgb25s
eSB0byB0aGUgc2V0IG9mIGtleXMgaXQgb3ducy48YnI+CjwvZGl2Pgo8ZGl2PjMpIEVhY2ggY29u
dGFpbmVyIGNhbiBjcmVhdGUga2V5cywgYnV0IG5vdCBvdmVyd3JpdGUgZXhpc3Rpbmcga2V5cyB0
aGF0IGRvZXMgbm90IHJlbGF0ZWQgdG8gdGhpcyBjb250YWluZXIuPGJyPgo8L2Rpdj4KPGRpdj48
YnI+CjwvZGl2Pgo8ZGl2PkFjY29yZGluZyB0byB0aGUgJnF1b3Q7VENHIFRTUyAyLjAgVEFCIGFu
ZCBSZXNvdXJjZSBNYW5hZ2VyIFNwZWNpZmljYXRpb24mcXVvdDsgLSBUUE0gUmVzb3VyY2UgbWFu
YWdlciBkb2Vzbid0IGltcGxlbWVudCBhY2Nlc3MgcmVzdHJpY3Rpb25zIHJpZ2h0IG5vdy4KPGJy
Pgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlNvIHRoZSBxdWVzdGlvbiBpczogQ291bGQg
eW91IHN1Z2dlc3Qgc29tZSBleGlzdGluZyBzb2x1dGlvbiBvbiB0b3Agb2YgdGhlIFRQTSBSZXNv
dXJjZSBNYW5hZ2VyLCB3aGljaCBwcm92aWRlcyBhY2Nlc3MgcmVzdHJpY3Rpb25zIGFuZCBjYW4g
aXNvbGF0ZSBlYWNoIGNvbnRhaW5lciBhcyBhIFRQTSB1c2VyLjxicj4KPC9kaXY+CjxkaXY+PGJy
Pgo8L2Rpdj4KPGRpdj5CZXN0IHJlZ2FyZHMsPGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8
c3Bhbj5PbGVrc2lpPC9zcGFuPjxicj4KPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============6165858459963301719==--

