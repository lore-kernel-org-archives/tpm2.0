Content-Type: multipart/mixed; boundary="===============3174522115904003012=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Failed to initialize tcti context: 0x1
Date: Fri, 13 Mar 2020 12:39:15 -0700
Message-ID: <fa72d3b9-a2bc-0a18-8352-f73034e36205@intel.com>
In-Reply-To: CAA3rH8YO-pha4Etyjx9iv7559ZDxOOQYfZwAXM=6fNQiivyp4Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3174522115904003012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/13/20 3:10 AM, Samuel Mutel wrote:
> Hello,
> =

> When I start the command sudo tpm2_listpcrs, I receive the message
> Failed to initialize tcti context: 0x1.
> =

> How to resolve this?

It depends what tcti you are using. If you are using a sw emulator make
sure that it is running before you run the command.
Also see 'man tpm2_listpcrs' which talks about tcti configuration.

-- =

Tadeusz
--===============3174522115904003012==--

