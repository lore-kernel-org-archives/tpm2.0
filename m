Content-Type: multipart/mixed; boundary="===============6075850779392639545=="
MIME-Version: 1.0
From: Garrett Fields <ghfields at gmail.com>
Subject: [tpm2] Made an ZFS root pool auto-unlock, please give review of method
Date: Mon, 09 Dec 2019 23:15:30 -0500
Message-ID: <CA++-fmsqqfzj92nxDmm54D8FWcLB_RO8Atm=YxNd7XAzP3gJjw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6075850779392639545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Back in the end of July, I wrote a message on this discussion list titled
"PCR Policy enforcement when using nvram".  In that, I asked for a way to
have both a PCR check AND a password lock an nvram range (not an OR).  I
really appreciated everyone's help, especially William Roberts, who gave
some sample code of using a session to accomplish this goal.

Now that Ubuntu has updated its repositories for the upcoming 20.04 LTS
release and included TPM-tools v4.x, I figured it was time to take another
look.

My goal is to provide a method to auto-unlock a ZFS encrypted root
filesystem.  Currently, ZFS allows for unlocking via a prompt or file
containing a raw, hex, or passphrase values.  The mechanisms are already
inplace to prompt on startup.

So far I have just done a proof of concept.  It probably loads of bad code
and tons of polish needed:
https://github.com/ghfields/zfs/compare/master...ghfields:tpm2-autounlock

I forked the zfs project, expanded the its initramfs hooks to include the
required tpm2-tools binaries, and added another stanza to init script's
decrypting section.  I also created a pair of scripts that configures the
system and tests readback.

The nvram index and the PCRs used are stored/read from the zfs filesystem
properties.  I used the  filesytem's GUID as the required password as
another check to verify the NVRAM range was intended for that filesystem.
I also intend to issue an nvreadlock to prevent snooping once the key is
used.

I'd be interested in a critique of the method overall  I expect there ways
to make this more secure.  With enough effort, one could issue a
break=3Dpremount on the kernel line and manually extract the password from
the TPM.  Any way to tighten that up?

I'm a total novice at TPM in general, but am completely open to advise and
guidance.

Thanks,
Garrett Fields

--===============6075850779392639545==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5CYWNrIGluIHRoZSBlbmQgb2YgSnVseSwgSSB3cm90ZSBhIG1l
c3NhZ2Ugb24gdGhpcyBkaXNjdXNzaW9uIGxpc3QgdGl0bGVkICZxdW90O1BDUiBQb2xpY3kgZW5m
b3JjZW1lbnQgd2hlbiB1c2luZyBudnJhbSZxdW90Oy7CoCBJbiB0aGF0LCBJIGFza2VkIGZvciBh
IHdheSB0byBoYXZlIGJvdGggYSBQQ1IgY2hlY2sgQU5EIGEgcGFzc3dvcmQgbG9jayBhbiBudnJh
bSByYW5nZSAobm90IGFuIE9SKS7CoCBJIHJlYWxseSBhcHByZWNpYXRlZCBldmVyeW9uZSYjMzk7
cyBoZWxwLCBlc3BlY2lhbGx5IFdpbGxpYW0gUm9iZXJ0cywgd2hvIGdhdmUgc29tZSBzYW1wbGUg
Y29kZSBvZiB1c2luZyBhIHNlc3Npb24gdG8gYWNjb21wbGlzaCB0aGlzIGdvYWwuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5Ob3cgdGhhdCBVYnVudHUgaGFzIHVwZGF0ZWQgaXRzIHJlcG9zaXRv
cmllcyBmb3IgdGhlIHVwY29taW5nIDIwLjA0IExUUyByZWxlYXNlIGFuZCBpbmNsdWRlZCBUUE0t
dG9vbHMgdjQueCwgSSBmaWd1cmVkIGl0IHdhcyB0aW1lIHRvIHRha2UgYW5vdGhlciBsb29rLjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+TXkgZ29hbCBpcyB0byBwcm92aWRlIGEgbWV0aG9kIHRv
IGF1dG8tdW5sb2NrIGEgWkZTIGVuY3J5cHRlZCByb290IGZpbGVzeXN0ZW0uwqAgQ3VycmVudGx5
LCBaRlMgYWxsb3dzIGZvciB1bmxvY2tpbmcgdmlhIGEgcHJvbXB0IG9yIGZpbGUgY29udGFpbmlu
ZyBhIHJhdywgaGV4LCBvciBwYXNzcGhyYXNlIHZhbHVlcy7CoCBUaGUgbWVjaGFuaXNtcyBhcmUg
YWxyZWFkeSBpbnBsYWNlIHRvIHByb21wdCBvbiBzdGFydHVwLjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+U28gZmFyIEkgaGF2ZSBqdXN0IGRvbmUgYSBwcm9vZiBvZiBjb25jZXB0LsKgIEl0IHBy
b2JhYmx5IGxvYWRzIG9mIGJhZCBjb2RlIGFuZCB0b25zIG9mIHBvbGlzaCBuZWVkZWQ6wqAgPGEg
aHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2doZmllbGRzL3pmcy9jb21wYXJlL21hc3Rlci4uLmdo
ZmllbGRzOnRwbTItYXV0b3VubG9jayI+aHR0cHM6Ly9naXRodWIuY29tL2doZmllbGRzL3pmcy9j
b21wYXJlL21hc3Rlci4uLmdoZmllbGRzOnRwbTItYXV0b3VubG9jazwvYT48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PkkgZm9ya2VkIHRoZSB6ZnMgcHJvamVjdCwgZXhwYW5kZWQgdGhlIGl0cyBp
bml0cmFtZnMgaG9va3MgdG8gaW5jbHVkZSB0aGUgcmVxdWlyZWQgdHBtMi10b29scyBiaW5hcmll
cywgYW5kIGFkZGVkIGFub3RoZXIgc3RhbnphIHRvIGluaXQgc2NyaXB0JiMzOTtzIGRlY3J5cHRp
bmcgc2VjdGlvbi7CoCBJIGFsc28gY3JlYXRlZCBhIHBhaXIgb2Ygc2NyaXB0cyB0aGF0IGNvbmZp
Z3VyZXMgdGhlIHN5c3RlbSBhbmQgdGVzdHMgcmVhZGJhY2suPC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5UaGUgbnZyYW0gaW5kZXggYW5kIHRoZSBQQ1JzIHVzZWQgYXJlIHN0b3JlZC9yZWFkIGZy
b20gdGhlIHpmcyBmaWxlc3lzdGVtIHByb3BlcnRpZXMuwqAgSSB1c2VkIHRoZcKgIGZpbGVzeXRl
bSYjMzk7cyBHVUlEIGFzIHRoZSByZXF1aXJlZCBwYXNzd29yZCBhcyBhbm90aGVyIGNoZWNrIHRv
IHZlcmlmeSB0aGUgTlZSQU0gcmFuZ2Ugd2FzIGludGVuZGVkIGZvciB0aGF0IGZpbGVzeXN0ZW0u
wqDCoCBJIGFsc28gaW50ZW5kIHRvIGlzc3VlIGFuIG52cmVhZGxvY2sgdG8gcHJldmVudCBzbm9v
cGluZyBvbmNlIHRoZSBrZXkgaXMgdXNlZC48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5J
JiMzOTtkIGJlIGludGVyZXN0ZWQgaW4gYSBjcml0aXF1ZSBvZiB0aGUgbWV0aG9kIG92ZXJhbGzC
oCBJIGV4cGVjdCB0aGVyZSB3YXlzIHRvIG1ha2UgdGhpcyBtb3JlIHNlY3VyZS7CoCBXaXRoIGVu
b3VnaCBlZmZvcnQsIG9uZSBjb3VsZCBpc3N1ZSBhIGJyZWFrPXByZW1vdW50IG9uIHRoZSBrZXJu
ZWwgbGluZSBhbmQgbWFudWFsbHkgZXh0cmFjdCB0aGUgcGFzc3dvcmQgZnJvbSB0aGUgVFBNLsKg
IEFueSB3YXkgdG8gdGlnaHRlbiB0aGF0IHVwPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+IEkm
IzM5O20gYSB0b3RhbCBub3ZpY2UgYXQgVFBNIGluIGdlbmVyYWwsIGJ1dCBhbSBjb21wbGV0ZWx5
IG9wZW4gdG8gYWR2aXNlIGFuZCBndWlkYW5jZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRo
YW5rcyw8L2Rpdj48ZGl2PkdhcnJldHQgRmllbGRzPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjwvZGl2Pgo=

--===============6075850779392639545==--

