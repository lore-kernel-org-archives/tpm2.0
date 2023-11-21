Return-Path: <konstantin@linuxfoundation.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79848408A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7761E40898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1700601676;
 bh=CtgqEnGlOvbOxYLgO1I+chqokhKSNHAyKyXwkP9xvfY=;
 h=Date:From:To:Subject:From;
 b=N92KTsdjmanIMfDGJxDJoPcVogIcKTeURwxSCXfOivxTTzbxdGxaeJdPfMRrZa0Bi
 UhzZAjOcP/XKeFADQ0y78GBTWa1D7GQa42KxgruoXpsej3Em0L2Rqn67nUzp/Y1RDm
 0YOarcmiuXbaH1e+0cd0ecjteuZT5JwEKyiPPPxw=
Date: Tue, 21 Nov 2023 16:21:15 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Message-ID: <20231121-wild-excellent-mastodon-2ad369@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Subject: [Tpm2] PSA: the tpm2 list will be moving to lists.linux.dev
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

Hello, all:

The mailman-2 system running on lists.linuxfoundation.org is being
decommissioned, so all lists currently hosted there will be found new homes.
Some time next week, the tpm2 list will be migrated to live on
lists.linux.dev, but the impact of this move should be minor:

1. The new canonical list address will be tpm2@lists.linux.dev.

2. *The old address will continue to work* for the foreseeable future, so any
   existing conversations can continue and any new messages sent to the old
   list address will be properly delivered to all subscribers.

3. All members will be automatically subscribed to the new list, so no action
   is required on anyone's part to keep receiving list mail.

4. The list will be archived on https://lore.kernel.org/tpm2/ with all prior
   archives automatically imported.

5. The List-ID header will change, regardless to which address the message is
   sent:

   before: List-Id: <tpm2.lists.linuxfoundation.org>
    after: List-Id: <tpm2.lists.linux.dev>

   You will need to update your filtering rules if you filter based on the
   contents of that header (on or after the migration date).

6. The mailman footer will no longer be added to message bodies and the
   subject will no longer be modified to insert [tpm2] (because this
   violates DMARC).

7. Subscribing and unsubscribing will be done using the mlmmj supported
   commands, documented at https://subspace.kernel.org/subscribing.html

Please let me know if you have any questions or concerns. Otherwise, I will
follow up next week with the exact date and time of the move.

Best regards,
-K

