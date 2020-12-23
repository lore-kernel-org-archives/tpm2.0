Content-Type: multipart/mixed; boundary="===============6032787926653341578=="
MIME-Version: 1.0
From: Auriga7 <Auriga7 at protonmail.com>
Subject: [tpm2] Re: Ensure the link between an unrestricted signing key and a
 TPM
Date: Wed, 23 Dec 2020 16:06:09 +0000
Message-ID: <D4yzi2HNWDWJ_7gCUWtAr6noTPvOuJFL_IP7FMrmSX7rJC1QTm-MhXjsvEzXIy6Y9JBFpTkF_MBK2Uu_yTkESAuD7f1KWhWdKkVaj9z4JBY=@protonmail.com>
In-Reply-To: 1xY442AjNtSF-2-2Z0wAmaNt7Ls9WJ3wDa28g8RkC0rUzkOZ8-NKN2ElubfvSApUmifoBspVU4-w_R19ag9C-gOFinvFOipyKcf-wXt3mJU=@protonmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6032787926653341578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think I've figured out how to do it. Here an example :

tpm2_createek -c ek.handle -G rsa -u ek.pub

tpm2_startauthsession --policy-session -S session.ctx
tpm2_policysecret -S session.ctx -c e
tpm2_create -C ek.handle -c ak.ctx -u ak.pub -r ak.priv -P session:session.=
ctx
tpm2_readpublic -c ak.ctx -o ak.pem -n ak.name -f pem
tpm2_flushcontext session.ctx

file_size=3D`stat --printf=3D"%s" ak.name`
loaded_key_name=3D`cat ak.name | xxd -p -c $file_size`
echo "secret" > secret.data
tpm2_makecredential -e ek.pub -s secret.data -n $loaded_key_name -o cred.out

tpm2_startauthsession --policy-session -S session.ctx
tpm2_policysecret -S session.ctx -c e
tpm2_activatecredential -c ak.ctx -C ek.handle -i cred.out -o decrypt_secre=
t.data -P "session:session.ctx"
tpm2_flushcontext session.ctx

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
Le mardi 22 d=C3=A9cembre 2020 15:37, Auriga7 <Auriga7(a)protonmail.com> a =
=C3=A9crit :

> Hi,
>
> I would like to know how i can certiffy that a non restricted signing key=
 belongs to a real TPM in the same way that an AIK key can guarantee it is =
from a TPM using EK and the EK certificate of the TPM. I've tried using the=
 makecredential and activatecredential commands of tpm2-tools on a non rest=
ricted signing key created with the create command. However those commands =
seems to only work for an AIK key created using createak command. How can I=
 create a non restricted signing key and then ensure that this key is linke=
d to real TPM using the tpm2-tools.
>
> Thank you.

--===============6032787926653341578==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdj5JIHRoaW5rIEkndmUgZmlndXJlZCBvdXQgaG93IHRvIGRvIGl0LiBIZXJlIGFuIGV4YW1w
bGUgOjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRwbTJfY3JlYXRlZWsgLWMgZWsuaGFu
ZGxlIC1HIHJzYSAtdSBlay5wdWI8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4gdHBtMl9z
dGFydGF1dGhzZXNzaW9uIC0tcG9saWN5LXNlc3Npb24gLVMgc2Vzc2lvbi5jdHggPGJyPjwvZGl2
PjxkaXY+dHBtMl9wb2xpY3lzZWNyZXQgLVMgc2Vzc2lvbi5jdHggLWMgZSA8YnI+PC9kaXY+PGRp
dj50cG0yX2NyZWF0ZSAtQyBlay5oYW5kbGUgLWMgYWsuY3R4IC11IGFrLnB1YiAtciBhay5wcml2
IC1QIHNlc3Npb246c2Vzc2lvbi5jdHggPGJyPjwvZGl2PjxkaXY+dHBtMl9yZWFkcHVibGljIC1j
IGFrLmN0eCAtbyBhay5wZW0gLW4gYWsubmFtZSAtZiBwZW0gPGJyPjwvZGl2PjxkaXY+dHBtMl9m
bHVzaGNvbnRleHQgc2Vzc2lvbi5jdHgmbmJzcDsgPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+ZmlsZV9zaXplPWBzdGF0IC0tcHJpbnRmPSIlcyIgYWsubmFtZWAgPGJyPjwvZGl2PjxkaXY+
bG9hZGVkX2tleV9uYW1lPWBjYXQgYWsubmFtZSB8IHh4ZCAtcCAtYyAkZmlsZV9zaXplYCA8YnI+
PC9kaXY+PGRpdj5lY2hvICJzZWNyZXQiICZndDsgc2VjcmV0LmRhdGEgPGJyPjwvZGl2PjxkaXY+
dHBtMl9tYWtlY3JlZGVudGlhbCAtZSBlay5wdWIgLXMgc2VjcmV0LmRhdGEgLW4gJGxvYWRlZF9r
ZXlfbmFtZSAtbyBjcmVkLm91dCZuYnNwOyA8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj50
cG0yX3N0YXJ0YXV0aHNlc3Npb24gLS1wb2xpY3ktc2Vzc2lvbiAtUyBzZXNzaW9uLmN0eCA8YnI+
PC9kaXY+PGRpdj50cG0yX3BvbGljeXNlY3JldCAtUyBzZXNzaW9uLmN0eCAtYyBlIDxicj48L2Rp
dj48ZGl2PnRwbTJfYWN0aXZhdGVjcmVkZW50aWFsIC1jIGFrLmN0eCAtQyBlay5oYW5kbGUgLWkg
Y3JlZC5vdXQgLW8gZGVjcnlwdF9zZWNyZXQuZGF0YSAtUCAic2Vzc2lvbjpzZXNzaW9uLmN0eCIg
PGJyPjwvZGl2PjxkaXY+dHBtMl9mbHVzaGNvbnRleHQgc2Vzc2lvbi5jdHg8YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj7igJDigJDigJDigJDigJDigJDigJAgT3Jp
Z2luYWwgTWVzc2FnZSDigJDigJDigJDigJDigJDigJDigJA8YnI+PC9kaXY+PGRpdj4gTGUgbWFy
ZGkgMjIgZMOpY2VtYnJlIDIwMjAgMTU6MzcsIEF1cmlnYTcgJmx0OzxhIGhyZWY9Im1haWx0bzpB
dXJpZ2E3QHByb3Rvbm1haWwuY29tIj5BdXJpZ2E3QHByb3Rvbm1haWwuY29tPC9hPiZndDsgYSDD
qWNyaXQmbmJzcDs6PGJyPjwvZGl2PjxkaXY+IDxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
cHJvdG9ubWFpbF9xdW90ZSIgdHlwZT0iY2l0ZSI+PGRpdj5IaSw8YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5JIHdvdWxkIGxpa2UgdG8ga25vdyBob3cgaSBjYW4gY2VydGlmZnkgdGhhdCBh
IG5vbiByZXN0cmljdGVkIHNpZ25pbmcga2V5IGJlbG9uZ3MgdG8gYSByZWFsIFRQTSBpbiB0aGUg
c2FtZSB3YXkgdGhhdCBhbiBBSUsga2V5IGNhbiBndWFyYW50ZWUgaXQgaXMgZnJvbSBhIFRQTSB1
c2luZyBFSyBhbmQgdGhlIEVLIGNlcnRpZmljYXRlIG9mIHRoZSBUUE0uIEkndmUgdHJpZWQgdXNp
bmcgdGhlIG1ha2VjcmVkZW50aWFsIGFuZCBhY3RpdmF0ZWNyZWRlbnRpYWwgY29tbWFuZHMgb2Yg
dHBtMi10b29scyBvbiBhIG5vbiByZXN0cmljdGVkIHNpZ25pbmcga2V5IGNyZWF0ZWQgd2l0aCB0
aGUgY3JlYXRlIGNvbW1hbmQuIEhvd2V2ZXIgdGhvc2UgY29tbWFuZHMgc2VlbXMgdG8gb25seSB3
b3JrIGZvciBhbiBBSUsga2V5IGNyZWF0ZWQgdXNpbmcgY3JlYXRlYWsgY29tbWFuZC4gSG93IGNh
biBJIGNyZWF0ZSBhIG5vbiByZXN0cmljdGVkIHNpZ25pbmcga2V5IGFuZCB0aGVuIGVuc3VyZSB0
aGF0IHRoaXMga2V5IGlzIGxpbmtlZCB0byByZWFsIFRQTSB1c2luZyB0aGUgdHBtMi10b29scy48
YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFuayB5b3UuPGJyPjwvZGl2PjwvYmxvY2tx
dW90ZT48ZGl2Pjxicj48L2Rpdj4=
--===============6032787926653341578==--

