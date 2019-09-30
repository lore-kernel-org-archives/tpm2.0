Content-Type: multipart/mixed; boundary="===============2723052551877139681=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Error Running tpm2-tools in windows against MSSIM
Date: Mon, 30 Sep 2019 11:01:47 -0700
Message-ID: <180f4a44-36de-13ad-ed00-0f17abd1c810@intel.com>
In-Reply-To: CAJLNp_Wv6xuh-bQBa3REuzw9vD9PA_s2h+MFrk4+NWqWT6+W4g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2723052551877139681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/30/19 10:28 AM, Arun Sudhir wrote:
> WARNING:esys:api\Esys_GetCapability.c:303:Esys_GetCapability_Finish() Rec=
eived TPM Error
> ERROR:esys:api\Esys_GetCapability.c:107:Esys_GetCapability() Esys Finish =
ErrorCode (0x00000100)
> ERROR: Esys_GetCapability(0x100) - tpm:error(2.0): TPM not initialized by=
 TPM2_Startup or already initialized
> ERROR: Unable to run C:\Users\arunsu\source\repos\tpm2-tools-4.0\vstudio\=
x64\Debug\tpm2-getrandom.exe

As the above error states the TPM simulator needs to be initialized first.
Try "tpm2_startup -c" first, before sending other commands.

-- =

Tadeusz
--===============2723052551877139681==--

