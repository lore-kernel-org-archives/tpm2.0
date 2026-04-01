Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5DD3CF054
	for <tpm2@lists.linux.dev>; Wed,  1 Apr 2026 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035176; cv=none; b=LjrCPqJ+sH311H4r/uCJsJqvZroFT9te6I/k5To+vO1jv5QZJxJ4qel907qKLFdriaeOOuxjzdXqoDqPNBvCkgwnHLuQyjH8xbMgD5kvSBIrvVw9MSrqLFQHu7vY/UNdbH42OzBkBoH5p5Wbv8Dp8W/+w/QloGjjIN+rayb7+1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035176; c=relaxed/simple;
	bh=ZnRMjLP9oGXGnHma49x7O6C3I0HkRfcek6cwvwc9qqo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=Q3hRQjnR5LjYnt/qwbFyqaVzIvAt22f14H8qBny39LOEDzKGjhN2YR3GPGbJb0gUVg2MDLWqgi1Bs+JG1lw+6BMm+SWFS983zDkO3IbegH3ZPA0+F6xZ25x4fYTW6xEkedGKNbRlYLVkFCUH37eRRs+whtszrdpRZk21GbKh0Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=oH1iQFAU; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="oH1iQFAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775035172; x=1775639972; i=marvin24@gmx.de;
	bh=bv94LSqpDfAlod+uh4M2fRRZMwjHa5io/ok339Cdlwo=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oH1iQFAUDHs7Pp2/WCRjEp6GrYEH5oAWYV05OOmcKrIUwt/rg4OkLokNNJx2gdU8
	 //Q2nymMvW2UunTKkPzdk+gWm0LMG1L1bb6mfC0t8pQkkcQOSd253nf6rSMhgk8ZM
	 qjJZ/pRu6f9kP/Cl7nTlxbNZT3Bn6Z4CxpyuT3YPGvP8NjrEkkqOk0s1yLLarsL8u
	 +AYSOp9rHE0xKFffVKKbGxD/kswRwwr8SHsf+zYtIcTWdgOdVs9qXy0HimfzTN8jx
	 s2dJtxzwXdsLBMY9rTiVmXlnYGZHF5VL3Bx+NEC8DLXZAfdmuTMU7cApt8TWgu4c1
	 L82/MNa/vClkb2n7Bw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeI8-1vxrqy1JCu-00Viex for
 <tpm2@lists.linux.dev>; Wed, 01 Apr 2026 11:19:32 +0200
Date: Wed, 1 Apr 2026 11:19:31 +0200 (CEST)
From: Marc Dietrich <marvin24@gmx.de>
To: tpm2@lists.linux.dev
Subject: tpm_tis: workqueue: tpm_dev_async_work hogged CPU
Message-ID: <2b9e7540-5439-1143-8d30-b98a99ec4a7d@gmx.de>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Provags-ID: V03:K1:U19764f6y2lL9k8jTDuLcQ9zD8lwrsAWOdCsz951VN+Y4ho5RC/
 Th79d91pMPkJ2fYLnMEx9qGv3m536nijHOi0/AvozkWUKhQyfTjQd530BXauNsdrgKQtoCk
 icdxomPmnU3pM1xP4yGwi3PdJUA30QcEQ3ilHYOBkkTjZbZyY6UVIVfC+mD6fcgX3Ofw51E
 wq7IMatCjJne4lqldNWNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AV4OertU8e0=;lGU2BcfNBDiD2HzTz10FnkhINV9
 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
 0wC/4bJ6NqTy0j1X0=
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm seeing hogged CPU error during boot. Access to TPM is maybe due to=20
the decryption of the LUKS key. I have this since I can remember, so also=
=20
on current (ubuntu) kernels:
[    2.194340] workqueue: tpm_dev_async_work hogged CPU for >10000us 4=20
times, consider switching to WQ_UNBOUND
[    2.404044] workqueue: tpm_dev_async_work hogged CPU for >10000us 5=20
times, consider switching to WQ_UNBOUND
[    2.672315] workqueue: tpm_dev_async_work hogged CPU for >10000us 7=20
times, consider switching to WQ_UNBOUND
[    3.601033] workqueue: tpm_dev_async_work hogged CPU for >10000us 11=20
times, consider switching to WQ_UNBOUND
[    4.796138] workqueue: tpm_dev_async_work hogged CPU for >10000us 19=20
times, consider switching to WQ_UNBOUND
[    7.429240] workqueue: tpm_dev_async_work hogged CPU for >10000us 35=20
times, consider switching to WQ_UNBOUND

Is there a way to switch to an unbound workqueue or how can this warning=
=20
be prevented?

Best wishes,
Marc

