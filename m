Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864245C0B;
	Tue,  2 Sep 2025 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756832960; cv=none; b=c9ImDAs4HXqZMOynYLJivsbIkbCfp2moWb6MmQL8q+WI3dIbHV+Ey4enw0ewd+AxjFAroq2CLqvO33FhuHJIXwI1kbgolseLigXrD8+HAV3SRy3H7WUH7KxLnaUz0r8n0b0LBxvenO3sv+wN9D3IZKBmWv9644eOqcnCUuVGaC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756832960; c=relaxed/simple;
	bh=gc73lsVA61EkS85pMDbbDJ33qQAs99p4AZNQ7ApxMbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSvRa8YeNIxzonaqgpD0YRRD/XPUHB49R0LaXXM7m4iHOJeVBiCDkSJkAOk3P2Xk2MI4eGSh7J8cvrFZfP752dHgWiHqfAueQsBu9YxLDmNN8IkVCosmLMWidXLILib6UoClAV3sgX9X4SeLS1PyEk9m/Wd/ACu2GW6EcYKaKJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jl9nIz3S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jl9nIz3S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EA0C4CEED;
	Tue,  2 Sep 2025 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756832959;
	bh=gc73lsVA61EkS85pMDbbDJ33qQAs99p4AZNQ7ApxMbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jl9nIz3SiWQPVwa3lsSrGOGkM6iNjD42QbX99Ac7iIveXnGg8xxSH+YB55SY11QZb
	 3bcoCG/eyl34UTIhte/X/rq8s8rDu/VsW6J+yzI/zovJD1FceHJ6EcjagTt6tcQrrd
	 dUGTut+MpGRZrXyPLIb6iz+dTNI16BhQ8r0qJUfuQvj9iJ10OlnRRJRuxucRWyzW32
	 SiFBbj18OiMgBSQfnklGWDk4qsTNHOxQKQOZtbyVj1khC8HaZB4wjtNGPUjJqn7blS
	 5ehW61hoX0FcKATAK8XT7/mxOR4Z1DnHN1gaGJKWGvkuWth9SZXxdc5LXPUz7gfROU
	 spJucb25QkxSA==
Date: Tue, 2 Sep 2025 20:09:15 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: tpm-protocol@lists.linux.dev
Cc: tpm2@lists.linux.dev
Subject: Re: [PATCH] fix(macro): interpret responses dynamically
Message-ID: <aLcku6sRj8qnX-jh@kernel.org>
References: <20250902165455.3680143-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902165455.3680143-1-jarkko@kernel.org>

On Tue, Sep 02, 2025 at 07:54:55PM +0300, Jarkko Sakkinen wrote:
> Here's the failing case:
> 
> 8001000000300000000002000000002000647915de6106c955b26456b8b8a3b10546fa446405d4eb2e1fb0247fb52080
> 
> What happens is that `tpm_parse_response`  returns `ParserUnderflow`, and
> parsing fails (gracefully).
> 
> The root cause is incorrect interpretation of commands being applicable
> both with and without sessions. In the failing case the response is
> captured from a run of `tpm2sh start-session`.
> 
> It has hard to define the failing commit since this project barely has
> kicked off, and the recent history is encompassed of major overhauls in
> order to get where it is right now but most likely the failure was caused
> by when refactoring away from having `tpm_response!` in favor of universal
> `tpm_struct!`.
> 
> I highlight the parts of the diff that are relevant for addressing the
> issue:
> 
> First an analogous trait to `TpmCommandBodyParse` is defined for delivering
> the "discovered" tag in the different layers of the response parser:
> 
> pub(crate) trait TpmResponseBodyParse: Sized {
>     /// Parses the response body from a buffer, using the response tag to determine
>     /// the structure.
>     fn parse_body(tag: data::TpmSt, buf: &[u8]) -> TpmResult<(Self, &[u8])>;
> }
> 
> Then the trait call is patched to `tpm_dispatch!`:
> 
> -                    |buf| {
> -                        <$rsp_ty>::parse(buf)
> +                    |tag, buf| {
> +                        <$rsp_ty as $crate::message::TpmResponseBodyParse>::parse_body(tag, buf)
> 
> The dispatcher generated is orchestrated from the "entry function" i.e,
> `tpm_parse_response`, so that's where the tag is originally supplied
> after doing a binary search to `PARSE_RESPONSE_MAP`:
> 
> -    let (body, mut session_area) = (dispatch.2)(body_buf)?;
> +    let (body, mut session_area) = (dispatch.2)(tag, body_buf)?;
> 
> Finally, `tpm_struct!` is mirgated to provide the trait implementation:
> 
> -            fn parse(buf: &[u8]) -> $crate::TpmResult<(Self, &[u8])> {
> +            fn parse_body(
> +                tag: $crate::data::TpmSt,
> +                buf: &[u8],
> 
> And that's how tag is delivered to the new response body parser for
> implementing the actual upgraded logic:
> 
> -                if $with_sessions {
> -                    let (size, buf_after_size) = u32::parse(cursor)?;
> +                if $with_sessions && tag == $crate::data::TpmSt::Sessions {
> 
> This fixes the bug and as is proven against the failing case by
> `test_response_start_auth_session_no_sessions_2`.
> 
> However, this revealed a "symmetrical bug" in tpm_build_response()
> leading to a failure in the final comparison of the test case.
> 
> This led to the new `TpmResponseBodyBuild`, which matches the logic
> with already pre-existing `TpmCommandBodyBuild`, and fixes essentially
> `fn len()`.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

Since tpm2sh is a separate project I was a bit stressed whether the
problem is fixed after releasing 0.10.21 of the stable 0.10.x branch
but it clearly does:

❯ sudo RUST_TRACE=full RUST_LOG=trace target/debug/tpm2sh  start-session
[sudo] password for jarkko:
[2025-09-02T17:05:31.895688Z TRACE cli::device] Command: 80010000003b0000017640000007400000070020c74f3cf4a9a62efe747457f8e8af8cd0bfb90a3725d62944a73002600617fd0e0000000010000b
[2025-09-02T17:05:31.929485Z TRACE cli::device] Response: 800100000030000000000200000000208da38751c181fb84262d4e2dac59610fe5f14d5d177ecc3544afcb0ac8b47671
tpm://0x02000000

This also verifies that `test_response_start_auth_session_no_sessions_2`
is capturing the bug realistically, and it is factors less likely that
the bug will retrigger.

BR, Jarkko
