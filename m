Content-Type: multipart/mixed; boundary="===============8318752525995066643=="
MIME-Version: 1.0
From: arjun kashyap <arjun21k at gmail.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 2
Date: Thu, 07 Mar 2019 21:04:46 -0600
Message-ID: <CA+tUB7Ccj9K88RecFTqCCrB48oKF8P17w=X5LjfShnJvzh69RA@mail.gmail.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0162E6CAA6@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8318752525995066643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Andreas. I will check this out.

Best,
Arjun

<https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm_c=
ampaign=3Dsig-email&utm_content=3Dwebmail&utm_term=3Dicon>
Virus-free.
www.avast.com
<https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm_c=
ampaign=3Dsig-email&utm_content=3Dwebmail&utm_term=3Dlink>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>

On Thu, Mar 7, 2019 at 3:40 PM Fuchs, Andreas <
andreas.fuchs(a)sit.fraunhofer.de> wrote:

> You could also use the tpm2-tss-engine.
> See this test for an example:
>
> https://github.com/tpm2-software/tpm2-tss-engine/blob/master/test/rsadecr=
ypt.sh
>
> Or if you cannot store a key-file on disk, use the above script and
> combine it with persistent keys from here:
>
> https://github.com/tpm2-software/tpm2-tss-engine/blob/master/test/rsasign=
_persistent_emptyauth.sh
>
> Cheers,
> Andreas
>
> ------------------------------
> *From:* tpm2 [tpm2-bounces(a)lists.01.org] on behalf of arjun kashyap [
> arjun21k(a)gmail.com]
> *Sent:* Thursday, March 07, 2019 20:41
> *To:* Desai, Imran; william.c.roberts(a)intel.com; tpm2(a)lists.01.org
> *Subject:* Re: [tpm2] tpm2 Digest, Vol 21, Issue 2
>
> Thanks William and Imran for your inputs. My use case is that once my
> system boots up (with tpm) I should be able to send encrypted data to it
> over the network. I thought I could use the EK as each tpm has a unique a=
nd
> built-in one. My thought process was to try to use the EK public portion =
to
> encrypt the data and send it over the network to the tpm and then decrypt
> it using EK private portion. As both of you pointed out that I should set
> appropriate attributes while creating the key and prefer using
> tpm2_createprimary instead of tpm2_createek. But I have another concern
> with this approach. With tpm2_createek I could extract the public key
> portion of the EK which gets created. But if I use tpm2_createprimary I do
> not have that option. So could you suggest some workaround? Also, please
> feel free to suggest another approach for this use case. Kindly correct me
> if I am wrong as I am new to tpms.
>
> Thanks again,
> Arjun
>
> On Tue, Mar 5, 2019 at 3:27 PM Desai, Imran <imran.desai(a)intel.com> wro=
te:
>
>> For what you want to do, try this.
>>
>> tpm2_createprimary -a e -G rsa -A
>> "fixedtpm|fixedparent|sensitivedataorigin|userwithauth|adminwithpolicy|d=
ecrypt"
>> -o key.ctx
>> tpm2_evictcontrol -a o -c key.ctx -p 0x81010002
>> tpm2_rsaencrypt -c 0x81010002 -o enc.out plain.txt
>> tpm2_rsadecrypt -c 0x81010002 -o dec.out -I enc.out
>>
>> PS: I would not use such a key if I cared about privacy.
>>
>> =EF=BB=BFOn 3/5/19, 1:50 PM, "Desai, Imran" <imran.desai(a)intel.com> wr=
ote:
>>
>>     +1 to what Bill said. If you must do this I'd suggest you use
>> createprimary to create the key under endorsement hierarchy. I understand
>> that is exactly what tpm2_createek does but there is a caveat. For what =
you
>> intend to do it requires userwith attribute set to 1. The reason it is n=
ot
>> set to 1 in createek tool is because it would create an endorsement key =
off
>> a non standard template per TCK EK credential profile spec. The alternat=
ive
>> is to satisfy policysecret of the endorsement hierarchy and that will
>> require a change in the tool.
>>
>>     On 3/5/19, 1:00 PM, "tpm2 on behalf of tpm2-request(a)lists.01.org" <
>> tpm2-bounces(a)lists.01.org on behalf of tpm2-request(a)lists.01.org> wr=
ote:
>>
>>         Send tpm2 mailing list submissions to
>>                 tpm2(a)lists.01.org
>>
>>         To subscribe or unsubscribe via the World Wide Web, visit
>>                 https://lists.01.org/mailman/listinfo/tpm2
>>         or, via email, send a message with subject or body 'help' to
>>                 tpm2-request(a)lists.01.org
>>
>>         You can reach the person managing the list at
>>                 tpm2-owner(a)lists.01.org
>>
>>         When replying, please edit your Subject line so it is more
>> specific
>>         than "Re: Contents of tpm2 digest..."
>>
>>
>>         Today's Topics:
>>
>>            1. Re: Use endorsement key for encryption and decryption
>>               (Roberts, William C)
>>
>>
>>
>> ----------------------------------------------------------------------
>>
>>         Message: 1
>>         Date: Tue, 5 Mar 2019 17:29:10 +0000
>>         From: "Roberts, William C" <william.c.roberts(a)intel.com>
>>         To: arjun kashyap <arjun21k(a)gmail.com>, "tpm2(a)lists.01.org"
>>                 <tpm2(a)lists.01.org>
>>         Subject: Re: [tpm2] Use endorsement key for encryption and
>> decryption
>>         Message-ID:
>>                 <
>> 476DC76E7D1DF2438D32BFADF679FC5649CFA6CA(a)ORSMSX101.amr.corp.intel.com>
>>
>>         Content-Type: text/plain; charset=3D"utf-8"
>>
>>
>>
>>         > -----Original Message-----
>>         > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of
>> arjun kashyap
>>         > Sent: Sunday, March 3, 2019 12:58 PM
>>         > To: tpm2(a)lists.01.org
>>         > Subject: [tpm2] Use endorsement key for encryption and
>> decryption
>>         >
>>         > Hello all,
>>         >
>>         > I am using the IBM tpm2.0 simulator. My use case is that I
>> would like to encrypt
>>         > data and send to tpm and then decrypt this at the tpm side. I
>> would want to use
>>         > the endorsement key (EK) for this purpose. Hence, I would like
>> to encrypt data
>>         > using EK's public key and decrypt using EK's private key. I
>> tried creating EK using
>>         > tpm2_createek -G rsa -f pem -c - -p ek.pem. Now, I have the
>> ek.pem( public
>>         > portion of EK) to encrypt the data. When I load this key into
>> the tpm and invoke
>>         > tpm2_rsadecrypt I get an error. I also tried using
>> tpm2_createprimary to create
>>         > an EK but failed in the above attempt. Could anyone please help
>> me out so that I
>>         > can use EK to encrypt/decrypt data.
>>         >
>>         > Please let me know if more information is needed.
>>
>>         What's the error code? You probably can't perform an rsadecrypt,
>>         Do to object attributes. I would bet sign would work. Endorsement
>>         usually means signing.
>>
>>         >
>>         > Thanks in advance.
>>         >
>>         >  <https://www.avast.com/sig-
>>         > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
>>         > email&utm_content=3Dwebmail&utm_term=3Dicon>       Virus-free.
>>         > www.avast.com <https://www.avast.com/sig-
>>         > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
>>         > email&utm_content=3Dwebmail&utm_term=3Dlink>
>>
>>
>>         ------------------------------
>>
>>         Subject: Digest Footer
>>
>>         _______________________________________________
>>         tpm2 mailing list
>>         tpm2(a)lists.01.org
>>         https://lists.01.org/mailman/listinfo/tpm2
>>
>>
>>         ------------------------------
>>
>>         End of tpm2 Digest, Vol 21, Issue 2
>>         ***********************************
>>
>>
>>
>>
>> _______________________________________________
>> tpm2 mailing list
>> tpm2(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/tpm2
>>
>
>
> <https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm=
_campaign=3Dsig-email&utm_content=3Dwebmail&utm_term=3Dicon> Virus-free.
> www.avast.com
> <https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm=
_campaign=3Dsig-email&utm_content=3Dwebmail&utm_term=3Dlink>
> <#m_6257261603722230097_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
>

--===============8318752525995066643==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIEFuZHJlYXMuIEkgd2lsbCBjaGVjayB0aGlzIG91dC48ZGl2
Pjxicj48L2Rpdj48ZGl2PkJlc3QsPC9kaXY+PGRpdj5Bcmp1bjwvZGl2PjwvZGl2PjxkaXYgaWQ9
IkRBQjRGQUQ4LTJERDctNDBCQi1BMUI4LTRFMkFBMUY5RkRGMiI+PGJyPgo8dGFibGUgc3R5bGU9
ImJvcmRlci10b3A6MXB4IHNvbGlkICNkM2Q0ZGUiPgoJPHRyPgogICAgICAgIDx0ZCBzdHlsZT0i
d2lkdGg6NTVweDtwYWRkaW5nLXRvcDoxM3B4Ij48YSBocmVmPSJodHRwczovL3d3dy5hdmFzdC5j
b20vc2lnLWVtYWlsP3V0bV9tZWRpdW09ZW1haWwmYW1wO3V0bV9zb3VyY2U9bGluayZhbXA7dXRt
X2NhbXBhaWduPXNpZy1lbWFpbCZhbXA7dXRtX2NvbnRlbnQ9d2VibWFpbCZhbXA7dXRtX3Rlcm09
aWNvbiIgdGFyZ2V0PSJfYmxhbmsiPjxpbWcgc3JjPSJodHRwczovL2lwbWNkbi5hdmFzdC5jb20v
aW1hZ2VzL2ljb25zL2ljb24tZW52ZWxvcGUtdGljay1yb3VuZC1vcmFuZ2UtYW5pbWF0ZWQtbm8t
cmVwZWF0LXYxLmdpZiIgYWx0PSIiIHdpZHRoPSI0NiIgaGVpZ2h0PSIyOSIgc3R5bGU9IndpZHRo
OiA0NnB4OyBoZWlnaHQ6IDI5cHg7Ij48L2E+PC90ZD4KCQk8dGQgc3R5bGU9IndpZHRoOjQ3MHB4
O3BhZGRpbmctdG9wOjEycHg7Y29sb3I6IzQxNDI0ZTtmb250LXNpemU6MTNweDtmb250LWZhbWls
eTpBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtsaW5lLWhlaWdodDoxOHB4Ij5WaXJ1cy1mcmVl
LiA8YSBocmVmPSJodHRwczovL3d3dy5hdmFzdC5jb20vc2lnLWVtYWlsP3V0bV9tZWRpdW09ZW1h
aWwmYW1wO3V0bV9zb3VyY2U9bGluayZhbXA7dXRtX2NhbXBhaWduPXNpZy1lbWFpbCZhbXA7dXRt
X2NvbnRlbnQ9d2VibWFpbCZhbXA7dXRtX3Rlcm09bGluayIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxl
PSJjb2xvcjojNDQ1M2VhIj53d3cuYXZhc3QuY29tPC9hPgoJCTwvdGQ+Cgk8L3RyPgo8L3RhYmxl
PjxhIGhyZWY9IiNEQUI0RkFEOC0yREQ3LTQwQkItQTFCOC00RTJBQTFGOUZERjIiIHdpZHRoPSIx
IiBoZWlnaHQ9IjEiPjwvYT48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYg
ZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUaHUsIE1hciA3LCAyMDE5IGF0IDM6NDAg
UE0gRnVjaHMsIEFuZHJlYXMgJmx0OzxhIGhyZWY9Im1haWx0bzphbmRyZWFzLmZ1Y2hzQHNpdC5m
cmF1bmhvZmVyLmRlIj5hbmRyZWFzLmZ1Y2hzQHNpdC5mcmF1bmhvZmVyLmRlPC9hPiZndDsgd3Jv
dGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0
KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgoKCjxkaXY+CjxkaXYgc3R5bGU9ImRpcmVjdGlvbjpsdHI7
Zm9udC1mYW1pbHk6VGFob21hO2NvbG9yOnJnYigwLDAsMCk7Zm9udC1zaXplOjEwcHQiPgo8ZGl2
PllvdSBjb3VsZCBhbHNvIHVzZSB0aGUgdHBtMi10c3MtZW5naW5lLjwvZGl2Pgo8ZGl2PlNlZSB0
aGlzIHRlc3QgZm9yIGFuIGV4YW1wbGU6PC9kaXY+CjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXRo
dWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MtZW5naW5lL2Jsb2IvbWFzdGVyL3Rlc3QvcnNh
ZGVjcnlwdC5zaCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3
YXJlL3RwbTItdHNzLWVuZ2luZS9ibG9iL21hc3Rlci90ZXN0L3JzYWRlY3J5cHQuc2g8L2E+PC9k
aXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5PciBpZiB5b3UgY2Fubm90IHN0b3JlIGEga2V5LWZp
bGUgb24gZGlzaywgdXNlIHRoZSBhYm92ZSBzY3JpcHQgYW5kIGNvbWJpbmUgaXQgd2l0aCBwZXJz
aXN0ZW50IGtleXMgZnJvbSBoZXJlOjwvZGl2Pgo8ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHVi
LmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzLWVuZ2luZS9ibG9iL21hc3Rlci90ZXN0L3JzYXNp
Z25fcGVyc2lzdGVudF9lbXB0eWF1dGguc2giIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1
Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy1lbmdpbmUvYmxvYi9tYXN0ZXIvdGVzdC9yc2Fz
aWduX3BlcnNpc3RlbnRfZW1wdHlhdXRoLnNoPC9hPjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+Cjxk
aXY+Q2hlZXJzLDwvZGl2Pgo8ZGl2PkFuZHJlYXM8YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+
CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90Oztjb2xv
cjpyZ2IoMCwwLDApO2ZvbnQtc2l6ZToxNnB4Ij4KPGhyPgo8ZGl2IGlkPSJnbWFpbC1tXzYyNTcy
NjE2MDM3MjIyMzAwOTdkaXZScEY1NjA4MyIgc3R5bGU9ImRpcmVjdGlvbjpsdHIiPjxmb250IHNp
emU9IjIiIGZhY2U9IlRhaG9tYSIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiB0cG0yIFs8
YSBocmVmPSJtYWlsdG86dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmc8L2E+XSBvbiBiZWhhbGYgb2YgYXJqdW4ga2FzaHlh
cCBbPGEgaHJlZj0ibWFpbHRvOmFyanVuMjFrQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFy
anVuMjFrQGdtYWlsLmNvbTwvYT5dPGJyPgo8Yj5TZW50OjwvYj4gVGh1cnNkYXksIE1hcmNoIDA3
LCAyMDE5IDIwOjQxPGJyPgo8Yj5Ubzo8L2I+IERlc2FpLCBJbXJhbjsgPGEgaHJlZj0ibWFpbHRv
OndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5y
b2JlcnRzQGludGVsLmNvbTwvYT47IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KPGI+U3ViamVjdDo8L2I+
IFJlOiBbdHBtMl0gdHBtMiBEaWdlc3QsIFZvbCAyMSwgSXNzdWUgMjxicj4KPC9mb250Pjxicj4K
PC9kaXY+CjxkaXY+PC9kaXY+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2IGRpcj0ibHRyIj5U
aGFua3MgV2lsbGlhbSBhbmQgSW1yYW4gZm9yIHlvdXIgaW5wdXRzLiBNeSB1c2UgY2FzZSBpcyB0
aGF0IG9uY2UgbXkgc3lzdGVtIGJvb3RzwqB1cCAod2l0aCB0cG0pIEkgc2hvdWxkIGJlIGFibGUg
dG8gc2VuZCBlbmNyeXB0ZWQgZGF0YSB0byBpdCBvdmVyIHRoZSBuZXR3b3JrLiBJIHRob3VnaHQg
SSBjb3VsZCB1c2UgdGhlIEVLIGFzIGVhY2ggdHBtwqBoYXMgYSB1bmlxdWUgYW5kIGJ1aWx0LWlu
IG9uZS4gTXkgdGhvdWdodAogcHJvY2VzcyB3YXMgdG8gdHJ5IHRvIHVzZSB0aGUgRUsgcHVibGlj
IHBvcnRpb24gdG8gZW5jcnlwdCB0aGUgZGF0YSBhbmQgc2VuZCBpdCBvdmVyIHRoZSBuZXR3b3Jr
IHRvIHRoZSB0cG3CoGFuZCB0aGVuIGRlY3J5cHQgaXQgdXNpbmcgRUsgcHJpdmF0ZSBwb3J0aW9u
LiBBcyBib3RoIG9mIHlvdSBwb2ludGVkIG91dCB0aGF0IEkgc2hvdWxkIHNldCBhcHByb3ByaWF0
ZSBhdHRyaWJ1dGVzIHdoaWxlIGNyZWF0aW5nIHRoZSBrZXkgYW5kIHByZWZlcgogdXNpbmcgdHBt
Ml9jcmVhdGVwcmltYXJ5IGluc3RlYWQgb2YgdHBtMl9jcmVhdGVlay4gQnV0IEkgaGF2ZSBhbm90
aGVyIGNvbmNlcm4gd2l0aCB0aGlzIGFwcHJvYWNoLiBXaXRoIHRwbTJfY3JlYXRlZWsgSSBjb3Vs
ZCBleHRyYWN0IHRoZSBwdWJsaWMga2V5IHBvcnRpb24gb2YgdGhlIEVLIHdoaWNoIGdldHMgY3Jl
YXRlZC4gQnV0IGlmIEkgdXNlIHRwbTJfY3JlYXRlcHJpbWFyeSBJIGRvIG5vdCBoYXZlIHRoYXQg
b3B0aW9uLiBTbyBjb3VsZCB5b3UKIHN1Z2dlc3Qgc29tZSB3b3JrYXJvdW5kPyBBbHNvLCBwbGVh
c2UgZmVlbCBmcmVlIHRvIHN1Z2dlc3QgYW5vdGhlciBhcHByb2FjaCBmb3IgdGhpcyB1c2UgY2Fz
ZS4gS2luZGx5IGNvcnJlY3TCoG1lIGlmIEkgYW0gd3JvbmcgYXMgSSBhbSBuZXcgdG8gdHBtcy4K
PGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlRoYW5rcyBhZ2Fpbiw8L2Rpdj4KPGRpdj5Bcmp1bjwvZGl2
Pgo8L2Rpdj4KPGJyPgo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+CjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIE1hciA1LCAyMDE5IGF0IDM6MjcgUE0gRGVzYWksIElt
cmFuICZsdDs8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiByZWw9Im5vb3Bl
bmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+
Jmd0OyB3cm90ZTo8YnI+CjwvZGl2Pgo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CkZvciB3aGF0IHlvdSB3YW50IHRvIGRvLCB0
cnkgdGhpcy48YnI+Cjxicj4KdHBtMl9jcmVhdGVwcmltYXJ5IC1hIGUgLUcgcnNhIC1BICZxdW90
O2ZpeGVkdHBtfGZpeGVkcGFyZW50fHNlbnNpdGl2ZWRhdGFvcmlnaW58dXNlcndpdGhhdXRofGFk
bWlud2l0aHBvbGljeXxkZWNyeXB0JnF1b3Q7IC1vIGtleS5jdHg8YnI+CnRwbTJfZXZpY3Rjb250
cm9sIC1hIG8gLWMga2V5LmN0eCAtcCAweDgxMDEwMDAyPGJyPgp0cG0yX3JzYWVuY3J5cHQgLWMg
MHg4MTAxMDAwMiAtbyBlbmMub3V0IHBsYWluLnR4dDxicj4KdHBtMl9yc2FkZWNyeXB0IC1jIDB4
ODEwMTAwMDIgLW8gZGVjLm91dCAtSSBlbmMub3V0PGJyPgo8YnI+ClBTOiBJIHdvdWxkIG5vdCB1
c2Ugc3VjaCBhIGtleSBpZiBJIGNhcmVkIGFib3V0IHByaXZhY3kuPGJyPgo8YnI+Cu+7v09uIDMv
NS8xOSwgMTo1MCBQTSwgJnF1b3Q7RGVzYWksIEltcmFuJnF1b3Q7ICZsdDs8YSBocmVmPSJtYWls
dG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+Cjxicj4K
wqAgwqAgKzEgdG8gd2hhdCBCaWxsIHNhaWQuIElmIHlvdSBtdXN0IGRvIHRoaXMgSSYjMzk7ZCBz
dWdnZXN0IHlvdSB1c2UgY3JlYXRlcHJpbWFyeSB0byBjcmVhdGUgdGhlIGtleSB1bmRlciBlbmRv
cnNlbWVudCBoaWVyYXJjaHkuIEkgdW5kZXJzdGFuZCB0aGF0IGlzIGV4YWN0bHkgd2hhdCB0cG0y
X2NyZWF0ZWVrIGRvZXMgYnV0IHRoZXJlIGlzIGEgY2F2ZWF0LiBGb3Igd2hhdCB5b3UgaW50ZW5k
IHRvIGRvIGl0IHJlcXVpcmVzIHVzZXJ3aXRoIGF0dHJpYnV0ZQogc2V0IHRvIDEuIFRoZSByZWFz
b24gaXQgaXMgbm90IHNldCB0byAxIGluIGNyZWF0ZWVrIHRvb2wgaXMgYmVjYXVzZSBpdCB3b3Vs
ZCBjcmVhdGUgYW4gZW5kb3JzZW1lbnQga2V5IG9mZiBhIG5vbiBzdGFuZGFyZCB0ZW1wbGF0ZSBw
ZXIgVENLIEVLIGNyZWRlbnRpYWwgcHJvZmlsZSBzcGVjLiBUaGUgYWx0ZXJuYXRpdmUgaXMgdG8g
c2F0aXNmeSBwb2xpY3lzZWNyZXQgb2YgdGhlIGVuZG9yc2VtZW50IGhpZXJhcmNoeSBhbmQgdGhh
dCB3aWxsIHJlcXVpcmUKIGEgY2hhbmdlIGluIHRoZSB0b29sLjxicj4KPGJyPgrCoCDCoCBPbiAz
LzUvMTksIDE6MDAgUE0sICZxdW90O3RwbTIgb24gYmVoYWxmIG9mIDxhIGhyZWY9Im1haWx0bzp0
cG0yLXJlcXVlc3RAbGlzdHMuMDEub3JnIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj4KdHBtMi1yZXF1ZXN0QGxpc3RzLjAxLm9yZzwvYT4mcXVvdDsgJmx0OzxhIGhy
ZWY9Im1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIiByZWw9Im5vb3BlbmVyIG5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj50cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnPC9hPiBvbiBi
ZWhhbGYgb2YKPGEgaHJlZj0ibWFpbHRvOnRwbTItcmVxdWVzdEBsaXN0cy4wMS5vcmciIHJlbD0i
bm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPgp0cG0yLXJlcXVlc3RAbGlzdHMu
MDEub3JnPC9hPiZndDsgd3JvdGU6PGJyPgo8YnI+CsKgIMKgIMKgIMKgIFNlbmQgdHBtMiBtYWls
aW5nIGxpc3Qgc3VibWlzc2lvbnMgdG88YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxhIGhy
ZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+CnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KPGJyPgrCoCDCoCDCoCDC
oCBUbyBzdWJzY3JpYmUgb3IgdW5zdWJzY3JpYmUgdmlhIHRoZSBXb3JsZCBXaWRlIFdlYiwgdmlz
aXQ8YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEu
b3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+Cmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMjwvYT48YnI+CsKg
IMKgIMKgIMKgIG9yLCB2aWEgZW1haWwsIHNlbmQgYSBtZXNzYWdlIHdpdGggc3ViamVjdCBvciBi
b2R5ICYjMzk7aGVscCYjMzk7IHRvPGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YSBocmVm
PSJtYWlsdG86dHBtMi1yZXF1ZXN0QGxpc3RzLjAxLm9yZyIgcmVsPSJub29wZW5lciBub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+CnRwbTItcmVxdWVzdEBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8
YnI+CsKgIMKgIMKgIMKgIFlvdSBjYW4gcmVhY2ggdGhlIHBlcnNvbiBtYW5hZ2luZyB0aGUgbGlz
dCBhdDxicj4KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGEgaHJlZj0ibWFpbHRvOnRwbTItb3du
ZXJAbGlzdHMuMDEub3JnIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij4KdHBtMi1vd25lckBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8YnI+CsKgIMKgIMKgIMKgIFdoZW4g
cmVwbHlpbmcsIHBsZWFzZSBlZGl0IHlvdXIgU3ViamVjdCBsaW5lIHNvIGl0IGlzIG1vcmUgc3Bl
Y2lmaWM8YnI+CsKgIMKgIMKgIMKgIHRoYW4gJnF1b3Q7UmU6IENvbnRlbnRzIG9mIHRwbTIgZGln
ZXN0Li4uJnF1b3Q7PGJyPgo8YnI+Cjxicj4KwqAgwqAgwqAgwqAgVG9kYXkmIzM5O3MgVG9waWNz
Ojxicj4KPGJyPgrCoCDCoCDCoCDCoCDCoCDCoDEuIFJlOiBVc2UgZW5kb3JzZW1lbnQga2V5IGZv
ciBlbmNyeXB0aW9uIGFuZCBkZWNyeXB0aW9uPGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCAoUm9i
ZXJ0cywgV2lsbGlhbSBDKTxicj4KPGJyPgo8YnI+CsKgIMKgIMKgIMKgIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08
YnI+Cjxicj4KwqAgwqAgwqAgwqAgTWVzc2FnZTogMTxicj4KwqAgwqAgwqAgwqAgRGF0ZTogVHVl
LCA1IE1hciAyMDE5IDE3OjI5OjEwICswMDAwPGJyPgrCoCDCoCDCoCDCoCBGcm9tOiAmcXVvdDtS
b2JlcnRzLCBXaWxsaWFtIEMmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgrCoCDCoCDCoCDCoCBUbzog
YXJqdW4ga2FzaHlhcCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFyanVuMjFrQGdtYWlsLmNvbSIgcmVs
PSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+YXJqdW4yMWtAZ21haWwuY29t
PC9hPiZndDssICZxdW90OzxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgcmVsPSJu
b29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+
JnF1b3Q7PGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRw
bTJAbGlzdHMuMDEub3JnIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgrCoCDCoCDCoCDCoCBTdWJqZWN0OiBSZTog
W3RwbTJdIFVzZSBlbmRvcnNlbWVudCBrZXkgZm9yIGVuY3J5cHRpb24gYW5kIGRlY3J5cHRpb248
YnI+CsKgIMKgIMKgIMKgIE1lc3NhZ2UtSUQ6PGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
bHQ7PGEgaHJlZj0ibWFpbHRvOjQ3NkRDNzZFN0QxREYyNDM4RDMyQkZBREY2NzlGQzU2NDlDRkE2
Q0FAT1JTTVNYMTAxLmFtci5jb3JwLmludGVsLmNvbSIgcmVsPSJub29wZW5lciBub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+NDc2REM3NkU3RDFERjI0MzhEMzJCRkFERjY3OUZDNTY0OUNGQTZD
QUBPUlNNU1gxMDEuYW1yLmNvcnAuaW50ZWwuY29tPC9hPiZndDs8YnI+Cjxicj4KwqAgwqAgwqAg
wqAgQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PSZxdW90O3V0Zi04JnF1b3Q7PGJy
Pgo8YnI+Cjxicj4KPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IEZyb206IHRwbTIgW21haWx0bzo8YSBocmVmPSJtYWls
dG86dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZzwvYT5dIE9uIEJlaGFsZiBP
ZiBhcmp1biBrYXNoeWFwPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IFNlbnQ6IFN1bmRheSwgTWFyY2gg
MywgMjAxOSAxMjo1OCBQTTxicj4KwqAgwqAgwqAgwqAgJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRv
OnRwbTJAbGlzdHMuMDEub3JnIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj4KdHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IFN1YmplY3Q6
IFt0cG0yXSBVc2UgZW5kb3JzZW1lbnQga2V5IGZvciBlbmNyeXB0aW9uIGFuZCBkZWNyeXB0aW9u
PGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IDxicj4KwqAgwqAgwqAgwqAgJmd0OyBIZWxsbyBhbGwsPGJy
PgrCoCDCoCDCoCDCoCAmZ3Q7IDxicj4KwqAgwqAgwqAgwqAgJmd0OyBJIGFtIHVzaW5nIHRoZSBJ
Qk0gdHBtMi4wIHNpbXVsYXRvci4gTXkgdXNlIGNhc2UgaXMgdGhhdCBJIHdvdWxkIGxpa2UgdG8g
ZW5jcnlwdDxicj4KwqAgwqAgwqAgwqAgJmd0OyBkYXRhIGFuZCBzZW5kIHRvIHRwbSBhbmQgdGhl
biBkZWNyeXB0IHRoaXMgYXQgdGhlIHRwbSBzaWRlLiBJIHdvdWxkIHdhbnQgdG8gdXNlPGJyPgrC
oCDCoCDCoCDCoCAmZ3Q7IHRoZSBlbmRvcnNlbWVudCBrZXkgKEVLKSBmb3IgdGhpcyBwdXJwb3Nl
LiBIZW5jZSwgSSB3b3VsZCBsaWtlIHRvIGVuY3J5cHQgZGF0YTxicj4KwqAgwqAgwqAgwqAgJmd0
OyB1c2luZyBFSyYjMzk7cyBwdWJsaWMga2V5IGFuZCBkZWNyeXB0IHVzaW5nIEVLJiMzOTtzIHBy
aXZhdGUga2V5LiBJIHRyaWVkIGNyZWF0aW5nIEVLIHVzaW5nPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7
IHRwbTJfY3JlYXRlZWsgLUcgcnNhIC1mIHBlbSAtYyAtIC1wIGVrLnBlbS4gTm93LCBJIGhhdmUg
dGhlIGVrLnBlbSggcHVibGljPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IHBvcnRpb24gb2YgRUspIHRv
IGVuY3J5cHQgdGhlIGRhdGEuIFdoZW4gSSBsb2FkIHRoaXMga2V5IGludG8gdGhlIHRwbSBhbmQg
aW52b2tlPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IHRwbTJfcnNhZGVjcnlwdCBJIGdldCBhbiBlcnJv
ci4gSSBhbHNvIHRyaWVkIHVzaW5nIHRwbTJfY3JlYXRlcHJpbWFyeSB0byBjcmVhdGU8YnI+CsKg
IMKgIMKgIMKgICZndDsgYW4gRUsgYnV0IGZhaWxlZCBpbiB0aGUgYWJvdmUgYXR0ZW1wdC4gQ291
bGQgYW55b25lIHBsZWFzZSBoZWxwIG1lIG91dCBzbyB0aGF0IEk8YnI+CsKgIMKgIMKgIMKgICZn
dDsgY2FuIHVzZSBFSyB0byBlbmNyeXB0L2RlY3J5cHQgZGF0YS48YnI+CsKgIMKgIMKgIMKgICZn
dDsgPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IFBsZWFzZSBsZXQgbWUga25vdyBpZiBtb3JlIGluZm9y
bWF0aW9uIGlzIG5lZWRlZC48YnI+Cjxicj4KwqAgwqAgwqAgwqAgV2hhdCYjMzk7cyB0aGUgZXJy
b3IgY29kZT8gWW91IHByb2JhYmx5IGNhbiYjMzk7dCBwZXJmb3JtIGFuIHJzYWRlY3J5cHQsPGJy
PgrCoCDCoCDCoCDCoCBEbyB0byBvYmplY3QgYXR0cmlidXRlcy4gSSB3b3VsZCBiZXQgc2lnbiB3
b3VsZCB3b3JrLiBFbmRvcnNlbWVudDxicj4KwqAgwqAgwqAgwqAgdXN1YWxseSBtZWFucyBzaWdu
aW5nLjxicj4KPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IDxicj4KwqAgwqAgwqAgwqAgJmd0OyBUaGFu
a3MgaW4gYWR2YW5jZS48YnI+CsKgIMKgIMKgIMKgICZndDsgPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7
wqAgJmx0OzxhIGhyZWY9Imh0dHBzOi8vd3d3LmF2YXN0LmNvbS9zaWctIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3d3dy5hdmFzdC5jb20vc2lnLTwvYT48YnI+CsKg
IMKgIMKgIMKgICZndDsgZW1haWw/dXRtX21lZGl1bT1lbWFpbCZhbXA7dXRtX3NvdXJjZT1saW5r
JmFtcDt1dG1fY2FtcGFpZ249c2lnLTxicj4KwqAgwqAgwqAgwqAgJmd0OyBlbWFpbCZhbXA7dXRt
X2NvbnRlbnQ9d2VibWFpbCZhbXA7dXRtX3Rlcm09aWNvbiZndDvCoCDCoCDCoCDCoFZpcnVzLWZy
ZWUuPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IDxhIGhyZWY9Imh0dHA6Ly93d3cuYXZhc3QuY29tIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj53d3cuYXZhc3QuY29tPC9hPiAmbHQ7PGEg
aHJlZj0iaHR0cHM6Ly93d3cuYXZhc3QuY29tL3NpZy0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vd3d3LmF2YXN0LmNvbS9zaWctPC9hPjxicj4KwqAgwqAgwqAgwqAg
Jmd0OyBlbWFpbD91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWxpbmsmYW1wO3V0bV9j
YW1wYWlnbj1zaWctPGJyPgrCoCDCoCDCoCDCoCAmZ3Q7IGVtYWlsJmFtcDt1dG1fY29udGVudD13
ZWJtYWlsJmFtcDt1dG1fdGVybT1saW5rJmd0Ozxicj4KPGJyPgo8YnI+CsKgIMKgIMKgIMKgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KPGJyPgrCoCDCoCDCoCDCoCBTdWJqZWN0
OiBEaWdlc3QgRm9vdGVyPGJyPgo8YnI+CsKgIMKgIMKgIMKgIF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgrCoCDCoCDCoCDCoCB0cG0yIG1haWxpbmcg
bGlzdDxicj4KwqAgwqAgwqAgwqAgPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiBy
ZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4KdHBtMkBsaXN0cy4wMS5v
cmc8L2E+PGJyPgrCoCDCoCDCoCDCoCA8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3RwbTIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPgpodHRw
czovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3RwbTI8L2E+PGJyPgo8YnI+Cjxicj4K
wqAgwqAgwqAgwqAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPgo8YnI+CsKgIMKg
IMKgIMKgIEVuZCBvZiB0cG0yIERpZ2VzdCwgVm9sIDIxLCBJc3N1ZSAyPGJyPgrCoCDCoCDCoCDC
oCAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjxicj4KPGJyPgo8YnI+Cjxicj4K
PGJyPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4K
dHBtMiBtYWlsaW5nIGxpc3Q8YnI+CjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIg
cmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5v
cmc8L2E+PGJyPgo8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3RwbTIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEu
b3JnL21haWxtYW4vbGlzdGluZm8vdHBtMjwvYT48YnI+CjwvYmxvY2txdW90ZT4KPC9kaXY+Cjwv
ZGl2Pgo8ZGl2IGlkPSJnbWFpbC1tXzYyNTcyNjE2MDM3MjIyMzAwOTdEQUI0RkFEOC0yREQ3LTQw
QkItQTFCOC00RTJBQTFGOUZERjIiPjxicj4KPHRhYmxlIHN0eWxlPSJib3JkZXItdG9wOjFweCBz
b2xpZCByZ2IoMjExLDIxMiwyMjIpIj4KPHRib2R5Pgo8dHI+Cjx0ZCBzdHlsZT0id2lkdGg6NTVw
eDtwYWRkaW5nLXRvcDoxM3B4Ij48YSBocmVmPSJodHRwczovL3d3dy5hdmFzdC5jb20vc2lnLWVt
YWlsP3V0bV9tZWRpdW09ZW1haWwmYW1wO3V0bV9zb3VyY2U9bGluayZhbXA7dXRtX2NhbXBhaWdu
PXNpZy1lbWFpbCZhbXA7dXRtX2NvbnRlbnQ9d2VibWFpbCZhbXA7dXRtX3Rlcm09aWNvbiIgcmVs
PSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+PGltZyBzcmM9Imh0dHBzOi8v
aXBtY2RuLmF2YXN0LmNvbS9pbWFnZXMvaWNvbnMvaWNvbi1lbnZlbG9wZS10aWNrLXJvdW5kLW9y
YW5nZS1hbmltYXRlZC1uby1yZXBlYXQtdjEuZ2lmIiBhbHQ9IiIgc3R5bGU9IndpZHRoOiA0NnB4
OyBoZWlnaHQ6IDI5cHg7IiB3aWR0aD0iNDYiIGhlaWdodD0iMjkiPjwvYT48L3RkPgo8dGQgc3R5
bGU9IndpZHRoOjQ3MHB4O3BhZGRpbmctdG9wOjEycHg7Y29sb3I6cmdiKDY1LDY2LDc4KTtmb250
LXNpemU6MTNweDtmb250LWZhbWlseTpBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtsaW5lLWhl
aWdodDoxOHB4Ij4KVmlydXMtZnJlZS4gPGEgaHJlZj0iaHR0cHM6Ly93d3cuYXZhc3QuY29tL3Np
Zy1lbWFpbD91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWxpbmsmYW1wO3V0bV9jYW1w
YWlnbj1zaWctZW1haWwmYW1wO3V0bV9jb250ZW50PXdlYm1haWwmYW1wO3V0bV90ZXJtPWxpbmsi
IHN0eWxlPSJjb2xvcjpyZ2IoNjgsODMsMjM0KSIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+Cnd3dy5hdmFzdC5jb208L2E+IDwvdGQ+CjwvdHI+CjwvdGJvZHk+Cjwv
dGFibGU+CjxhIGhyZWY9IiNtXzYyNTcyNjE2MDM3MjIyMzAwOTdfREFCNEZBRDgtMkRENy00MEJC
LUExQjgtNEUyQUExRjlGREYyIiBoZWlnaHQ9IjEiIHdpZHRoPSIxIj48L2E+PC9kaXY+CjwvZGl2
Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2PgoKPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============8318752525995066643==--

