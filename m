Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362574DA530
	for <tpm2@lists.linux.dev>; Tue, 12 May 2026 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588014; cv=none; b=XmVmvIyIMTTRyCWiUc4gvHl88J1dfyA9iiqAGyUmLC4DK8yujI8CSIf9JNN8uA4uvqJWdWwZiuzeWV4osrIo9HSwUVN9IHphB3ZZfBKaxK9lwakLrkKwd5BX+1+7uzsMRyCHeCZrguu1MoFGaInp+59QkdY1He/K8T9WIGm6lK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588014; c=relaxed/simple;
	bh=xG0iJX68DRNbxiYAwpTXbEbIp2yFhLOrjR36DRo1MmQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tAyiO0bPNl3VkKqX5PpSFJHeJVgxHRR/2gYbVnar27Gh/x8yCEJKLOQN/GCOMSKt594KHkeWTV1D5zb+J2zLD4GQ+pK65FArLdk60O2/H89JBI9s/IGctPlB8NjKZYWEbgyx5AW43VsppvNOZ5wh0kOFSIQUFw6orrbLzlobFRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=MLWLmfBN; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="MLWLmfBN"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1778588011; x=1810124011;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xG0iJX68DRNbxiYAwpTXbEbIp2yFhLOrjR36DRo1MmQ=;
  b=MLWLmfBNieTbXJyMokkT+xSjKoFFhz2cjoPFARSy2OcEFBOOo9RrTAC+
   95ZPxTavUMbpBym7o5eL+aMOmFlKIqRdJJgZYpKxBjx2CiNslaKODf77f
   ajHD3nuvbld1IkhoRHCgqxB8oZMYuRRTvf5UdTjVvgVvY+ttVcZsF8ILT
   k=;
X-CSE-ConnectionGUID: 2igJEe3GRyWAKpJT9ReSGA==
X-CSE-MsgGUID: NkahM9M0RBK2A7UKmRUdPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="93088248"
X-IronPort-AV: E=Sophos;i="6.23,230,1770591600"; 
   d="scan'208";a="93088248"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 14:12:18 +0200
Received: from MUCSE842.infineon.com (172.23.7.71) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 14:12:17 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE842.infineon.com
 (172.23.7.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 14:12:17 +0200
Received: from MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad]) by
 MUCSE843.infineon.com ([fe80::8f59:7f5d:e71c:9fad%21]) with mapi id
 15.02.2562.037; Tue, 12 May 2026 14:12:17 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: tpm2-tss release candidate 4.2.0-rc0
Thread-Topic: tpm2-tss release candidate 4.2.0-rc0
Thread-Index: Adzh7jBOXpdnkMXeTDmvAGCksMdfmAAGicyg
Date: Tue, 12 May 2026 12:12:03 +0000
Deferred-Delivery: Tue, 12 May 2026 12:11:55 +0000
Message-ID: <4d7c6dcc146844a5ae67e89c60c3cbe7@infineon.com>
References: <bab081292b8346878ab3391443d50598@infineon.com>
In-Reply-To: <bab081292b8346878ab3391443d50598@infineon.com>
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

I just tagged 4.2.0-rc0 https://github.com/tpm2-software/tpm2-tss/releases/=
tag/4.2.0-rc0

See the changelog here: https://github.com/tpm2-software/tpm2-tss/blob/mast=
er/CHANGELOG.md

Happy testing,
Andreas
