Content-Type: multipart/mixed; boundary="===============5256475912306236957=="
MIME-Version: 1.0
From: accounts <burnsds.accounts at protonmail.com>
Subject: [tpm2] Re: Clearing TPM
Date: Wed, 05 Oct 2022 16:45:05 +0000
Message-ID: <P3_eYbMn-8swpMxU6oR12IjAFam7WKJt1zXpL9u_Is6qnKj_RtxmTRcpXHqORzzTZWg-nATbDAsJLAn-Wu4-H58jpVMcfvB4sKYyvsw2hpw=@protonmail.com>
In-Reply-To: CAOCvsSnLQRZOkvo=yey3w6XtL17TKo7A9C1kY=eGFj+wvZ9o1Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5256475912306236957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Wow this is really helpful. Do you know if the request values are vendor sp=
ecific? It would be nice to know what the different values mean.

Thanks,
Dan

------- Original Message -------
On Friday, September 30th, 2022 at 4:07 PM, Steven Clark <davolfman(a)gmail=
.com> wrote:

> Also there's the Physical Presence Interface if your device supports it. =
You echo a number representing the type of reset you want to the sysfs path=
 at /sys/class/tpm/tpm0/ppi/request, read out the success or failure at /sy=
s/class/tpm/tpm0/ppi/response and reboot. The BIOS then uses it's platform =
authority to issue a clear, usually after prompting you to press some key t=
o indicate you're at the console and agree.
>
> For example:
> $echo 5 > /sys/class/tpm/tpm0/ppi/request
> $reboot
>
> On Fri, Sep 30, 2022, 12:50 PM Roberts, William C <william.c.roberts(a)in=
tel.com> wrote:
>
>> On Fri, 2022-09-30 at 17:46 +0000, burnsds.accounts(a)protonmail.com
>> wrote:
>>> Is there any way to get out of this state without the lockout
>>> password?
>>
>> Platform auth, which you won't have as its typically randomly set by
>> the OS on boot or you can use the bios settings to clear an Intel or
>> AMD based TPM. For discrete TPMs you need to consult their manuals.
>> Typically, its playing with some jumpers.
>>
>>> _______________________________________________
>>> tpm2 mailing list -- tpm2(a)lists.01.org
>>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============5256475912306236957==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij5Xb3cgdGhpcyBpcyByZWFsbHkgaGVscGZ1bC4mbmJzcDsgRG8geW91IGtu
b3cgaWYgdGhlIHJlcXVlc3QgdmFsdWVzIGFyZSB2ZW5kb3Igc3BlY2lmaWM/Jm5ic3A7IEl0IHdv
dWxkIGJlIG5pY2UgdG8ga25vdyB3aGF0IHRoZSBkaWZmZXJlbnQgdmFsdWVzIG1lYW4uPC9kaXY+
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij48YnI+VGhhbmtzLDxicj5EYW48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZh
bWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPjxicj48
L2Rpdj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3F1b3RlIj4NCiAgICAgICAgLS0tLS0tLSBPcmln
aW5hbCBNZXNzYWdlIC0tLS0tLS08YnI+DQogICAgICAgIE9uIEZyaWRheSwgU2VwdGVtYmVyIDMw
dGgsIDIwMjIgYXQgNDowNyBQTSwgU3RldmVuIENsYXJrICZsdDtkYXZvbGZtYW5AZ21haWwuY29t
Jmd0OyB3cm90ZTo8YnI+PGJyPg0KICAgICAgICA8YmxvY2txdW90ZSBjbGFzcz0icHJvdG9ubWFp
bF9xdW90ZSIgdHlwZT0iY2l0ZSI+DQogICAgICAgICAgICA8ZGl2IGRpcj0iYXV0byI+QWxzbyB0
aGVyZSdzIHRoZSBQaHlzaWNhbCBQcmVzZW5jZSBJbnRlcmZhY2UgaWYgeW91ciBkZXZpY2Ugc3Vw
cG9ydHMgaXQuICBZb3UgZWNobyBhIG51bWJlciByZXByZXNlbnRpbmcgdGhlIHR5cGUgb2YgcmVz
ZXQgeW91IHdhbnQgdG8gdGhlIHN5c2ZzIHBhdGggYXQgL3N5cy9jbGFzcy90cG0vdHBtMC9wcGkv
cmVxdWVzdCwgcmVhZCBvdXQgdGhlIHN1Y2Nlc3Mgb3IgZmFpbHVyZSBhdCAvc3lzL2NsYXNzL3Rw
bS90cG0wL3BwaS9yZXNwb25zZSBhbmQgcmVib290LiAgVGhlIEJJT1MgdGhlbiB1c2VzIGl0J3Mg
cGxhdGZvcm0gYXV0aG9yaXR5IHRvIGlzc3VlIGEgY2xlYXIsIHVzdWFsbHkgYWZ0ZXIgcHJvbXB0
aW5nIHlvdSB0byBwcmVzcyBzb21lIGtleSB0byBpbmRpY2F0ZSB5b3UncmUgYXQgdGhlIGNvbnNv
bGUgYW5kIGFncmVlLjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkZv
ciBleGFtcGxlOjwvZGl2PjxkaXYgZGlyPSJhdXRvIj4kZWNobyA1ICZndDsgL3N5cy9jbGFzcy90
cG0vdHBtMC9wcGkvcmVxdWVzdDwvZGl2PjxkaXYgZGlyPSJhdXRvIj4kcmVib290PC9kaXY+PC9k
aXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGNsYXNzPSJnbWFpbF9hdHRyIiBk
aXI9Imx0ciI+T24gRnJpLCBTZXAgMzAsIDIwMjIsIDEyOjUwIFBNIFJvYmVydHMsIFdpbGxpYW0g
QyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgcmVsPSJu
b3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJv
YmVydHNAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIHN0eWxl
PSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxl
ZnQ6MWV4IiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIEZyaSwgMjAyMi0wOS0zMCBhdCAxNzo0NiAr
MDAwMCwgPGEgcmVsPSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIiB0YXJnZXQ9Il9ibGFu
ayIgaHJlZj0ibWFpbHRvOmJ1cm5zZHMuYWNjb3VudHNAcHJvdG9ubWFpbC5jb20iPmJ1cm5zZHMu
YWNjb3VudHNAcHJvdG9ubWFpbC5jb208L2E+PGJyPg0Kd3JvdGU6PGJyPg0KJmd0OyBJcyB0aGVy
ZSBhbnkgd2F5IHRvIGdldCBvdXQgb2YgdGhpcyBzdGF0ZSB3aXRob3V0IHRoZSBsb2Nrb3V0PGJy
Pg0KJmd0OyBwYXNzd29yZD88YnI+DQo8YnI+DQpQbGF0Zm9ybSBhdXRoLCB3aGljaCB5b3Ugd29u
J3QgaGF2ZSBhcyBpdHMgdHlwaWNhbGx5IHJhbmRvbWx5IHNldCBieTxicj4NCnRoZSBPUyBvbiBi
b290IG9yIHlvdSBjYW4gdXNlIHRoZSBiaW9zIHNldHRpbmdzIHRvIGNsZWFyIGFuIEludGVsIG9y
PGJyPg0KQU1EIGJhc2VkIFRQTS4gRm9yIGRpc2NyZXRlIFRQTXMgeW91IG5lZWQgdG8gY29uc3Vs
dCB0aGVpciBtYW51YWxzLjxicj4NClR5cGljYWxseSwgaXRzIHBsYXlpbmcgd2l0aCBzb21lIGp1
bXBlcnMuIDxicj4NCjxicj4NCiZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX188YnI+DQomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIHJlbD0ibm9y
ZWZlcnJlciBub2ZvbGxvdyBub29wZW5lciIgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Im1haWx0bzp0
cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJmd0OyBUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIHJlbD0ibm9yZWZlcnJlciBub2ZvbGxvdyBub29w
ZW5lciIgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9y
ZyI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJmd0OyAlKHdlYl9wYWdlX3VybClz
bGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPg0KdHBtMiBtYWlsaW5nIGxpc3Qg
LS0gPGEgcmVsPSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIiB0YXJnZXQ9Il9ibGFuayIg
aHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+
DQpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIHJlbD0ibm9yZWZlcnJlciBub2Zv
bGxvdyBub29wZW5lciIgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxp
c3RzLjAxLm9yZyI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJSh3ZWJfcGFnZV91
cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+DQo8L2Jsb2NrcXVv
dGU+PC9kaXY+DQoNCiAgICAgICAgPC9ibG9ja3F1b3RlPjxicj4NCiAgICA8L2Rpdj4=
--===============5256475912306236957==--

