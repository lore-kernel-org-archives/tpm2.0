Content-Type: multipart/mixed; boundary="===============6972276813794381143=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: ActivateCredential not working
Date: Thu, 16 Jan 2020 19:51:06 +0100
Message-ID: <8592e618-4b74-14cd-bb81-a35e783afce1@uvensys.de>
In-Reply-To: 20200116183730.2574.6943@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6972276813794381143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

the gist looks very good, thanks for sharing.
A quick question, tho.

Sometime you use create_primary, sometimes you use createek

https://gist.github.com/dnoliver/04364e72d8b81368f72ad4e6896f688d#file-enro=
llment-sh-L19

https://gist.github.com/dnoliver/04364e72d8b81368f72ad4e6896f688d#file-enro=
llment-sh-L41


Is it true that those commands are interchangeable


regards,
Steffen

On 1/16/20 7:37 PM, nicolasoliver03(a)gmail.com wrote:
> Hello Erick,
>
> This worked for me
>
> echo "Enrolling with Atestation Key"
>
>   # Clear the TPM
>   tpm2_clear
>
>   # Create Endorsment Key
>   tpm2_createek -c ek.ctx -G rsa -u ek.pub
>
>   # Create Attestation Key
>   tpm2_createak -C ek.ctx -c ak.ctx -G rsa -g sha256 -s rsassa
>   tpm2_evictcontrol -C o -c ak.ctx 0x81010002
>   tpm2_readpublic -c ak.ctx -f pem -o ak.pem > ak.yaml
>   cat ak.yaml | grep '^name:' | awk '{ print $2 }' > ak.name
>
>   # Generate the nonce and credential for challenge
>   openssl rand -hex 6 > nonce.plain
>   tpm2_makecredential -e ek.pub -s nonce.plain -n $(cat ak.name) -o nonce=
.encrypted
>
>   # Decrypt nonce with Endorsement Key
>   tpm2_startauthsession --policy-session -S session.ctx
>   TPM2_RH_ENDORSEMENT=3D0x4000000B
>   tpm2_policysecret -S session.ctx -c ${TPM2_RH_ENDORSEMENT}
>   tpm2_activatecredential -c 0x81010002 -C ek.ctx -i nonce.encrypted -o n=
once.decrypted -P "session:session.ctx"
>   tpm2_flushcontext session.ctx
>
>   # Generate Attestation Quote
>   tpm2_quote -c 0x81010002 -l sha256:0,1,2,3,4,5,6,7,8,9 -q $(cat nonce.d=
ecrypted) -m quote.message -s quote.signature -o quote.pcrs -g sha256
>
>   # Validate Attestation Quote in the server
>   tpm2_checkquote -u ak.pem -m quote.message -s quote.signature -f quote.=
pcrs -g sha256 -q $(cat nonce.plain)
>
>
> I have a gist that you can use to test here https://gist.github.com/dnoli=
ver/04364e72d8b81368f72ad4e6896f688d (bash enrollment.sh ak)
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6972276813794381143==--

