Received: from gmmr-3.centrum.cz (gmmr-3.centrum.cz [46.255.225.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12D800
	for <tpm2@lists.linux.dev>; Sat, 25 Jan 2025 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.225.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737829954; cv=none; b=ucPqYXUltaqiTIhMAGd7EMu0cVJb8AikedR0bViVFBlBq7DoU9S7f21h5F1n8bjU3RfEAyNWTYSrdTYJalhthNEOFpFypucoYWldGSzsvQAsukIwdFNo74FymhnhG6kaLHQKudFfa6rOAP+sQayR41I5CaLkAgCPQwVvrzB6pho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737829954; c=relaxed/simple;
	bh=uAvw1WQaTXQ9k+7pzt4NMpqHQR2dssnXImuI08ey98U=;
	h=Date:From:Subject:To:MIME-Version:Message-Id:Content-Type; b=AmdvGKwIQeoXFyq3Ifhry63ysbfEsigWCtrbF7QgDjCpo/ECj+ISZf9OVpxSX+X4j3+ThBiB7EhSMfGGnuzKQ79NygeXILxcZmVU2GmGHxe6ywmdUjtLRi28l9QEscIprmlsJjtOVrS6OdISEy8XvYVNOvBrq+EUNVi1R7U8ACs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz; spf=pass smtp.mailfrom=centrum.cz; dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b=L9aE9Z7m; dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b=L9aE9Z7m; arc=none smtp.client-ip=46.255.225.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=centrum.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=centrum.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b="L9aE9Z7m";
	dkim=pass (1024-bit key) header.d=centrum.cz header.i=@centrum.cz header.b="L9aE9Z7m"
Received: from gmmr-1.centrum.cz (envoy-stl.cent [10.32.56.18])
	by gmmr-3.centrum.cz (Postfix) with ESMTP id C12AA201C2E0
	for <tpm2@lists.linux.dev>; Sat, 25 Jan 2025 19:30:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
	t=1737829826; bh=phIPBtIiYLiWBW3b3hVGz9DX72G6LV+L4zTlOTZPEJY=;
	h=Date:From:Subject:To:From;
	b=L9aE9Z7mdn3anqrb0Y/TKoM/2O8TIJgW94wtqHpNA9Hv3hsvJ5fTWS09Tndtiy8Kw
	 iwO7Z2sM2vru8fAJVqaeUPxJYePHTmwfXC8+0oicfpQKKvnOZb8zMNj070XXX6n+HN
	 NfYWuQiy63dW1xurFOsbSSQ2znvqhlUzJ2jt9qzs=
Received: from gmmr-1.centrum.cz (localhost [127.0.0.1])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id BF039197
	for <tpm2@lists.linux.dev>; Sat, 25 Jan 2025 19:30:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
	t=1737829826; bh=phIPBtIiYLiWBW3b3hVGz9DX72G6LV+L4zTlOTZPEJY=;
	h=Date:From:Subject:To:From;
	b=L9aE9Z7mdn3anqrb0Y/TKoM/2O8TIJgW94wtqHpNA9Hv3hsvJ5fTWS09Tndtiy8Kw
	 iwO7Z2sM2vru8fAJVqaeUPxJYePHTmwfXC8+0oicfpQKKvnOZb8zMNj070XXX6n+HN
	 NfYWuQiy63dW1xurFOsbSSQ2znvqhlUzJ2jt9qzs=
Received: from antispam39.centrum.cz (antispam39.cent [10.30.208.39])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id A50CE1A3
	for <tpm2@lists.linux.dev>; Sat, 25 Jan 2025 19:30:26 +0100 (CET)
X-CSE-ConnectionGUID: TN2e6QhDT8u5IoFJ+jYR3A==
X-CSE-MsgGUID: K3V6hOvVRaS/pRQvhXidAA==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2HCHABYLZVn/83j/y5agQmBU4NBgWQIARRbmHYBkCaId?=
 =?us-ascii?q?oFWgX4JBgEBAQEBAQEBAQk5CwQBAQMEggyNayg0CQ4BAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBDQEBBgEBAQEBAQYGAQKBHYU1Rg2CW4EsgSYBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEXAg2BPlSBKCSCcoIvATQUBrdWgTSBAYR713QFgSAfgWcGgUiFa4JJG?=
 =?us-ascii?q?gEFbYR4AYUtgVVEgRWGSQKCLYNIgi8Egi9IhAVnoFqBTRwDWSwBVRMXCwcFg?=
 =?us-ascii?q?XEDgRKBSUQ3gkdpSTcCDQI1gh58giuEXFaDb4RRhVuCFIIThg4dQAMLbT03F?=
 =?us-ascii?q?BsGnQBrPYUPLC+BHnANLZJ8kSahOjQHhB6BXQYMgl6GJ4EkiF6MUARJqlIBm?=
 =?us-ascii?q?HyOBJVThVYDAYFjghZNg1tRGQ+SG8cfdwI6AgcLAQEDCZAQgUsBAQ?=
IronPort-PHdr: A9a23:Sxzruh84pPzlV/9uWRS7ngc9DxPPW53KNwIYoqAql6hJOvz6uci5Z
 QqGuqkm3AeYFazgqNt6yMPu+5j6XmIB5ZvT+FsjS7drEzIjt4A9sjdkPvS4D1bmJuXhdS0wE
 ZcKflZk+3amLRodQ56mNBXdrXKo8DEdBAj0OxZrKeTpAI7SiNm82/yv95HJbAhFiiexbalvI
 Bi0ogjducobjZdmJ60s1hbHv3xEdvhZym9vOV+dhQv36N2q/J5k/SRQuvYh+NBFXK7nYak2T
 qFWASo/PWwt68PlrRbMQRKR63UTT2saihVHDRTL4xH8RZfxrzD1tvFh1ymAPM35Vq47VDK/5
 Kp2UhDoiSMHNzkk8GHLj8F7kaxWrA69qxF53oXZZpyeOvhjcaPHZd4US2pPUNtPWSJbDYyyb
 JcAAeUaMOZErYTwqUcCoQeiCQWyAu7k1z9GhmXx3a0/y+kvCx/J3BA6H9kTsXrUq8n1NLsSU
 e+v1qnH0CjIYvRO2Tjj9IjIaAotof6LXbJsbcrRyVMgFxnYgViLtYPqITWV1vgXs2iG6upsT
 /6gim8+pgx3vzOgydsihJPTiYIJ1lDL6z95wIAtKNC5VUJ3fdypHpReuiyUOIV7Qd0uT312t
 Ss51rEIuZ22cDUXxJkmwxPSZfOKfoyH7x/hVOufLil0iXJ4db+/mxq/91WrxOP7VsmxyllKr
 yxFn8HDtnAMyxzT6tWHReBn8ki93jaP0gbe4fxHL0AsjafWJJ8szqQumpcTsUnPBDH6lFv0g
 aOMaEko5uil5/zkb7jmvJOQKot5hw/kPqkglcGzG/k0PwgMUmWd5O+yzqfs/VfjT7VPlvA2l
 67Zv43EKskDva65BhNV0p4k6xaiEzeqyNQYkmcDLFJCYB+HgI3pO1TUIPzhAvqzmUijnyltx
 /DaJL3hH5DNImLfn7bgZbp96khcxxQvzd1H6J9ZC6sNLOzzV0LxrtDUEAE1Pg6uz+r5FNlw1
 psSWWeVDa+YNKPSv0WI5uUqI+SUfI8apir9K+I/6/7hin85hUMdfamz0psNdX+1BehpLFufY
 XrwmNcBDGIKshAiQ+3rkFGCSyJcZ26uX6Ig4TE2EJ6mDZ/GRoyzm7GB2Ca7HoZKZmBdEFyMF
 Xbod4OZW/YDci6dP9FukiIcWbinUIAuzQuuuxPiy7p7MurU/TUVuY/72Nhv+eLTixI8+yZsA
 sSS1mGNSnt0knoHSjMswK9wv0p9ykuZ0ahlhvxUD8Bc5vJRXggnNp7czul6BsjqVAzOcNiHV
 kqoT8mgDz0pU90xxsUBY1xhFNi6lh7NxjKkDbANm7yQHJw0/LrR0WDoKchlxHjKzLIhj0EoQ
 sRXNW2pmKp/9w/LCoDRikuXj6mkJuwg23uZ6H+Gl0KKvVpES0h0UKPYTTYTa1WA/vrj4UaXd
 7KyE/wINRddyceYJuMectD1lxNJQ+v/ON3Eb0q6lmGsHwuNgLieOtm5M14B1TnQXRBX2zsY+
 myLYFBWOw==
IronPort-Data: A9a23:uZmsla3wBGY2kpawnPbD5ZVwkn2cJEfYwER7XKvMYLTBsI5bp2NUy
 DYfDG+BO/qJM2P2fNtxbI6+oU8B75LUyoI3QVRo3Hw8FHgiRegppDi6wuUcGwvIc6UvmWo+t
 512huHodZ1yEzmF4E/wb9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtcAbeORXUXU4
 rsen+WFYAX4g2cubzpOg06+gEoHUMra6W5wUmMWOqgjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqfgqk
 YkQ6sbgIeseFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 dpCJW40bjy/1//r4bWVaKput/54BZy+VG8fkikIITDxAvMjW9WfBa7H48NCwTJ2jdIm8fT2O
 5RfM2cyKk6aPFsVYgp/5JEWxY9EglHnfiFC7l2SubY36nLf5Ad81qT3Ld+Tcc7iqcB9zhfJ+
 DyeojyR7hcyF4ehlzqi7EyWj9SIhRnCRoIiFbGR36s/6LGU7ilJYPEMbnOnufzjokq/QM5Eb
 UgV/Dc+66Q/6iSWosLVUBi9ujvY+BURXcZKDuh84xPlJrfo3jt1z1MsFlZpAOHKfudrLdD2/
 jdlR+/UOAE=
IronPort-HdrOrdr: A9a23:fUPRAa0FyWRKAQWPt0sGvwqjBKYkLtp133Aq2lEZdPUzSL39qy
 nOpoV/6faaslsssR0b9exoW5PwIk80i6QFg7X5VI3KNGKNhILCFu5fBOXZrQEJzUbFltK1rp
 0AT5RD
X-Talos-CUID: 9a23:WP0lpG7jet0I9BsNa9ssyGhOF54cclHhnGqNAkiWKyVreYfOYArF
X-Talos-MUID: 9a23:QVbrhQuOOdX3mmJHJc2np2pcasdP/ZqUAXtKia8/pcm0NCBZEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,234,1732575600"; 
   d="scan'208";a="89966050"
Received: from gmmr-4.centrum.cz ([46.255.227.205])
  by antispam39.centrum.cz with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Jan 2025 19:30:07 +0100
Received: from mail1003.cent (envoy-stl.cent [10.32.56.18])
	by gmmr-4.centrum.cz (Postfix) with ESMTP id 6A47C15DCA
	for <tpm2@lists.linux.dev>; Sat, 25 Jan 2025 19:30:07 +0100 (CET)
Received: from 85.193.34.157
	by mail1003.centrum.cz (centrum.cz multimail) with HTTP;
	Sat, 25 Jan 2025 19:30:07 +0100
Date: Sat, 25 Jan 2025 19:30:07 +0100
From: Petr Gotthard <petr.gotthard@centrum.cz>
Subject: [RELEASE] tpm2-openssl 1.3.0
To: <tpm2@lists.linux.dev>
X-Priority: 3
X-Original-From: =?utf-8?q?Petr_Gotthard?= <petr.gotthard@centrum.cz>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250125193007.8AA5669C@centrum.cz>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,
 
I would like to announce the final release of tpm2-openssl 1.3.0: https://github.com/tpm2-software/tpm2-openssl/releases/tag/1.3.0

This is a feature release with few new functions, but most notably it should work in multi-thread and multi-process applications.

Added
- Added support for RSA-OAEP decryption.
- Added 'xof' and 'algid-absent' parameters to digests.
- Added Parent to textual information printed by 'openssl pkey -text'.

Fixed
- Fixed multi-threaded operation, preventing the 'Esys called in bad sequence' errors (thanks to @Danigaralfo, @famez, and @AndreasFuchsTPM).
- Fixed retrieval of OSSL_PKEY_PARAM_MAX_SIZE for RSA keys. The exact value is returned instead of a fixed TPM2_MAX_RSA_KEY_BYTES.
- Fixed handling of absent emptyAuth value in the TSS2 PRIVATE KEY file.
- Set authorization value of newly generated keys. This allows users of the C API to direcly use just generated EVP_PKEY.


Kind Regards,
Petr
