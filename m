Return-Path: <petr.gotthard@centrum.cz>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24B2E81CA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF8C81C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
 t=1697274746; bh=MBt6UajTlSTSk5IOD+btFJSaIPfZaWb0vnz7ZU7JDeo=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=N7AV3V1vS5xUkJuMOhXgOJDiqyvBrcBNU81mZlbxKLV20/SpDG9l0YdsKriVqj1AZ
 DBtgoJrBJcdMSCnYHQsEylTduvpdlSi30/3PBiQ37LWM42PZCg/vdTKnAyXSwz8mvI
 CSnmP/zLtdNS+YP4Cw6jRifViGDuVxd+ewXOwEMI=
Date: Sat, 14 Oct 2023 11:12:04 +0200
From: Petr Gotthard <petr.gotthard@centrum.cz>
References: <SN6PR11MB3437E666457CD27E5B0FAB9AB8DD9@sn6pr11mb3437.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB3437E666457CD27E5B0FAB9AB8DD9@sn6pr11mb3437.namprd11.prod.outlook.com>
MIME-Version: 1.0
Message-Id: <20231014111204.3DBB765D@centrum.cz>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [Tpm2] [RELEASE] tpm2-openssl 1.2.0
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

Hello,

I just released tpm2-openssl 1.2.0: https://github.com/tpm2-software/tpm2-openssl/releases/tag/1.2.0

This is a feature release with several improvements
https://github.com/tpm2-software/tpm2-openssl/blob/1.2.0/docs/CHANGELOG.md

Many thanks to all the contributors!


Kind Regards,
Petr
