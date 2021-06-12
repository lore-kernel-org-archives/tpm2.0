Content-Type: multipart/mixed; boundary="===============2004494913889350330=="
MIME-Version: 1.0
From: Felix Rubio Dalmau <felix at kngnt.org>
Subject: [tpm2] Example with multifactor authentication available?
Date: Sat, 12 Jun 2021 07:58:03 +0200
Message-ID: <2015324.Nl9YbVPvRr@polaris>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2004494913889350330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everybody!


I am still learning about tpm and tpm2-tools. Following the advice from Wil=
liam Roberts, I set the authentication policy up as AND(pcr, password) by d=
oing the following:

    # create a policy that requires the pcr and the password
    tpm2_startauthsession -S session.dat
    tpm2_policypcr -S session.dat -l "sha1:0,1,2,3" -L policy.dat
    tpm2_policypassword -S session.dat -L policy.dat
    tpm2_flushcontext session.dat

    # and the sealing goes with
    echo mysecret | tpm2_create -C primary.ctx -u key.pub -r key.priv -i- -=
p password -L policy.dat

William suggested I should set up a signed policy so that when UEFI gets up=
dated I can regenerate the policy and not find myself lock out off the syst=
em, which I understand, but the problem is: to prevent from further unlock =
attemps, after unsealing the secret protected by that policy, I will extend=
 one of the pcr registers... so, if I generate the pcr policy with the live=
 system, I will be using pcr values that have been altered.

Now, I have thought in either forcing the EFI updates to happen during the =
system boot (I download the update, recreate a initramfs including it, and =
during the following boot, in the unlocking script, the UEFI gets updated a=
nd the policy gets created before unlocking), or in having a multi factor a=
uthentication that allows me to get in with either the previous policy or w=
ith another policy composed by the previous password and a rescue password.=
 In this case, AND(password1, OR(password2, pcr)), I have written the follo=
wing statements:

    # session for auth based on pcr =

    tpm2_startauthsession -S session.dat =

    tpm2_policypcr -S session.dat -l "sha256:0,1" -L policy.pcr =

    tpm2_flushcontext session.dat =

    rm session.dat =

 =

    # session for auth based on rescue password =

    tpm2_startauthsession -S session.dat =

    tpm2_policypassword -S session.dat -L policy.rescue
    tpm2_flushcontext session.dat
    rm session.dat
 =

    # compound both policies using OR and require always the password =

    tpm2_startauthsession -S session.dat =

    tpm2_policyor -S session.dat -L policy.dat sha256:policy.pcr,policy.res=
cue =

    tpm2_policypassword -S session.dat -L policy.dat     =

    tpm2_flushcontext session.dat
    rm session.dat


I think this is ok, but then.. I do not see how to initialize the password =
policies. Is there any example similar to what I want to achieve?

Thank you!
Felix

--===============2004494913889350330==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJjb250ZW50LXR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CjwvaGVhZD4KPGJvZHk+PHAgc3R5bGU9Im1hcmdpbi10
b3A6MDttYXJnaW4tYm90dG9tOjA7bWFyZ2luLWxlZnQ6MDttYXJnaW4tcmlnaHQ6MDsiPkhpIGV2
ZXJ5Ym9keSE8L3A+CjxwIHN0eWxlPSJtYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO21hcmdp
bi1sZWZ0OjA7bWFyZ2luLXJpZ2h0OjA7Ij48YnIgLz48L3A+CjxwIHN0eWxlPSJtYXJnaW4tdG9w
OjA7bWFyZ2luLWJvdHRvbTowO21hcmdpbi1sZWZ0OjA7bWFyZ2luLXJpZ2h0OjA7Ij5JIGFtIHN0
aWxsIGxlYXJuaW5nIGFib3V0IHRwbSBhbmQgdHBtMi10b29scy4gRm9sbG93aW5nIHRoZSBhZHZp
Y2UgZnJvbSBXaWxsaWFtIFJvYmVydHMsIEkgc2V0IHRoZSBhdXRoZW50aWNhdGlvbiBwb2xpY3kg
dXAgYXMgQU5EKHBjciwgcGFzc3dvcmQpIGJ5IGRvaW5nIHRoZSBmb2xsb3dpbmc6PC9wPgo8YnIg
Lz48cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDttYXJnaW4tbGVmdDowO21h
cmdpbi1yaWdodDowOyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7ICMgY3JlYXRlIGEgcG9saWN5IHRoYXQg
cmVxdWlyZXMgdGhlIHBjciBhbmQgdGhlIHBhc3N3b3JkPC9wPgo8cCBzdHlsZT0ibWFyZ2luLXRv
cDowO21hcmdpbi1ib3R0b206MDttYXJnaW4tbGVmdDowO21hcmdpbi1yaWdodDowOyI+Jm5ic3A7
Jm5ic3A7Jm5ic3A7IHRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtUyBzZXNzaW9uLmRhdDwvcD4KPHAg
c3R5bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7bWFyZ2luLWxlZnQ6MDttYXJnaW4t
cmlnaHQ6MDsiPiZuYnNwOyZuYnNwOyZuYnNwOyB0cG0yX3BvbGljeXBjciAtUyBzZXNzaW9uLmRh
dCAtbCAmcXVvdDtzaGExOjAsMSwyLDMmcXVvdDsgLUwgcG9saWN5LmRhdDwvcD4KPHAgc3R5bGU9
Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7bWFyZ2luLWxlZnQ6MDttYXJnaW4tcmlnaHQ6
MDsiPiZuYnNwOyZuYnNwOyZuYnNwOyB0cG0yX3BvbGljeXBhc3N3b3JkIC1TIHNlc3Npb24uZGF0
IC1MIHBvbGljeS5kYXQ8L3A+CjxwIHN0eWxlPSJtYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTow
O21hcmdpbi1sZWZ0OjA7bWFyZ2luLXJpZ2h0OjA7Ij4mbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9m
bHVzaGNvbnRleHQgc2Vzc2lvbi5kYXQ8L3A+CjxiciAvPjxwIHN0eWxlPSJtYXJnaW4tdG9wOjA7
bWFyZ2luLWJvdHRvbTowO21hcmdpbi1sZWZ0OjA7bWFyZ2luLXJpZ2h0OjA7Ij4mbmJzcDsmbmJz
cDsmbmJzcDsgIyBhbmQgdGhlIHNlYWxpbmcgZ29lcyB3aXRoPC9wPgo8cCBzdHlsZT0ibWFyZ2lu
LXRvcDowO21hcmdpbi1ib3R0b206MDttYXJnaW4tbGVmdDowO21hcmdpbi1yaWdodDowOyI+Jm5i
c3A7Jm5ic3A7Jm5ic3A7IGVjaG8gbXlzZWNyZXQgfCB0cG0yX2NyZWF0ZSAtQyBwcmltYXJ5LmN0
eCAtdSBrZXkucHViIC1yIGtleS5wcml2IC1pLSAtcCBwYXNzd29yZCAtTCBwb2xpY3kuZGF0PC9w
Pgo8YnIgLz48cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDttYXJnaW4tbGVm
dDowO21hcmdpbi1yaWdodDowOyI+V2lsbGlhbSBzdWdnZXN0ZWQgSSBzaG91bGQgc2V0IHVwIGEg
c2lnbmVkIHBvbGljeSBzbyB0aGF0IHdoZW4gVUVGSSBnZXRzIHVwZGF0ZWQgSSBjYW4gcmVnZW5l
cmF0ZSB0aGUgcG9saWN5IGFuZCBub3QgZmluZCBteXNlbGYgbG9jayBvdXQgb2ZmIHRoZSBzeXN0
ZW0sIHdoaWNoIEkgdW5kZXJzdGFuZCwgYnV0IHRoZSBwcm9ibGVtIGlzOiB0byBwcmV2ZW50IGZy
b20gZnVydGhlciB1bmxvY2sgYXR0ZW1wcywgYWZ0ZXIgdW5zZWFsaW5nIHRoZSBzZWNyZXQgcHJv
dGVjdGVkIGJ5IHRoYXQgcG9saWN5LCBJIHdpbGwgZXh0ZW5kIG9uZSBvZiB0aGUgcGNyIHJlZ2lz
dGVycy4uLiBzbywgaWYgSSBnZW5lcmF0ZSB0aGUgcGNyIHBvbGljeSB3aXRoIHRoZSBsaXZlIHN5
c3RlbSwgSSB3aWxsIGJlIHVzaW5nIHBjciB2YWx1ZXMgdGhhdCBoYXZlIGJlZW4gYWx0ZXJlZC48
L3A+CjxiciAvPjxwIHN0eWxlPSJtYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO21hcmdpbi1s
ZWZ0OjA7bWFyZ2luLXJpZ2h0OjA7Ij5Ob3csIEkgaGF2ZSB0aG91Z2h0IGluIGVpdGhlciBmb3Jj
aW5nIHRoZSBFRkkgdXBkYXRlcyB0byBoYXBwZW4gZHVyaW5nIHRoZSBzeXN0ZW0gYm9vdCAoSSBk
b3dubG9hZCB0aGUgdXBkYXRlLCByZWNyZWF0ZSBhIGluaXRyYW1mcyBpbmNsdWRpbmcgaXQsIGFu
ZCBkdXJpbmcgdGhlIGZvbGxvd2luZyBib290LCBpbiB0aGUgdW5sb2NraW5nIHNjcmlwdCwgdGhl
IFVFRkkgZ2V0cyB1cGRhdGVkIGFuZCB0aGUgcG9saWN5IGdldHMgY3JlYXRlZCBiZWZvcmUgdW5s
b2NraW5nKSwgb3IgaW4gaGF2aW5nIGEgbXVsdGkgZmFjdG9yIGF1dGhlbnRpY2F0aW9uIHRoYXQg
YWxsb3dzIG1lIHRvIGdldCBpbiB3aXRoIGVpdGhlciB0aGUgcHJldmlvdXMgcG9saWN5IG9yIHdp
dGggYW5vdGhlciBwb2xpY3kgY29tcG9zZWQgYnkgdGhlIHByZXZpb3VzIHBhc3N3b3JkIGFuZCBh
IHJlc2N1ZSBwYXNzd29yZC4gSW4gdGhpcyBjYXNlLCBBTkQocGFzc3dvcmQxLCBPUihwYXNzd29y
ZDIsIHBjcikpLCBJIGhhdmUgd3JpdHRlbiB0aGUgZm9sbG93aW5nIHN0YXRlbWVudHM6PC9wPgo8
YnIgLz48cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDttYXJnaW4tbGVmdDow
O21hcmdpbi1yaWdodDowOyI+wqDCoCZuYnNwOyAjIHNlc3Npb24gZm9yIGF1dGggYmFzZWQgb24g
cGNywqA8YnIgLz7CoMKgwqDCoHRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtUyBzZXNzaW9uLmRhdMKg
PGJyIC8+wqDCoMKgwqB0cG0yX3BvbGljeXBjciAtUyBzZXNzaW9uLmRhdCAtbCAmcXVvdDtzaGEy
NTY6MCwxJnF1b3Q7IC1MIHBvbGljeS5wY3LCoDxiciAvPsKgwqDCoMKgdHBtMl9mbHVzaGNvbnRl
eHQgc2Vzc2lvbi5kYXTCoDxiciAvPsKgwqDCoMKgcm0gc2Vzc2lvbi5kYXTCoDxiciAvPsKgPGJy
IC8+wqDCoMKgwqAjIHNlc3Npb24gZm9yIGF1dGggYmFzZWQgb24gcmVzY3VlIHBhc3N3b3JkwqA8
YnIgLz7CoMKgwqDCoHRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtUyBzZXNzaW9uLmRhdMKgPGJyIC8+
wqDCoMKgwqB0cG0yX3BvbGljeXBhc3N3b3JkIC1TIHNlc3Npb24uZGF0IC1MIHBvbGljeS5yZXNj
dWU8YnIgLz7CoMKgwqDCoHRwbTJfZmx1c2hjb250ZXh0IHNlc3Npb24uZGF0PC9wPgo8cCBzdHls
ZT0ibWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDttYXJnaW4tbGVmdDowO21hcmdpbi1yaWdo
dDowOyI+wqDCoMKgIHJtIHNlc3Npb24uZGF0PGJyIC8+wqA8YnIgLz7CoMKgwqDCoCMgY29tcG91
bmQgYm90aCBwb2xpY2llcyB1c2luZyBPUiBhbmQgcmVxdWlyZSBhbHdheXMgdGhlIHBhc3N3b3Jk
wqA8YnIgLz7CoMKgwqDCoHRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtUyBzZXNzaW9uLmRhdMKgPGJy
IC8+wqDCoMKgwqB0cG0yX3BvbGljeW9yIC1TIHNlc3Npb24uZGF0IC1MIHBvbGljeS5kYXQgc2hh
MjU2OnBvbGljeS5wY3IscG9saWN5LnJlc2N1ZcKgPGJyIC8+wqDCoMKgwqB0cG0yX3BvbGljeXBh
c3N3b3JkIC1TIHNlc3Npb24uZGF0IC1MIHBvbGljeS5kYXTCoMKgwqDCoMKgPGJyIC8+wqDCoMKg
wqB0cG0yX2ZsdXNoY29udGV4dMKgc2Vzc2lvbi5kYXQ8L3A+CjxwIHN0eWxlPSJtYXJnaW4tdG9w
OjA7bWFyZ2luLWJvdHRvbTowO21hcmdpbi1sZWZ0OjA7bWFyZ2luLXJpZ2h0OjA7Ij7CoMKgwqAg
cm0gc2Vzc2lvbi5kYXQ8L3A+CjxwPiZuYnNwOzwvcD4KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDtt
YXJnaW4tYm90dG9tOjA7bWFyZ2luLWxlZnQ6MDttYXJnaW4tcmlnaHQ6MDsiPkkgdGhpbmsgdGhp
cyBpcyBvaywgYnV0IHRoZW4uLiBJIGRvIG5vdCBzZWUgaG93IHRvIGluaXRpYWxpemUgdGhlIHBh
c3N3b3JkIHBvbGljaWVzLiBJcyB0aGVyZSBhbnkgZXhhbXBsZSBzaW1pbGFyIHRvIHdoYXQgSSB3
YW50IHRvIGFjaGlldmU/PC9wPgo8YnIgLz48cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdpbi1i
b3R0b206MDttYXJnaW4tbGVmdDowO21hcmdpbi1yaWdodDowOyI+VGhhbmsgeW91ITwvcD4KPHAg
c3R5bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7bWFyZ2luLWxlZnQ6MDttYXJnaW4t
cmlnaHQ6MDsiPkZlbGl4PC9wPgo8L2JvZHk+CjwvaHRtbD4=
--===============2004494913889350330==--

