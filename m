Content-Type: multipart/mixed; boundary="===============3967309691994394588=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: tpm2_createprimary command
Date: Fri, 18 Oct 2019 09:51:57 -0700
Message-ID: <114ce654-1b31-e41b-bec8-b0f69666e64e@intel.com>
In-Reply-To: 20191015080300.2603.85237@new-ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3967309691994394588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/15/19 1:03 AM, mohammed.aitbendaoud(a)gmail.com wrote:
> Thank you for ur reply.
> I have already followed this tutorial but the commands do not work.
> I am under embedded linux and i installed the tpm2-tools.
> =

> For exmaple : =

> tpm2_createprimary -o primary.ctx =

> give me error like ---> tpm2_createprimary : invalide option -- 'o' =


Because -o is indeed an invalid option. What you want is -c. See:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_createprim=
ary.1.md

--
Tadeusz
--===============3967309691994394588==--

