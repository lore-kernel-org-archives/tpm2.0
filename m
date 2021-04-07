Content-Type: multipart/mixed; boundary="===============3168301353222402702=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] tpm2_eventlog ERROR: SpecID eventType must be EV_NO_ACTION
Date: Wed, 07 Apr 2021 16:53:19 -0400
Message-ID: <OF3D622C11.68F63C8B-ON002586B0.00725856-852586B0.0072BEBD@notes.na.collabserv.com>
In-Reply-To: 20210407181211.2848.65584@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3168301353222402702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: nicolasoliver03(a)gmail.com
> To: tpm2(a)lists.01.org
> Date: 04/07/2021 02:12 PM
> Subject: [EXTERNAL] [tpm2] tpm2_eventlog ERROR: SpecID eventType
> must be EV_NO_ACTION

Does the subject agree with this issue?

>
> Hello!
>
> I was recently trying to inspect TPM Event Logs with the
> tpm2_eventlog command.
> I am getting the following error:
>
> ---
> ERROR on line: "235" in file: "lib/tpm2_eventlog.c": SpecID
> eventType must be EV_NO_ACTION
> ERROR on line: "79" in file: "tools/misc/tpm2_eventlog.c": failed to
> parse tpm2 eventlog
> ERROR on line: "146" in file: "tools/tpm2_tool.c": Unable to run
tpm2_eventlog
>
> I tried with tsseventextend as well, and I got a similar error message:
>
> eventextend: failed, rc 0000009a
> TPM_RC_INSUFFICIENT - the TPM was unable to unmarshal a value
> because there were not enough octets in the input buffer Handle
> number unspecified

Two suggestions to help us:

1 - Can you upload the event log so we can debug it?

2 - Can you run tsseventextend -v (verbose tracing)?

>
> And then tried with fwupdtpmevlog command, and I got it parsed, but
> the reconstructed PCR 4 does not match the state of the actual TPM
> PCR 4 state.
>
> Is it accurate to say that the TPM Event Log I am parsing is corrupted?

Not yet.  Let's debug before we decide where the bug is.


> And potentially, the corrupted entry is related to the PCR 4
> measurements, and that's why I get a mismatch in the reconstruction?
>
> Thanks!
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============3168301353222402702==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PHR0Pjxmb250IHNpemU9IjIiPiZndDsgRnJvbTogbmljb2xhc29saXZl
cjAzQGdtYWlsLmNvbTwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0OyBUbzog
dHBtMkBsaXN0cy4wMS5vcmc8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPiZndDsg
RGF0ZTogMDQvMDcvMjAyMSAwMjoxMiBQTTwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0i
MiI+Jmd0OyBTdWJqZWN0OiBbRVhURVJOQUxdIFt0cG0yXSB0cG0yX2V2ZW50bG9nIEVSUk9SOiBT
cGVjSUQgZXZlbnRUeXBlIDxicj4mZ3Q7IG11c3QgYmUgRVZfTk9fQUNUSU9OPC9mb250PjwvdHQ+
PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+RG9lcyB0aGUgc3ViamVjdCBhZ3JlZSB3aXRoIHRo
aXMgaXNzdWU/PC9mb250PjwvdHQ+PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0OyA8YnI+
Jmd0OyBIZWxsbyE8YnI+Jmd0OyA8YnI+Jmd0OyBJIHdhcyByZWNlbnRseSB0cnlpbmcgdG8gaW5z
cGVjdCBUUE0gRXZlbnQgTG9ncyB3aXRoIHRoZSA8YnI+Jmd0OyB0cG0yX2V2ZW50bG9nIGNvbW1h
bmQuPGJyPiZndDsgSSBhbSBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgZXJyb3I6PGJyPiZndDsgPGJy
PiZndDsgLS0tPGJyPiZndDsgRVJST1Igb24gbGluZTogJnF1b3Q7MjM1JnF1b3Q7IGluIGZpbGU6
ICZxdW90O2xpYi90cG0yX2V2ZW50bG9nLmMmcXVvdDs6IFNwZWNJRCA8YnI+Jmd0OyBldmVudFR5
cGUgbXVzdCBiZSBFVl9OT19BQ1RJT048YnI+Jmd0OyBFUlJPUiBvbiBsaW5lOiAmcXVvdDs3OSZx
dW90OyBpbiBmaWxlOiAmcXVvdDt0b29scy9taXNjL3RwbTJfZXZlbnRsb2cuYyZxdW90OzogZmFp
bGVkIHRvPGJyPiZndDsgcGFyc2UgdHBtMiBldmVudGxvZyAmbmJzcDs8YnI+Jmd0OyBFUlJPUiBv
biBsaW5lOiAmcXVvdDsxNDYmcXVvdDsgaW4gZmlsZTogJnF1b3Q7dG9vbHMvdHBtMl90b29sLmMm
cXVvdDs6IFVuYWJsZSB0byBydW4gdHBtMl9ldmVudGxvZzxicj4mZ3Q7IDxicj4mZ3Q7IEkgdHJp
ZWQgd2l0aCB0c3NldmVudGV4dGVuZCBhcyB3ZWxsLCBhbmQgSSBnb3QgYSBzaW1pbGFyIGVycm9y
IG1lc3NhZ2U6PGJyPiZndDsgPGJyPiZndDsgZXZlbnRleHRlbmQ6IGZhaWxlZCwgcmMgMDAwMDAw
OWE8YnI+Jmd0OyBUUE1fUkNfSU5TVUZGSUNJRU5UIC0gdGhlIFRQTSB3YXMgdW5hYmxlIHRvIHVu
bWFyc2hhbCBhIHZhbHVlIDxicj4mZ3Q7IGJlY2F1c2UgdGhlcmUgd2VyZSBub3QgZW5vdWdoIG9j
dGV0cyBpbiB0aGUgaW5wdXQgYnVmZmVyIEhhbmRsZSA8YnI+Jmd0OyBudW1iZXIgdW5zcGVjaWZp
ZWQ8L2ZvbnQ+PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5Ud28gc3VnZ2VzdGlvbnMg
dG8gaGVscCB1czo8L2ZvbnQ+PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4xIC0gQ2Fu
IHlvdSB1cGxvYWQgdGhlIGV2ZW50IGxvZyBzbyB3ZSBjYW4gZGVidWcgaXQ/PC9mb250PjwvdHQ+
PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+MiAtIENhbiB5b3UgcnVuIHRzc2V2ZW50ZXh0ZW5k
IC12ICh2ZXJib3NlIHRyYWNpbmcpPzwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+
PGJyPiZndDsgPGJyPiZndDsgQW5kIHRoZW4gdHJpZWQgd2l0aCBmd3VwZHRwbWV2bG9nIGNvbW1h
bmQsIGFuZCBJIGdvdCBpdCBwYXJzZWQsIGJ1dCA8YnI+Jmd0OyB0aGUgcmVjb25zdHJ1Y3RlZCBQ
Q1IgNCBkb2VzIG5vdCBtYXRjaCB0aGUgc3RhdGUgb2YgdGhlIGFjdHVhbCBUUE0gPGJyPiZndDsg
UENSIDQgc3RhdGUuPGJyPiZndDsgPGJyPiZndDsgSXMgaXQgYWNjdXJhdGUgdG8gc2F5IHRoYXQg
dGhlIFRQTSBFdmVudCBMb2cgSSBhbSBwYXJzaW5nIGlzIGNvcnJ1cHRlZD8gPC9mb250PjwvdHQ+
PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Tm90IHlldC4gJm5ic3A7TGV0J3MgZGVidWcgYmVm
b3JlIHdlIGRlY2lkZSB3aGVyZSB0aGUgYnVnIGlzLjwvZm9udD48L3R0Pjxicj48YnI+PGJyPjx0
dD48Zm9udCBzaXplPSIyIj4mZ3Q7IEFuZCBwb3RlbnRpYWxseSwgdGhlIGNvcnJ1cHRlZCBlbnRy
eSBpcyByZWxhdGVkIHRvIHRoZSBQQ1IgNCA8YnI+Jmd0OyBtZWFzdXJlbWVudHMsIGFuZCB0aGF0
J3Mgd2h5IEkgZ2V0IGEgbWlzbWF0Y2ggaW4gdGhlIHJlY29uc3RydWN0aW9uPzxicj4mZ3Q7IDxi
cj4mZ3Q7IFRoYW5rcyE8YnI+Jmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXzxicj4mZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEu
b3JnPGJyPiZndDsgVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byB0cG0yLWxlYXZlQGxp
c3RzLjAxLm9yZzxicj4mZ3Q7ICUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShf
aW50ZXJuYWxfbmFtZSlzPGJyPiZndDsgPGJyPjwvZm9udD48L3R0PjxCUj4KPC9ib2R5PjwvaHRt
bD4K

--===============3168301353222402702==--

