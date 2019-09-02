Content-Type: multipart/mixed; boundary="===============7014193648388186203=="
MIME-Version: 1.0
From: ZhengYu Tsai <kalohomulder at gmail.com>
Subject: [tpm2] Fwd: tpm2-tool can't execute normally on X86 target
Date: Mon, 02 Sep 2019 16:54:20 +0800
Message-ID: <CAAG8Em0_epZE9jUWPAkBg1_1PNXBjVj_xnr5xJz_Cr_yUOotgA@mail.gmail.com>
In-Reply-To: mailman.191.1567413102.2212.tpm2@lists.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7014193648388186203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all :

Per this issue https://github.com/tpm2-software/tpm2-tools/issues/1722 ,
i have tried these suggest, and target log as below :

*ONIE:/tpm2/tpm2-tools/tools #* export PATH=3D"$PATH:/tpm2/tpm2-tools/tools"
*ONIE:/tpm2/tpm2-tools/tools # * echo $PATH
/sbin:/usr/sbin:/bin:/usr/bin:/tpm2-tools/tools
*ONIE:/tpm2/tpm2-tools/tools #* which tpm2_pcrread
/tpm2/tpm2-tools/tools/tpm2_pcrread
*ONIE:/tpm2/tpm2-tools/tools #* ./tpm2_pcrread
/bin/sh: ./tpm2_pcrread: not found

It still can't solve, does it require static build the tools ? how can i
static build tpm2-tools ?

Thank you for your reply and williamcroberts.

--===============7014193648388186203==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPkhpIGFsbCA6PGRpdiBkaXI9
Imx0ciI+PGRpdj48YnI+PC9kaXY+PGRpdj5QZXIgdGhpcyBpc3N1ZcKgPGEgaHJlZj0iaHR0cHM6
Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9pc3N1ZXMvMTcyMiIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvaXNz
dWVzLzE3MjI8L2E+wqAsPC9kaXY+PGRpdj5pIGhhdmUgdHJpZWQgdGhlc2Ugc3VnZ2VzdCwgYW5k
IHRhcmdldCBsb2cgYXMgYmVsb3cgOsKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48Yj5PTklF
Oi90cG0yL3RwbTItdG9vbHMvdG9vbHMgIzwvYj4gZXhwb3J0IFBBVEg9JnF1b3Q7JFBBVEg6L3Rw
bTIvdHBtMi10b29scy90b29scyZxdW90OzwvZGl2PjxkaXY+PGI+T05JRTovdHBtMi90cG0yLXRv
b2xzL3Rvb2xzICPCoDwvYj7CoGVjaG8gJFBBVEg8YnI+PC9kaXY+PGRpdj4vc2JpbjovdXNyL3Ni
aW46L2JpbjovdXNyL2JpbjovdHBtMi10b29scy90b29sczwvZGl2PjxkaXY+PGI+T05JRTovdHBt
Mi90cG0yLXRvb2xzL3Rvb2xzICM8L2I+wqB3aGljaCB0cG0yX3BjcnJlYWQ8L2Rpdj48ZGl2Pi90
cG0yL3RwbTItdG9vbHMvdG9vbHMvdHBtMl9wY3JyZWFkPGJyPjwvZGl2PjxkaXY+PGI+T05JRTov
dHBtMi90cG0yLXRvb2xzL3Rvb2xzICM8L2I+wqAuL3RwbTJfcGNycmVhZDwvZGl2PjxkaXY+PGZv
bnQgY29sb3I9IiNmZjAwMDAiPi9iaW4vc2g6IC4vdHBtMl9wY3JyZWFkOiBub3QgZm91bmQ8L2Zv
bnQ+PGJyPjwvZGl2PjxkaXY+wqA8YnI+PC9kaXY+PGRpdj5JdCBzdGlsbCBjYW4mIzM5O3Qgc29s
dmUsIGRvZXMgaXQgcmVxdWlyZSBzdGF0aWMgYnVpbGQgdGhlIHRvb2xzID8gaG93IGNhbiBpIHN0
YXRpYyBidWlsZCB0cG0yLXRvb2xzID88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFu
ayB5b3UgZm9yIHlvdXIgcmVwbHkgYW5kIHdpbGxpYW1jcm9iZXJ0cy48YnI+PC9kaXY+PGRpdj48
YnI+PC9kaXY+PGgzIGNsYXNzPSJtXzg1NDIwNjg4NDgwNzE5MzUzOTVtXzc1OTg3NDU3OTY2MzA4
NjU1NTZnbWFpbC10aW1lbGluZS1jb21tZW50LWhlYWRlci10ZXh0IG1fODU0MjA2ODg0ODA3MTkz
NTM5NW1fNzU5ODc0NTc5NjYzMDg2NTU1NmdtYWlsLWY1IG1fODU0MjA2ODg0ODA3MTkzNTM5NW1f
NzU5ODc0NTc5NjYzMDg2NTU1NmdtYWlsLXRleHQtbm9ybWFsIiBzdHlsZT0iYm94LXNpemluZzpi
b3JkZXItYm94O21hcmdpbi1ib3R0b206MXB4O21hcmdpbi10b3A6MHB4O3BhZGRpbmctYm90dG9t
OjhweDtwYWRkaW5nLXRvcDo4cHg7d2lkdGg6NTE0LjE1NnB4O2NvbG9yOnJnYig4OCw5NiwxMDUp
O2ZvbnQtZmFtaWx5Oi1hcHBsZS1zeXN0ZW0sQmxpbmtNYWNTeXN0ZW1Gb250LCZxdW90O1NlZ29l
IFVJJnF1b3Q7LEhlbHZldGljYSxBcmlhbCxzYW5zLXNlcmlmLCZxdW90O0FwcGxlIENvbG9yIEVt
b2ppJnF1b3Q7LCZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7LCZxdW90O1NlZ29lIFVJIFN5bWJv
bCZxdW90Oztmb250LXNpemU6MTRweDtmb250LXdlaWdodDo0MDAiPjxicj48L2gzPjwvZGl2Pgo8
L2Rpdj48L2Rpdj4K

--===============7014193648388186203==--

