Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFEC19D8A8
	for <tpm2@lists.linux.dev>; Tue, 22 Oct 2024 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729604194; cv=none; b=U4zHUELyOaIclmYZX+RArQSrdWQej7pbzGcEmAVczbyXEzhdZ6zV4Cq3erL6EBsYMPL4dTeoQWxanGnML0DA90lIeBkVTBB+4lPVbtph/0wxAn5976E56VEudOgNU5r8PR8Umu7KZtMCjaIvZ4gnWw3CZ9TZocvc9hM2fcNkPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729604194; c=relaxed/simple;
	bh=IcVTouMEwBnvnK5PEtqava5XzllAkLwYhezk+dEH7WA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=F2lvODQ3Onxt14H8700HAs1dnvF3ZKeocAjij/RuV3TOp7wgGcLKWqn1VPNnoXwcAODYnBwPyRafwhb4hfH7wMc+6QLsMpthZOcAKLoEBtsFxZ0IQhUxzSjFTzRnT69nc9FqNi8C9GYOcvCibR8649Qn/fjSEs6YLheqSCa28qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=GWGt1pZB; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="GWGt1pZB"
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4XXtKF5ZZczDqFV
	for <tpm2@lists.linux.dev>; Tue, 22 Oct 2024 13:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1729603681; bh=IcVTouMEwBnvnK5PEtqava5XzllAkLwYhezk+dEH7WA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=GWGt1pZB8sdivkQlXbeIKB6fuJqvssoQK6BeLGVkUK2EZ790UFU0cZ5Jdgshh7Hcv
	 OJ7vMGLbyTZpFceVujHRBj1FZ6OG7MVOiW5UkG20LNhyQlB7yHyO9F+L6CVUL7TW2s
	 +ugQvpP79l1beFiZm0oZ5FK2yhnto6/F6EaO57mk=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4XXtK75TkMz9s5x
	for <tpm2@lists.linux.dev>; Tue, 22 Oct 2024 13:27:55 +0000 (UTC)
X-Riseup-User-ID: DC83B5622FC5F0C3EBB12A6F433A46B0E32659E7CCE44E2E2323469F77B6178C
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4XXtK73yF0zJn4g
	for <tpm2@lists.linux.dev>; Tue, 22 Oct 2024 13:27:55 +0000 (UTC)
Message-ID: <bbe0cfcb-5337-4d8e-9746-e0520bbeb551@riseup.net>
Date: Tue, 22 Oct 2024 06:27:54 -0700
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: TPM error 0x0902 every 10 seconds
From: scar@riseup.net
To: tpm2@lists.linux.dev
References: <1f97dff4-3920-48c1-b8fc-424dbde64a84@riseup.net>
Content-Language: en-US
In-Reply-To: <1f97dff4-3920-48c1-b8fc-424dbde64a84@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hey sorry but am i in the wrong place or something?  please let me know
if there's a more suitable place.  how does no one here know what this
means?  are there further steps can i take to help you help me?  thanks
