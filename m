Content-Type: multipart/mixed; boundary="===============4598248167382669147=="
MIME-Version: 1.0
From: Andrey Larionov <anlarionov at gmail.com>
Subject: [tpm2] Re: Importing AES key protected by PolicyAuthorize
Date: Fri, 22 Nov 2019 19:49:26 +0300
Message-ID: <CAHmz7DPam0ycdd5Uv7C-i6hpSr3GRzy03d_5hO=DVxUxFOeVpw@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E460F3@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4598248167382669147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you, William.
Can i help somehow with this PR?

Also, i have a question about test in PR. Should this test check what
policy actually regulates authorization for imported key? Even for
unsatisfiable policy shouldn't we try to access key?

On Fri, Nov 22, 2019 at 1:59 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> > -----Original Message-----
> > From: Andrey Larionov [mailto:anlarionov(a)gmail.com]
> > Sent: Wednesday, November 20, 2019 3:23 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Importing AES key protected by PolicyAuthorize
> >
> > Hello. First of all i would like to thank all the contributors of
> project for such
> > tremendous work of creating really pleasant experience for such
> complicated
> > topic.
> >
> > Previously asked this question via github issue. So just closed it and
> crsossposting
> > to mailing list.
> >
> >
> >
> > I'm trying to permanently import AES key into TPM. And use sequence of
> > commands for this
> >
> > tpm2_import -C -G aes -i -r -u
> > tpm2_load -C -u -r -n -c
> > tpm2_evictcontrol -c
> >
> >
> > And this works fine. But whet i try to import key protected by a policy,
> generated
> > with tpm2_policyauthorize, via -L argument in tpm2_import i got this
> error
> > message, which i think irrelevant, because i don't import duplicated ke=
y.
> > ERROR: Expected SymSeed to be specified via "-s", missing option.
> >
> > Did i misunderstand something? Is it achievable?
>
> This looks like a limitation in the tool implementation. When you specify
> -L it heads
> Down a path called tpm2_import where it expects TPM public and private
> blobs
> instead of just raw key material.
>
> I have this working on a PR:
> https://github.com/tpm2-software/tpm2-tools/pull/1857
>
> This sudo code should work, or be close (the test has this too in the PR)
>
> # create a primary key
> tpm2_createprimary -c primary.ctx
>
> # create an aes 256 key (16 byte key)
> dd if=3D/dev/urandom of=3Daes.key bs=3D16 count=3D1
>
> # create a fake policy, size sha256 (32 bytes)
> dd if=3D/dev/urandom of=3Dpolicy.dat bs=3D32 count=3D1
>
> # import to tpm
> tpm2_import -G aes -i aes.key -L policy.dat -r aes.priv -u aes.pub
>
> >
> > Also, i think this CLI parameter, -L, in tpm2_import could have better
> > documentation. It's unclear what policy should be specified, and how it
> would be
> > used.
>
> Policies in TPM's are just hashes. You execute a set of tpm2_policyxxx
> commands
> with a trial session and get a policy hash. This hash is specified when
> you create the
> object and is immutable. When you wish to use the object, you satisfy the
> policy on
> a policy session and when you access the object, the TPM checks the
> internal state
> of the session, and if the hashes match, it grants access.
>
> In the test code, I just generated a random 32 byte (sha256 size hash). So
> essentially
> I said create the object with a random and thus unsatisfiable policy, not
> something
> you would likely do in the real world.
>
> The option "-L the policy file" is a pretty terrible help message, ill
> make a bug so we don't
> Forget this:
>   - https://github.com/tpm2-software/tpm2-tools/issues/1858
>
> >
> >
> >
> > I'll try to clarify my needs:
> > I would like to provision many TPM2 devices with same, externaly
> generated, AES
> > key in Platform Hierarchy (but only AES key should be same, primary
> objects and
> > parent objects should differs).
> > I need this key to be persisted inside TPM.
> > I would like to have this AES key protected by flexible policy
> > (TPM2_PolicyAuthorize), to be accessed in target system with obtainable
> policy.
> > So i expect to use this sequence (briefly, without session management
> > commands):
> >
> > tpm2_createprimary
> > tpm2_loadexternal
> > tpm2_policyauthorize
> > tpm2_import
> > tpm2_load
> > tpm2_evictcontrol
> >
> >
> > What am i missing here?
>
>

--===============4598248167382669147==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhhbmsgeW91LCBXaWxsaWFtLjxkaXY+Q2FuIGkgaGVscCBzb21laG93
IHdpdGggdGhpcyBQUj88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFsc28sIGkgaGF2ZSBhIHF1
ZXN0aW9uIGFib3V0IHRlc3QgaW4gUFIuwqBTaG91bGQgdGhpcyB0ZXN0IGNoZWNrIHdoYXQgcG9s
aWN5IGFjdHVhbGx5IHJlZ3VsYXRlcyBhdXRob3JpemF0aW9uIGZvciBpbXBvcnRlZCBrZXk/IEV2
ZW4gZm9yIHVuc2F0aXNmaWFibGUgcG9saWN5IHNob3VsZG4mIzM5O3Qgd2UgdHJ5IHRvIGFjY2Vz
cyBrZXk/PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0i
bHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTo1OSBBTSBS
b2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0Bp
bnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48
L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBw
eCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGlu
Zy1sZWZ0OjFleCI+Jmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4KJmd0OyBGcm9t
OiBBbmRyZXkgTGFyaW9ub3YgW21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5sYXJpb25vdkBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5hbmxhcmlvbm92QGdtYWlsLmNvbTwvYT5dPGJyPgomZ3Q7
IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjAsIDIwMTkgMzoyMyBQTTxicj4KJmd0OyBUbzog
PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBs
aXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFt0cG0yXSBJbXBvcnRpbmcgQUVTIGtl
eSBwcm90ZWN0ZWQgYnkgUG9saWN5QXV0aG9yaXplPGJyPgomZ3Q7IDxicj4KJmd0OyBIZWxsby4g
Rmlyc3Qgb2YgYWxsIGkgd291bGQgbGlrZSB0byB0aGFuayBhbGwgdGhlIGNvbnRyaWJ1dG9ycyBv
ZiBwcm9qZWN0IGZvciBzdWNoPGJyPgomZ3Q7IHRyZW1lbmRvdXMgd29yayBvZiBjcmVhdGluZyBy
ZWFsbHkgcGxlYXNhbnQgZXhwZXJpZW5jZSBmb3Igc3VjaCBjb21wbGljYXRlZDxicj4KJmd0OyB0
b3BpYy48YnI+CiZndDsgPGJyPgomZ3Q7IFByZXZpb3VzbHkgYXNrZWQgdGhpcyBxdWVzdGlvbiB2
aWEgZ2l0aHViIGlzc3VlLiBTbyBqdXN0IGNsb3NlZCBpdCBhbmQgY3Jzb3NzcG9zdGluZzxicj4K
Jmd0OyB0byBtYWlsaW5nIGxpc3QuPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgom
Z3Q7IEkmIzM5O20gdHJ5aW5nIHRvIHBlcm1hbmVudGx5IGltcG9ydCBBRVMga2V5IGludG8gVFBN
LiBBbmQgdXNlIHNlcXVlbmNlIG9mPGJyPgomZ3Q7IGNvbW1hbmRzIGZvciB0aGlzPGJyPgomZ3Q7
IDxicj4KJmd0OyB0cG0yX2ltcG9ydCAtQyAtRyBhZXMgLWkgLXIgLXU8YnI+CiZndDsgdHBtMl9s
b2FkIC1DIC11IC1yIC1uIC1jPGJyPgomZ3Q7IHRwbTJfZXZpY3Rjb250cm9sIC1jPGJyPgomZ3Q7
IDxicj4KJmd0OyA8YnI+CiZndDsgQW5kIHRoaXMgd29ya3MgZmluZS4gQnV0IHdoZXQgaSB0cnkg
dG8gaW1wb3J0IGtleSBwcm90ZWN0ZWQgYnkgYSBwb2xpY3ksIGdlbmVyYXRlZDxicj4KJmd0OyB3
aXRoIHRwbTJfcG9saWN5YXV0aG9yaXplLCB2aWEgLUwgYXJndW1lbnQgaW4gdHBtMl9pbXBvcnQg
aSBnb3QgdGhpcyBlcnJvcjxicj4KJmd0OyBtZXNzYWdlLCB3aGljaCBpIHRoaW5rIGlycmVsZXZh
bnQsIGJlY2F1c2UgaSBkb24mIzM5O3QgaW1wb3J0IGR1cGxpY2F0ZWQga2V5Ljxicj4KJmd0OyBF
UlJPUjogRXhwZWN0ZWQgU3ltU2VlZCB0byBiZSBzcGVjaWZpZWQgdmlhICZxdW90Oy1zJnF1b3Q7
LCBtaXNzaW5nIG9wdGlvbi48YnI+CiZndDsgPGJyPgomZ3Q7IERpZCBpIG1pc3VuZGVyc3RhbmQg
c29tZXRoaW5nPyBJcyBpdCBhY2hpZXZhYmxlPzxicj4KPGJyPgpUaGlzIGxvb2tzIGxpa2UgYSBs
aW1pdGF0aW9uIGluIHRoZSB0b29sIGltcGxlbWVudGF0aW9uLiBXaGVuIHlvdSBzcGVjaWZ5IC1M
IGl0IGhlYWRzPGJyPgpEb3duIGEgcGF0aCBjYWxsZWQgdHBtMl9pbXBvcnQgd2hlcmUgaXQgZXhw
ZWN0cyBUUE0gcHVibGljIGFuZCBwcml2YXRlIGJsb2JzPGJyPgppbnN0ZWFkIG9mIGp1c3QgcmF3
IGtleSBtYXRlcmlhbC48YnI+Cjxicj4KSSBoYXZlIHRoaXMgd29ya2luZyBvbiBhIFBSOjxicj4K
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9wdWxs
LzE4NTciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNv
bS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvcHVsbC8xODU3PC9hPjxicj4KPGJyPgpUaGlzIHN1
ZG8gY29kZSBzaG91bGQgd29yaywgb3IgYmUgY2xvc2UgKHRoZSB0ZXN0IGhhcyB0aGlzIHRvbyBp
biB0aGUgUFIpPGJyPgo8YnI+CiMgY3JlYXRlIGEgcHJpbWFyeSBrZXk8YnI+CnRwbTJfY3JlYXRl
cHJpbWFyeSAtYyBwcmltYXJ5LmN0eDxicj4KPGJyPgojIGNyZWF0ZSBhbiBhZXMgMjU2IGtleSAo
MTYgYnl0ZSBrZXkpPGJyPgpkZCBpZj0vZGV2L3VyYW5kb20gb2Y9YWVzLmtleSBicz0xNiBjb3Vu
dD0xPGJyPgo8YnI+CiMgY3JlYXRlIGEgZmFrZSBwb2xpY3ksIHNpemUgc2hhMjU2ICgzMiBieXRl
cyk8YnI+CmRkIGlmPS9kZXYvdXJhbmRvbSBvZj1wb2xpY3kuZGF0IGJzPTMyIGNvdW50PTE8YnI+
Cjxicj4KIyBpbXBvcnQgdG8gdHBtPGJyPgp0cG0yX2ltcG9ydCAtRyBhZXMgLWkgYWVzLmtleSAt
TCBwb2xpY3kuZGF0IC1yIGFlcy5wcml2IC11IGFlcy5wdWI8YnI+Cjxicj4KJmd0OyA8YnI+CiZn
dDsgQWxzbywgaSB0aGluayB0aGlzIENMSSBwYXJhbWV0ZXIsIC1MLCBpbiB0cG0yX2ltcG9ydCBj
b3VsZCBoYXZlIGJldHRlcjxicj4KJmd0OyBkb2N1bWVudGF0aW9uLiBJdCYjMzk7cyB1bmNsZWFy
IHdoYXQgcG9saWN5IHNob3VsZCBiZSBzcGVjaWZpZWQsIGFuZCBob3cgaXQgd291bGQgYmU8YnI+
CiZndDsgdXNlZC48YnI+Cjxicj4KUG9saWNpZXMgaW4gVFBNJiMzOTtzIGFyZSBqdXN0IGhhc2hl
cy4gWW91IGV4ZWN1dGUgYSBzZXQgb2YgdHBtMl9wb2xpY3l4eHggY29tbWFuZHM8YnI+CndpdGgg
YSB0cmlhbCBzZXNzaW9uIGFuZCBnZXQgYSBwb2xpY3kgaGFzaC4gVGhpcyBoYXNoIGlzIHNwZWNp
ZmllZCB3aGVuIHlvdSBjcmVhdGUgdGhlPGJyPgpvYmplY3QgYW5kIGlzIGltbXV0YWJsZS4gV2hl
biB5b3Ugd2lzaCB0byB1c2UgdGhlIG9iamVjdCwgeW91IHNhdGlzZnkgdGhlIHBvbGljeSBvbjxi
cj4KYSBwb2xpY3kgc2Vzc2lvbiBhbmQgd2hlbiB5b3UgYWNjZXNzIHRoZSBvYmplY3QsIHRoZSBU
UE0gY2hlY2tzIHRoZSBpbnRlcm5hbCBzdGF0ZTxicj4Kb2YgdGhlIHNlc3Npb24sIGFuZCBpZiB0
aGUgaGFzaGVzIG1hdGNoLCBpdCBncmFudHMgYWNjZXNzLjxicj4KPGJyPgpJbiB0aGUgdGVzdCBj
b2RlLCBJIGp1c3QgZ2VuZXJhdGVkIGEgcmFuZG9tIDMyIGJ5dGUgKHNoYTI1NiBzaXplIGhhc2gp
LiBTbyBlc3NlbnRpYWxseTxicj4KSSBzYWlkIGNyZWF0ZSB0aGUgb2JqZWN0IHdpdGggYSByYW5k
b20gYW5kIHRodXMgdW5zYXRpc2ZpYWJsZSBwb2xpY3ksIG5vdCBzb21ldGhpbmc8YnI+CnlvdSB3
b3VsZCBsaWtlbHkgZG8gaW4gdGhlIHJlYWwgd29ybGQuPGJyPgo8YnI+ClRoZSBvcHRpb24gJnF1
b3Q7LUwgdGhlIHBvbGljeSBmaWxlJnF1b3Q7IGlzIGEgcHJldHR5IHRlcnJpYmxlIGhlbHAgbWVz
c2FnZSwgaWxsIG1ha2UgYSBidWcgc28gd2UgZG9uJiMzOTt0PGJyPgpGb3JnZXQgdGhpczo8YnI+
CsKgIC0gPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29s
cy9pc3N1ZXMvMTg1OCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9n
aXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9pc3N1ZXMvMTg1ODwvYT48YnI+Cjxi
cj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBJJiMzOTtsbCB0cnkgdG8gY2xh
cmlmeSBteSBuZWVkczo8YnI+CiZndDsgSSB3b3VsZCBsaWtlIHRvIHByb3Zpc2lvbiBtYW55IFRQ
TTIgZGV2aWNlcyB3aXRoIHNhbWUsIGV4dGVybmFseSBnZW5lcmF0ZWQsIEFFUzxicj4KJmd0OyBr
ZXkgaW4gUGxhdGZvcm0gSGllcmFyY2h5IChidXQgb25seSBBRVMga2V5IHNob3VsZCBiZSBzYW1l
LCBwcmltYXJ5IG9iamVjdHMgYW5kPGJyPgomZ3Q7IHBhcmVudCBvYmplY3RzIHNob3VsZCBkaWZm
ZXJzKS48YnI+CiZndDsgSSBuZWVkIHRoaXMga2V5IHRvIGJlIHBlcnNpc3RlZCBpbnNpZGUgVFBN
Ljxicj4KJmd0OyBJIHdvdWxkIGxpa2UgdG8gaGF2ZSB0aGlzIEFFUyBrZXkgcHJvdGVjdGVkIGJ5
IGZsZXhpYmxlIHBvbGljeTxicj4KJmd0OyAoVFBNMl9Qb2xpY3lBdXRob3JpemUpLCB0byBiZSBh
Y2Nlc3NlZCBpbiB0YXJnZXQgc3lzdGVtIHdpdGggb2J0YWluYWJsZSBwb2xpY3kuPGJyPgomZ3Q7
IFNvIGkgZXhwZWN0IHRvIHVzZSB0aGlzIHNlcXVlbmNlIChicmllZmx5LCB3aXRob3V0IHNlc3Np
b24gbWFuYWdlbWVudDxicj4KJmd0OyBjb21tYW5kcyk6PGJyPgomZ3Q7IDxicj4KJmd0OyB0cG0y
X2NyZWF0ZXByaW1hcnk8YnI+CiZndDsgdHBtMl9sb2FkZXh0ZXJuYWw8YnI+CiZndDsgdHBtMl9w
b2xpY3lhdXRob3JpemU8YnI+CiZndDsgdHBtMl9pbXBvcnQ8YnI+CiZndDsgdHBtMl9sb2FkPGJy
PgomZ3Q7IHRwbTJfZXZpY3Rjb250cm9sPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgV2hh
dCBhbSBpIG1pc3NpbmcgaGVyZT88YnI+Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============4598248167382669147==--

