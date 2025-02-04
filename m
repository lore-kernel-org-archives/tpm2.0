Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DF6207676
	for <tpm2@lists.linux.dev>; Tue,  4 Feb 2025 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661927; cv=none; b=tEvDPOWe1CrWUpWJdwwm27YBD1YcbCe2/n2fVrSRXc39oHPBxQcVlw24PNa6+hvJZuTlsZpxijDdczcaM1WvZ98BxrSb3o5R73fercgaw/hudyJ3MHaGPkyyc+1+CDfDMsx6/3NV6coLyDAM7qixfgu75VyK3AOgu9yLAY7iNds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661927; c=relaxed/simple;
	bh=x6gUKgVT4IfFMQFs/VXdRWZi3VbHc/M0JYyzMg827QE=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=iRSE8fqTvjSxDRIC4gK/wZ+rebmVCVmFsudZzTZZMUsScjwEK0CnVPMlRd2WF7KM1HS5fGr7XTcJXuKJJTtKWGN2Nf4sCQZ9jKMkA9v6vNHMdjo6CUrPtheE3OjIPsoA7mGcKc6HZ3vgAy1d6qZurYvuSIm5/Vv/wzBANYLssRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philipp-goerz.com; spf=pass smtp.mailfrom=philipp-goerz.com; dkim=pass (2048-bit key) header.d=philipp-goerz.com header.i=@philipp-goerz.com header.b=X1m2VJQT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tSqyiJ67; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philipp-goerz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philipp-goerz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philipp-goerz.com header.i=@philipp-goerz.com header.b="X1m2VJQT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tSqyiJ67"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 303842540196
	for <tpm2@lists.linux.dev>; Tue,  4 Feb 2025 04:38:45 -0500 (EST)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-05.internal (MEProxy); Tue, 04 Feb 2025 04:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	philipp-goerz.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm2; t=
	1738661925; x=1738748325; bh=x6gUKgVT4IfFMQFs/VXdRWZi3VbHc/M0JYy
	zMg827QE=; b=X1m2VJQTUMBb86CBGybQECDks2KHUJ6HWtxzK15nWHY8+5we7M2
	TzPzHo3Yw4eyUIUBT3PJMTFOHX/GiPbJYvENlk5g3uCe//inzbP/gLfKVmu0wUzs
	AwnN7i93At6mZnL8kmZlPWjNP+A4OVtIJBQubSOzBsTnMX968uc/iZUccbFtnKbq
	ByisoXaPe4uMqx46B23NS+Q1XS+/T2/cYxC2qt+QCLgJ8vtC1ZGhtfysSU4z1OKI
	YXeGfJl8j+EM0jNFOMXFBvZFxpCMnP/pXtqAOCP4qqO+AlCgWDTHGQt5OlFUwIz+
	O9nz2aPDwOfuTCNHEc+MfcM7pmviRA7vOjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738661925; x=1738748325; bh=x6gUKgVT4IfFMQFs/VXdRWZi3VbHc/M0JYy
	zMg827QE=; b=tSqyiJ67r4K3Zr2plr7PVXc1/2emK+TgCnzoAPShO3vjqLj8qe/
	pD1VyTQ8+MDOUPbi6PDEsIw/qtMql3cNEK0aiKana9QmQtZwF0Dcq4x7c38PKGz1
	nSggGvhDEgOZWrDAvoW0NlmWpIPZ33jC9pD51IpLg4YL4INYudeujEDv+rhWQwTX
	tzwh3VqxfQTGuw5KjsH9aVzul8YE4GAS7jhuIE1XlBcJ85Sia5PlGwf1Oqyo2ddq
	pNXDXPpvoMI9V4BWakmYPGQeHqG2kaZ8uySHqvdXz2pZBcocjv/4zJSaSH8eO6iz
	fxEuR3lRyInxLTHiNFaRxd1w0DpdnnSwMCw==
X-ME-Sender: <xms:JOChZ1HziZoUiZMThTfjgQs_QUc8KhZnkZlat3_oH8MaRrB_6VN3-w>
    <xme:JOChZ6V7-ZEZE4SZTA69GWzPW7TOMr2SjMs04nTqayIw2fINip3U1mONX6flmyiER
    GP6r3Ygv8C6ZZLHQAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggff
    fhvffkufgtgfesthejredtredttdenucfhrhhomheplhhishhtshdqlhhinhhugiesphhh
    ihhlihhpphdqghhovghriidrtghomhenucggtffrrghtthgvrhhnpeelgeekteetledvje
    etkedtkedvfedvjefguddvheejkedtvdefhffhheejhfettdenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheplhhishhtshdqlhhinhhugiesphhhihhlihhpphdqghhovghriidrtghomhdp
    nhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhpmh
    dvsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:JOChZ3I7zFXY26lPTGlRUKMPEQIL2XQf8DWuoknMiWnKyzhQeNtLBg>
    <xmx:JOChZ7EnWfOjLfB2Vt6kmE8G09lfCWd_fywRFQu1FQkZdCxaKXi-nA>
    <xmx:JOChZ7WwDghusq8JpmHl1tc3QsU4L56xTtIAhu2C-tKRCOeGh7MOdw>
    <xmx:JOChZ2N3xv7I4P0H2pXbsIamx7baZxxnDRWT99CpDqVgJJQOQ-WbzA>
    <xmx:JeChZ8eUBnZ7f_LKJdYHmH7vVxBOA7Phr_-YLV7Lu-iBCa8twEN3Pi6w>
Feedback-ID: i14d946ac:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C07793360079; Tue,  4 Feb 2025 04:38:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 10:38:23 +0100
From: lists-linux@philipp-goerz.com
To: tpm2@lists.linux.dev
Message-Id: <1b9d6383-e309-4a5d-a26f-b8e7f83a0fc1@app.fastmail.com>
Subject: Close to zero coverage in OSS-Fuzz
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

I noticed that this project has pretty much zero coverage in OSS-Fuzz, which seems relatively easy to fix for someone that knows this project. I opened an issue here: https://github.com/tpm2-software/tpm2-tss/issues/2940

Best
Philipp
