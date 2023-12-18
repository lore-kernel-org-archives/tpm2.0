Return-Path: <konstantin@linuxfoundation.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B4180FB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B33180F58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1702940734; x=1703545534;
 darn=lists.linuxfoundation.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x/bFzJjrz3xMvxJllqdGKS+Ph6LApMUNEeDRPIsjj0g=;
 b=GOhnCvZvJ1wkny8+HGpQHoakHgr0hrXI9imVhY4C8w8xwwBiSulsFWYhalNO7QyOu8
 FIOzPAkrTuwtg9sEgwHRfunkWU7BAXwSBo7ySxtEb8Z3tswNerPlR91EfznvtJq71OG4
 SCdsfMa9z/Y22hBlYTw4Zd1G8vw89+M3IMxTo=
MIME-Version: 1.0
References: <20231121-wild-excellent-mastodon-2ad369@meerkat>
In-Reply-To: <20231121-wild-excellent-mastodon-2ad369@meerkat>
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Mon, 18 Dec 2023 18:05:23 -0500
Message-ID: <CAMwyc-S1sAqQVi=E1Km4t+Op56osk20JbYyaOFDDrAsVcbPBfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Tpm2] PSA: the tpm2 list will be moving to lists.linux.dev
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

On Tue, 21 Nov 2023 at 16:21, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello, all:
>
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
>
> Please let me know if you have any questions or concerns. Otherwise, I will
> follow up next week with the exact date and time of the move.

Hello:

This took a bit longer than expected due to other work, but the
migration of this list will take place this Thursday, December 21, at
11AM US-Pacific (19:00 UTC). I will follow up once this work has been
completed.

-K
