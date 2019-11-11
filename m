Content-Type: multipart/mixed; boundary="===============1058622174513001175=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] Re: tpm2_rsadecrypt to stdout
Date: Mon, 11 Nov 2019 14:33:55 +0000
Message-ID: <20191111143355.2696.31591@new-ml01.vlan13.01.org>
In-Reply-To: 00d567dc-40c6-47da-be4c-702751e3c122@www.fastmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1058622174513001175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The option to output to stdout exists. https://github.com/tpm2-software/tpm=
2-tools/blob/76a880355c905ddb1a48621b1f92ab6405bf2db1/tools/tpm2_rsadecrypt=
.c#L42

You can do this by not specifying -o and it should send it to stdout
--===============1058622174513001175==--

