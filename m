Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EC5466B52
	for <tpm2@lists.linux.dev>; Wed,  8 Jul 2026 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515547; cv=none; b=CPk4jQnq0nfxKUIeVCMjc4llK/U7DDZBaX81ThLDfGj0oOkd39KIdt+0iRQ0ggRoXE7MKEsisku9RVVBhYHTSY7m8gtq8lewFwuh+3w1RsCOf8mPJXEVR24Ws0v3w8znNEgaRzhT8y73PoZSAY4DISoDqRSvuIt44bLrk26lyqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515547; c=relaxed/simple;
	bh=gtbsLicxnxKUZoud5wI9Cpw8dfaviXy9rjqkPgYf8r8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dF3SEEv2Hmh7HLWJBx/9WAeZCreThtYjs6enIC4Bt7nHTVXlXj0SxIC2FspGPtWPUp05OauF0y8vBad8A1M/89jsnpobdn5O3a9r2wkc3oNzlEn5Bxk1K4h/x0XDfVKsoDjOQW/2tGUuqP9I7b1LOulreIx7tfuPkJwHeNUcFOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=KA66oU3j; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="KA66oU3j"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1783515546; x=1815051546;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=gtbsLicxnxKUZoud5wI9Cpw8dfaviXy9rjqkPgYf8r8=;
  b=KA66oU3jlrP+NmZkRA97Ki5V0rO5Xx9UARyodtQzx7dnbJom9QBFLO4C
   448u5XQRG2AMTO48dv4TNF2QMmCYhOB3+bYAkQL6qQey/rPSr3DDQWjoO
   ZLzT9w+Ivri7jQtoXG597t7UroY5FJNzxrsTgjzs0FXMudjSXlBH3n6W0
   0=;
X-CSE-ConnectionGUID: gj0Wnt5YS26MTGQbLZlc2Q==
X-CSE-MsgGUID: HOdz6JfZQq+PYqEIMe8Whw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="137157598"
X-IronPort-AV: E=Sophos;i="6.25,153,1779141600"; 
   d="scan'208";a="137157598"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 14:57:55 +0200
Received: from MUCSE842.infineon.com (172.23.7.71) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 14:57:54 +0200
Received: from MUCSE843.infineon.com (172.23.7.72) by MUCSE842.infineon.com
 (172.23.7.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 14:57:54 +0200
Received: from MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a]) by
 MUCSE843.infineon.com ([fe80::2199:b8a6:8f2e:48a%21]) with mapi id
 15.02.2562.043; Wed, 8 Jul 2026 14:57:54 +0200
From: <Andreas.Fuchs@infineon.com>
To: <tpm2@lists.linux.dev>
Subject: [SECURITY] tpm2-tss 4.1.4-rc0 and 4.2.0-rc1
Thread-Topic: [SECURITY] tpm2-tss 4.1.4-rc0 and 4.2.0-rc1
Thread-Index: Ad0O2KylpxxEQAF2TSSOWRyeCdzwVQAAGQIQ
Date: Wed, 8 Jul 2026 12:57:41 +0000
Deferred-Delivery: Wed, 8 Jul 2026 12:56:50 +0000
Message-ID: <c402b9fb476744fdb7e44702a07f64a0@infineon.com>
References: <4570b78c22e8483eac2c9b08cb3a5bd0@infineon.com>
In-Reply-To: <4570b78c22e8483eac2c9b08cb3a5bd0@infineon.com>
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

I just tagged https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.4-=
rc0
and https://github.com/tpm2-software/tpm2-tss/releases/tag/4.2.0-rc1

Both contain a number of security fixes.
As such, I'm planning to do the final release "very soon" i.e. beginning of=
 next week.

Happy testing,
Andreas
