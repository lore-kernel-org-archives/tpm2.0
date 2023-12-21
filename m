Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E7BA2F
	for <tpm2@lists.linuxfoundation.org>; Thu, 21 Dec 2023 20:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PA4ZWJrQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A557C617BC
	for <tpm2@lists.linuxfoundation.org>; Thu, 21 Dec 2023 20:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A557C617BC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=PA4ZWJrQ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQFXdFANWpZx for <tpm2@lists.linuxfoundation.org>;
	Thu, 21 Dec 2023 20:36:48 +0000 (UTC)
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B91BE6001B
	for <tpm2@lists.linuxfoundation.org>; Thu, 21 Dec 2023 20:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B91BE6001B
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7cae6a42e69so667203241.0
        for <tpm2@lists.linuxfoundation.org>; Thu, 21 Dec 2023 12:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703191007; x=1703795807; darn=lists.linuxfoundation.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQ/aVs7/l+xmzslZjqeY29jvjcjsr+htveNIDHev6FQ=;
        b=PA4ZWJrQRDu2DClo22o4Ey2a2izK9VmYEHMv+LBEsKX0pt/W+OidGTGUyNeZmawz8e
         9PJU0atNqw/WWFAWPypj48C6fwHGsVKSJ6YiCyxoBRjDrPHuVgiVHCSXMDp0OaihFtlh
         Z8pGtp4eKgGnljHPBHieoqeJcHU3kLmxdj4dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703191007; x=1703795807;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ/aVs7/l+xmzslZjqeY29jvjcjsr+htveNIDHev6FQ=;
        b=q4kE0r6ERqQXvBIEAZydXVe0WRe7SC21YSNuZxUHBnMDX0kqKJoPIyJbygFcU0cvq3
         wiLJ+ZmIw0ETG7Qw3pXc1rkipWpz1dPCYVHQIY8XY5ZmHOnypUNlqTzXARfA2ig+qK8L
         nUCcd50QKjqPkW1D+jVnk6Bl9hi1w+6COxDkUKVdHfDyITof816RQDE5Ak9Qdlk4p0U+
         YVWb1oDM27iqHJxPTwu3CRlfcKqaBZpOp2J7XDoRWyFNeK+8FNRUAXy0JnzDvnleZmzH
         z4DtYdclsGctlXALpm22eHWIZlhbXe/xKYnjEWT5WyrmI0H3F6EN9GbDvMzZii6v2rkJ
         9IqA==
X-Gm-Message-State: AOJu0Ywrm8aTxCbLvrZk46u/A+l4SItctuLucSuyta9CUJwEbDIGidTD
	aGj9H2lMgq2UnGxq4DzmTP7NKTS9b+lJ1LOOKdWwxgFnHrhQi5d9Vk7tWMuYo50=
X-Google-Smtp-Source: AGHT+IFE5Ojxg8uKc4LOQ8Nq/vgJayzAVKe7viHRa0BnI3BYRlWf66Ih+1L9ezrxx2nA/EudXjHzhJiRaHXFCDUdXr4=
X-Received: by 2002:a67:c199:0:b0:464:8e32:10f0 with SMTP id
 h25-20020a67c199000000b004648e3210f0mr488500vsj.5.1703191005840; Thu, 21 Dec
 2023 12:36:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231121-wild-excellent-mastodon-2ad369@meerkat>
In-Reply-To: <20231121-wild-excellent-mastodon-2ad369@meerkat>
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Thu, 21 Dec 2023 15:36:35 -0500
Message-ID: <CAMwyc-RVvhLzj7U_2MkUdLJkAuHUNrZQ5rUD2Ti9YZzFSpNZJg@mail.gmail.com>
Subject: Re: PSA: the tpm2 list will be moving to lists.linux.dev
To: tpm2@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Nov 2023 at 16:21, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> The mailman-2 system running on lists.linuxfoundation.org is being
> decommissioned, so all lists currently hosted there will be found new homes.
> Some time next week, the tpm2 list will be migrated to live on
> lists.linux.dev, but the impact of this move should be minor:
>
> 1. The new canonical list address will be tpm2@lists.linux.dev.
>
> 2. *The old address will continue to work* for the foreseeable future, so any
>    existing conversations can continue and any new messages sent to the old
>    list address will be properly delivered to all subscribers.
>
> 3. All members will be automatically subscribed to the new list, so no action
>    is required on anyone's part to keep receiving list mail.
>
> 4. The list will be archived on https://lore.kernel.org/tpm2/ with all prior
>    archives automatically imported.
>
> 5. The List-ID header will change, regardless to which address the message is
>    sent:
>
>    before: List-Id: <tpm2.lists.linuxfoundation.org>
>     after: List-Id: <tpm2.lists.linux.dev>
>
>    You will need to update your filtering rules if you filter based on the
>    contents of that header (on or after the migration date).
>
> 6. The mailman footer will no longer be added to message bodies and the
>    subject will no longer be modified to insert [tpm2] (because this
>    violates DMARC).
>
> 7. Subscribing and unsubscribing will be done using the mlmmj supported
>    commands, documented at https://subspace.kernel.org/subscribing.html

Hello:

This work is complete and this message acts as a test to make sure
that everything is working properly. The list archives will be moved
later today.

Best wishes,
-K
