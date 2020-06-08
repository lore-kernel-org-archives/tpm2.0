Content-Type: multipart/mixed; boundary="===============4327116565693104100=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: how unique are primary keys ?
Date: Mon, 08 Jun 2020 19:40:23 +0000
Message-ID: <20200608194023.2851.73993@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB3437DB5C94E6F8B873F3BD8CB8850@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4327116565693104100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From integration tests -- https://github.com/tpm2-software/tpm2-tools/blob/=
876e5d57efb48cce4225bdb738704c5cd48aa312/test/integration/tests/createprima=
ry.sh#L53

printf '\x00\x01' > ud.1

dd if=3D/dev/zero bs=3D256 count=3D1 of=3Dud.2

cat ud.1 ud.2 > unique.dat

tpm2_createprimary -C o -G rsa2048:aes128cfb -g sha256 -c prim.ctx -a "rest=
ricted|decrypt|fixedtpm|fixedparent|sensitivedataorigin|userwithauth|\
noda" -u unique.dat

tpm2_createprimary -C o -G rsa2048:aes128cfb -g sha256 -c prim2.ctx -a "res=
tricted|decrypt|fixedtpm|fixedparent|sensitivedataorigin|userwithauth|\
noda"

diff prim.ctx prim2.ctx
--===============4327116565693104100==--

