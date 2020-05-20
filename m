Content-Type: multipart/mixed; boundary="===============6984297303659711779=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] Re: trying duplication and then rsa_en/decrypt
Date: Wed, 20 May 2020 11:03:07 -0700
Message-ID: <c2e6d7db-708d-003c-64e4-911911448c40@oracle.com>
In-Reply-To: 20200520173152.2843.3012@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6984297303659711779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Imran,

Thanks for your reply.

I had two cases, but for now, let's talk about the one in the =

tpm2_policyduplicationselect(1) man page. I did the exact steps listed =

there in the example. Then after the duplication, I did an import and =

load, as follows:

# tpm2_import -Q -C dst_n.ctx -i new_dupkey.priv -u dupkey.pub \
 =C2=A0=C2=A0=C2=A0 -s dupseed.dat -r imported.priv -L policydupselect.dat

# tpm2_load -Q -C dst_n.ctx -r imported.priv -u dupkey.pub -c imported.ctx

I then tried to do tpm2_rsa_en/decrypt with imported.ctx. The decrypt is =

where the policy errors came up.


But as you point out below the "userwithauth" attribute is not part of =

the example in that man page. So let me try again with that attribute =

added. IIRC, the readpublic on the duplicated/imported key did reference =

a policy, which I could not figure out how to satisfy. Will get back to =

you shortly after trying again.

Thanks,
-ted


On 5/20/20 10:31 AM, Imran Desai wrote:
> Hi Ted,
>
> Based on what you said you want to accomplish and your above-mentioned re=
ferences, I have a hunch that you have the keys set up incorrectly.
> Can you please,
> 1. Try to create a key with "userwithauth" set in the step in your script=
 that references policy_duplication man page as in here: "tpm2_create -C sr=
c_o.ctx -g sha256 -G rsa -r dupkey.priv -u dupkey.pub \
> -L policydupselect.dat  -a "sensitivedataorigin|sign|decrypt|userwithauth=
" -c dupkey.ctx -Q"
> 2. Share your exact steps/ script that you implemented.
> 3. Share the key properties of the parent and child object you created. Y=
ou can use tpm2_readpublic command to dump the key properties.
>
> Thanks
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============6984297303659711779==--

