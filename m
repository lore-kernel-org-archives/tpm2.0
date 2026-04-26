Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200792AE78;
	Sun, 26 Apr 2026 07:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777189686; cv=none; b=QjgSsTW+LyfKEOHC5eN2s9PzU4sHs60q8YZHS1zhOkptXQRrzWW6qAuis+4Rnv4IIgjKLEzitmwYDA/ZN/bVtKswpzR5Ui8MwcB0FAVHOD37Xzb6+HFuZ3Xa9Npn9cHavFPVbwzfWUTZ951vBaWy47WKxSehWif+fqpCmT3Mo7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777189686; c=relaxed/simple;
	bh=qIOWcfjo6P4lBewZ5FIsnwBuDk1Kxe0EAbqDEUh7gHY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7Lri57aImBAZcrmiXGc2Hjb9AbPLT2TFWkWL9z/MAbg7Bx83pHri1loVFT97jbMvVFZHC/u5RmYU84I5YcV96bg8qppQkW7KG8BZC9/tOiax4NXRluFuxsogas+mneCdGJ8tW70vcH3LDM3HcATADGH02mWup0d2FSF/WPybsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHZyk7dK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHZyk7dK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A24C2BCAF;
	Sun, 26 Apr 2026 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777189685;
	bh=qIOWcfjo6P4lBewZ5FIsnwBuDk1Kxe0EAbqDEUh7gHY=;
	h=Date:From:To:Subject:From;
	b=OHZyk7dKv2kzxmb85M7HbY91RzjZAAI3FIn5hifEUYCF6jAl8EVNBfMYzZ7S2QXoH
	 JGQw1Vvw9HE5tan4gl9dkiSqgEfAowb2HyMHPAmeXCV/uhrL7ByXUgM/v9qel92t3D
	 NT13kUtCKk0Lw3U11LZyci5fz/0iCjneEsVLTagKOUyU98gjKSBu6uA+0eP9Vbw+/z
	 3ctZIUNnGgIBMvZ7ud0B5niP+VrAj821jiuvwpVIaDa/IUNsMtpd9GyB6Ykomj9npE
	 VaZLtPZouRgrrcrBsehFk5uoJ2jU/3+VZpKa2H/mwokY5f6E3paHCVNfvuibmztEzp
	 3J7Goz4SNYmTA==
Date: Sun, 26 Apr 2026 10:48:01 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev, tpm2@lists.linux.dev
Subject: tpm2-protocol moved to Gitlab
Message-ID: <ae3DMTQM0JWUtqYC@kernel.org>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tpm2-protocol has moved to Gitlab and accepts regular merge requests:

https://gitlab.com/tpm-protocol/tpm2-protocol

My other TPM2 crates and https://crates.io/crates/tpm2sh will gradually
follow.

BR, Jarkko
