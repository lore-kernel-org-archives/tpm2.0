Content-Type: multipart/mixed; boundary="===============1036789228795841251=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
Date: Wed, 18 Apr 2018 11:17:47 -0700
Message-ID: <6594cb44-a95c-f40d-6d20-8e784f9c13c1@intel.com>
In-Reply-To: 1524003884018.79616@data61.csiro.au
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1036789228795841251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/17/2018 03:24 PM, Duncan.Palmer(a)data61.csiro.au wrote:
> We see the same behaviour on an Intel NUC5i7. I haven't looked at the cap=
abilities reported by the TPM device on that platform. The attached patch (=
setting max_data_size =3D MAX_NV_BUFFER_SIZE when max_data_size is reported=
 as 0), sorts the problem out.
> =


Hi Duncan,
Could you please send a Pull Request with your fix to the tools repo.

Thanks,
-- =

Tadeusz

--===============1036789228795841251==--

