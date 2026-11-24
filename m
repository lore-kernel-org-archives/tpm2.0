Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530109;
	b=5Qz7+tJ7X8iTibAnp0ahkoRbppZbRw0pUMM6jporw+kyEZEiWaw+HAjl07Y7C2h7f6MB
	 w8aykhvDnUCrCIo04l0KbT7udr/uwtsjyWZbY7OuqScvUSZpvcxOjkqQl51Std9pjJlyC
	 F/4+iW1cimOQWqS9C0mLeFzo9Bz5xHeP7+e55UxqgTBZUa6srpZRcIui8y54lEQM6T11M
	 75+wA0pR+gSqZ2XHXv1d7PKURK8QvyDhnaMkoDVgp0Im76V9DJfhZwTJmpEOrQh0YOTv3
	 txUxR1NDw/PUGobjzXApdX3aHvLInV/hPDey61N6sFQrqTmZ0MVRT9LHOCVoEdZFvdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530109;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=nNaqDW3KNuLeUeE86mBInhj5ZLjIK9y+tEELOsGAzNU=;
	b=x7en3XABMZPDqATKBUlVo+rTuoc8fZBP7y+4WYpWWwXJBuDDAbTSO+1iyGoAbJxKclDX
	 YAx+SpsE8lUW3aYnP9cpx6ki8bMxQHymWv5fujL6S2Tjlt2zIaD8jtls8s+RfsiJFL0NS
	 fixCtZ620TFb7tVqr6SItaQmu0JTf9aKnvcn4j3qVPQH8kBLe1KYxa1ZV7M7jyd1LSqX0
	 r2RMYDJFvWzCW2tBoFGdL35+UQ8o1o4o5XibhPkBeRUJWKfHZxIZ+ZVE5ub32dJnszZpg
	 1iqe7mL6RmVqFeEfDOj+REtOePYzwVOHz2s8bcMzuYmlQ9j2I6jFIJ7o/ha+NdOorMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=juergen_repp@web.de header.a=rsa-sha256 header.s=s29768273 header.b=uoZzAqZa;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC63606A31E
	for <tpm2@lists.linux.dev>; Tue, 24 Nov 2026 14:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=juergen_repp@web.de header.a=rsa-sha256 header.s=s29768273 header.b=uoZzAqZa
DKIM2-Signature:  i=1; m=1; t=1795530099;
 mf=PGp1ZXJnZW5fcmVwcEB3ZWIuZGU+;
 rt=PHRwbTJAbGlzdHMubGludXguZGV2Pg==;
 d=web.de;
 s=s29768273:rsa-sha256:Nh9dvyOcdxwmeIZDqAJmYEFBMeo+
   fIyp04Y8N96dkpueWx/3AYtyzwuxjO3QlnELR/aHiqZ+uLjua1liNHtIN8JIg4q8ufATlsBnJNx
   wVNOXLqfhh8Mp9YvrIfylL7MQnRbBiAyi2JNLsSrAksKKnlChBEeDSpYnWa4Rony83ujuojDeLl
   2RhpbLcXtAOFoFFxL5aM8qRRMRS7n4ExX8CL6ciWQIoEOSL6KY6dnpXTwWaMyqUpbx+BUXXEhyX
   RjmM62HCXTlLmdGF8MZqGfL+JB3EBZqESsNN0l6SI51qSLyjnvVSxRt/NwINVU4Tg/VUpKBaSfO
   xtPwCosBpl321Q==;
Message-Instance:  m=1;
 h=sha256:
   ZX8oqbj3bOc/BtzPKKd3uIfnhmBt9ix0nJVxojTtncA=:
   nNaqDW3KNuLeUeE86mBInhj5ZLjIK9y+tEELOsGAzNU=,
  sha512:
   D46VqAdQLblT6W2HqE1OJ6Kjz4bsfG+7r10dLHn75VwI9ym/rpUYaQS7jVBjcA1mHWjHLXOX+A4UBVm/L1haig==:
   EK5MBVP3i5zkXCAfUmMA14/GArIHAaSXuE7M4SVZ0ag2cROr1bPI4FYuJXsMXyfBNvReRTwnBj9PMRRXrG2vUQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795530099; x=1796134899; i=juergen_repp@web.de;
	bh=nNaqDW3KNuLeUeE86mBInhj5ZLjIK9y+tEELOsGAzNU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uoZzAqZahj7ah43plv64QbF7ILDEV8wDD8ZMMdD8Avqd1aoDmBwQ/O+TzqIdHVRI
	 VB+V6YMQcg1YTaSNta43mxWBYEaTT9pkf9Kb5o0Zro9jp65h48kgpM036mTbb6lGc
	 t9Uz2CUPJ0n4MwC2JjnwUBIEIdb88DbnbNdg9tqKU5De6QXEZmEeBl3k866SsASPU
	 W37TIuXGSOKjZvGeLdtBReXYpMpzV7wgeMrxRCSN8ey0L7KRgRXM0ZaFuW3vcK+Ju
	 k2Lh8FG6PzWZQVSCiIJb8gPY+sxBWjL9dKc0/rIi2q4TCSXhsFY6WL4BU2Go+wnbQ
	 Pmml7iwvcswxhRjR6Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Ml46w-1yEqFz0hX2-00iXNr for
 <tpm2@lists.linux.dev>; Tue, 24 Nov 2026 15:21:39 +0100
Message-ID: <ae3820b9-7a5f-46ba-9e75-db1303935e1f@web.de>
Date: Tue, 24 Nov 2026 15:21:38 +0100
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Post: <mailto:tpm2@lists.linux.dev>
List-Help: <mailto:tpm2+help@lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
List-Owner: <mailto:tpm2+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tpm2@lists.linux.dev
From: Juergen Repp <juergen_repp@web.de>
Subject: [SECURITY] tpm2-tss 4.2.3-rc0 and 4.1.7-rc0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:GY5U+nrz6chIxV6oIPu/rzj4qgOCh0e94hfXKMDP8W9XCB3xTMh
 Bn4UogjS2lJGc68IkyMJhvBxj8o2HYjz2sx3EvP5lErOT9OHiivgXTP3cqfXX65X94sftI9
 8X5LEv2jzAEyBbpHUWb5xv/NIeoxdrNAzruME8+MSXlbMT2yzwtBggxmIkD+IfOLVq5nCxL
 bbge1DNQnRrxawR2TbeUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R1EPXXvKKW4=;B0iIU7dQh+QQw+ZxmYpPxahjfJj
 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
 mEeHaoWqg==

Dear tpm2 list,

we are about to release the new tpm2-tss releases so I tagged new RCs:
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.2.3-rc0
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.7-rc0

The changes include:

### Security
- GHSA-8fwv-r544-cjrh CVE-ID requested

### Fixes
- fapi: validate quote PCR selections before event log replay


Kind regards,
Moritz & Juergen
