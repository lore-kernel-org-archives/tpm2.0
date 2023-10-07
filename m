Return-Path: <petr.gotthard@centrum.cz>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8F4841772
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5355941769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
 t=1696710969; bh=28thu8XiAxXGctKd+ooYAFO9qHWcPlRCRSVIeuHbg+s=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=mFaOdt3PrKN5ECqzDEfeDureS3dXFDwxjexIYGMMYpfLrLm4QAENqQq6Lt/OCee7K
 7xyQXuUPzAVna7gZJTfMyywEa8tMqJdfxusMnaF5Jqf4iYjE5mI6e28kLhFjIGMjBr
 9PleQDPnoZS2j41q0CtI3Ja6zThbTET6Mi6CtXqk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
 t=1696710969; bh=28thu8XiAxXGctKd+ooYAFO9qHWcPlRCRSVIeuHbg+s=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=mFaOdt3PrKN5ECqzDEfeDureS3dXFDwxjexIYGMMYpfLrLm4QAENqQq6Lt/OCee7K
 7xyQXuUPzAVna7gZJTfMyywEa8tMqJdfxusMnaF5Jqf4iYjE5mI6e28kLhFjIGMjBr
 9PleQDPnoZS2j41q0CtI3Ja6zThbTET6Mi6CtXqk=
Date: Sat, 07 Oct 2023 22:36:08 +0200
From: Petr Gotthard <petr.gotthard@centrum.cz>
References: <20230304111257.FBBD1E80@centrum.cz>
 <20230503134318.423136D0@centrum.cz>
In-Reply-To: <20230503134318.423136D0@centrum.cz>
MIME-Version: 1.0
Message-Id: <20231007223608.6C34B3C5@centrum.cz>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [Tpm2] [RELEASE CANDIDATE] tpm2-openssl 1.2.0-rc2
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

Hello,

I would like to announce the release of tpm2-openssl 1.2.0-rc2, hopefully its last release candidate.

https://github.com/tpm2-software/tpm2-openssl/blob/1.2.0-rc2/docs/CHANGELOG.md


Kind Regards,
Petr
