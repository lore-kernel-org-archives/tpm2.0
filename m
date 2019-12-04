Content-Type: multipart/mixed; boundary="===============2107367097743318778=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Re: Check to see if signature is okay, then reboot
Date: Wed, 04 Dec 2019 20:03:33 +0000
Message-ID: <CALtZhhNYmOKOTN-FSP-NMuhe5b320Enu4v6X6QQsAP8H10N5fA@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E4BE0F@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2107367097743318778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>
>
> You need to call tpm2_loadexternal again to load the public portion of the
> key into
> The TPM or you need to mark the pubic object persistent with
> tpm2_evictcontrol.
> However, I would urge against that. Just load the object when you need it.
> A RM
> Should take care of flushing "transient" objects when your don't with
> them, or if
> Using the TPM directly, tpm2_flushcontext.




Against all logic or rationale, I simply have to fulfill one of the
requirements that my boss has given me (which was handed down to him from
another person). The requirement is that no RSA keys are stored on the hard
disk. Therefore a public key must be loaded into the TPM2 chip once in the
factory where is to be stored persistently and used to verify signatures.

So how should I go about this?

Should I do "createprimary", then follow it with "loadexternal" to load the
public key into the chip? What should I do next? Should I use
"evictcontrol" to move it into non-volatile storage? I tried using
evictcontrol today to move it into non-volatile storage but I couldn't find
the handle for the public key when I queried "getcap".




> Those files used in the -C and -c options are context files. Between
> command invocations
> The tools save the object context for re-use during, essentially, that
> boot of the TPM.
> After reboot, you need to re-get a context file, in your case
> tpm2_loadexternal will
> provide it.
>


How do I get a context file for a key that's already stored persistently
inside the TPM2 chip?

--===============2107367097743318778==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGJyPgpZb3UgbmVl
ZCB0byBjYWxsIHRwbTJfbG9hZGV4dGVybmFsIGFnYWluIHRvIGxvYWQgdGhlIHB1YmxpYyBwb3J0
aW9uIG9mIHRoZSBrZXkgaW50bzxicj4KVGhlIFRQTSBvciB5b3UgbmVlZCB0byBtYXJrIHRoZSBw
dWJpYyBvYmplY3QgcGVyc2lzdGVudCB3aXRoIHRwbTJfZXZpY3Rjb250cm9sLjxicj4KSG93ZXZl
ciwgSSB3b3VsZCB1cmdlIGFnYWluc3QgdGhhdC4gSnVzdCBsb2FkIHRoZSBvYmplY3Qgd2hlbiB5
b3UgbmVlZCBpdC4gQSBSTTxicj4KU2hvdWxkIHRha2UgY2FyZSBvZiBmbHVzaGluZyAmcXVvdDt0
cmFuc2llbnQmcXVvdDsgb2JqZWN0cyB3aGVuIHlvdXIgZG9uJiMzOTt0IHdpdGggdGhlbSwgb3Ig
aWY8YnI+ClVzaW5nIHRoZSBUUE0gZGlyZWN0bHksIHRwbTJfZmx1c2hjb250ZXh0LjwvYmxvY2tx
dW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFn
YWluc3QgYWxsIGxvZ2ljIG9yIHJhdGlvbmFsZSwgSSBzaW1wbHkgaGF2ZSB0byBmdWxmaWxsIG9u
ZSBvZiB0aGUgcmVxdWlyZW1lbnRzIHRoYXQgbXkgYm9zcyBoYXMgZ2l2ZW4gbWUgKHdoaWNoIHdh
cyBoYW5kZWQgZG93biB0byBoaW0gZnJvbSBhbm90aGVyIHBlcnNvbikuIFRoZSByZXF1aXJlbWVu
dCBpcyB0aGF0IG5vIFJTQSBrZXlzIGFyZSBzdG9yZWQgb24gdGhlIGhhcmQgZGlzay4gVGhlcmVm
b3JlIGEgcHVibGljIGtleSBtdXN0IGJlIGxvYWRlZCBpbnRvIHRoZSBUUE0yIGNoaXAgb25jZSBp
biB0aGUgZmFjdG9yeSB3aGVyZSBpcyB0byBiZSBzdG9yZWQgcGVyc2lzdGVudGx5IGFuZCB1c2Vk
IHRvIHZlcmlmeSBzaWduYXR1cmVzLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+U28gaG93IHNo
b3VsZCBJIGdvIGFib3V0IHRoaXM/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5TaG91bGQgSSBk
byAmcXVvdDtjcmVhdGVwcmltYXJ5JnF1b3Q7LCB0aGVuIGZvbGxvdyBpdCB3aXRoICZxdW90O2xv
YWRleHRlcm5hbCZxdW90OyB0byBsb2FkIHRoZSBwdWJsaWMga2V5IGludG8gdGhlIGNoaXA/IFdo
YXQgc2hvdWxkIEkgZG8gbmV4dD8gU2hvdWxkIEkgdXNlICZxdW90O2V2aWN0Y29udHJvbCZxdW90
OyB0byBtb3ZlIGl0IGludG8gbm9uLXZvbGF0aWxlIHN0b3JhZ2U/IEkgdHJpZWQgdXNpbmcgZXZp
Y3Rjb250cm9sIHRvZGF5IHRvIG1vdmUgaXQgaW50byBub24tdm9sYXRpbGUgc3RvcmFnZSBidXQg
SSBjb3VsZG4mIzM5O3QgZmluZCB0aGUgaGFuZGxlIGZvciB0aGUgcHVibGljIGtleSB3aGVuIEkg
cXVlcmllZCAmcXVvdDtnZXRjYXAmcXVvdDsuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVm
dDoxZXgiPlRob3NlIGZpbGVzIHVzZWQgaW4gdGhlIC1DIGFuZCAtYyBvcHRpb25zIGFyZSBjb250
ZXh0IGZpbGVzLiBCZXR3ZWVuIGNvbW1hbmQgaW52b2NhdGlvbnM8YnI+ClRoZSB0b29scyBzYXZl
IHRoZSBvYmplY3QgY29udGV4dCBmb3IgcmUtdXNlIGR1cmluZywgZXNzZW50aWFsbHksIHRoYXQg
Ym9vdCBvZiB0aGUgVFBNLjxicj4KQWZ0ZXIgcmVib290LCB5b3UgbmVlZCB0byByZS1nZXQgYSBj
b250ZXh0IGZpbGUsIGluIHlvdXIgY2FzZSB0cG0yX2xvYWRleHRlcm5hbCB3aWxsPGJyPgpwcm92
aWRlIGl0Ljxicj4KPC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SG93IGRvIEkgZ2V0IGEgY29udGV4dCBmaWxlIGZvciBhIGtleSB0aGF0JiMzOTtzIGFscmVh
ZHkgc3RvcmVkIHBlcnNpc3RlbnRseSBpbnNpZGUgdGhlIFRQTTIgY2hpcD88L2Rpdj4K

--===============2107367097743318778==--

