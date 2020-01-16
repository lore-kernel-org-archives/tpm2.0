Content-Type: multipart/mixed; boundary="===============0001112573983066378=="
MIME-Version: 1.0
From: Garrett Fields <ghfields at gmail.com>
Subject: [tpm2] Re: Made an ZFS root pool auto-unlock,
 please give review of method
Date: Thu, 16 Jan 2020 18:03:26 -0500
Message-ID: <CA++-fmvrrqtoogiJOxGTN=eDfbn4XJ7Q=Sn2XXYmQT4K5S2BFA@mail.gmail.com>
In-Reply-To: CA++-fmsqqfzj92nxDmm54D8FWcLB_RO8Atm=YxNd7XAzP3gJjw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0001112573983066378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've played around with this for quite some time and wanted to get some
more eyes on this code.  I've created a draft PR with "ZFS on Linux",
asking for a discussion of methodology.  Likely, the people on this list
can speak to the utilization of TPM2-tools and help with the security
aspects more than the filesystems focused developers there.

Please have a look and submit comments here or the PR itself.
https://github.com/zfsonlinux/zfs/pull/9852

Many thanks,
Garrett Fields

On Mon, Dec 9, 2019 at 11:15 PM Garrett Fields <ghfields(a)gmail.com> wrote:

> Back in the end of July, I wrote a message on this discussion list titled
> "PCR Policy enforcement when using nvram".  In that, I asked for a way to
> have both a PCR check AND a password lock an nvram range (not an OR).  I
> really appreciated everyone's help, especially William Roberts, who gave
> some sample code of using a session to accomplish this goal.
>
> Now that Ubuntu has updated its repositories for the upcoming 20.04 LTS
> release and included TPM-tools v4.x, I figured it was time to take another
> look.
>
> My goal is to provide a method to auto-unlock a ZFS encrypted root
> filesystem.  Currently, ZFS allows for unlocking via a prompt or file
> containing a raw, hex, or passphrase values.  The mechanisms are already
> inplace to prompt on startup.
>
> So far I have just done a proof of concept.  It probably loads of bad code
> and tons of polish needed:
> https://github.com/ghfields/zfs/compare/master...ghfields:tpm2-autounlock
>
> I forked the zfs project, expanded the its initramfs hooks to include the
> required tpm2-tools binaries, and added another stanza to init script's
> decrypting section.  I also created a pair of scripts that configures the
> system and tests readback.
>
> The nvram index and the PCRs used are stored/read from the zfs filesystem
> properties.  I used the  filesytem's GUID as the required password as
> another check to verify the NVRAM range was intended for that filesystem.
> I also intend to issue an nvreadlock to prevent snooping once the key is
> used.
>
> I'd be interested in a critique of the method overall  I expect there ways
> to make this more secure.  With enough effort, one could issue a
> break=3Dpremount on the kernel line and manually extract the password from
> the TPM.  Any way to tighten that up?
>
> I'm a total novice at TPM in general, but am completely open to advise and
> guidance.
>
> Thanks,
> Garrett Fields
>
>
>

--===============0001112573983066378==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5JJiMzOTt2ZSBwbGF5ZWQgYXJvdW5kIHdpdGggdGhpcyBmb3Ig
cXVpdGXCoHNvbWUgdGltZSBhbmQgd2FudGVkIHRvIGdldCBzb21lIG1vcmUgZXllcyBvbiB0aGlz
IGNvZGUuwqAgSSYjMzk7dmUgY3JlYXRlZCBhIGRyYWZ0IFBSIHdpdGggJnF1b3Q7WkZTIG9uIExp
bnV4JnF1b3Q7LCBhc2tpbmcgZm9yIGEgZGlzY3Vzc2lvbiBvZiBtZXRob2RvbG9neS7CoCBMaWtl
bHksIHRoZSBwZW9wbGUgb24gdGhpcyBsaXN0IGNhbiBzcGVhayB0byB0aGUgdXRpbGl6YXRpb24g
b2YgVFBNMi10b29scyBhbmQgaGVscCB3aXRoIHRoZSBzZWN1cml0eSBhc3BlY3RzIG1vcmUgdGhh
biB0aGUgZmlsZXN5c3RlbXMgZm9jdXNlZCBkZXZlbG9wZXJzIHRoZXJlLjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+UGxlYXNlIGhhdmUgYSBsb29rIGFuZCBzdWJtaXQgY29tbWVudHMgaGVyZSBv
ciB0aGUgUFIgaXRzZWxmLjxicj48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNv
bS96ZnNvbmxpbnV4L3pmcy9wdWxsLzk4NTIiPmh0dHBzOi8vZ2l0aHViLmNvbS96ZnNvbmxpbnV4
L3pmcy9wdWxsLzk4NTI8L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5NYW55IHRoYW5rcyw8
L2Rpdj48ZGl2PkdhcnJldHQgRmllbGRzPGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgRGVj
IDksIDIwMTkgYXQgMTE6MTUgUE0gR2FycmV0dCBGaWVsZHMgJmx0OzxhIGhyZWY9Im1haWx0bzpn
aGZpZWxkc0BnbWFpbC5jb20iPmdoZmllbGRzQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48
L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBw
eCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGlu
Zy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdj5CYWNrIGluIHRoZSBlbmQgb2YgSnVseSwg
SSB3cm90ZSBhIG1lc3NhZ2Ugb24gdGhpcyBkaXNjdXNzaW9uIGxpc3QgdGl0bGVkICZxdW90O1BD
UiBQb2xpY3kgZW5mb3JjZW1lbnQgd2hlbiB1c2luZyBudnJhbSZxdW90Oy7CoCBJbiB0aGF0LCBJ
IGFza2VkIGZvciBhIHdheSB0byBoYXZlIGJvdGggYSBQQ1IgY2hlY2sgQU5EIGEgcGFzc3dvcmQg
bG9jayBhbiBudnJhbSByYW5nZSAobm90IGFuIE9SKS7CoCBJIHJlYWxseSBhcHByZWNpYXRlZCBl
dmVyeW9uZSYjMzk7cyBoZWxwLCBlc3BlY2lhbGx5IFdpbGxpYW0gUm9iZXJ0cywgd2hvIGdhdmUg
c29tZSBzYW1wbGUgY29kZSBvZiB1c2luZyBhIHNlc3Npb24gdG8gYWNjb21wbGlzaCB0aGlzIGdv
YWwuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Ob3cgdGhhdCBVYnVudHUgaGFzIHVwZGF0ZWQg
aXRzIHJlcG9zaXRvcmllcyBmb3IgdGhlIHVwY29taW5nIDIwLjA0IExUUyByZWxlYXNlIGFuZCBp
bmNsdWRlZCBUUE0tdG9vbHMgdjQueCwgSSBmaWd1cmVkIGl0IHdhcyB0aW1lIHRvIHRha2UgYW5v
dGhlciBsb29rLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+TXkgZ29hbCBpcyB0byBwcm92aWRl
IGEgbWV0aG9kIHRvIGF1dG8tdW5sb2NrIGEgWkZTIGVuY3J5cHRlZCByb290IGZpbGVzeXN0ZW0u
wqAgQ3VycmVudGx5LCBaRlMgYWxsb3dzIGZvciB1bmxvY2tpbmcgdmlhIGEgcHJvbXB0IG9yIGZp
bGUgY29udGFpbmluZyBhIHJhdywgaGV4LCBvciBwYXNzcGhyYXNlIHZhbHVlcy7CoCBUaGUgbWVj
aGFuaXNtcyBhcmUgYWxyZWFkeSBpbnBsYWNlIHRvIHByb21wdCBvbiBzdGFydHVwLjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+U28gZmFyIEkgaGF2ZSBqdXN0IGRvbmUgYSBwcm9vZiBvZiBjb25j
ZXB0LsKgIEl0IHByb2JhYmx5IGxvYWRzIG9mIGJhZCBjb2RlIGFuZCB0b25zIG9mIHBvbGlzaCBu
ZWVkZWQ6wqAgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2doZmllbGRzL3pmcy9jb21wYXJl
L21hc3Rlci4uLmdoZmllbGRzOnRwbTItYXV0b3VubG9jayIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vZ2l0aHViLmNvbS9naGZpZWxkcy96ZnMvY29tcGFyZS9tYXN0ZXIuLi5naGZpZWxkczp0cG0y
LWF1dG91bmxvY2s8L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGZvcmtlZCB0aGUgemZz
IHByb2plY3QsIGV4cGFuZGVkIHRoZSBpdHMgaW5pdHJhbWZzIGhvb2tzIHRvIGluY2x1ZGUgdGhl
IHJlcXVpcmVkIHRwbTItdG9vbHMgYmluYXJpZXMsIGFuZCBhZGRlZCBhbm90aGVyIHN0YW56YSB0
byBpbml0IHNjcmlwdCYjMzk7cyBkZWNyeXB0aW5nIHNlY3Rpb24uwqAgSSBhbHNvIGNyZWF0ZWQg
YSBwYWlyIG9mIHNjcmlwdHMgdGhhdCBjb25maWd1cmVzIHRoZSBzeXN0ZW0gYW5kIHRlc3RzIHJl
YWRiYWNrLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlIG52cmFtIGluZGV4IGFuZCB0aGUg
UENScyB1c2VkIGFyZSBzdG9yZWQvcmVhZCBmcm9tIHRoZSB6ZnMgZmlsZXN5c3RlbSBwcm9wZXJ0
aWVzLsKgIEkgdXNlZCB0aGXCoCBmaWxlc3l0ZW0mIzM5O3MgR1VJRCBhcyB0aGUgcmVxdWlyZWQg
cGFzc3dvcmQgYXMgYW5vdGhlciBjaGVjayB0byB2ZXJpZnkgdGhlIE5WUkFNIHJhbmdlIHdhcyBp
bnRlbmRlZCBmb3IgdGhhdCBmaWxlc3lzdGVtLsKgwqAgSSBhbHNvIGludGVuZCB0byBpc3N1ZSBh
biBudnJlYWRsb2NrIHRvIHByZXZlbnQgc25vb3Bpbmcgb25jZSB0aGUga2V5IGlzIHVzZWQuPGJy
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSYjMzk7ZCBiZSBpbnRlcmVzdGVkIGluIGEgY3Jp
dGlxdWUgb2YgdGhlIG1ldGhvZCBvdmVyYWxswqAgSSBleHBlY3QgdGhlcmUgd2F5cyB0byBtYWtl
IHRoaXMgbW9yZSBzZWN1cmUuwqAgV2l0aCBlbm91Z2ggZWZmb3J0LCBvbmUgY291bGQgaXNzdWUg
YSBicmVhaz1wcmVtb3VudCBvbiB0aGUga2VybmVsIGxpbmUgYW5kIG1hbnVhbGx5IGV4dHJhY3Qg
dGhlIHBhc3N3b3JkIGZyb20gdGhlIFRQTS7CoCBBbnkgd2F5IHRvIHRpZ2h0ZW4gdGhhdCB1cD88
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiBJJiMzOTttIGEgdG90YWwgbm92aWNlIGF0IFRQTSBp
biBnZW5lcmFsLCBidXQgYW0gY29tcGxldGVseSBvcGVuIHRvIGFkdmlzZSBhbmQgZ3VpZGFuY2Uu
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5HYXJyZXR0IEZpZWxk
czxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48L2Rpdj4KPC9ibG9ja3F1
b3RlPjwvZGl2Pgo=

--===============0001112573983066378==--

