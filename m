Content-Type: multipart/mixed; boundary="===============6893431655998615510=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: tpm2_eventlog ERROR: SpecID eventType must be EV_NO_ACTION
Date: Fri, 09 Apr 2021 13:25:58 -0400
Message-ID: <OF0100B943.2E0657A1-ON002586B2.005F299D-852586B2.005FC2E2@notes.na.collabserv.com>
In-Reply-To: 20210409164723.2848.7769@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6893431655998615510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


The error is basic - it's not a legal TPM 2.0 event log.

The first event (line 0) has to be a EV_NO_ACTION event with a
TCG_EfiSpecIDEvent structure.  I have a -nospec option, but that's just to
test incremental logs.  It's not intended for a full log.

From the TCG spec:

3.	The first event log entry SHALL be a TCG_PCClientPCREvent structure.
See Section 10.2.1 TCG_PCClientPCREvent Structure.


--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)




From:	nicolasoliver03(a)gmail.com
To:	tpm2(a)lists.01.org
Date:	04/09/2021 12:47 PM
Subject:	[EXTERNAL] [tpm2] Re: tpm2_eventlog ERROR: SpecID eventType
            must be EV_NO_ACTION



The output of tsseventextend -v is below.
I am getting this same error in 2 servers from different manufacturers.
I may need to cleanup a little before sharing the logs, please bear with
me!

eventextend: line 0
TSS_EVENT_Line_Trace: PCR index 0
TSS_EVENT_EventType_Trace: 00000008 EV_S_CRTM_VERSION
 TSS_EVENT_Line_Trace: PCR length 20
 c4 2f ed ad 26 82 00 cb 1d 15 f9 78 41 c3 44 e7
 9d ae 33 20
 TSS_EVENT_Line_Trace: event length 16
 1e fb 6b 54 0c 1d 55 40 a4 ad 4e f4 bf 17 b8 3a
eventextend: failed, rc 0000009a
TPM_RC_INSUFFICIENT - the TPM was unable to unmarshal a value because there
were not enough octets in the input buffer Handle number unspecified
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s




--===============6893431655998615510==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+VGhlIGVycm9yIGlzIGJhc2ljIC0gaXQncyBu
b3QgYSBsZWdhbCBUUE0gMi4wIGV2ZW50IGxvZy48L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPSIy
Ij5UaGUgZmlyc3QgZXZlbnQgKGxpbmUgMCkgaGFzIHRvIGJlIGEgRVZfTk9fQUNUSU9OIGV2ZW50
IHdpdGggYSBUQ0dfRWZpU3BlY0lERXZlbnQgc3RydWN0dXJlLiAgSSBoYXZlIGEgLW5vc3BlYyBv
cHRpb24sIGJ1dCB0aGF0J3MganVzdCB0byB0ZXN0IGluY3JlbWVudGFsIGxvZ3MuICBJdCdzIG5v
dCBpbnRlbmRlZCBmb3IgYSBmdWxsIGxvZy48L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPjxicj5G
cm9tIHRoZSBUQ0cgc3BlYzo8L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPSIyIj4zLiAgICAgICAg
VGhlIGZpcnN0IGV2ZW50IGxvZyBlbnRyeSBTSEFMTCBiZSBhIFRDR19QQ0NsaWVudFBDUkV2ZW50
IHN0cnVjdHVyZS4gIFNlZSBTZWN0aW9uIDEwLjIuMSBUQ0dfUENDbGllbnRQQ1JFdmVudCBTdHJ1
Y3R1cmUuIDwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+PGJyPjxicj4tLTxicj5LZW4gR29sZG1h
biAgIGtnb2xkbWFuQHVzLmlibS5jb20gICA8YnI+OTE0LTk0NS0yNDE1ICg4NjItMjQxNSk8YnI+
PC9mb250Pjxicj48YnI+PGltZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHNyYz0iY2lkOjFfXz04
RkJCMEMyMURGQ0NBRjBEOGY5ZThhOTNkZjkzODY5MDkxOGM4RkJAIiBib3JkZXI9IjAiIGFsdD0i
SW5hY3RpdmUgaGlkZSBkZXRhaWxzIGZvciBuaWNvbGFzb2xpdmVyMDMtLS0wNC8wOS8yMDIxIDEy
OjQ3OjI4IFBNLS0tVGhlIG91dHB1dCBvZiB0c3NldmVudGV4dGVuZCAtdiBpcyBiZWxvdy4gSSBh
bSBnZXR0aW5nIHRoaSI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM0MjQyODIiPm5pY29sYXNvbGl2
ZXIwMy0tLTA0LzA5LzIwMjEgMTI6NDc6MjggUE0tLS1UaGUgb3V0cHV0IG9mIHRzc2V2ZW50ZXh0
ZW5kIC12IGlzIGJlbG93LiBJIGFtIGdldHRpbmcgdGhpcyBzYW1lIGVycm9yIGluIDIgc2VydmVy
cyBmcm9tIGRpZmZlcmVudCBtPC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1
RjVGNUYiPkZyb206ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+bmljb2xhc29saXZlcjAz
QGdtYWlsLmNvbTwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPlRvOiAg
ICAgICAgPC9mb250Pjxmb250IHNpemU9IjIiPnRwbTJAbGlzdHMuMDEub3JnPC9mb250Pjxicj48
Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+RGF0ZTogICAgICAgIDwvZm9udD48Zm9udCBz
aXplPSIyIj4wNC8wOS8yMDIxIDEyOjQ3IFBNPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBjb2xv
cj0iIzVGNUY1RiI+U3ViamVjdDogICAgICAgIDwvZm9udD48Zm9udCBzaXplPSIyIj5bRVhURVJO
QUxdIFt0cG0yXSBSZTogdHBtMl9ldmVudGxvZyBFUlJPUjogU3BlY0lEIGV2ZW50VHlwZSBtdXN0
IGJlIEVWX05PX0FDVElPTjwvZm9udD48YnI+PGhyIHdpZHRoPSIxMDAlIiBzaXplPSIyIiBhbGln
bj0ibGVmdCIgbm9zaGFkZSBzdHlsZT0iY29sb3I6IzgwOTFBNTsgIj48YnI+PGJyPjxicj48dHQ+
PGZvbnQgc2l6ZT0iMiI+VGhlIG91dHB1dCBvZiB0c3NldmVudGV4dGVuZCAtdiBpcyBiZWxvdy48
YnI+SSBhbSBnZXR0aW5nIHRoaXMgc2FtZSBlcnJvciBpbiAyIHNlcnZlcnMgZnJvbSBkaWZmZXJl
bnQgbWFudWZhY3R1cmVycy48YnI+SSBtYXkgbmVlZCB0byBjbGVhbnVwIGEgbGl0dGxlIGJlZm9y
ZSBzaGFyaW5nIHRoZSBsb2dzLCBwbGVhc2UgYmVhciB3aXRoIG1lITxicj48YnI+ZXZlbnRleHRl
bmQ6IGxpbmUgMDxicj5UU1NfRVZFTlRfTGluZV9UcmFjZTogUENSIGluZGV4IDA8YnI+VFNTX0VW
RU5UX0V2ZW50VHlwZV9UcmFjZTogMDAwMDAwMDggRVZfU19DUlRNX1ZFUlNJT048YnI+IFRTU19F
VkVOVF9MaW5lX1RyYWNlOiBQQ1IgbGVuZ3RoIDIwPGJyPiBjNCAyZiBlZCBhZCAyNiA4MiAwMCBj
YiAxZCAxNSBmOSA3OCA0MSBjMyA0NCBlNzxicj4gOWQgYWUgMzMgMjA8YnI+IFRTU19FVkVOVF9M
aW5lX1RyYWNlOiBldmVudCBsZW5ndGggMTY8YnI+IDFlIGZiIDZiIDU0IDBjIDFkIDU1IDQwIGE0
IGFkIDRlIGY0IGJmIDE3IGI4IDNhPGJyPmV2ZW50ZXh0ZW5kOiBmYWlsZWQsIHJjIDAwMDAwMDlh
PGJyPlRQTV9SQ19JTlNVRkZJQ0lFTlQgLSB0aGUgVFBNIHdhcyB1bmFibGUgdG8gdW5tYXJzaGFs
IGEgdmFsdWUgYmVjYXVzZSB0aGVyZSB3ZXJlIG5vdCBlbm91Z2ggb2N0ZXRzIGluIHRoZSBpbnB1
dCBidWZmZXIgSGFuZGxlIG51bWJlciB1bnNwZWNpZmllZDxicj5fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj50cG0yIG1haWxpbmcgbGlzdCAtLSB0cG0y
QGxpc3RzLjAxLm9yZzxicj5UbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVh
dmVAbGlzdHMuMDEub3JnPGJyPiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShf
aW50ZXJuYWxfbmFtZSlzPGJyPjxicj48L2ZvbnQ+PC90dD48YnI+PGJyPjxCUj4KPC9ib2R5Pjwv
aHRtbD4K

--===============6893431655998615510==
Content-Type: image/gif
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="graycol.gif"

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--===============6893431655998615510==--

