Content-Type: multipart/mixed; boundary="===============1214765887821337561=="
MIME-Version: 1.0
From: joseph at zeronsoftn.com
Subject: [tpm2] Re: How can I prevent MITM attacks for unsealing?
Date: Sat, 22 Oct 2022 07:23:38 +0300
Message-ID: <1666412618.635839966@f7.my.com>
In-Reply-To: 062975e60a00d3c82b1eba07c13ce095ce9f85ae.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1214765887821337561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Serialized primary.handle has a Public Key.
Is there a way to verify whether this public key is a key created by the TP=
M through the TPM's EK?
If this is possible, it will not be possible to protect against MITM in gen=
eral, but if you have the CA of specific TPM manufacturers safely or remote=
ly verify it, can be defend against MITM. =ED=86=A0=EC=9A=94=EC=9D=BC, 22 1=
0=EC=9B=94 2022, 02:43=EC=98=A4=EC=A0=84 +09:00 =EB=B0=9C=EC=8B=A0 "Roberts=
, William C"  william.c.roberts(a)intel.com :

>On Mon, 2022-10-10 at 18:07 +0300,  joseph(a)zeronsoftn.com wrote:
>
> Here is the commands I tried:
> https://gist.github.com/jclab-joseph/d1d6d9bbbd32c0fe200cc7725bcf0d86
> A session was established via a serialized persistent handle.
> This seems to be able to prevent MITM in the session connection
> process.
>
> But, assume that an attacker can modify the filesystem.
> If the primary.handle can be replaced with the attacker's key, the
> session will be successfully established.
> And I suspect that plaintext can be exposed if unsealed through the
> session.
>
> Wouldn't validation be needed between the connected session and
> seal.ctx?
>If the attacker can modify the primary.handle, which is verifying the
>encrypted session, then yes you need something else. You could add a
>bind key with a password and have the user enter the password and thus
>nothing for the attacker to attack that is stored on disk.
>
>
> =ED=99=94=EC=9A=94=EC=9D=BC, 04 10=EC=9B=94 2022, 00:54=EC=98=A4=EC=A0=84=
 +09:00 =EB=B0=9C=EC=8B=A0 "Roberts, William C" =

> william.c.roberts(a)intel.com:
>
>> On Mon, 2022-10-03 at 18:01 +0300,  joseph(a)zeronsoftn.com wrote:
>>> Hello,
>>>
>>> Does anyone know about this issue?
>>>
>>>
>> https://github.com/jc-lab/securekit/blob/466abe16bfe4f28ef86db6bc7264921=
4ab2e4b51/pkg/securekit-disk/opt/securekit/sbin/disk-init#L82-L86
>>>
>>> Here's one example of sealing and unsealing.
>>> This method seems (probably?) to prevent the sniffing attack,
>> which
>>> was a vulnerability of Bitlocker in the past.
>>>
>>> But isn't a MITM attack possible in the process of creating an
>>> encrypted session?
>> So just to unpack the commands here for discussion I copied that
>> code
>> block:
>>
>> tpm2_createprimary -Q -C o -c tpm-primary.ctx
>> tpm2_load -Q -C tpm-primary.ctx -u ${p1_dir}/seal.pub -r
>> ${p1_dir}/seal.priv -c tpm-seal.ctx
>> tpm2_startauthsession -Q --hmac-session -c tpm-primary.ctx -S
>> session.ctx
>> tpm2_unseal -Q -p pcr:${tpm_seal_pcr_policy} -c tpm-seal.ctx -o
>> ${output}
>> cleanupSession
>>
>> The issue here is that the key created by the tpm2_createprimary
>> command doesn't have provenance, so it's just be trusted implicitly
>> even through it could be attacker controlled. If the attacker was
>> controlling the primary object, they could just forward the
>> commands
>> unencrypted to the TPM and get the unseal to release them the key
>> in
>> the clear.
>>
>>>
>>> I am not familiar with the process of establishing a session,
>>> However, it seems that MITM can be prevented only by using a
>> session
>>> key encrypted with the EK of the TPM, or by signing the
>> asymmetric
>>> key with the EK to derive the key, when creating a session.
>>
>> You just need a way to ensure provenance. Another way is to load an
>> established key to the TPM and start the authsession with that. If
>> you're using a persistent key you need to verify the name after
>> establishing the session or use something like a serialized ESYS_TR
>> which will do the name checking automatically. If you load a key
>> blob
>> to the TPM that you control, ESAPI will have the checks in place to
>> make sure you don't get duped.
>>
>>>
>>> Is MITM not considered in TPM? Or is there another way?
>>
>> It is considered in the TPM and is discussed in the architecture
>> document. Theirs a few ways you can securely set up an encrypted
>> session, either with EK and associated Certificate or through other
>> keys like the SRK. The big thing is, you have to do it in a way
>> where
>> the attacker can not MiTM the session establishment, which boils
>> down
>> to using a known key.
>>
>>>
>>> Regards,
>>>
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> tpm2 mailing list --  tpm2(a)lists.01.org
>>> To unsubscribe send an email to  tpm2-leave(a)lists.01.org
>>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
>

--===============1214765887821337561==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PC9oZWFkPjxib2R5PjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IiBkaXI9
Imx0ciI+U2VyaWFsaXplZCBwcmltYXJ5LmhhbmRsZSBoYXMgYSBQdWJsaWMgS2V5Ljxicj4KSXMg
dGhlcmUgYSB3YXkgdG8gdmVyaWZ5IHdoZXRoZXIgdGhpcyBwdWJsaWMga2V5IGlzIGEga2V5IGNy
ZWF0ZWQgYnkgdGhlIFRQTSB0aHJvdWdoIHRoZSBUUE0ncyBFSz88L3A+CjxwIGRpcj0ibHRyIj5J
ZiB0aGlzIGlzIHBvc3NpYmxlLCBpdCB3aWxsIG5vdCBiZSBwb3NzaWJsZSB0byBwcm90ZWN0IGFn
YWluc3QgTUlUTSBpbiBnZW5lcmFsLCBidXQgaWYgeW91IGhhdmUgdGhlIENBIG9mIHNwZWNpZmlj
IFRQTSBtYW51ZmFjdHVyZXJzIHNhZmVseSBvciByZW1vdGVseSB2ZXJpZnkgaXQsIGNhbiBiZSBk
ZWZlbmQgYWdhaW5zdCBNSVRNLjwvcD4K7Yag7JqU7J28LCAyMiAxMOyblCAyMDIyLCAwMjo0M+yY
pOyghCArMDk6MDAg67Cc7IugICJSb2JlcnRzLCBXaWxsaWFtIEMiIDxhIGhyZWY9Im1haWx0bzp3
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwv
YT46PGJyPjxicj48YmxvY2txdW90ZSBpZD0ibWFpbC1hcHAtYXV0by1xdW90ZSIgY2l0ZT0iMTY2
NjM3NDE4MzAwMDAwMTEwMjkiIHN0eWxlPSJib3JkZXItbGVmdDoxcHggc29saWQgI0ZDMkMzODsg
bWFyZ2luOjBweCAwcHggMHB4IDEwcHg7IHBhZGRpbmc6MHB4IDBweCAwcHggMTBweDsiPgoJCgoK
CiAgICAKCgoKCgoKCgoKCQoJCgoKCQoJCgkKCQoJCgoJCgkKCgkKCQoKCgo8ZGl2IGNsYXNzPSJq
cy1oZWxwZXIganMtcmVhZG1zZy1tc2ciPgoJPHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxl
PgogCTxkaXY+CgkJPGJhc2UgdGFyZ2V0PSJfc2VsZiIgaHJlZj0iaHR0cHM6Ly9lLWFqLm15LmNv
bS8iPgoJCQoJCQk8ZGl2IGlkPSJzdHlsZV8xNjY2Mzc0MTgzMDAwMDAxMTAyOV9CT0RZIj5PbiBN
b24sIDIwMjItMTAtMTAgYXQgMTg6MDcgKzAzMDAsIDxhIGhyZWY9Im1haWx0bzpqb3NlcGhAemVy
b25zb2Z0bi5jb20iPmpvc2VwaEB6ZXJvbnNvZnRuLmNvbTwvYT4gd3JvdGU6PGJyPgomZ3Q7IDxi
cj4KJmd0OyBIZXJlIGlzIHRoZSBjb21tYW5kcyBJIHRyaWVkOjxicj4KJmd0OyA8YSBocmVmPSJo
dHRwczovL2dpc3QuZ2l0aHViLmNvbS9qY2xhYi1qb3NlcGgvZDFkNmQ5YmJiZDMyYzBmZTIwMGNj
NzcyNWJjZjBkODYiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpc3QuZ2l0aHViLmNvbS9qY2xh
Yi1qb3NlcGgvZDFkNmQ5YmJiZDMyYzBmZTIwMGNjNzcyNWJjZjBkODY8L2E+PGJyPgomZ3Q7IEEg
c2Vzc2lvbiB3YXMgZXN0YWJsaXNoZWQgdmlhIGEgc2VyaWFsaXplZCBwZXJzaXN0ZW50IGhhbmRs
ZS48YnI+CiZndDsgVGhpcyBzZWVtcyB0byBiZSBhYmxlIHRvIHByZXZlbnQgTUlUTSBpbiB0aGUg
c2Vzc2lvbiBjb25uZWN0aW9uPGJyPgomZ3Q7IHByb2Nlc3MuPGJyPgomZ3Q7IDxicj4KJmd0OyBC
dXQsIGFzc3VtZSB0aGF0IGFuIGF0dGFja2VyIGNhbiBtb2RpZnkgdGhlIGZpbGVzeXN0ZW0uPGJy
PgomZ3Q7IElmIHRoZSBwcmltYXJ5LmhhbmRsZSBjYW4gYmUgcmVwbGFjZWQgd2l0aCB0aGUgYXR0
YWNrZXIncyBrZXksIHRoZTxicj4KJmd0OyBzZXNzaW9uIHdpbGwgYmUgc3VjY2Vzc2Z1bGx5IGVz
dGFibGlzaGVkLjxicj4KJmd0OyBBbmQgSSBzdXNwZWN0IHRoYXQgcGxhaW50ZXh0IGNhbiBiZSBl
eHBvc2VkIGlmIHVuc2VhbGVkIHRocm91Z2ggdGhlPGJyPgomZ3Q7IHNlc3Npb24uPGJyPgomZ3Q7
IDxicj4KJmd0OyBXb3VsZG4ndCB2YWxpZGF0aW9uIGJlIG5lZWRlZCBiZXR3ZWVuIHRoZSBjb25u
ZWN0ZWQgc2Vzc2lvbiBhbmQ8YnI+CiZndDsgc2VhbC5jdHg/PGJyPgogICAgCklmIHRoZSBhdHRh
Y2tlciBjYW4gbW9kaWZ5IHRoZSBwcmltYXJ5LmhhbmRsZSwgd2hpY2ggaXMgdmVyaWZ5aW5nIHRo
ZTxicj4KZW5jcnlwdGVkIHNlc3Npb24sIHRoZW4geWVzIHlvdSBuZWVkIHNvbWV0aGluZyBlbHNl
LiBZb3UgY291bGQgYWRkIGE8YnI+CmJpbmQga2V5IHdpdGggYSBwYXNzd29yZCBhbmQgaGF2ZSB0
aGUgdXNlciBlbnRlciB0aGUgcGFzc3dvcmQgYW5kIHRodXM8YnI+Cm5vdGhpbmcgZm9yIHRoZSBh
dHRhY2tlciB0byBhdHRhY2sgdGhhdCBpcyBzdG9yZWQgb24gZGlzay48YnI+Cjxicj4KJmd0OyA8
YnI+CiZndDsg7ZmU7JqU7J28LCAwNCAxMOyblCAyMDIyLCAwMDo1NOyYpOyghCArMDk6MDAg67Cc
7IugICJSb2JlcnRzLCBXaWxsaWFtIEMiIDxicj4KJmd0OyB3aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb206PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7IE9uIE1vbiwgMjAyMi0xMC0wMyBhdCAxODow
MSArMDMwMCwgPGEgaHJlZj0ibWFpbHRvOmpvc2VwaEB6ZXJvbnNvZnRuLmNvbSI+am9zZXBoQHpl
cm9uc29mdG4uY29tPC9hPiB3cm90ZTo8YnI+CiZndDsgJmd0OyAmZ3Q7IEhlbGxvLDxicj4KJmd0
OyAmZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyBEb2VzIGFueW9uZSBrbm93IGFib3V0IHRo
aXMgaXNzdWU/PGJyPgomZ3Q7ICZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IDxicj4KJmd0
OyAmZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9qYy1sYWIvc2VjdXJla2l0L2Jsb2Iv
NDY2YWJlMTZiZmU0ZjI4ZWY4NmRiNmJjNzI2NDkyMTRhYjJlNGI1MS9wa2cvc2VjdXJla2l0LWRp
c2svb3B0L3NlY3VyZWtpdC9zYmluL2Rpc2staW5pdCNMODItTDg2IiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9naXRodWIuY29tL2pjLWxhYi9zZWN1cmVraXQvYmxvYi80NjZhYmUxNmJmZTRmMjhl
Zjg2ZGI2YmM3MjY0OTIxNGFiMmU0YjUxL3BrZy9zZWN1cmVraXQtZGlzay9vcHQvc2VjdXJla2l0
L3NiaW4vZGlzay1pbml0I0w4Mi1MODY8L2E+PGJyPgomZ3Q7ICZndDsgJmd0OyA8YnI+CiZndDsg
Jmd0OyAmZ3Q7IEhlcmUncyBvbmUgZXhhbXBsZSBvZiBzZWFsaW5nIGFuZCB1bnNlYWxpbmcuPGJy
PgomZ3Q7ICZndDsgJmd0OyBUaGlzIG1ldGhvZCBzZWVtcyAocHJvYmFibHk/KSB0byBwcmV2ZW50
IHRoZSBzbmlmZmluZyBhdHRhY2ssPGJyPgomZ3Q7ICZndDsgd2hpY2g8YnI+CiZndDsgJmd0OyAm
Z3Q7IHdhcyBhIHZ1bG5lcmFiaWxpdHkgb2YgQml0bG9ja2VyIGluIHRoZSBwYXN0Ljxicj4KJmd0
OyAmZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyBCdXQgaXNuJ3QgYSBNSVRNIGF0dGFjayBw
b3NzaWJsZSBpbiB0aGUgcHJvY2VzcyBvZiBjcmVhdGluZyBhbjxicj4KJmd0OyAmZ3Q7ICZndDsg
ZW5jcnlwdGVkIHNlc3Npb24/PGJyPgomZ3Q7ICZndDsgU28ganVzdCB0byB1bnBhY2sgdGhlIGNv
bW1hbmRzIGhlcmUgZm9yIGRpc2N1c3Npb24gSSBjb3BpZWQgdGhhdDxicj4KJmd0OyAmZ3Q7IGNv
ZGU8YnI+CiZndDsgJmd0OyBibG9jazo8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyB0cG0y
X2NyZWF0ZXByaW1hcnkgLVEgLUMgbyAtYyB0cG0tcHJpbWFyeS5jdHg8YnI+CiZndDsgJmd0OyB0
cG0yX2xvYWQgLVEgLUMgdHBtLXByaW1hcnkuY3R4IC11ICR7cDFfZGlyfS9zZWFsLnB1YiAtcjxi
cj4KJmd0OyAmZ3Q7ICR7cDFfZGlyfS9zZWFsLnByaXYgLWMgdHBtLXNlYWwuY3R4PGJyPgomZ3Q7
ICZndDsgdHBtMl9zdGFydGF1dGhzZXNzaW9uIC1RIC0taG1hYy1zZXNzaW9uIC1jIHRwbS1wcmlt
YXJ5LmN0eCAtUzxicj4KJmd0OyAmZ3Q7IHNlc3Npb24uY3R4PGJyPgomZ3Q7ICZndDsgdHBtMl91
bnNlYWwgLVEgLXAgcGNyOiR7dHBtX3NlYWxfcGNyX3BvbGljeX0gLWMgdHBtLXNlYWwuY3R4IC1v
PGJyPgomZ3Q7ICZndDsgJHtvdXRwdXR9PGJyPgomZ3Q7ICZndDsgY2xlYW51cFNlc3Npb248YnI+
CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyBUaGUgaXNzdWUgaGVyZSBpcyB0aGF0IHRoZSBrZXkg
Y3JlYXRlZCBieSB0aGUgdHBtMl9jcmVhdGVwcmltYXJ5PGJyPgomZ3Q7ICZndDsgY29tbWFuZCBk
b2Vzbid0IGhhdmUgcHJvdmVuYW5jZSwgc28gaXQncyBqdXN0IGJlIHRydXN0ZWQgaW1wbGljaXRs
eTxicj4KJmd0OyAmZ3Q7IGV2ZW4gdGhyb3VnaCBpdCBjb3VsZCBiZSBhdHRhY2tlciBjb250cm9s
bGVkLiBJZiB0aGUgYXR0YWNrZXIgd2FzPGJyPgomZ3Q7ICZndDsgY29udHJvbGxpbmcgdGhlIHBy
aW1hcnkgb2JqZWN0LCB0aGV5IGNvdWxkIGp1c3QgZm9yd2FyZCB0aGU8YnI+CiZndDsgJmd0OyBj
b21tYW5kczxicj4KJmd0OyAmZ3Q7IHVuZW5jcnlwdGVkIHRvIHRoZSBUUE0gYW5kIGdldCB0aGUg
dW5zZWFsIHRvIHJlbGVhc2UgdGhlbSB0aGUga2V5PGJyPgomZ3Q7ICZndDsgaW48YnI+CiZndDsg
Jmd0OyB0aGUgY2xlYXIuPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyA8YnI+CiZn
dDsgJmd0OyAmZ3Q7IEkgYW0gbm90IGZhbWlsaWFyIHdpdGggdGhlIHByb2Nlc3Mgb2YgZXN0YWJs
aXNoaW5nIGEgc2Vzc2lvbiw8YnI+CiZndDsgJmd0OyAmZ3Q7IEhvd2V2ZXIsIGl0IHNlZW1zIHRo
YXQgTUlUTSBjYW4gYmUgcHJldmVudGVkIG9ubHkgYnkgdXNpbmcgYTxicj4KJmd0OyAmZ3Q7IHNl
c3Npb248YnI+CiZndDsgJmd0OyAmZ3Q7IGtleSBlbmNyeXB0ZWQgd2l0aCB0aGUgRUsgb2YgdGhl
IFRQTSwgb3IgYnkgc2lnbmluZyB0aGU8YnI+CiZndDsgJmd0OyBhc3ltbWV0cmljPGJyPgomZ3Q7
ICZndDsgJmd0OyBrZXkgd2l0aCB0aGUgRUsgdG8gZGVyaXZlIHRoZSBrZXksIHdoZW4gY3JlYXRp
bmcgYSBzZXNzaW9uLjxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IFlvdSBqdXN0IG5lZWQg
YSB3YXkgdG8gZW5zdXJlIHByb3ZlbmFuY2UuIEFub3RoZXIgd2F5IGlzIHRvIGxvYWQgYW48YnI+
CiZndDsgJmd0OyBlc3RhYmxpc2hlZCBrZXkgdG8gdGhlIFRQTSBhbmQgc3RhcnQgdGhlIGF1dGhz
ZXNzaW9uIHdpdGggdGhhdC4gSWY8YnI+CiZndDsgJmd0OyB5b3UncmUgdXNpbmcgYSBwZXJzaXN0
ZW50IGtleSB5b3UgbmVlZCB0byB2ZXJpZnkgdGhlIG5hbWUgYWZ0ZXI8YnI+CiZndDsgJmd0OyBl
c3RhYmxpc2hpbmcgdGhlIHNlc3Npb24gb3IgdXNlIHNvbWV0aGluZyBsaWtlIGEgc2VyaWFsaXpl
ZCBFU1lTX1RSPGJyPgomZ3Q7ICZndDsgd2hpY2ggd2lsbCBkbyB0aGUgbmFtZSBjaGVja2luZyBh
dXRvbWF0aWNhbGx5LiBJZiB5b3UgbG9hZCBhIGtleTxicj4KJmd0OyAmZ3Q7IGJsb2I8YnI+CiZn
dDsgJmd0OyB0byB0aGUgVFBNIHRoYXQgeW91IGNvbnRyb2wsIEVTQVBJIHdpbGwgaGF2ZSB0aGUg
Y2hlY2tzIGluIHBsYWNlIHRvPGJyPgomZ3Q7ICZndDsgbWFrZSBzdXJlIHlvdSBkb24ndCBnZXQg
ZHVwZWQuPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAm
Z3Q7IElzIE1JVE0gbm90IGNvbnNpZGVyZWQgaW4gVFBNPyBPciBpcyB0aGVyZSBhbm90aGVyIHdh
eT88YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyBJdCBpcyBjb25zaWRlcmVkIGluIHRoZSBU
UE0gYW5kIGlzIGRpc2N1c3NlZCBpbiB0aGUgYXJjaGl0ZWN0dXJlPGJyPgomZ3Q7ICZndDsgZG9j
dW1lbnQuIFRoZWlycyBhIGZldyB3YXlzIHlvdSBjYW4gc2VjdXJlbHkgc2V0IHVwIGFuIGVuY3J5
cHRlZDxicj4KJmd0OyAmZ3Q7IHNlc3Npb24sIGVpdGhlciB3aXRoIEVLIGFuZCBhc3NvY2lhdGVk
IENlcnRpZmljYXRlIG9yIHRocm91Z2ggb3RoZXI8YnI+CiZndDsgJmd0OyBrZXlzIGxpa2UgdGhl
IFNSSy4gVGhlIGJpZyB0aGluZyBpcywgeW91IGhhdmUgdG8gZG8gaXQgaW4gYSB3YXk8YnI+CiZn
dDsgJmd0OyB3aGVyZTxicj4KJmd0OyAmZ3Q7IHRoZSBhdHRhY2tlciBjYW4gbm90IE1pVE0gdGhl
IHNlc3Npb24gZXN0YWJsaXNobWVudCwgd2hpY2ggYm9pbHM8YnI+CiZndDsgJmd0OyBkb3duPGJy
PgomZ3Q7ICZndDsgdG8gdXNpbmcgYSBrbm93biBrZXkuPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7
ICZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IFJlZ2FyZHMsPGJyPgomZ3Q7ICZndDsgJmd0
OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsg
Jmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsgJmd0OyAmZ3Q7IHRw
bTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBt
MkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7ICZndDsgJmd0OyBUbyB1bnN1YnNjcmliZSBzZW5k
IGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyI+dHBt
Mi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7ICZndDsgJmd0OyAlKHdlYl9wYWdlX3Vy
bClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KJmd0OyA8YnI+CiZn
dDsgPGJyPgomZ3Q7IDxicj4KPC9kaXY+CgkJCQoJCQoJCTxiYXNlIHRhcmdldD0iX3NlbGYiIGhy
ZWY9Imh0dHBzOi8vZS1hai5teS5jb20vIj4KCTwvZGl2PgoKCQo8L2Rpdj4KCgo8L2Jsb2NrcXVv
dGU+CjxkaXY+PGJyPjxicj48YnI+PGltZyBzcmM9Imh0dHBzOi8vbWFpbC56ZXJvbnNvZnRuLmNv
bS9tdGh1bWJuYWlsLzdiMjZiNmQ4LTI3OWItNDUyNy1iZmNkLTljM2ZiNTkxZTQ2Yy5wbmciIHN0
eWxlPSJtYXgtaGVpZ2h0OiAzMnB4Ij48L2Rpdj48L2JvZHk+PC9odG1sPg==
--===============1214765887821337561==--

