Received: from majs.cnackers.org (vps-1525-1.tilaa.nl [46.19.33.97])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992A03C3BF7
	for <tpm2@lists.linux.dev>; Mon, 20 Jul 2026 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.33.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580808; cv=none; b=dwPR0L0L4YorpcGvF6ppTr1sY1TuSPNiOq7ICvial5Yb87F1GT3nOMHw7+QK/5Gu5f1aZ4NZjjv45h0aMNEuM17TEMeBNlcLFw5+anOowmiUkewb+3cyrj9lREs4MjQgsIfGBmOCmAzLQHOdwrLfDt3IvrOfupOUTu2Kq05/7lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580808; c=relaxed/simple;
	bh=wTJ01LTH4Mw8INfMdjRAgt+HFwgFqTY1PdStNxKXmyY=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=eQSqhdxbt2Rd7as/S40zIdWp7pXMKgR3P4COE3MJg7rFwy9BTP3Y/WG8PTRDDz15Me2DCfw6EjE1qF2ZXPtWQ3tDwJUyfrXT76xuo3Rm75ImltHvTDSh3Ubf0NDwhY9QGeTFe0+75OZK41b4ltDx9OPCJfvc/+V2SeGN6CKS7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cnackers.org; spf=none smtp.mailfrom=cnackers.org; arc=none smtp.client-ip=46.19.33.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cnackers.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cnackers.org
Received: from majs.cnackers.org (localhost [127.0.0.1]) by majs.cnackers.org (Postfix) with ESMTPA id 7086BFF10
Message-ID: <a669f1e0903fa00a647bc0409c1ef30494279c9a.camel@cnackers.org>
Subject: tpm2-pytss 3.0.0-rc1
From: Erik <who+lfl@cnackers.org>
To: tpm2@lists.linux.dev
Date: Mon, 20 Jul 2026 22:46:45 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

There is now a release candidate available for the next release of tpm2-pyt=
ss, 3.0.0-rc1.
Since the last RC the most interesting changes are support for free-threade=
d python, memory leak fixes in FAPI and the we no longer have a dependency =
on asn1crypto.
The full changelog can be found at https://github.com/tpm2-software/tpm2-py=
tss/blob/master/CHANGELOG.md

/Erik
