Content-Type: multipart/mixed; boundary="===============6113182461497961211=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Clearing TPM
Date: Wed, 05 Oct 2022 11:47:10 -0700
Message-ID: <CAOCvsS=XKSPqPtO7RtvP-Zn67nbV84OtoALOLcbCmzETYidUFw@mail.gmail.com>
In-Reply-To: P3_eYbMn-8swpMxU6oR12IjAFam7WKJt1zXpL9u_Is6qnKj_RtxmTRcpXHqORzzTZWg-nATbDAsJLAn-Wu4-H58jpVMcfvB4sKYyvsw2hpw=@protonmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6113182461497961211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The codes are defined in Table 2 of the document "TCG PC Client Platform
Physical Presence Interface Specification" which you can find on the
Trusted Computing Group website.   5 is defined as Clear

On Wed, Oct 5, 2022, 9:45 AM accounts <burnsds.accounts(a)protonmail.com>
wrote:

> Wow this is really helpful.  Do you know if the request values are vendor
> specific?  It would be nice to know what the different values mean.
>
> Thanks,
> Dan
>
> ------- Original Message -------
> On Friday, September 30th, 2022 at 4:07 PM, Steven Clark <
> davolfman(a)gmail.com> wrote:
>
> Also there's the Physical Presence Interface if your device supports it.
> You echo a number representing the type of reset you want to the sysfs pa=
th
> at /sys/class/tpm/tpm0/ppi/request, read out the success or failure at
> /sys/class/tpm/tpm0/ppi/response and reboot. The BIOS then uses it's
> platform authority to issue a clear, usually after prompting you to press
> some key to indicate you're at the console and agree.
>
> For example:
> $echo 5 > /sys/class/tpm/tpm0/ppi/request
> $reboot
>
> On Fri, Sep 30, 2022, 12:50 PM Roberts, William C <
> william.c.roberts(a)intel.com> wrote:
>
>> On Fri, 2022-09-30 at 17:46 +0000, burnsds.accounts(a)protonmail.com
>> wrote:
>> > Is there any way to get out of this state without the lockout
>> > password?
>>
>> Platform auth, which you won't have as its typically randomly set by
>> the OS on boot or you can use the bios settings to clear an Intel or
>> AMD based TPM. For discrete TPMs you need to consult their manuals.
>> Typically, its playing with some jumpers.
>>
>> > _______________________________________________
>> > tpm2 mailing list -- tpm2(a)lists.01.org
>> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>
>
>

--===============6113182461497961211==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPlRoZSBjb2RlcyBhcmUgZGVmaW5lZCBpbiBUYWJsZSAyIG9mIHRoZSBk
b2N1bWVudCAmcXVvdDtUQ0cgUEMgQ2xpZW50IFBsYXRmb3JtIFBoeXNpY2FsIFByZXNlbmNlIElu
dGVyZmFjZSBTcGVjaWZpY2F0aW9uJnF1b3Q7IHdoaWNoIHlvdSBjYW4gZmluZCBvbiB0aGUgVHJ1
c3RlZCBDb21wdXRpbmcgR3JvdXAgd2Vic2l0ZS7CoCDCoDUgaXMgZGVmaW5lZCBhcyBDbGVhcjwv
ZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9Imdt
YWlsX2F0dHIiPk9uIFdlZCwgT2N0IDUsIDIwMjIsIDk6NDUgQU0gYWNjb3VudHMgJmx0OzxhIGhy
ZWY9Im1haWx0bzpidXJuc2RzLmFjY291bnRzQHByb3Rvbm1haWwuY29tIj5idXJuc2RzLmFjY291
bnRzQHByb3Rvbm1haWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNs
YXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFw
eCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFy
aWFsO2ZvbnQtc2l6ZToxNHB4O2NvbG9yOnJnYigwLDAsMCkiPldvdyB0aGlzIGlzIHJlYWxseSBo
ZWxwZnVsLsKgIERvIHlvdSBrbm93IGlmIHRoZSByZXF1ZXN0IHZhbHVlcyBhcmUgdmVuZG9yIHNw
ZWNpZmljP8KgIEl0IHdvdWxkIGJlIG5pY2UgdG8ga25vdyB3aGF0IHRoZSBkaWZmZXJlbnQgdmFs
dWVzIG1lYW4uPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Zm9udC1zaXplOjE0
cHg7Y29sb3I6cmdiKDAsMCwwKSI+PGJyPlRoYW5rcyw8YnI+RGFuPC9kaXY+PGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6QXJpYWw7Zm9udC1zaXplOjE0cHg7Y29sb3I6cmdiKDAsMCwwKSI+PGJyPjwv
ZGl2PjxkaXY+CiAgICAgICAgLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS08YnI+CiAg
ICAgICAgT24gRnJpZGF5LCBTZXB0ZW1iZXIgMzB0aCwgMjAyMiBhdCA0OjA3IFBNLCBTdGV2ZW4g
Q2xhcmsgJmx0OzxhIGhyZWY9Im1haWx0bzpkYXZvbGZtYW5AZ21haWwuY29tIiB0YXJnZXQ9Il9i
bGFuayIgcmVsPSJub3JlZmVycmVyIj5kYXZvbGZtYW5AZ21haWwuY29tPC9hPiZndDsgd3JvdGU6
PGJyPjxicj4KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAgICAgPGRp
diBkaXI9ImF1dG8iPkFsc28gdGhlcmUmIzM5O3MgdGhlIFBoeXNpY2FsIFByZXNlbmNlIEludGVy
ZmFjZSBpZiB5b3VyIGRldmljZSBzdXBwb3J0cyBpdC4gIFlvdSBlY2hvIGEgbnVtYmVyIHJlcHJl
c2VudGluZyB0aGUgdHlwZSBvZiByZXNldCB5b3Ugd2FudCB0byB0aGUgc3lzZnMgcGF0aCBhdCAv
c3lzL2NsYXNzL3RwbS90cG0wL3BwaS9yZXF1ZXN0LCByZWFkIG91dCB0aGUgc3VjY2VzcyBvciBm
YWlsdXJlIGF0IC9zeXMvY2xhc3MvdHBtL3RwbTAvcHBpL3Jlc3BvbnNlIGFuZCByZWJvb3QuICBU
aGUgQklPUyB0aGVuIHVzZXMgaXQmIzM5O3MgcGxhdGZvcm0gYXV0aG9yaXR5IHRvIGlzc3VlIGEg
Y2xlYXIsIHVzdWFsbHkgYWZ0ZXIgcHJvbXB0aW5nIHlvdSB0byBwcmVzcyBzb21lIGtleSB0byBp
bmRpY2F0ZSB5b3UmIzM5O3JlIGF0IHRoZSBjb25zb2xlIGFuZCBhZ3JlZS48ZGl2IGRpcj0iYXV0
byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5Gb3IgZXhhbXBsZTo8L2Rpdj48ZGl2IGRpcj0i
YXV0byI+JGVjaG8gNSAmZ3Q7IC9zeXMvY2xhc3MvdHBtL3RwbTAvcHBpL3JlcXVlc3Q8L2Rpdj48
ZGl2IGRpcj0iYXV0byI+JHJlYm9vdDwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9x
dW90ZSI+PGRpdiBjbGFzcz0iZ21haWxfYXR0ciIgZGlyPSJsdHIiPk9uIEZyaSwgU2VwIDMwLCAy
MDIyLCAxMjo1MCBQTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxs
aWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHJlbD0ibm9yZWZlcnJlciBub2ZvbGxvdyBub29wZW5l
ciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
PC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW46MCAwIDAg
LjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4IiBjbGFzcz0i
Z21haWxfcXVvdGUiPk9uIEZyaSwgMjAyMi0wOS0zMCBhdCAxNzo0NiArMDAwMCwgPGEgcmVsPSJu
b3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIG5vcmVmZXJyZXIiIGhyZWY9Im1haWx0bzpidXJu
c2RzLmFjY291bnRzQHByb3Rvbm1haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YnVybnNkcy5hY2Nv
dW50c0Bwcm90b25tYWlsLmNvbTwvYT48YnI+Cndyb3RlOjxicj4KJmd0OyBJcyB0aGVyZSBhbnkg
d2F5IHRvIGdldCBvdXQgb2YgdGhpcyBzdGF0ZSB3aXRob3V0IHRoZSBsb2Nrb3V0PGJyPgomZ3Q7
IHBhc3N3b3JkPzxicj4KPGJyPgpQbGF0Zm9ybSBhdXRoLCB3aGljaCB5b3Ugd29uJiMzOTt0IGhh
dmUgYXMgaXRzIHR5cGljYWxseSByYW5kb21seSBzZXQgYnk8YnI+CnRoZSBPUyBvbiBib290IG9y
IHlvdSBjYW4gdXNlIHRoZSBiaW9zIHNldHRpbmdzIHRvIGNsZWFyIGFuIEludGVsIG9yPGJyPgpB
TUQgYmFzZWQgVFBNLiBGb3IgZGlzY3JldGUgVFBNcyB5b3UgbmVlZCB0byBjb25zdWx0IHRoZWly
IG1hbnVhbHMuPGJyPgpUeXBpY2FsbHksIGl0cyBwbGF5aW5nIHdpdGggc29tZSBqdW1wZXJzLiA8
YnI+Cjxicj4KJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXzxicj4KJmd0OyB0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSByZWw9Im5vcmVmZXJyZXIgbm9m
b2xsb3cgbm9vcGVuZXIgbm9yZWZlcnJlciIgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgcmVsPSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3Bl
bmVyIG5vcmVmZXJyZXIiIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyAlKHdlYl9w
YWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGlu
ZyBsaXN0IC0tIDxhIHJlbD0ibm9yZWZlcnJlciBub2ZvbGxvdyBub29wZW5lciBub3JlZmVycmVy
IiBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT48YnI+ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgcmVs
PSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIG5vcmVmZXJyZXIiIGhyZWY9Im1haWx0bzp0
cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMu
MDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRl
cm5hbF9uYW1lKXM8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4KCiAgICAgICAgPC9ibG9ja3F1b3Rl
Pjxicj4KICAgIDwvZGl2PjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============6113182461497961211==--

