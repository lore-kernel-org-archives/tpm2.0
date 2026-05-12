Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA93372041
	for <tpm2@lists.linux.dev>; Tue, 12 May 2026 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588070; cv=none; b=k55u4HO40/nUtQeTLW5PuY5qEdxYSGwRlgGmthNXmhTJnpTDhO45J4SLtQo5iNYZG9yWxsbu+jDBrVQ7V0m34Jx07JgDaFS+rH+Vmnv7qJm5DkzQwC8LZ/FiloDOtLQwZOEfPMxBWlOtV56kHYlU3cOGF/Q0GaiG4k2oX7vmmyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588070; c=relaxed/simple;
	bh=qhZYVxfRu0kmkCiKHV4nmaEJeIS72Af6PNWf5dDh2sE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jdLHrQ+jLoUSLXQofjIFSh/7KgAi8cvpjg7qx+s/FGL+DtOYckrc+PnMVcGoCyYRnEga3fgU4TL4NROA8dWcVm0zd3PO/3kyKL6HDxhLDJ08XOWphvbfTEZgI0qvH7XJkpwAcHtMgxY44UI878ec6dWHTwCnagknX4CYQ0+nxcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Pox/jDPi; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Pox/jDPi"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1778588069; x=1810124069;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qhZYVxfRu0kmkCiKHV4nmaEJeIS72Af6PNWf5dDh2sE=;
  b=Pox/jDPixxufT2Ry8EGsM+aujYmO4GGo0AVcHw8XMCyZN9NUyjMnSctG
   1UMJnTh1G0Pk7O1sgeof9pIcqGFGHs4nTRAvNroPhCKzhafFl6pnL5ZW9
   O1MWHp8oQOlOJyd24+JrOPjgjTmIFUKumZdo/X7iaLZZXAMmMO6BxQCb+
   U=;
X-CSE-ConnectionGUID: JMemg83+Ree/DYWTR0i+wA==
X-CSE-MsgGUID: N8aK69ZRQAKgJgaB0i8zug==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="129631303"
X-IronPort-AV: E=Sophos;i="6.23,230,1770591600"; 
   d="scan'208";a="129631303"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 14:13:17 +0200
Received: from MUCSE842.infineon.com (172.23.7.71) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 14:13:17 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE842.infineon.com
 (172.23.7.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 14:13:16 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.2562.037; Tue, 12 May 2026 14:13:16 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: tpm2-tools release candidate 5.8-rc0
Thread-Topic: tpm2-tools release candidate 5.8-rc0
Thread-Index: Adzh7lVwy3MdnP6gTy2wUrNztUK4YQAGg4uQ
Date: Tue, 12 May 2026 12:13:01 +0000
Deferred-Delivery: Tue, 12 May 2026 12:12:09 +0000
Message-ID: <a1f4d30342d54574a7d6f9989dac568f@infineon.com>
References: <cae0a9287bdf4b68b01f1113df9622c8@infineon.com>
In-Reply-To: <cae0a9287bdf4b68b01f1113df9622c8@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi all,

I just tagged 5.8-rc0: https://github.com/tpm2-software/tpm2-tools/releases=
/tag/5.8-rc0

You can find the Changelog here: https://github.com/tpm2-software/tpm2-tool=
s/blob/master/docs/CHANGELOG.md

Happy testing,
Andreas
