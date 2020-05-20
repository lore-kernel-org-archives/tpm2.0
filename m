Content-Type: multipart/mixed; boundary="===============0292836161970628013=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] Re: trying duplication and then rsa_en/decrypt
Date: Wed, 20 May 2020 11:56:18 -0700
Message-ID: <a789286e-4f9b-3238-4e6c-12e96c66a72d@oracle.com>
In-Reply-To: c2e6d7db-708d-003c-64e4-911911448c40@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0292836161970628013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Imran,

I tried this, but I noticed something that I think is odd.

I added the userwithauth:
# tpm2_create -C src_o.ctx -g sha256 -G rsa -r dupkey.priv -u dupkey.pub \
 =C2=A0=C2=A0=C2=A0=C2=A0 -L policydupselect.dat=C2=A0 \
 =C2=A0=C2=A0=C2=A0=C2=A0 -a "sensitivedataorigin|sign|decrypt|userwithauth=
" -c dupkey.ctx -Q

but it does not show up in the readpublic (which is below).

Is this a bug?

FWIW, I am on the 4.1.X branch (just before 4.1.2 came out).
Do I need the 4.1.2 changes?

Thanks,
-ted


 =C2=A0# more dupkey.rp-txt
 =C2=A0key: dupkey.ctx
 =C2=A0name: 000b6894c94c68dd0d379b80c6417130e620e9da317b0033b1cddd1ab542c5=
a592e6
 =C2=A0qualified name: =

000bb9be4705c017f1bf8b238b5f53c87487b4a73c86b8345abfdc671014ab5567ff
 =C2=A0name-alg:
 =C2=A0=C2=A0 value: sha256
 =C2=A0=C2=A0 raw: 0xb
 =C2=A0attributes:
 =C2=A0=C2=A0 value: sensitivedataorigin|decrypt|sign
 =C2=A0=C2=A0 raw: 0x60020
 =C2=A0type:
 =C2=A0=C2=A0 value: rsa
 =C2=A0=C2=A0 raw: 0x1
 =C2=A0exponent: 0x0
 =C2=A0bits: 2048
 =C2=A0scheme:
 =C2=A0=C2=A0 value: null
 =C2=A0=C2=A0 raw: 0x10
 =C2=A0scheme-halg:
 =C2=A0=C2=A0 value: (null)
 =C2=A0=C2=A0 raw: 0x0
 =C2=A0sym-alg:
 =C2=A0=C2=A0 value: null
 =C2=A0=C2=A0 raw: 0x10
 =C2=A0sym-mode:
 =C2=A0=C2=A0 value: (null)
 =C2=A0=C2=A0 raw: 0x0
 =C2=A0sym-keybits: 0
 =C2=A0rsa: =

cf42bc7b2063618a8e74d9179f263d0b71be412780d09d5f2e876714f5597fe797c97226473
 =C2=A0d2f4b23e3ded77af61c6959ae708e3d59e965f928750a56db367fa6f687ab8a107ac=
7e89b76fb1aa
 =C2=A01cb09008e1d239fe874937e292b447970ab464466ab293df3e473c839dbce360efe9=
2c5bb20eac66
 =C2=A00714e6a7f7f7ce0646eb9a16e2fe80ba148c4bdb591fec14aed763d70f59cfa4d91d=
bc1515cfe296
 =C2=A04452a897cea0c958d8da3615003a6b1b08318a6ddf8f9181923ba6eb7fc127a6d9a9=
148bdd60f3b4
 =C2=A0663ae246f5216f15f3d5a78b6e69b06e9ce5fbd9d62cf461e088a35da3d419301798=
39e9984e8976
 =C2=A0de8f0a3ecda87812c53771603dca3ffabac01
 =C2=A0authorization policy: =

389e01e8e7605646e8586acc5270ff210125d040d152c348266c99c441
 =C2=A084f4d2



On 5/20/20 11:03 AM, ted.h.kim(a)oracle.com wrote:
> Hi Imran,
>
> Thanks for your reply.
>
> I had two cases, but for now, let's talk about the one in the =

> tpm2_policyduplicationselect(1) man page. I did the exact steps listed =

> there in the example. Then after the duplication, I did an import and =

> load, as follows:
>
> # tpm2_import -Q -C dst_n.ctx -i new_dupkey.priv -u dupkey.pub \
> =C2=A0=C2=A0=C2=A0 -s dupseed.dat -r imported.priv -L policydupselect.dat
>
> # tpm2_load -Q -C dst_n.ctx -r imported.priv -u dupkey.pub -c =

> imported.ctx
>
> I then tried to do tpm2_rsa_en/decrypt with imported.ctx. The decrypt =

> is where the policy errors came up.
>
>
> But as you point out below the "userwithauth" attribute is not part of =

> the example in that man page. So let me try again with that attribute =

> added. IIRC, the readpublic on the duplicated/imported key did =

> reference a policy, which I could not figure out how to satisfy. Will =

> get back to you shortly after trying again.
>
> Thanks,
> -ted
>
>
> On 5/20/20 10:31 AM, Imran Desai wrote:
>> Hi Ted,
>>
>> Based on what you said you want to accomplish and your =

>> above-mentioned references, I have a hunch that you have the keys set =

>> up incorrectly.
>> Can you please,
>> 1. Try to create a key with "userwithauth" set in the step in your =

>> script that references policy_duplication man page as in here: =

>> "tpm2_create -C src_o.ctx -g sha256 -G rsa -r dupkey.priv -u =

>> dupkey.pub \
>> -L policydupselect.dat=C2=A0 -a =

>> "sensitivedataorigin|sign|decrypt|userwithauth" -c dupkey.ctx -Q"
>> 2. Share your exact steps/ script that you implemented.
>> 3. Share the key properties of the parent and child object you =

>> created. You can use tpm2_readpublic command to dump the key properties.
>>
>> Thanks
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============0292836161970628013==--

