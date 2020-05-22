Content-Type: multipart/mixed; boundary="===============1717580148978623139=="
MIME-Version: 1.0
From: Dimitar Tomov <dimi at designfirst.ee>
Subject: [tpm2] How we authorize the EK hierarchy to create AIK?
Date: Fri, 22 May 2020 12:39:37 +0000
Message-ID: <
 <VI1PR08MB265382226043323834F5B31FB5B40@VI1PR08MB2653.eurprd08.prod.outlook.com>>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1717580148978623139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I am having a hard time finding where happens the creation of policy(author=
ization) for the tpm2-tools to create AIK under the EK hierarchy?

I know the sequence goes like this:
Createk ...
Creatak ... using the object context created by EK

But the EK context object does not carry the Policy Authorization for creat=
ing AIK, so I am guessing the TSS2 stack is creating it based on the input =
form the tools.

I also tried looking up in the TCG spec for more information what is the au=
thorization procedure to enable use of the EK Hierarchy, but the search on =
the TCG website returned only blog posts and two mentions of AIK in https:/=
/trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-Provisioning-Gui=
dance-Published-v1r1.pdf

In this document, endorsementPolicy and endorsementAuth are mentioned, but =
I am having hard time finding how the TSS / Tools interact to set those and=
 later use them for the creation of AIK.

Could someone point me to the right place of code?

Best,
Dimi

--===============1717580148978623139==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjwvaGVhZD4KPGJvZHk+CjxkaXYgZGlyPSJsdHIi
Pgo8ZGl2PjwvZGl2Pgo8ZGl2IGRhdGEtb2dzYz0iIiBzdHlsZT0iIj4KPGRpdiBkaXI9Imx0ciI+
SGkgZXZlcnlvbmUsPC9kaXY+CjxkaXYgZGlyPSJsdHIiPjxicj4KPC9kaXY+CjxkaXYgZGlyPSJs
dHIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IGluaGVyaXQ7Ij5JIGFtIGhhdmluZyBhIGhhcmQg
dGltZSBmaW5kaW5nIHdoZXJlIGhhcHBlbnMgdGhlIGNyZWF0aW9uIG9mIHBvbGljeShhdXRob3Jp
emF0aW9uKSBmb3IgdGhlIHRwbTItdG9vbHMgdG8gY3JlYXRlIEFJSyB1bmRlciB0aGUgRUsgaGll
cmFyY2h5Pzwvc3Bhbj48L2Rpdj4KPGRpdiBkaXI9Imx0ciI+PGJyPgo8L2Rpdj4KPGRpdiBkaXI9
Imx0ciI+SSBrbm93IHRoZSBzZXF1ZW5jZSBnb2VzIGxpa2UgdGhpczo8L2Rpdj4KPGRpdiBkaXI9
Imx0ciI+Q3JlYXRlayAuLi4mbmJzcDs8L2Rpdj4KPGRpdiBkaXI9Imx0ciI+Q3JlYXRhayAuLi4g
dXNpbmcgdGhlIG9iamVjdCBjb250ZXh0IGNyZWF0ZWQgYnkgRUs8L2Rpdj4KPGRpdiBkaXI9Imx0
ciI+PGJyPgo8L2Rpdj4KPGRpdiBkaXI9Imx0ciI+QnV0IHRoZSBFSyBjb250ZXh0IG9iamVjdCBk
b2VzIG5vdCBjYXJyeSB0aGUgUG9saWN5IEF1dGhvcml6YXRpb24gZm9yIGNyZWF0aW5nIEFJSywg
c28gSSBhbSBndWVzc2luZyB0aGUgVFNTMiBzdGFjayBpcyBjcmVhdGluZyBpdCBiYXNlZCBvbiB0
aGUgaW5wdXQgZm9ybSB0aGUgdG9vbHMuPC9kaXY+CjxkaXYgZGlyPSJsdHIiPjxicj4KPC9kaXY+
CjxkaXYgZGlyPSJsdHIiPkkgYWxzbyB0cmllZCBsb29raW5nIHVwIGluIHRoZSBUQ0cgc3BlYyBm
b3IgbW9yZSBpbmZvcm1hdGlvbiB3aGF0IGlzIHRoZSBhdXRob3JpemF0aW9uIHByb2NlZHVyZSB0
byBlbmFibGUgdXNlIG9mIHRoZSBFSyBIaWVyYXJjaHksIGJ1dCB0aGUgc2VhcmNoIG9uIHRoZSBU
Q0cgd2Vic2l0ZSByZXR1cm5lZCBvbmx5IGJsb2cgcG9zdHMgYW5kIHR3byBtZW50aW9ucyBvZiBB
SUsgaW4mbmJzcDs8YSBocmVmPSJodHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3At
Y29udGVudC91cGxvYWRzL1RDRy1UUE0tdjIuMC1Qcm92aXNpb25pbmctR3VpZGFuY2UtUHVibGlz
aGVkLXYxcjEucGRmIj5odHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29udGVu
dC91cGxvYWRzL1RDRy1UUE0tdjIuMC1Qcm92aXNpb25pbmctR3VpZGFuY2UtUHVibGlzaGVkLXYx
cjEucGRmPC9hPiZuYnNwOzwvZGl2Pgo8ZGl2IGRpcj0ibHRyIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOiBpbmhlcml0OyI+PGJyPgo8L3NwYW4+PC9kaXY+CjxkaXYgZGlyPSJsdHIiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6IGluaGVyaXQ7Ij5JbiB0aGlzIGRvY3VtZW50LCBlbmRvcnNlbWVudFBv
bGljeSBhbmQgZW5kb3JzZW1lbnRBdXRoIGFyZSBtZW50aW9uZWQsIGJ1dCBJIGFtIGhhdmluZyBo
YXJkIHRpbWUgZmluZGluZyBob3cgdGhlIFRTUyAvIFRvb2xzIGludGVyYWN0IHRvIHNldCB0aG9z
ZSBhbmQgbGF0ZXIgdXNlIHRoZW0gZm9yIHRoZSBjcmVhdGlvbiBvZiBBSUsuPC9zcGFuPjwvZGl2
Pgo8ZGl2IGRpcj0ibHRyIj48YnI+CjwvZGl2Pgo8ZGl2IGRpcj0ibHRyIj5Db3VsZCBzb21lb25l
IHBvaW50IG1lIHRvIHRoZSByaWdodCBwbGFjZSBvZiBjb2RlPzwvZGl2Pgo8ZGl2IGRpcj0ibHRy
Ij48YnI+CjwvZGl2Pgo8ZGl2PkJlc3QsPC9kaXY+CjxkaXYgZGlyPSJsdHIiPkRpbWk8L2Rpdj4K
PC9kaXY+CjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K

--===============1717580148978623139==--

