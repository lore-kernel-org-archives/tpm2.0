Content-Type: multipart/mixed; boundary="===============5162588966461007117=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 2
Date: Thu, 07 Mar 2019 21:40:11 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0162E6CAA6@exch2010c.sit.fraunhofer.de>
In-Reply-To: CA+tUB7DBmVzXwDsHjk4ud5rkspbBGjY-=Cw1pG2oBJu9k36x1Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5162588966461007117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You could also use the tpm2-tss-engine.
See this test for an example:
https://github.com/tpm2-software/tpm2-tss-engine/blob/master/test/rsadecryp=
t.sh

Or if you cannot store a key-file on disk, use the above script and combine=
 it with persistent keys from here:
https://github.com/tpm2-software/tpm2-tss-engine/blob/master/test/rsasign_p=
ersistent_emptyauth.sh

Cheers,
Andreas

________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of arjun kashyap [arjun2=
1k(a)gmail.com]
Sent: Thursday, March 07, 2019 20:41
To: Desai, Imran; william.c.roberts(a)intel.com; tpm2(a)lists.01.org
Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 2

Thanks William and Imran for your inputs. My use case is that once my syste=
m boots up (with tpm) I should be able to send encrypted data to it over th=
e network. I thought I could use the EK as each tpm has a unique and built-=
in one. My thought process was to try to use the EK public portion to encry=
pt the data and send it over the network to the tpm and then decrypt it usi=
ng EK private portion. As both of you pointed out that I should set appropr=
iate attributes while creating the key and prefer using tpm2_createprimary =
instead of tpm2_createek. But I have another concern with this approach. Wi=
th tpm2_createek I could extract the public key portion of the EK which get=
s created. But if I use tpm2_createprimary I do not have that option. So co=
uld you suggest some workaround? Also, please feel free to suggest another =
approach for this use case. Kindly correct me if I am wrong as I am new to =
tpms.

Thanks again,
Arjun

On Tue, Mar 5, 2019 at 3:27 PM Desai, Imran <imran.desai(a)intel.com<mailto=
:imran.desai(a)intel.com>> wrote:
For what you want to do, try this.

tpm2_createprimary -a e -G rsa -A "fixedtpm|fixedparent|sensitivedataorigin=
|userwithauth|adminwithpolicy|decrypt" -o key.ctx
tpm2_evictcontrol -a o -c key.ctx -p 0x81010002
tpm2_rsaencrypt -c 0x81010002 -o enc.out plain.txt
tpm2_rsadecrypt -c 0x81010002 -o dec.out -I enc.out

PS: I would not use such a key if I cared about privacy.

=EF=BB=BFOn 3/5/19, 1:50 PM, "Desai, Imran" <imran.desai(a)intel.com<mailto=
:imran.desai(a)intel.com>> wrote:

    +1 to what Bill said. If you must do this I'd suggest you use createpri=
mary to create the key under endorsement hierarchy. I understand that is ex=
actly what tpm2_createek does but there is a caveat. For what you intend to=
 do it requires userwith attribute set to 1. The reason it is not set to 1 =
in createek tool is because it would create an endorsement key off a non st=
andard template per TCK EK credential profile spec. The alternative is to s=
atisfy policysecret of the endorsement hierarchy and that will require a ch=
ange in the tool.

    On 3/5/19, 1:00 PM, "tpm2 on behalf of tpm2-request(a)lists.01.org<mail=
to:tpm2-request(a)lists.01.org>" <tpm2-bounces(a)lists.01.org<mailto:tpm2-b=
ounces(a)lists.01.org> on behalf of tpm2-request(a)lists.01.org<mailto:tpm2=
-request(a)lists.01.org>> wrote:

        Send tpm2 mailing list submissions to
                tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>

        To subscribe or unsubscribe via the World Wide Web, visit
                https://lists.01.org/mailman/listinfo/tpm2
        or, via email, send a message with subject or body 'help' to
                tpm2-request(a)lists.01.org<mailto:tpm2-request(a)lists.01.=
org>

        You can reach the person managing the list at
                tpm2-owner(a)lists.01.org<mailto:tpm2-owner(a)lists.01.org>

        When replying, please edit your Subject line so it is more specific
        than "Re: Contents of tpm2 digest..."


        Today's Topics:

           1. Re: Use endorsement key for encryption and decryption
              (Roberts, William C)


        -------------------------------------------------------------------=
---

        Message: 1
        Date: Tue, 5 Mar 2019 17:29:10 +0000
        From: "Roberts, William C" <william.c.roberts(a)intel.com<mailto:wi=
lliam.c.roberts(a)intel.com>>
        To: arjun kashyap <arjun21k(a)gmail.com<mailto:arjun21k(a)gmail.com=
>>, "tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>"
                <tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>>
        Subject: Re: [tpm2] Use endorsement key for encryption and decrypti=
on
        Message-ID:
                <476DC76E7D1DF2438D32BFADF679FC5649CFA6CA(a)ORSMSX101.amr.c=
orp.intel.com<mailto:476DC76E7D1DF2438D32BFADF679FC5649CFA6CA(a)ORSMSX101.a=
mr.corp.intel.com>>

        Content-Type: text/plain; charset=3D"utf-8"



        > -----Original Message-----
        > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org<mailto:tpm2-bounce=
s(a)lists.01.org>] On Behalf Of arjun kashyap
        > Sent: Sunday, March 3, 2019 12:58 PM
        > To: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
        > Subject: [tpm2] Use endorsement key for encryption and decryption
        >
        > Hello all,
        >
        > I am using the IBM tpm2.0 simulator. My use case is that I would =
like to encrypt
        > data and send to tpm and then decrypt this at the tpm side. I wou=
ld want to use
        > the endorsement key (EK) for this purpose. Hence, I would like to=
 encrypt data
        > using EK's public key and decrypt using EK's private key. I tried=
 creating EK using
        > tpm2_createek -G rsa -f pem -c - -p ek.pem. Now, I have the ek.pe=
m( public
        > portion of EK) to encrypt the data. When I load this key into the=
 tpm and invoke
        > tpm2_rsadecrypt I get an error. I also tried using tpm2_createpri=
mary to create
        > an EK but failed in the above attempt. Could anyone please help m=
e out so that I
        > can use EK to encrypt/decrypt data.
        >
        > Please let me know if more information is needed.

        What's the error code? You probably can't perform an rsadecrypt,
        Do to object attributes. I would bet sign would work. Endorsement
        usually means signing.

        >
        > Thanks in advance.
        >
        >  <https://www.avast.com/sig-
        > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
        > email&utm_content=3Dwebmail&utm_term=3Dicon>       Virus-free.
        > www.avast.com<http://www.avast.com> <https://www.avast.com/sig-
        > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
        > email&utm_content=3Dwebmail&utm_term=3Dlink>


        ------------------------------

        Subject: Digest Footer

        _______________________________________________
        tpm2 mailing list
        tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
        https://lists.01.org/mailman/listinfo/tpm2


        ------------------------------

        End of tpm2 Digest, Vol 21, Issue 2
        ***********************************




_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
https://lists.01.org/mailman/listinfo/tpm2

[https://ipmcdn.avast.com/images/icons/icon-envelope-tick-round-orange-anim=
ated-no-repeat-v1.gif]<https://www.avast.com/sig-email?utm_medium=3Demail&u=
tm_source=3Dlink&utm_campaign=3Dsig-email&utm_content=3Dwebmail&utm_term=3D=
icon>    Virus-free. www.avast.com<https://www.avast.com/sig-email?utm_medi=
um=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-email&utm_content=3Dwebmail=
&utm_term=3Dlink>

--===============5162588966461007117==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUi
IGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8c3R5bGUgdHlwZT0idGV4dC9j
c3MiIGlkPSJvd2FQYXJhU3R5bGUiPlAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fTwv
c3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBmcHN0eWxlPSIxIiBvY3NpPSIwIj4NCjxkaXYgc3R5bGU9
ImRpcmVjdGlvbjogbHRyO2ZvbnQtZmFtaWx5OiBUYWhvbWE7Y29sb3I6ICMwMDAwMDA7Zm9udC1z
aXplOiAxMHB0OyI+DQo8ZGl2PllvdSBjb3VsZCBhbHNvIHVzZSB0aGUgdHBtMi10c3MtZW5naW5l
LjwvZGl2Pg0KPGRpdj5TZWUgdGhpcyB0ZXN0IGZvciBhbiBleGFtcGxlOjwvZGl2Pg0KPGRpdj48
YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy1lbmdpbmUv
YmxvYi9tYXN0ZXIvdGVzdC9yc2FkZWNyeXB0LnNoIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9n
aXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MtZW5naW5lL2Jsb2IvbWFzdGVyL3Rlc3Qv
cnNhZGVjcnlwdC5zaDwvYT48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pk9yIGlmIHlv
dSBjYW5ub3Qgc3RvcmUgYSBrZXktZmlsZSBvbiBkaXNrLCB1c2UgdGhlIGFib3ZlIHNjcmlwdCBh
bmQgY29tYmluZSBpdCB3aXRoIHBlcnNpc3RlbnQga2V5cyBmcm9tIGhlcmU6PC9kaXY+DQo8ZGl2
PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzLWVuZ2lu
ZS9ibG9iL21hc3Rlci90ZXN0L3JzYXNpZ25fcGVyc2lzdGVudF9lbXB0eWF1dGguc2giIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy1lbmdp
bmUvYmxvYi9tYXN0ZXIvdGVzdC9yc2FzaWduX3BlcnNpc3RlbnRfZW1wdHlhdXRoLnNoPC9hPjwv
ZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+Q2hlZXJzLDwvZGl2Pg0KPGRpdj5BbmRyZWFz
PGJyPg0KPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IFRpbWVzIE5ldyBSb21hbjsgY29sb3I6ICMwMDAwMDA7IGZvbnQtc2l6ZTogMTZweCI+DQo8aHIg
dGFiaW5kZXg9Ii0xIj4NCjxkaXYgaWQ9ImRpdlJwRjU2MDgzIiBzdHlsZT0iZGlyZWN0aW9uOiBs
dHI7Ij48Zm9udCBzaXplPSIyIiBmYWNlPSJUYWhvbWEiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9t
OjwvYj4gdHBtMiBbdHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZ10gb24gYmVoYWxmIG9mIGFyanVu
IGthc2h5YXAgW2FyanVuMjFrQGdtYWlsLmNvbV08YnI+DQo8Yj5TZW50OjwvYj4gVGh1cnNkYXks
IE1hcmNoIDA3LCAyMDE5IDIwOjQxPGJyPg0KPGI+VG86PC9iPiBEZXNhaSwgSW1yYW47IHdpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbTsgdHBtMkBsaXN0cy4wMS5vcmc8YnI+DQo8Yj5TdWJqZWN0
OjwvYj4gUmU6IFt0cG0yXSB0cG0yIERpZ2VzdCwgVm9sIDIxLCBJc3N1ZSAyPGJyPg0KPC9mb250
Pjxicj4NCjwvZGl2Pg0KPGRpdj48L2Rpdj4NCjxkaXY+DQo8ZGl2IGRpcj0ibHRyIj4NCjxkaXYg
ZGlyPSJsdHIiPlRoYW5rcyBXaWxsaWFtIGFuZCBJbXJhbiBmb3IgeW91ciBpbnB1dHMuIE15IHVz
ZSBjYXNlIGlzIHRoYXQgb25jZSBteSBzeXN0ZW0gYm9vdHMmbmJzcDt1cCAod2l0aCB0cG0pIEkg
c2hvdWxkIGJlIGFibGUgdG8gc2VuZCBlbmNyeXB0ZWQgZGF0YSB0byBpdCBvdmVyIHRoZSBuZXR3
b3JrLiBJIHRob3VnaHQgSSBjb3VsZCB1c2UgdGhlIEVLIGFzIGVhY2ggdHBtJm5ic3A7aGFzIGEg
dW5pcXVlIGFuZCBidWlsdC1pbiBvbmUuIE15IHRob3VnaHQNCiBwcm9jZXNzIHdhcyB0byB0cnkg
dG8gdXNlIHRoZSBFSyBwdWJsaWMgcG9ydGlvbiB0byBlbmNyeXB0IHRoZSBkYXRhIGFuZCBzZW5k
IGl0IG92ZXIgdGhlIG5ldHdvcmsgdG8gdGhlIHRwbSZuYnNwO2FuZCB0aGVuIGRlY3J5cHQgaXQg
dXNpbmcgRUsgcHJpdmF0ZSBwb3J0aW9uLiBBcyBib3RoIG9mIHlvdSBwb2ludGVkIG91dCB0aGF0
IEkgc2hvdWxkIHNldCBhcHByb3ByaWF0ZSBhdHRyaWJ1dGVzIHdoaWxlIGNyZWF0aW5nIHRoZSBr
ZXkgYW5kIHByZWZlcg0KIHVzaW5nIHRwbTJfY3JlYXRlcHJpbWFyeSBpbnN0ZWFkIG9mIHRwbTJf
Y3JlYXRlZWsuIEJ1dCBJIGhhdmUgYW5vdGhlciBjb25jZXJuIHdpdGggdGhpcyBhcHByb2FjaC4g
V2l0aCB0cG0yX2NyZWF0ZWVrIEkgY291bGQgZXh0cmFjdCB0aGUgcHVibGljIGtleSBwb3J0aW9u
IG9mIHRoZSBFSyB3aGljaCBnZXRzIGNyZWF0ZWQuIEJ1dCBpZiBJIHVzZSB0cG0yX2NyZWF0ZXBy
aW1hcnkgSSBkbyBub3QgaGF2ZSB0aGF0IG9wdGlvbi4gU28gY291bGQgeW91DQogc3VnZ2VzdCBz
b21lIHdvcmthcm91bmQ/IEFsc28sIHBsZWFzZSBmZWVsIGZyZWUgdG8gc3VnZ2VzdCBhbm90aGVy
IGFwcHJvYWNoIGZvciB0aGlzIHVzZSBjYXNlLiBLaW5kbHkgY29ycmVjdCZuYnNwO21lIGlmIEkg
YW0gd3JvbmcgYXMgSSBhbSBuZXcgdG8gdHBtcy4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlRo
YW5rcyBhZ2Fpbiw8L2Rpdj4NCjxkaXY+QXJqdW48L2Rpdj4NCjwvZGl2Pg0KPGJyPg0KPGRpdiBj
bGFzcz0iZ21haWxfcXVvdGUiPg0KPGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9u
IFR1ZSwgTWFyIDUsIDIwMTkgYXQgMzoyNyBQTSBEZXNhaSwgSW1yYW4gJmx0OzxhIGhyZWY9Im1h
aWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVy
IG5vcmVmZXJyZXIiPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4NCjwv
ZGl2Pg0KPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAw
cHggMHB4IDAuOGV4OyBib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTsgcGFk
ZGluZy1sZWZ0OjFleCI+DQpGb3Igd2hhdCB5b3Ugd2FudCB0byBkbywgdHJ5IHRoaXMuPGJyPg0K
PGJyPg0KdHBtMl9jcmVhdGVwcmltYXJ5IC1hIGUgLUcgcnNhIC1BICZxdW90O2ZpeGVkdHBtfGZp
eGVkcGFyZW50fHNlbnNpdGl2ZWRhdGFvcmlnaW58dXNlcndpdGhhdXRofGFkbWlud2l0aHBvbGlj
eXxkZWNyeXB0JnF1b3Q7IC1vIGtleS5jdHg8YnI+DQp0cG0yX2V2aWN0Y29udHJvbCAtYSBvIC1j
IGtleS5jdHggLXAgMHg4MTAxMDAwMjxicj4NCnRwbTJfcnNhZW5jcnlwdCAtYyAweDgxMDEwMDAy
IC1vIGVuYy5vdXQgcGxhaW4udHh0PGJyPg0KdHBtMl9yc2FkZWNyeXB0IC1jIDB4ODEwMTAwMDIg
LW8gZGVjLm91dCAtSSBlbmMub3V0PGJyPg0KPGJyPg0KUFM6IEkgd291bGQgbm90IHVzZSBzdWNo
IGEga2V5IGlmIEkgY2FyZWQgYWJvdXQgcHJpdmFjeS48YnI+DQo8YnI+DQrvu79PbiAzLzUvMTks
IDE6NTAgUE0sICZxdW90O0Rlc2FpLCBJbXJhbiZxdW90OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmlt
cmFuLmRlc2FpQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9vcGVuZXIgbm9yZWZl
cnJlciI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPg0KPGJyPg0KJm5i
c3A7ICZuYnNwOyAmIzQzOzEgdG8gd2hhdCBCaWxsIHNhaWQuIElmIHlvdSBtdXN0IGRvIHRoaXMg
SSdkIHN1Z2dlc3QgeW91IHVzZSBjcmVhdGVwcmltYXJ5IHRvIGNyZWF0ZSB0aGUga2V5IHVuZGVy
IGVuZG9yc2VtZW50IGhpZXJhcmNoeS4gSSB1bmRlcnN0YW5kIHRoYXQgaXMgZXhhY3RseSB3aGF0
IHRwbTJfY3JlYXRlZWsgZG9lcyBidXQgdGhlcmUgaXMgYSBjYXZlYXQuIEZvciB3aGF0IHlvdSBp
bnRlbmQgdG8gZG8gaXQgcmVxdWlyZXMgdXNlcndpdGggYXR0cmlidXRlDQogc2V0IHRvIDEuIFRo
ZSByZWFzb24gaXQgaXMgbm90IHNldCB0byAxIGluIGNyZWF0ZWVrIHRvb2wgaXMgYmVjYXVzZSBp
dCB3b3VsZCBjcmVhdGUgYW4gZW5kb3JzZW1lbnQga2V5IG9mZiBhIG5vbiBzdGFuZGFyZCB0ZW1w
bGF0ZSBwZXIgVENLIEVLIGNyZWRlbnRpYWwgcHJvZmlsZSBzcGVjLiBUaGUgYWx0ZXJuYXRpdmUg
aXMgdG8gc2F0aXNmeSBwb2xpY3lzZWNyZXQgb2YgdGhlIGVuZG9yc2VtZW50IGhpZXJhcmNoeSBh
bmQgdGhhdCB3aWxsIHJlcXVpcmUNCiBhIGNoYW5nZSBpbiB0aGUgdG9vbC48YnI+DQo8YnI+DQom
bmJzcDsgJm5ic3A7IE9uIDMvNS8xOSwgMTowMCBQTSwgJnF1b3Q7dHBtMiBvbiBiZWhhbGYgb2Yg
PGEgaHJlZj0ibWFpbHRvOnRwbTItcmVxdWVzdEBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPg0KdHBtMi1yZXF1ZXN0QGxpc3RzLjAxLm9yZzwv
YT4mcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIiB0
YXJnZXQ9Il9ibGFuayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj50cG0yLWJvdW5jZXNAbGlz
dHMuMDEub3JnPC9hPiBvbiBiZWhhbGYgb2YNCjxhIGhyZWY9Im1haWx0bzp0cG0yLXJlcXVlc3RA
bGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj4N
CnRwbTItcmVxdWVzdEBsaXN0cy4wMS5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+DQo8YnI+DQombmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgU2VuZCB0cG0yIG1haWxpbmcgbGlzdCBzdWJtaXNzaW9u
cyB0bzxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj4NCnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4N
Cjxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBUbyBzdWJzY3JpYmUgb3IgdW5zdWJz
Y3JpYmUgdmlhIHRoZSBXb3JsZCBXaWRlIFdlYiwgdmlzaXQ8YnI+DQombmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDxhIGhyZWY9Imh0dHBzOi8v
bGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+DQpodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3RwbTI8
L2E+PGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IG9yLCB2aWEgZW1haWwsIHNlbmQg
YSBtZXNzYWdlIHdpdGggc3ViamVjdCBvciBib2R5ICdoZWxwJyB0bzxicj4NCiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgPGEgaHJlZj0ibWFp
bHRvOnRwbTItcmVxdWVzdEBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3Bl
bmVyIG5vcmVmZXJyZXIiPg0KdHBtMi1yZXF1ZXN0QGxpc3RzLjAxLm9yZzwvYT48YnI+DQo8YnI+
DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgWW91IGNhbiByZWFjaCB0aGUgcGVyc29uIG1h
bmFnaW5nIHRoZSBsaXN0IGF0PGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA8YSBocmVmPSJtYWlsdG86dHBtMi1vd25lckBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPg0KdHBtMi1v
d25lckBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7IFdoZW4gcmVwbHlpbmcsIHBsZWFzZSBlZGl0IHlvdXIgU3ViamVjdCBsaW5lIHNvIGl0IGlz
IG1vcmUgc3BlY2lmaWM8YnI+DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgdGhhbiAmcXVv
dDtSZTogQ29udGVudHMgb2YgdHBtMiBkaWdlc3QuLi4mcXVvdDs8YnI+DQo8YnI+DQo8YnI+DQom
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgVG9kYXkncyBUb3BpY3M6PGJyPg0KPGJyPg0KJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsxLiBSZTogVXNlIGVuZG9yc2Vt
ZW50IGtleSBmb3IgZW5jcnlwdGlvbiBhbmQgZGVjcnlwdGlvbjxicj4NCiZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAoUm9iZXJ0cywgV2lsbGlhbSBDKTxi
cj4NCjxicj4NCjxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
PGJyPg0KPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IE1lc3NhZ2U6IDE8YnI+DQom
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgRGF0ZTogVHVlLCA1IE1hciAyMDE5IDE3OjI5OjEw
ICYjNDM7MDAwMDxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBGcm9tOiAmcXVvdDtS
b2JlcnRzLCBXaWxsaWFtIEMmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIi
PndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PGJyPg0KJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IFRvOiBhcmp1biBrYXNoeWFwICZsdDs8YSBocmVmPSJtYWlsdG86YXJqdW4y
MWtAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5h
cmp1bjIxa0BnbWFpbC5jb208L2E+Jmd0OywgJnF1b3Q7PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj50cG0y
QGxpc3RzLjAxLm9yZzwvYT4mcXVvdDs8YnI+DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0
cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPnRwbTJA
bGlzdHMuMDEub3JnPC9hPiZndDs8YnI+DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgU3Vi
amVjdDogUmU6IFt0cG0yXSBVc2UgZW5kb3JzZW1lbnQga2V5IGZvciBlbmNyeXB0aW9uIGFuZCBk
ZWNyeXB0aW9uPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IE1lc3NhZ2UtSUQ6PGJy
Pg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOjQ3NkRDNzZFN0QxREYyNDM4RDMyQkZBREY2NzlGQzU2NDlD
RkE2Q0FAT1JTTVNYMTAxLmFtci5jb3JwLmludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0i
bm9vcGVuZXIgbm9yZWZlcnJlciI+NDc2REM3NkU3RDFERjI0MzhEMzJCRkFERjY3OUZDNTY0OUNG
QTZDQUBPUlNNU1gxMDEuYW1yLmNvcnAuaW50ZWwuY29tPC9hPiZndDs8YnI+DQo8YnI+DQombmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0
PSZxdW90O3V0Zi04JnF1b3Q7PGJyPg0KPGJyPg0KPGJyPg0KPGJyPg0KJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+DQombmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJmd0OyBGcm9tOiB0cG0yIFttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3Bl
bmVyIG5vcmVmZXJyZXIiPnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmc8L2E+XSBPbiBCZWhhbGYg
T2YgYXJqdW4ga2FzaHlhcDxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmZ3Q7IFNl
bnQ6IFN1bmRheSwgTWFyY2ggMywgMjAxOSAxMjo1OCBQTTxicj4NCiZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmZ3Q7IFRvOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPg0KdHBtMkBsaXN0cy4wMS5v
cmc8L2E+PGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZndDsgU3ViamVjdDogW3Rw
bTJdIFVzZSBlbmRvcnNlbWVudCBrZXkgZm9yIGVuY3J5cHRpb24gYW5kIGRlY3J5cHRpb248YnI+
DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJmd0OyA8YnI+DQombmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJmd0OyBIZWxsbyBhbGwsPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZndDsgPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZndDsgSSBhbSB1c2lu
ZyB0aGUgSUJNIHRwbTIuMCBzaW11bGF0b3IuIE15IHVzZSBjYXNlIGlzIHRoYXQgSSB3b3VsZCBs
aWtlIHRvIGVuY3J5cHQ8YnI+DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJmd0OyBkYXRh
IGFuZCBzZW5kIHRvIHRwbSBhbmQgdGhlbiBkZWNyeXB0IHRoaXMgYXQgdGhlIHRwbSBzaWRlLiBJ
IHdvdWxkIHdhbnQgdG8gdXNlPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZndDsg
dGhlIGVuZG9yc2VtZW50IGtleSAoRUspIGZvciB0aGlzIHB1cnBvc2UuIEhlbmNlLCBJIHdvdWxk
IGxpa2UgdG8gZW5jcnlwdCBkYXRhPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZn
dDsgdXNpbmcgRUsncyBwdWJsaWMga2V5IGFuZCBkZWNyeXB0IHVzaW5nIEVLJ3MgcHJpdmF0ZSBr
ZXkuIEkgdHJpZWQgY3JlYXRpbmcgRUsgdXNpbmc8YnI+DQombmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJmd0OyB0cG0yX2NyZWF0ZWVrIC1HIHJzYSAtZiBwZW0gLWMgLSAtcCBlay5wZW0uIE5v
dywgSSBoYXZlIHRoZSBlay5wZW0oIHB1YmxpYzxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmZ3Q7IHBvcnRpb24gb2YgRUspIHRvIGVuY3J5cHQgdGhlIGRhdGEuIFdoZW4gSSBsb2Fk
IHRoaXMga2V5IGludG8gdGhlIHRwbSBhbmQgaW52b2tlPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZndDsgdHBtMl9yc2FkZWNyeXB0IEkgZ2V0IGFuIGVycm9yLiBJIGFsc28gdHJp
ZWQgdXNpbmcgdHBtMl9jcmVhdGVwcmltYXJ5IHRvIGNyZWF0ZTxicj4NCiZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmZ3Q7IGFuIEVLIGJ1dCBmYWlsZWQgaW4gdGhlIGFib3ZlIGF0dGVtcHQu
IENvdWxkIGFueW9uZSBwbGVhc2UgaGVscCBtZSBvdXQgc28gdGhhdCBJPGJyPg0KJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZndDsgY2FuIHVzZSBFSyB0byBlbmNyeXB0L2RlY3J5cHQgZGF0
YS48YnI+DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJmd0OyA8YnI+DQombmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJmd0OyBQbGVhc2UgbGV0IG1lIGtub3cgaWYgbW9yZSBpbmZvcm1h
dGlvbiBpcyBuZWVkZWQuPGJyPg0KPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IFdo
YXQncyB0aGUgZXJyb3IgY29kZT8gWW91IHByb2JhYmx5IGNhbid0IHBlcmZvcm0gYW4gcnNhZGVj
cnlwdCw8YnI+DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgRG8gdG8gb2JqZWN0IGF0dHJp
YnV0ZXMuIEkgd291bGQgYmV0IHNpZ24gd291bGQgd29yay4gRW5kb3JzZW1lbnQ8YnI+DQombmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgdXN1YWxseSBtZWFucyBzaWduaW5nLjxicj4NCjxicj4N
CiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmZ3Q7IDxicj4NCiZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmZ3Q7IFRoYW5rcyBpbiBhZHZhbmNlLjxicj4NCiZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmZ3Q7IDxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmZ3Q7Jm5i
c3A7ICZsdDs8YSBocmVmPSJodHRwczovL3d3dy5hdmFzdC5jb20vc2lnLSIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly93d3cuYXZhc3QuY29tL3NpZy08L2E+PGJyPg0K
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZndDsgZW1haWw/dXRtX21lZGl1bT1lbWFpbCZh
bXA7dXRtX3NvdXJjZT1saW5rJmFtcDt1dG1fY2FtcGFpZ249c2lnLTxicj4NCiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmZ3Q7IGVtYWlsJmFtcDt1dG1fY29udGVudD13ZWJtYWlsJmFtcDt1
dG1fdGVybT1pY29uJmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO1ZpcnVzLWZyZWUuPGJy
Pg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZndDsgPGEgaHJlZj0iaHR0cDovL3d3dy5h
dmFzdC5jb20iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnd3dy5hdmFzdC5jb208
L2E+ICZsdDs8YSBocmVmPSJodHRwczovL3d3dy5hdmFzdC5jb20vc2lnLSIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly93d3cuYXZhc3QuY29tL3NpZy08L2E+PGJyPg0K
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZndDsgZW1haWw/dXRtX21lZGl1bT1lbWFpbCZh
bXA7dXRtX3NvdXJjZT1saW5rJmFtcDt1dG1fY2FtcGFpZ249c2lnLTxicj4NCiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmZ3Q7IGVtYWlsJmFtcDt1dG1fY29udGVudD13ZWJtYWlsJmFtcDt1
dG1fdGVybT1saW5rJmd0Ozxicj4NCjxicj4NCjxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08YnI+DQo8YnI+DQombmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgU3ViamVjdDogRGlnZXN0IEZvb3Rlcjxicj4NCjxicj4NCiZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXzxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB0cG0yIG1haWxp
bmcgbGlzdDxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA8YSBocmVmPSJtYWlsdG86
dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJy
ZXIiPg0KdHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7IDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+DQpodHRwczovL2xpc3RzLjAxLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3RwbTI8L2E+PGJyPg0KPGJyPg0KPGJyPg0KJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4NCjxicj4NCiZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBFbmQgb2YgdHBtMiBEaWdlc3QsIFZvbCAyMSwgSXNz
dWUgMjxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKjxicj4NCjxicj4NCjxicj4NCjxicj4NCjxicj4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPg0KdHBtMiBtYWlsaW5nIGxp
c3Q8YnI+DQo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4NCjxh
IGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9s
aXN0aW5mby90cG0yPC9hPjxicj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPC9kaXY+DQo8ZGl2
IGlkPSJEQUI0RkFEOC0yREQ3LTQwQkItQTFCOC00RTJBQTFGOUZERjIiPjxicj4NCjx0YWJsZSBz
dHlsZT0iYm9yZGVyLXRvcDoxcHggc29saWQgI2QzZDRkZSI+DQo8dGJvZHk+DQo8dHI+DQo8dGQg
c3R5bGU9IndpZHRoOjU1cHg7IHBhZGRpbmctdG9wOjEzcHgiPjxhIGhyZWY9Imh0dHBzOi8vd3d3
LmF2YXN0LmNvbS9zaWctZW1haWw/dXRtX21lZGl1bT1lbWFpbCZhbXA7dXRtX3NvdXJjZT1saW5r
JmFtcDt1dG1fY2FtcGFpZ249c2lnLWVtYWlsJmFtcDt1dG1fY29udGVudD13ZWJtYWlsJmFtcDt1
dG1fdGVybT1pY29uIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj48
aW1nIHNyYz0iaHR0cHM6Ly9pcG1jZG4uYXZhc3QuY29tL2ltYWdlcy9pY29ucy9pY29uLWVudmVs
b3BlLXRpY2stcm91bmQtb3JhbmdlLWFuaW1hdGVkLW5vLXJlcGVhdC12MS5naWYiIGFsdD0iIiBz
dHlsZT0id2lkdGg6NDZweDsgaGVpZ2h0OjI5cHgiIHdpZHRoPSI0NiIgaGVpZ2h0PSIyOSI+PC9h
PjwvdGQ+DQo8dGQgc3R5bGU9IndpZHRoOjQ3MHB4OyBwYWRkaW5nLXRvcDoxMnB4OyBjb2xvcjoj
NDE0MjRlOyBmb250LXNpemU6MTNweDsgZm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMt
c2VyaWY7IGxpbmUtaGVpZ2h0OjE4cHgiPg0KVmlydXMtZnJlZS4gPGEgaHJlZj0iaHR0cHM6Ly93
d3cuYXZhc3QuY29tL3NpZy1lbWFpbD91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWxp
bmsmYW1wO3V0bV9jYW1wYWlnbj1zaWctZW1haWwmYW1wO3V0bV9jb250ZW50PXdlYm1haWwmYW1w
O3V0bV90ZXJtPWxpbmsiIHN0eWxlPSJjb2xvcjojNDQ1M2VhIiB0YXJnZXQ9Il9ibGFuayIgcmVs
PSJub29wZW5lciBub3JlZmVycmVyIj4NCnd3dy5hdmFzdC5jb208L2E+IDwvdGQ+DQo8L3RyPg0K
PC90Ym9keT4NCjwvdGFibGU+DQo8YSBocmVmPSIjREFCNEZBRDgtMkRENy00MEJCLUExQjgtNEUy
QUExRjlGREYyIiBoZWlnaHQ9IjEiIHdpZHRoPSIxIj48L2E+PC9kaXY+DQo8L2Rpdj4NCjwvZGl2
Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--===============5162588966461007117==--

