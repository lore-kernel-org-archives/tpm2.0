Return-Path: <swebb@umd.com.au>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB392833A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 177A68308A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umd-com-au.20221208.gappssmtp.com; s=20221208; t=1687421191; x=1690013191;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WhoHFXbuEaZoBJnDol0z4WZZ4ZDJnz19cdpRO1AwX+4=;
 b=3CgyeKHcn2niyQZyQW9wWjLZ3I7cUj3UDeSJbaZM62pAkimwJgOfV1Z20cVBmgroev
 YzqdHjCi/lWAUnCpT0wd6IWV/c9rYnmARVz1s+DPU2lZgENOLpVSKvWieK89VaV30Z4P
 FZWztUe6ruFvcOZHhDkwvL0CinGNI+Pdj8lFXYweQx1WKkvfbgjDYiAtGmiU9sY0Pxf8
 1X4peGyWupNE4xpSLTE13L6+V/Hao0A3tP7X3g3ocISYyl1HhpTEHzNUa49oLTTEwPqd
 ZQ7ooGfXFGDXxrV5j2HDEHCp7QmEgzr7fRzoCLkP75EJ6iNAYnoFvWSUdext4inB3Yjr
 TbUw==
MIME-Version: 1.0
From: Stewart Webb <swebb@umd.com.au>
Date: Thu, 22 Jun 2023 18:06:20 +1000
Message-ID: <CAKfZqkGug+w7FznhcKHBWwQdQS25HGVd2DAFaw5_uEcYrhd2hQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b2cf9e05feb35cd2"
Subject: [Tpm2] Better understanding auth/object hierarchies
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

--000000000000b2cf9e05feb35cd2
Content-Type: text/plain; charset="UTF-8"

Hi there,

I have been investigating using the TPM2 for secure persistence of secrets.
It seems sealing objects are the way to go for this kind of thing.

I am hoping someone here might be able to better explain how sealing
objects are related to the parent objects they are created and loaded
under, especially when password auth values are involved. I've been a bit
confused by some examples I've put together that allow various operations
without supplying the passwords I would have thought were required.

(note: many of the examples below require calls to tpm2_flushcontext to
clear out space for intermediate object loading, but I have excluded them
for brevity)

As part of my evaluation I have learnt that sealing objects must always be
created underneath some other 'primary object'/primary key that must be
created first.

    # make a new primary key
    $ tpm2_createprimary -C o -c testprim.ctx
    # make a new sealing object under this primary key
    $ tpm2_create -u testseal.pub -r testseal.priv -i hunter2.txt -C
testprim.ctx


These primary objects can optionally be created with password auth values
on them. As you'd expect, trying to create a sealing object via a
password-protected primary object without supplying its password doesn't
work:

    $ tpm2_createprimary -C o -p str:testpwd -c testprim-wauth.ctx
    $ tpm2_create -u testseal-wpauth.pub -r testseal-wpauth.priv -i
hunter2.txt -C testprim-wauth.ctx
WARNING:esys:src/tss2-esys/api/Esys_Create.c:398:Esys_Create_Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_Create.c:134:Esys_Create() Esys
Finish ErrorCode (0x0000098e)    ERROR: Esys_Create(0x98E) -
tpm:session(1):the authorization HMAC check failed and DA counter
incremented    ERROR: Unable to run tpm2_create    $ tpm2_create -u
testseal-wpauth.pub -r testseal-wpauth.priv -i hunter2.txt -C
testprim-wauth.ctx -P str:testpwd    # OK


What confuses me a bit is that loading and unsealing one of these
created-under-the-auth-protected-primary-key objects works fine if the
loading is done under a non-authed primary key:

    # no password required here
    $ tpm2_load -C testprim.ctx -u testseal-wpauth.pub -r
testseal-wpauth.priv -n testseal-loadedwnopauth.name -c
testseal-loadedwnopauth.ctx
    $ tpm2_unseal -c testseal-loadedwnopauth.ctx
    hunter2


However, if loading under the auth-value-protected primary key, the
password is required as expected for the loading...

    # Try load without password
    $ tpm2_load -C testprim-wauth.ctx -u testseal-wpauth.pub -r
testseal-wpauth.priv -n testseal-loadedwpauth.name -c
testseal-loadedwpauth.ctx
WARNING:esys:src/tss2-esys/api/Esys_Load.c:324:Esys_Load_Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_Load.c:112:Esys_Load() Esys Finish
ErrorCode (0x0000098e)    ERROR: Eys_Load(0x98E) - tpm:session(1):the
authorization HMAC check failed and DA counter incremented    ERROR:
Unable to run tpm2_load    # with password:    $ tpm2_load -C
testprim-wauth.ctx -u testseal-wpauth.pub -r testseal-wpauth.priv -n
testseal-loadedwpauth.name -c testseal-loadedwpauth.ctx -P str:testpwd
   # OK


...but the unsealing still works without a password too. I'm assuming this
is because the sealing object itself has no password on it.

$ tpm2_unseal -c testseal-loadedwpauth.ctx
hunter2

If the sealing object itself is given a password auth value (-p flag in
tpm2_create) then it can never be unsealed without that password, which is
expected behaviour, so that at least works fine.

I am just confused as to why things created under password-protected
primary keys can still be seemingly later used without needing that
password? Is the password purely for the ability to create subsequent child
objects under the primary key? Or am I missing something here?

Cheers,
Stewart Webb

--000000000000b2cf9e05feb35cd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi there,</div><div><br></div><div><=
div>I have been investigating using the TPM2 for secure=20
persistence of secrets. It seems sealing objects are the way to go for=20
this kind of thing.</div><div><br></div>I am hoping someone here might=20
be able to better explain how sealing objects are related to the parent=20
objects they are created and loaded under, especially when password auth
 values are involved. I&#39;ve been a bit confused by some examples I&#39;v=
e put
 together that allow various operations without supplying the passwords I
 would have thought were required.<br></div><div><br></div><div>(note: many=
 of the examples below require calls to tpm2_flushcontext to=20
clear out space for intermediate object loading, but I have excluded=20
them for brevity)</div><div><br></div><div>As part of my evaluation I=20
have learnt that sealing objects must always be created underneath some=20
other &#39;primary object&#39;/primary key that must be created first.</div=
><div><br></div><div><span><code style=3D"white-space:pre-wrap"></code></sp=
an><span><code style=3D"white-space:pre-wrap"><code></code></code></span><p=
re><code>    # make a new primary key
    $ tpm2_createprimary -C o -c testprim.ctx
    # make a new sealing object under this primary key
    $ tpm2_create -u testseal.pub -r testseal.priv -i hunter2.txt -C testpr=
im.ctx</code></pre></div><div><span><code style=3D"white-space:pre-wrap"></=
code></span></div><div><br></div><div>These
 primary objects can optionally be created with password auth values on=20
them. As you&#39;d expect, trying to create a sealing object via a=20
password-protected primary object without supplying its password doesn&#39;=
t
 work:<code><br></code></div><div><code><br></code><pre><code>    </code><c=
ode>$ tpm2_createprimary -C o -p str:testpwd -c testprim-wauth.ctx<br>    $=
 tpm2_create -u testseal-wpauth.pub -r testseal-wpauth.priv -i hunter2.txt =
-C testprim-wauth.ctx
<code>    </code>WARNING:esys:src/tss2-esys/api/Esys_Create.c:398:Esys_Crea=
te_Finish() Received TPM Error
<code>    </code>ERROR:esys:src/tss2-esys/api/Esys_Create.c:134:Esys_Create=
() Esys Finish ErrorCode (0x0000098e)
<code>    </code>ERROR: Esys_Create(0x98E) - tpm:session(1):the authorizati=
on HMAC check failed and DA counter incremented
<code>    </code>ERROR: Unable to run tpm2_create
<code>    </code>$ tpm2_create -u testseal-wpauth.pub -r testseal-wpauth.pr=
iv -i hunter2.txt -C testprim-wauth.ctx -P str:testpwd
<code>    </code># OK<br></code></pre></div><div><div><div dir=3D"ltr" clas=
s=3D"gmail_signature"><div><br></div><div>What confuses me a bit is that lo=
ading and unsealing one of these created-under-the-auth-protected-primary-k=
ey objects works fine if the loading is done under a non-authed primary key=
:</div><div><br></div><div><pre><code>    # no password required here
    $ tpm2_load -C testprim.ctx -u testseal-wpauth.pub -r testseal-wpauth.p=
riv -n <a href=3D"http://testseal-loadedwnopauth.name">testseal-loadedwnopa=
uth.name</a> -c testseal-loadedwnopauth.ctx
    $ tpm2_unseal -c testseal-loadedwnopauth.ctx
    hunter2</code></pre></div><div></div><div><br></div><div>However, if lo=
ading under the auth-value-protected primary key, the password is required =
as expected for the loading...</div><div><br></div><pre><code>    # Try loa=
d without password
    $ tpm2_load -C testprim-wauth.ctx -u testseal-wpauth.pub -r testseal-wp=
auth.priv -n <a href=3D"http://testseal-loadedwpauth.name">testseal-loadedw=
pauth.name</a> -c testseal-loadedwpauth.ctx
<code>    </code>WARNING:esys:src/tss2-esys/api/Esys_Load.c:324:Esys_Load_F=
inish() Received TPM Error
<code>    </code>ERROR:esys:src/tss2-esys/api/Esys_Load.c:112:Esys_Load() E=
sys Finish ErrorCode (0x0000098e)
<code>    </code>ERROR: Eys_Load(0x98E) - tpm:session(1):the authorization =
HMAC check failed and DA counter incremented
<code>    </code>ERROR: Unable to run tpm2_load
<code>    </code># with password:
<code>    </code>$ tpm2_load -C testprim-wauth.ctx -u testseal-wpauth.pub -=
r testseal-wpauth.priv -n <a href=3D"http://testseal-loadedwpauth.name">tes=
tseal-loadedwpauth.name</a> -c testseal-loadedwpauth.ctx -P str:testpwd
<code>    </code># OK</code></pre><div><br></div><div>...but
 the unsealing still works without a password too. I&#39;m assuming this is=
=20
because the sealing object itself has no password on it.</div><div><br></di=
v><div><div dir=3D"ltr"><span><code style=3D"white-space:pre-wrap">    $ tp=
m2_unseal -c testseal-loadedwpauth.ctx<span><code style=3D"white-space:pre-=
wrap"></code></span><br>    hunter2<br></code></span></div><div><br></div><=
/div><div>If
 the sealing object itself is given a password auth value (-p flag in=20
tpm2_create) then it can never be unsealed without that password, which=20
is expected behaviour, so that at least works fine.</div><div><br></div><di=
v>I
 am just confused as to why things created under password-protected=20
primary keys can still be seemingly later used without needing that=20
password? Is the password purely for the ability to create subsequent=20
child objects under the primary key? Or am I missing something here?<br></d=
iv><div><br></div><div dir=3D"ltr">Cheers,<div>Stewart Webb</div></div></di=
v></div></div></div></div>

--000000000000b2cf9e05feb35cd2--
