Content-Type: multipart/mixed; boundary="===============8370122522786579617=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: trying duplication and then rsa_en/decrypt
Date: Wed, 20 May 2020 17:31:52 +0000
Message-ID: <20200520173152.2843.3012@ml01.vlan13.01.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EEFEE5@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8370122522786579617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ted, =


Based on what you said you want to accomplish and your above-mentioned refe=
rences, I have a hunch that you have the keys set up incorrectly. =

Can you please,
1. Try to create a key with "userwithauth" set in the step in your script t=
hat references policy_duplication man page as in here: "tpm2_create -C src_=
o.ctx -g sha256 -G rsa -r dupkey.priv -u dupkey.pub \
-L policydupselect.dat  -a "sensitivedataorigin|sign|decrypt|userwithauth" =
-c dupkey.ctx -Q"
2. Share your exact steps/ script that you implemented.
3. Share the key properties of the parent and child object you created. You=
 can use tpm2_readpublic command to dump the key properties.

Thanks
--===============8370122522786579617==--

