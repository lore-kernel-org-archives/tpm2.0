Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788546;
	b=rZLNj5Cf4FYf7DVKXVRMAfBNDntm0oFYG5nfAkJ4iUwkTdNxwgBzmafOKgk2EFt+L3nx
	 upxcoI5vZ7ynCBV5g+43ThKAJLGOfrFT3BbWCCY4CXFPsSvnofXDi0gBQd78snqHLIwwt
	 qBjo+25uFzU0fKi6WDDZR3WyKjxUtlXtku5mD2uppOmF6OPpUHExumnwrR7j5erDLqWxq
	 DaMD98dAjGwZdXEc6SR6j/2yS5nRc4Erb7hPVV7tC44f1AdECE7VE1DHlve2wZCWtpoPt
	 GdXDpyewspJh5Mi4IDqIV0N8sJ/c3cRZ2cf1umxMa1BBGJ2Vs2u8NvdlMmL/gJuFaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788546;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=oRM0WhmRjvmRzarPY6lc/2SURwSQIncnx/klhMxWfi4=;
	b=4mf5W4w/bJXKJWhiD1YLH9X0LImjk2r4CssSb7SR+J8PaPgQ9AeFRQM8t0IAGWni6kO8
	 325cJEjJMnculyJU6Ak2f+1WuWv02D3pT577UhO3OQ0h2GfAtUwTl3uUA8TXI8++D5ejn
	 6MVLpZnpmGtgoA7GHMGXH0kfA2m819Lt1ta5J7J1jZ8Sx2hVTmMGx7b68GKIRXIA1Z3RP
	 +0fS5Vgx0FeKm74eOr16TruYSkVSSnsTHvjLsCkO6A/4OdNmln4WS9SjJly0xLyrK1uLl
	 k37WT1ekI2NE4Wr4S7t2tuUpP072K+2LSrKZ9JHi6rrb2Q3mKadm4H+Au/S+EoTTaig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=juergen_repp@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dGBQH7jB;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E51F606A31C
	for <tpm2@lists.linux.dev>; Fri, 27 Nov 2026 14:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E51F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=juergen_repp@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dGBQH7jB
DKIM2-Signature:  i=1; m=1; t=1795788537;
 mf=PGp1ZXJnZW5fcmVwcEB3ZWIuZGU+;
 rt=PHRwbTJAbGlzdHMubGludXguZGV2Pg==;
 d=web.de;
 s=s29768273:rsa-sha256:uNcyJ4LCk6UFw6Ib6T3j51uxbUtA
   CpDphXynVOVbBTTCKl2Jhx1Nd+K6Lg/+Qx241/RMvJBWPIOb1GBsZtYo54yuNKmFXiYtadOsiwd
   lyop2SjMt7DzEW8qPsUDcf1+EvEU9LVjcTu24fR3pOW0TqBK9dRtdq+6itmR3MY5g7HqC8rNsMf
   AhCzTujewud8pi7MrOTZVEvRTpCpG6ixuKWXrmcY4ZqLB7eYBdxDN0k6l7BV7OgY9XdCd3BFX06
   y66IHI4iwy+j/eE3kNHb2hJYwQPkm1Zg76tuubUv1lKYBTfYEtSBcQaxi2ZLwX7vPl1EXMSccua
   ktrPc1Rz1Cj4Ag==;
Message-Instance:  m=1;
 h=sha256:
   c6t6v0dE14G3I49JAf7GUIkdQJxc/89MjhsoCS7PvRw=:
   oRM0WhmRjvmRzarPY6lc/2SURwSQIncnx/klhMxWfi4=,
  sha512:
   g94hQzP25mzpEju2QGYIL7MME8O13fG5JslYXBn/CqH/87yIUnD75/cN0xxMbjDb0i7p3Is8OSx65UQoFmstrQ==:
   mIg9L6AJm4Hz0UgTfMLDzcfrRTUml3lzg900HtF2+jjbhnnHimk79eaTgAww2s2qIgxezVZjOq6mTYAJv1yhoQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795788537; x=1796393337; i=juergen_repp@web.de;
	bh=oRM0WhmRjvmRzarPY6lc/2SURwSQIncnx/klhMxWfi4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dGBQH7jBdNhQMPjmiN0sciTQfEOZJq1ysgIQ+BnRVAY/i2IXw07s5pA9FTwu3KTJ
	 qejqIq5G+IlUEIJ4+QBO+AYkp7YT+5EO9gGWnP+qBGUjbJS/xrVfnlDR647BZo2E/
	 y/peU2N7FBr1ghW1xFTKG+hL1jmry88Qr14d1FV5NlD26iOS2u5m7P0mHC0KCs7Y3
	 1auJ4kS570Z5Mv6lzEstK+0TpvXw1J0xF36wSxk2rFUl2dDoq/zlsOP9x6rd3GpOF
	 YDOls/7AcOQby98qe/rudsJ12MKvsfTsKH9I9CwPR9HKPmiXtFwQRbmhA4/DVO0PM
	 iqiOPsZjXwPT4jpFGw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MOUtg-1xsSox0HGw-00MpIY for
 <tpm2@lists.linux.dev>; Fri, 27 Nov 2026 15:08:57 +0100
Message-ID: <daf92438-38f2-4f8a-9dfe-cbd3f04db5c0@web.de>
Date: Fri, 27 Nov 2026 15:08:56 +0100
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
Subject: [SECURITY] [RELEASE] tpm2-tss 4.2.3 and 4.1.7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:oZliqlUDRTpmRAwTrzCeYFhjwt6XJpOTQy7n13/qkI+bz1yN7dw
 JIEqJaTbrL6VBJUWdR/cBpjGJtNu/52dMhwQIHbWlv06WpcmSjemzjWzL1e/8ocue3Cimj+
 QXN8IDmNL/UUFbah1+pnEjTjaP+2UvLahL9DF3RwAMfHcZIKCkOE8JZBiNefonReDWqdS1l
 VN/Eplds0Cep+49B6KjeA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/ADFCws+1I8=;y601aKGkbnmQe4UtU7ZOGNOQHBT
 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

Dear tpm2 list,

we have released two new tpm2-tss releases:
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.2.3
https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.7

Kind regards,
Moritz and Juergen
