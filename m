Content-Type: multipart/mixed; boundary="===============7041290454194705523=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Sharing TPM 2.0 between containers with access policy
Date: Fri, 05 Jun 2020 10:16:28 -0700
Message-ID: <18096ca7-42ac-fd5f-faa4-118adcf11140@intel.com>
In-Reply-To: AM0PR03MB4162166A604E7966236ABBCCE3860@AM0PR03MB4162.eurprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7041290454194705523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/5/20 12:52 AM, Oleksii Moisieiev wrote:
> Hello all,
> =

> I have an embedded device, with Docker containers based architecture.
> This device is operating by software, installed in separate containers.
> =

> =

> I would like to share TPM2.0 access between this containers with the
> following restrictions:
> =

> 1) Forbid Clear TPM command for the containers;
> 2) Each container should have an access only to the set of keys it owns.
> 3) Each container can create keys, but not overwrite existing keys that
> does not related to this container.
> =

> According to the "TCG TSS 2.0 TAB and Resource Manager Specification" -
> TPM Resource manager doesn't implement access restrictions right now.

I think you could run a separate instance of RM in per container to get
2 & 3. As for 1, this would need to be prevented on a platform
configuration level, like in BIOS or equivalent.

Thanks,
-- =

Tadeusz
--===============7041290454194705523==--

