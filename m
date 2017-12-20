Content-Type: multipart/mixed; boundary="===============1412582743497531126=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: Re: [tpm2] [RFC] Session Handling/Policy Support in Tools
Date: Wed, 20 Dec 2017 16:35:17 +0200
Message-ID: <CAAxBZJuE6ftmtc=2tSWs3LDbPZMToSY0fM_T+JVoZdzfzvGcPg@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FE6D774@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1412582743497531126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Forgive me if this is obvious to you :-) but I'd like to understand and
clarify the above a bit more. In the procedure you've presented above does
step #4 change the state of the session to one that can be used?

Is then the procedure then something like:

1. tpm2_createpolicy - create a pcr policy and spit out the policy digest

eg: I create a policy based upon the current state of (eg) sha1:0,1,2,3 and
save this as  0123.policy

2. tpm2_create - create an object containing the policy created in #1 (+
keys?)

eg: I create an object which is sealed (???) against 0123.policy

Question: is there a need to perform a tpm2_load here or is it sufficient
that this exists temporarily?

3. tpm2_startauthsession - create a session handle for a given pcr policy

eg: I generate a session handle for a given policy, eg: 0123.policy and
return this as, say   session.bin

4. tpm2_policypcr, given #1 and #3, check if either a supplied set of PCR
values or the current state of the PCR registers are specified in #1 match,
if so then the session handle is marked as being valid until step #6

5. tpm2_* with -S taking the output of #3 as input as required

Question: what happens if I issue a tpm2_* command without -S during this
time?

6. tpm2_flushcontext   taking the session handle and/or  object from #2 as
input.  Any further attempts to use the session handle with tpm2_* -S
fails.


So an example session might proceed

$tpm2_createpolicy -P -f 0123.policy -g sha256 -L sha1:0,1,2
$ls
0123.policy
$tpm2_create -H 0x81010001 -g sha256 -G rsa -L 0123.policy
0x810100ff         <- output handle, also assume 0x81010001 exists in the
above
$tpm2_startauthsession -L 0123.policy -s session.bin
$ls
session.bin

Now this is pure guesswork here

$tpm2_decrypt -k 0x81010001 -I secret.enc -o plain.txt -S session.bin
FAIL

$tpm2_policypcr -k 0x81010001 -s session.bin -L
0123.policy                    <- reads sha1:0,1,2,3 from the TPM
OK

$tpm2_decrypt -k 0x81010001 -I secret.enc -o plain.txt -S session.bin
$cat plain.txt
"This is a secret message"

$tpm2_flushcontext -H 0x810100ff            <- our object from above

$tpm2_decrypt -k 0x81010001 -I secret.enc -o plain.txt -S session.bin
FAIL




t.

Ian



On 19 December 2017 at 20:01, Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> There are two main parts to the direction I see the tools policy/session
> support heading:
>
> 1. The first is cleaning up all the code around session support and policy
> building.  I think now that I understand the topic better, I can organize
> this code a little better. This is rather trivial and beside the main poi=
nt.
>
> 2. Since abrmd 1.3 we have support for sessions across RM IPC connections
> and direct tpm communications (/dev/tmp0) also has the same support. We
> have tools like tpm2_createpolicy that are made up of multiple
> commands to work around session flushing on IPC RM disconnections.
> tpm2_createpolicy is really comprised of 3 commands: tpm2_startauthsessio=
n,
> tpm2_policypcr and tpm2_flushcontext.
>
> I'm proposing we leave tpm2_createpolicy, for in-kernel-rm users, but add
> tpm2_startauthsession and tpm2_policypcr for the abrmd and direct tpm
> usages. Abrmd works by using Tss2_Sys_ContextSave as the
> marker of NOT flushing a session handle. Granted you also need the
> sessionAttributes set to continue so the TPM doesn't kill it.
>
> I think the flow for using the new tools would be something like this:
>
> 1. tpm2_createpolicy - create a pcr policy and spit out the policy digest
> 2. tpm2_create - create an object and set its policy digest as obtained in
> step 1
> 3. tpm2_startauthsession - create a pcr policy and spit out the session
> handle
> 4. tpm2_policypcr - satisfy policy via policy digest and pcr list
> obtained/used in step 1 as well as taking the session handle from step 3
> 5. tpm2_<tool> - use some tool passing the session handle from step 3
> 6. tpm2_flushcontext - flushes the handle from step 3
>
> With that said, since tpm2_createpolicy is really a combination of the
> tpm2_startauthsession, tpm2_pcrlist, tpm2_policypcr and tpm2_flushcontext,
> all that could be moved into lib, so each new tool and
> create policy are really just calling into the same code.
>
> Thoughts, am I missing something here?
>
> This is a lot of work, so I would like to start it now, as it would be the
> major feature set going towards 4.0 release.
>
> Bill
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>



-- =

*Dr. Ian Oliver*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
*Twitter: @i_j_oliver*

--===============1412582743497531126==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2Pjxk
aXY+PGRpdj5Gb3JnaXZlIG1lIGlmIHRoaXMgaXMgb2J2aW91cyB0byB5b3UgOi0pIGJ1dCBJJiMz
OTtkIGxpa2UgdG8gdW5kZXJzdGFuZCBhbmQgY2xhcmlmeSB0aGUgYWJvdmUgYSBiaXQgbW9yZS4g
SW4gdGhlIHByb2NlZHVyZSB5b3UmIzM5O3ZlIHByZXNlbnRlZCBhYm92ZSBkb2VzIHN0ZXAgIzQg
Y2hhbmdlIHRoZSBzdGF0ZSBvZiB0aGUgc2Vzc2lvbiB0byBvbmUgdGhhdCBjYW4gYmUgdXNlZD88
YnI+PGJyPjwvZGl2PklzIHRoZW4gdGhlIHByb2NlZHVyZSB0aGVuIHNvbWV0aGluZyBsaWtlOjxi
cj48YnI+PC9kaXY+MS4gdHBtMl9jcmVhdGVwb2xpY3kgLSBjcmVhdGUgYSBwY3IgcG9saWN5IGFu
ZCBzcGl0IG91dCB0aGUgcG9saWN5IGRpZ2VzdDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+ZWc6
IEkgY3JlYXRlIGEgcG9saWN5IGJhc2VkIHVwb24gdGhlIGN1cnJlbnQgc3RhdGUgb2YgKGVnKSBz
aGExOjAsMSwyLDMgYW5kIHNhdmUgdGhpcyBhc8KgIDAxMjMucG9saWN5PGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjIuIHRwbTJfY3JlYXRlIC0gY3JlYXRlIGFuIG9iamVjdCBjb250YWluaW5nIHRo
ZSBwb2xpY3kgY3JlYXRlZCBpbiAjMSAoKyBrZXlzPyk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PmVnOiBJIGNyZWF0ZSBhbiBvYmplY3Qgd2hpY2ggaXMgc2VhbGVkICg/Pz8pIGFnYWluc3QgMDEy
My5wb2xpY3k8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlF1ZXN0aW9uOiBpcyB0aGVyZSBhIG5l
ZWQgdG8gcGVyZm9ybSBhIHRwbTJfbG9hZCBoZXJlIG9yIGlzIGl0IHN1ZmZpY2llbnQgdGhhdCB0
aGlzIGV4aXN0cyB0ZW1wb3JhcmlseT88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+My4gdHBtMl9z
dGFydGF1dGhzZXNzaW9uIC0gY3JlYXRlIGEgc2Vzc2lvbiBoYW5kbGUgZm9yIGEgZ2l2ZW4gcGNy
IHBvbGljeTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+ZWc6IEkgZ2VuZXJhdGUgYSBzZXNzaW9u
IGhhbmRsZSBmb3IgYSBnaXZlbiBwb2xpY3ksIGVnOiAwMTIzLnBvbGljeSBhbmQgcmV0dXJuIHRo
aXMgYXMsIHNhecKgwqAgc2Vzc2lvbi5iaW48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+NC4gdHBt
Ml9wb2xpY3lwY3IsIGdpdmVuICMxIGFuZCAjMywgY2hlY2sgaWYgZWl0aGVyIGEgc3VwcGxpZWQg
c2V0IG9mIFBDUiB2YWx1ZXMgb3IgdGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhlIFBDUiByZWdpc3Rl
cnMgYXJlIHNwZWNpZmllZCBpbiAjMSBtYXRjaCwgaWYgc28gdGhlbiB0aGUgc2Vzc2lvbiBoYW5k
bGUgaXMgbWFya2VkIGFzIGJlaW5nIHZhbGlkIHVudGlsIHN0ZXAgIzY8YnI+PGJyPjwvZGl2PjUu
IHRwbTJfKiB3aXRoIC1TIHRha2luZyB0aGUgb3V0cHV0IG9mICMzIGFzIGlucHV0IGFzIHJlcXVp
cmVkPGJyPjxicj48L2Rpdj5RdWVzdGlvbjogd2hhdCBoYXBwZW5zIGlmIEkgaXNzdWUgYSB0cG0y
XyogY29tbWFuZCB3aXRob3V0IC1TIGR1cmluZyB0aGlzIHRpbWU/PGJyPjxicj48L2Rpdj42LiB0
cG0yX2ZsdXNoY29udGV4dMKgwqAgdGFraW5nIHRoZSBzZXNzaW9uIGhhbmRsZSBhbmQvb3LCoCBv
YmplY3QgZnJvbSAjMiBhcyBpbnB1dC7CoCBBbnkgZnVydGhlciBhdHRlbXB0cyB0byB1c2UgdGhl
IHNlc3Npb24gaGFuZGxlIHdpdGggdHBtMl8qIC1TwqAgZmFpbHMuPGJyPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+U28gYW4gZXhhbXBsZSBzZXNzaW9uIG1pZ2h0IHBy
b2NlZWQ8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiR0cG0yX2NyZWF0ZXBvbGljeSAtUCAtZiAw
MTIzLnBvbGljeSAtZyBzaGEyNTYgLUwgc2hhMTowLDEsMjwvZGl2PjxkaXY+JGxzPC9kaXY+PGRp
dj4wMTIzLnBvbGljeTwvZGl2PjxkaXY+JHRwbTJfY3JlYXRlIC1IIDB4ODEwMTAwMDEgLWcgc2hh
MjU2IC1HIHJzYSAtTCAwMTIzLnBvbGljeTwvZGl2PjxkaXY+MHg4MTAxMDBmZsKgwqDCoMKgwqDC
oMKgwqAgJmx0Oy0gb3V0cHV0IGhhbmRsZSwgYWxzbyBhc3N1bWUgMHg4MTAxMDAwMSBleGlzdHMg
aW4gdGhlIGFib3ZlPGJyPjwvZGl2PjxkaXY+JHRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtTCAwMTIz
LnBvbGljeSAtcyBzZXNzaW9uLmJpbjwvZGl2PjxkaXY+JGxzPC9kaXY+PGRpdj5zZXNzaW9uLmJp
bjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Tm93IHRoaXMgaXMgcHVyZSBndWVzc3dvcmsgaGVy
ZTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+JHRwbTJfZGVjcnlwdCAtayAweDgxMDEwMDAxIC1J
IHNlY3JldC5lbmMgLW8gcGxhaW4udHh0IC1TIHNlc3Npb24uYmluPC9kaXY+PGRpdj5GQUlMIDxi
cj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiR0cG0yX3BvbGljeXBjciAtayAweDgxMDEwMDAx
IC1zIHNlc3Npb24uYmluIC1MIDAxMjMucG9saWN5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJmx0Oy0gcmVhZHMgc2hhMTowLDEsMiwzIGZyb20gdGhlIFRQTTwvZGl2Pjxk
aXY+T0s8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiR0cG0yX2RlY3J5cHQgLWsgMHg4MTAxMDAw
MSAtSSBzZWNyZXQuZW5jIC1vIHBsYWluLnR4dCAtUyBzZXNzaW9uLmJpbjwvZGl2PjxkaXY+JGNh
dCBwbGFpbi50eHQ8L2Rpdj48ZGl2PiZxdW90O1RoaXMgaXMgYSBzZWNyZXQgbWVzc2FnZSZxdW90
OzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+JHRwbTJfZmx1c2hjb250ZXh0IC1IIDB4ODEwMTAw
ZmbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZsdDstIG91ciBvYmplY3QgZnJvbSBhYm92ZTwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdj4kdHBtMl9kZWNyeXB0IC1rIDB4ODEwMTAwMDEgLUkg
c2VjcmV0LmVuYyAtbyBwbGFpbi50eHQgLVMgc2Vzc2lvbi5iaW48L2Rpdj48ZGl2PkZBSUwgPGJy
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+PGJyPjwvZGl2PnQuPGJyPjxicj48L2Rpdj5JYW48YnI+PGRpdj48ZGl2PjxkaXY+PGRp
dj48ZGl2PjxkaXY+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2Pjxicj48YnI+PC9kaXY+PC9kaXY+
PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9k
aXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+
T24gMTkgRGVjZW1iZXIgMjAxNyBhdCAyMDowMSwgUm9iZXJ0cywgV2lsbGlhbSBDIDxzcGFuIGRp
cj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7PC9zcGFu
PiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+
VGhlcmUgYXJlIHR3byBtYWluIHBhcnRzIHRvIHRoZSBkaXJlY3Rpb24gSSBzZWUgdGhlIHRvb2xz
IHBvbGljeS9zZXNzaW9uIHN1cHBvcnQgaGVhZGluZzo8YnI+Cjxicj4KMS4gVGhlIGZpcnN0IGlz
IGNsZWFuaW5nIHVwIGFsbCB0aGUgY29kZSBhcm91bmQgc2Vzc2lvbiBzdXBwb3J0IGFuZCBwb2xp
Y3kgYnVpbGRpbmcuwqAgSSB0aGluayBub3cgdGhhdCBJIHVuZGVyc3RhbmQgdGhlIHRvcGljIGJl
dHRlciwgSSBjYW4gb3JnYW5pemUgdGhpcyBjb2RlIGEgbGl0dGxlIGJldHRlci4gVGhpcyBpcyBy
YXRoZXIgdHJpdmlhbCBhbmQgYmVzaWRlIHRoZSBtYWluIHBvaW50Ljxicj4KPGJyPgoyLiBTaW5j
ZSBhYnJtZCAxLjMgd2UgaGF2ZSBzdXBwb3J0IGZvciBzZXNzaW9ucyBhY3Jvc3MgUk0gSVBDIGNv
bm5lY3Rpb25zIGFuZCBkaXJlY3QgdHBtIGNvbW11bmljYXRpb25zICgvZGV2L3RtcDApIGFsc28g
aGFzIHRoZSBzYW1lIHN1cHBvcnQuIFdlIGhhdmUgdG9vbHMgbGlrZSB0cG0yX2NyZWF0ZXBvbGlj
eSB0aGF0IGFyZSBtYWRlIHVwIG9mIG11bHRpcGxlPGJyPgpjb21tYW5kcyB0byB3b3JrIGFyb3Vu
ZCBzZXNzaW9uIGZsdXNoaW5nIG9uIElQQyBSTSBkaXNjb25uZWN0aW9ucy4gdHBtMl9jcmVhdGVw
b2xpY3kgaXMgcmVhbGx5IGNvbXByaXNlZCBvZiAzIGNvbW1hbmRzOiB0cG0yX3N0YXJ0YXV0aHNl
c3Npb24sIHRwbTJfcG9saWN5cGNyIGFuZCB0cG0yX2ZsdXNoY29udGV4dC48YnI+Cjxicj4KSSYj
Mzk7bSBwcm9wb3Npbmcgd2UgbGVhdmUgdHBtMl9jcmVhdGVwb2xpY3ksIGZvciBpbi1rZXJuZWwt
cm0gdXNlcnMsIGJ1dCBhZGQgdHBtMl9zdGFydGF1dGhzZXNzaW9uIGFuZCB0cG0yX3BvbGljeXBj
ciBmb3IgdGhlIGFicm1kIGFuZCBkaXJlY3QgdHBtIHVzYWdlcy4gQWJybWQgd29ya3MgYnkgdXNp
bmcgVHNzMl9TeXNfQ29udGV4dFNhdmUgYXMgdGhlPGJyPgptYXJrZXIgb2YgTk9UIGZsdXNoaW5n
IGEgc2Vzc2lvbiBoYW5kbGUuIEdyYW50ZWQgeW91IGFsc28gbmVlZCB0aGUgc2Vzc2lvbkF0dHJp
YnV0ZXMgc2V0IHRvIGNvbnRpbnVlIHNvIHRoZSBUUE0gZG9lc24mIzM5O3Qga2lsbCBpdC48YnI+
Cjxicj4KSSB0aGluayB0aGUgZmxvdyBmb3IgdXNpbmcgdGhlIG5ldyB0b29scyB3b3VsZCBiZSBz
b21ldGhpbmcgbGlrZSB0aGlzOjxicj4KPGJyPgoxLiB0cG0yX2NyZWF0ZXBvbGljeSAtIGNyZWF0
ZSBhIHBjciBwb2xpY3kgYW5kIHNwaXQgb3V0IHRoZSBwb2xpY3kgZGlnZXN0PGJyPgoyLiB0cG0y
X2NyZWF0ZSAtIGNyZWF0ZSBhbiBvYmplY3QgYW5kIHNldCBpdHMgcG9saWN5IGRpZ2VzdCBhcyBv
YnRhaW5lZCBpbiBzdGVwIDE8YnI+CjMuIHRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtIGNyZWF0ZSBh
IHBjciBwb2xpY3kgYW5kIHNwaXQgb3V0IHRoZSBzZXNzaW9uIGhhbmRsZTxicj4KNC4gdHBtMl9w
b2xpY3lwY3IgLSBzYXRpc2Z5IHBvbGljeSB2aWEgcG9saWN5IGRpZ2VzdCBhbmQgcGNyIGxpc3Qg
b2J0YWluZWQvdXNlZCBpbiBzdGVwIDEgYXMgd2VsbCBhcyB0YWtpbmcgdGhlIHNlc3Npb24gaGFu
ZGxlIGZyb20gc3RlcCAzPGJyPgo1LiB0cG0yXyZsdDt0b29sJmd0OyAtIHVzZSBzb21lIHRvb2wg
cGFzc2luZyB0aGUgc2Vzc2lvbiBoYW5kbGUgZnJvbSBzdGVwIDM8YnI+CjYuIHRwbTJfZmx1c2hj
b250ZXh0IC0gZmx1c2hlcyB0aGUgaGFuZGxlIGZyb20gc3RlcCAzPGJyPgo8YnI+CldpdGggdGhh
dCBzYWlkLCBzaW5jZSB0cG0yX2NyZWF0ZXBvbGljeSBpcyByZWFsbHkgYSBjb21iaW5hdGlvbiBv
ZiB0aGUgdHBtMl9zdGFydGF1dGhzZXNzaW9uLCB0cG0yX3Bjcmxpc3QsIHRwbTJfcG9saWN5cGNy
IGFuZCB0cG0yX2ZsdXNoY29udGV4dCwgYWxsIHRoYXQgY291bGQgYmUgbW92ZWQgaW50byBsaWIs
IHNvIGVhY2ggbmV3IHRvb2wgYW5kPGJyPgpjcmVhdGUgcG9saWN5IGFyZSByZWFsbHkganVzdCBj
YWxsaW5nIGludG8gdGhlIHNhbWUgY29kZS48YnI+Cjxicj4KVGhvdWdodHMsIGFtIEkgbWlzc2lu
ZyBzb21ldGhpbmcgaGVyZT88YnI+Cjxicj4KVGhpcyBpcyBhIGxvdCBvZiB3b3JrLCBzbyBJIHdv
dWxkIGxpa2UgdG8gc3RhcnQgaXQgbm93LCBhcyBpdCB3b3VsZCBiZSB0aGUgbWFqb3IgZmVhdHVy
ZSBzZXQgZ29pbmcgdG93YXJkcyA0LjAgcmVsZWFzZS48YnI+Cjxicj4KQmlsbDxicj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fPHdicj5fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBt
YWlsaW5nIGxpc3Q8YnI+CjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBs
aXN0cy4wMS5vcmc8L2E+PGJyPgo8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3RwbTIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
bGlzdHMuMDEub3JnL21haWxtYW4vPHdicj5saXN0aW5mby90cG0yPC9hPjxicj4KPC9ibG9ja3F1
b3RlPjwvZGl2Pjxicj48YnIgY2xlYXI9ImFsbCI+PGJyPi0tIDxicj48ZGl2IGNsYXNzPSJnbWFp
bF9zaWduYXR1cmUiIGRhdGEtc21hcnRtYWlsPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJs
dHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGly
PSJsdHIiPjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsO2ZvbnQtc2l6ZTpzbWFsbCI+PGI+
RHIuIElhbiBPbGl2ZXI8L2I+PGJyPj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+
PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWw7Zm9udC1zaXplOnNtYWxsIj5Qcml2
YWN5IEVuZ2luZWVyaW5nOsKgIDxiPjwvYj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDE3LDE3LDE3
KTtmb250LWZhbWlseTpBcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxM3B4O2xpbmUtaGVpZ2h0
OjE5cHgiPjxhIGhyZWY9Imh0dHA6Ly93d3cuYW1hem9uLmNvLnVrL2RwLzE0OTc1Njk3MTAiIHRh
cmdldD0iX2JsYW5rIj52aWEgQW1hem9uPC9hPjwvc3Bhbj48Yj48YnI+VHdpdHRlcjogQGlfal9v
bGl2ZXI8L2I+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+
PC9kaXY+CjwvZGl2Pgo=

--===============1412582743497531126==--

