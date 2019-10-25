Content-Type: multipart/mixed; boundary="===============5463790000836926720=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: sending commands to simulator
Date: Fri, 25 Oct 2019 15:10:53 -0700
Message-ID: <a5a92112-ae79-e7c5-2064-49a8b0f7d323@intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E2BA30@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5463790000836926720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/25/19 12:19 PM, Roberts, William C wrote:
>   if [ "$raw" =3D=3D "yes" ]; then
>     echo -n "$cmd" | nc -N "$ip" "$port"
>   else
>     echo -n "$cmd" | xxd -p -r | nc -N "$ip" "$port"
>   fi

Looks good. Would be even better if we make sure that the response from
the mssim (4 bytes) is 0x00 00 00 00 (success) and print an error msg
otherwise.

--
Tadeusz
--===============5463790000836926720==--

