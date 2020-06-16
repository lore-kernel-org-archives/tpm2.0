Content-Type: multipart/mixed; boundary="===============0574420409303830001=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: FAPI
Date: Tue, 16 Jun 2020 08:40:10 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0171B6B580@exch2010c.sit.fraunhofer.de>
In-Reply-To: CAP3jAwRUtNKNt=p1=kTCtOSpKP=-Mi1GP=-jBmSLg4WmVTOZwg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0574420409303830001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You might want to use this integration test as starter:
https://github.com/tpm2-software/tpm2-tss/blob/master/test/integration/fapi=
-quote.int.c

It creates the restricted signing key, calls quote, etc.

Note that we still await the TCG event log format spec to fully support the=
 event log.

Cheers,
Andreas
________________________________
From: Rahul Hardikar [rahulhardikar(a)gmail.com]
Sent: Monday, June 15, 2020 22:50
To: tpm2(a)lists.01.org
Cc: Fuchs, Andreas
Subject: FAPI


Sorry for the subject, was going to CC Andreas
On Mon, Jun 15, 2020 at 1:50 PM Rahul Hardikar <rahulhardikar(a)gmail.com<m=
ailto:rahulhardikar(a)gmail.com>> wrote:
Hi All,
Since FAPI is now supported in the latest tss2, I would like to implement t=
he Attestation protocol using FAPI, I believe basic commands like create_ek=
, create_ak, read_manufac_certificate exist in FAPI API, what is missing is=
, make credential w/o a TPM chip as most servers don't have tpm chip.  I al=
so don't see Activate Credential.

How can we achieve this in FAPI?

Thanks,
Rahul

--===============0574420409303830001==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIx
IiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9t
YTtjb2xvcjogIzAwMDAwMDtmb250LXNpemU6IDEwcHQ7Ij4KPGRpdj5Zb3UgbWlnaHQgd2FudCB0
byB1c2UgdGhpcyBpbnRlZ3JhdGlvbiB0ZXN0IGFzIHN0YXJ0ZXI6PC9kaXY+CjxkaXY+PGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MvYmxvYi9tYXN0ZXIv
dGVzdC9pbnRlZ3JhdGlvbi9mYXBpLXF1b3RlLmludC5jIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MvYmxvYi9tYXN0ZXIvdGVzdC9pbnRl
Z3JhdGlvbi9mYXBpLXF1b3RlLmludC5jPC9hPjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+
SXQgY3JlYXRlcyB0aGUgcmVzdHJpY3RlZCBzaWduaW5nIGtleSwgY2FsbHMgcXVvdGUsIGV0Yy48
L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pk5vdGUgdGhhdCB3ZSBzdGlsbCBhd2FpdCB0aGUg
VENHIGV2ZW50IGxvZyBmb3JtYXQgc3BlYyB0byBmdWxseSBzdXBwb3J0IHRoZSBldmVudCBsb2cu
PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5DaGVlcnMsPC9kaXY+CjxkaXY+QW5kcmVhczxi
cj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBUaW1lcyBOZXcgUm9tYW47IGNvbG9y
OiAjMDAwMDAwOyBmb250LXNpemU6IDE2cHgiPgo8aHIgdGFiaW5kZXg9Ii0xIj4KPGRpdiBpZD0i
ZGl2UnBGMTU4MjYwIiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7Ij48Zm9udCBzaXplPSIyIiBmYWNl
PSJUYWhvbWEiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gUmFodWwgSGFyZGlrYXIgW3Jh
aHVsaGFyZGlrYXJAZ21haWwuY29tXTxicj4KPGI+U2VudDo8L2I+IE1vbmRheSwgSnVuZSAxNSwg
MjAyMCAyMjo1MDxicj4KPGI+VG86PC9iPiB0cG0yQGxpc3RzLjAxLm9yZzxicj4KPGI+Q2M6PC9i
PiBGdWNocywgQW5kcmVhczxicj4KPGI+U3ViamVjdDo8L2I+IEZBUEk8YnI+CjwvZm9udD48YnI+
CjwvZGl2Pgo8ZGl2PjwvZGl2Pgo8ZGl2Pgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+
PGJyPgo8L2Rpdj4KU29ycnkgZm9yIHRoZSBzdWJqZWN0LCB3YXMgZ29pbmcgdG8gQ0MgQW5kcmVh
czxicj4KPGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPgo8ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21h
aWxfYXR0ciI+T24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMTo1MCBQTSBSYWh1bCBIYXJkaWthciAm
bHQ7PGEgaHJlZj0ibWFpbHRvOnJhaHVsaGFyZGlrYXJAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5yYWh1bGhhcmRpa2FyQGdtYWlsLmNvbTwvYT4m
Z3Q7IHdyb3RlOjxicj4KPC9kaXY+CjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDsgYm9yZGVyLWxlZnQtd2lkdGg6MXB4OyBib3Jk
ZXItbGVmdC1zdHlsZTpzb2xpZDsgYm9yZGVyLWxlZnQtY29sb3I6cmdiKDIwNCwyMDQsMjA0KTsg
cGFkZGluZy1sZWZ0OjFleCI+CjxkaXYgZGlyPSJsdHIiPkhpIEFsbCwKPGRpdj5TaW5jZSBGQVBJ
IGlzIG5vdyBzdXBwb3J0ZWQgaW4gdGhlIGxhdGVzdCB0c3MyLCBJIHdvdWxkIGxpa2UgdG8gaW1w
bGVtZW50IHRoZSBBdHRlc3RhdGlvbiBwcm90b2NvbCB1c2luZyBGQVBJLCBJIGJlbGlldmUgYmFz
aWMgY29tbWFuZHMgbGlrZSBjcmVhdGVfZWssIGNyZWF0ZV9haywgcmVhZF9tYW51ZmFjX2NlcnRp
ZmljYXRlIGV4aXN0IGluIEZBUEkgQVBJLCB3aGF0IGlzIG1pc3NpbmcgaXMsIG1ha2UgY3JlZGVu
dGlhbCB3L28gYSBUUE0KIGNoaXAgYXMgbW9zdCBzZXJ2ZXJzIGRvbid0IGhhdmUgdHBtIGNoaXAu
Jm5ic3A7IEkgYWxzbyBkb24ndCBzZWUgQWN0aXZhdGUgQ3JlZGVudGlhbC48L2Rpdj4KPGRpdj48
YnI+CjwvZGl2Pgo8ZGl2PkhvdyBjYW4gd2UgYWNoaWV2ZSB0aGlzIGluIEZBUEk/PC9kaXY+Cjxk
aXY+PGJyPgo8L2Rpdj4KPGRpdj5UaGFua3MsPC9kaXY+CjxkaXY+UmFodWw8L2Rpdj4KPC9kaXY+
CjwvYmxvY2txdW90ZT4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2JvZHk+
CjwvaHRtbD4K

--===============0574420409303830001==--

