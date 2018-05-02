Content-Type: multipart/mixed; boundary="===============7702139835624296018=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] ESAPI StartAuthSession
Date: Wed, 02 May 2018 07:39:49 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D010EB20A0E@exch2010c.sit.fraunhofer.de>
In-Reply-To: CAOysEaeeMgv0m0vCnE_mnKDKVVqE3QcMaNMxmAvCkr3TkFhhvA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7702139835624296018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Davide,

you are correct, you are somewhere referencing a (ESYS_TR handle) that does=
 not exist.
I guess code would be good, so we can help you...

A typical usage looks like this:
ESYS_TR sessiontr;
TPMT_SYM_DEF symmetric =3D { .algorithm =3D TPM2_ALG_NULL };
r =3D Esys_StartAuthSession(ectx, ESYS_TR_NONE, ESYS_TR_NONE, /* tpmKey, bi=
nd */
                                            ESYS_TR_NONE, ESYS_TR_NONE, ESY=
S_TR_NONE, /* shandle 1-3 */
                                            NULL, /*nonceCaller */, TPM2_SE=
_HMAC, &symmetric, TPM2_ALG_SHA1,
                                            &sessiontr, NULL /* tpmNonce */=
);

If this does not work, please send us your code...

Cheers,
Andreas

________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Davide Rutigliano [da=
vide.ruti(a)gmail.com]
Sent: Monday, April 30, 2018 22:16
To: tpm2(a)lists.01.org
Subject: [tpm2] ESAPI StartAuthSession

Hello everyone,

I'm in trouble with Esys_StartAuthSession because I receive continuously th=
is error and I cannot understand why:

"""
ERROR:esys_iutil:esapi/esapi_util/esys_iutil.c:879:esys_GetResourceObject()=
 Error: Esys handle does not exist (70018).
ERROR:esys:esapi/esapi/Esys_StartAuthSession.c:124:Esys_StartAuthSession() =
Error in async function ErrorCode (0x00070018)
TPM2_StartAuthSession failed with 0x70018
"""

I suppose I'm doing something wrong with session handles but I don't know w=
hat.

Could someone help me please?

Thanks in advance,

Davide Rutigliano.

--===============7702139835624296018==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+UCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIxIiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9tYTtjb2xvcjogIzAwMDAwMDtmb250LXNp
emU6IDEwcHQ7Ij5IaSBEYXZpZGUsPGJyPgo8YnI+CnlvdSBhcmUgY29ycmVjdCwgeW91IGFyZSBz
b21ld2hlcmUgcmVmZXJlbmNpbmcgYSAoRVNZU19UUiBoYW5kbGUpIHRoYXQgZG9lcyBub3QgZXhp
c3QuPGJyPgpJIGd1ZXNzIGNvZGUgd291bGQgYmUgZ29vZCwgc28gd2UgY2FuIGhlbHAgeW91Li4u
PGJyPgo8YnI+CkEgdHlwaWNhbCB1c2FnZSBsb29rcyBsaWtlIHRoaXM6PGJyPgpFU1lTX1RSIHNl
c3Npb250cjs8YnI+ClRQTVRfU1lNX0RFRiBzeW1tZXRyaWMgPSB7IC5hbGdvcml0aG0gPSBUUE0y
X0FMR19OVUxMIH07PGJyPgpyID0gRXN5c19TdGFydEF1dGhTZXNzaW9uKGVjdHgsIEVTWVNfVFJf
Tk9ORSwgRVNZU19UUl9OT05FLCAvKiB0cG1LZXksIGJpbmQgKi88YnI+CiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyBFU1lTX1RSX05PTkUsIEVTWVNfVFJfTk9ORSwgRVNZU19UUl9OT05F
LCAvKiBzaGFuZGxlIDEtMyAqLzxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyBOVUxMLCAvKm5vbmNlQ2FsbGVyICovLCBUUE0yX1NFX0hNQUMsICZhbXA7c3ltbWV0cmlj
LCBUUE0yX0FMR19TSEExLDxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZhbXA7
c2Vzc2lvbnRyLCBOVUxMIC8qIHRwbU5vbmNlICovKTs8YnI+Cjxicj4KSWYgdGhpcyBkb2VzIG5v
dCB3b3JrLCBwbGVhc2Ugc2VuZCB1cyB5b3VyIGNvZGUuLi4gPGJyPgo8YnI+CkNoZWVycyw8YnI+
CkFuZHJlYXM8YnI+Cjxicj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IFRpbWVzIE5ldyBSb21h
bjsgY29sb3I6ICMwMDAwMDA7IGZvbnQtc2l6ZTogMTZweCI+CjxociB0YWJpbmRleD0iLTEiPgo8
ZGl2IGlkPSJkaXZScEY4MTQ1NCIgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyI+PGZvbnQgc2l6ZT0i
MiIgZmFjZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IHRwbTIgW3RwbTIt
Ym91bmNlc0BsaXN0cy4wMS5vcmddIG9uIGJlaGFsZiBvZiBEYXZpZGUgUnV0aWdsaWFubyBbZGF2
aWRlLnJ1dGlAZ21haWwuY29tXTxicj4KPGI+U2VudDo8L2I+IE1vbmRheSwgQXByaWwgMzAsIDIw
MTggMjI6MTY8YnI+CjxiPlRvOjwvYj4gdHBtMkBsaXN0cy4wMS5vcmc8YnI+CjxiPlN1YmplY3Q6
PC9iPiBbdHBtMl0gRVNBUEkgU3RhcnRBdXRoU2Vzc2lvbjxicj4KPC9mb250Pjxicj4KPC9kaXY+
CjxkaXY+PC9kaXY+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPkhlbGxvIGV2ZXJ5b25lLAo8ZGl2Pjxi
cj4KPC9kaXY+CjxkaXY+CjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMi44MDAwMDAxOTA3MzQ4NjNw
eCI+SSdtIGluIHRyb3VibGUgd2l0aCBFc3lzX1N0YXJ0QXV0aFNlc3Npb24gYmVjYXVzZSBJIHJl
Y2VpdmUgY29udGludW91c2x5IHRoaXMgZXJyb3IgYW5kIEkgY2Fubm90IHVuZGVyc3RhbmQgd2h5
OjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LXNpemU6MTIuODAwMDAwMTkwNzM0ODYzcHgiPjxicj4K
PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMi44MDAwMDAxOTA3MzQ4NjNweCI+JnF1b3Q7
JnF1b3Q7JnF1b3Q7PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMi44MDAwMDAxOTA3MzQ4
NjNweCI+CjxkaXY+RVJST1I6ZXN5c19pdXRpbDplc2FwaS9lc2FwaV88d2JyPnV0aWwvZXN5c19p
dXRpbC5jOjg3OTplc3lzXzx3YnI+R2V0UmVzb3VyY2VPYmplY3QoKSBFcnJvcjogRXN5cyBoYW5k
bGUgZG9lcyBub3QgZXhpc3QgKDcwMDE4KS4mbmJzcDs8L2Rpdj4KPGRpdj5FUlJPUjplc3lzOmVz
YXBpL2VzYXBpL0VzeXNfPHdicj5TdGFydEF1dGhTZXNzaW9uLmM6MTI0OkVzeXNfPHdicj5TdGFy
dEF1dGhTZXNzaW9uKCkgRXJyb3IgaW4gYXN5bmMgZnVuY3Rpb24gRXJyb3JDb2RlICgweDAwMDcw
MDE4KSZuYnNwOzwvZGl2Pgo8ZGl2PlRQTTJfU3RhcnRBdXRoU2Vzc2lvbiBmYWlsZWQgd2l0aCAw
eDcwMDE4PC9kaXY+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LXNpemU6MTIuODAwMDAwMTkwNzM0
ODYzcHgiPiZxdW90OyZxdW90OyZxdW90OzwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LXNpemU6MTIu
ODAwMDAwMTkwNzM0ODYzcHgiPjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMi44
MDAwMDAxOTA3MzQ4NjNweCI+SSBzdXBwb3NlIEknbSBkb2luZyBzb21ldGhpbmcgd3Jvbmcgd2l0
aCBzZXNzaW9uIGhhbmRsZXMgYnV0IEkgZG9uJ3Qga25vdyB3aGF0LjwvZGl2Pgo8ZGl2IHN0eWxl
PSJmb250LXNpemU6MTIuODAwMDAwMTkwNzM0ODYzcHgiPjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9
ImZvbnQtc2l6ZToxMi44MDAwMDAxOTA3MzQ4NjNweCI+Q291bGQgc29tZW9uZSBoZWxwIG1lIHBs
ZWFzZT88L2Rpdj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5UaGFua3MgaW4gYWR2YW5j
ZSw8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PkRhdmlkZSBSdXRpZ2xpYW5vLjwvZGl2Pgo8
L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============7702139835624296018==--

