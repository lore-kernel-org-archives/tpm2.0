Content-Type: multipart/mixed; boundary="===============2816304005192184487=="
MIME-Version: 1.0
From: Duncan.Palmer at data61.csiro.au
Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0
Date: Tue, 24 Apr 2018 12:51:49 +0000
Message-ID: <1524574309106.7317@data61.csiro.au>
In-Reply-To: 6594cb44-a95c-f40d-6d20-8e784f9c13c1@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2816304005192184487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Done. I hadn't submitted a pull request before as I was unsure whether this=
 issue was related to the TPM I'm using (which doesn't seem commonly used),=
 or more generally applicable.

Duncan Palmer
Senior Software Engineer | Autonomous Systems
Data61 | CSIRO
E duncan.palmer(a)csiro.au
Queensland Centre for Advanced Technologies (QCAT),
1 Technology Court, Pullenvale QLD, 4069
www.data61.csiro.au

CSIRO=E2=80=99s Digital Productivity business unit and NICTA have joined fo=
rces to create digital powerhouse Data61

________________________________________
From: Tadeusz Struk <tadeusz.struk(a)intel.com>
Sent: 19 April 2018 04:17
To: Palmer, Duncan (Data61, Pullenvale); ian.justin.oliver(a)gmail.com; tpm=
2(a)lists.01.org
Subject: Re: [tpm2] NVRAM_write, BUFFER_SIZE is 0

On 04/17/2018 03:24 PM, Duncan.Palmer(a)data61.csiro.au wrote:
> We see the same behaviour on an Intel NUC5i7. I haven't looked at the cap=
abilities reported by the TPM device on that platform. The attached patch (=
setting max_data_size =3D MAX_NV_BUFFER_SIZE when max_data_size is reported=
 as 0), sorts the problem out.
>

Hi Duncan,
Could you please send a Pull Request with your fix to the tools repo.

Thanks,
--
Tadeusz


--===============2816304005192184487==--

