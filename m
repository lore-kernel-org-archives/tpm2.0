Content-Type: multipart/mixed; boundary="===============8332894782687943723=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 5437ab: test: test_tpm2_nv.sh
 large_file_name and large_fi...
Date: Fri, 15 Dec 2017 12:10:56 -0800
Message-ID: <5a342c50714e_10192ab49f355c047622b@hookshot-fe-d252ca1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8332894782687943723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 5437abdd960acf87464f23f2435bb506b1f872ca
      https://github.com/intel/tpm2-tools/commit/5437abdd960acf87464f23f243=
5bb506b1f872ca
  Author: Jerry Snitselaar <jsnitsel(a)redhat.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test: test_tpm2_nv.sh large_file_name and large_file_read_name should be =
different

Currently both are set as nv.test_large_w, so the cmp -s after the redirect=
 tests
will be comparing nv.test_large_w to itself. Change large_file_read_name to
nv.test_large_r.

Signed-off-by: Jerry Snitselaar <jsnitsel(a)redhat.com>
Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fb0edff055301769d0bdc3616d5feba7e9c277d4
      https://github.com/intel/tpm2-tools/commit/fb0edff055301769d0bdc3616d=
5feba7e9c277d4
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test_tpm2_nv.sh: whitespace fix

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ab1a2d468c4b2ac09a0ac651563653f36a73215f
      https://github.com/intel/tpm2-tools/commit/ab1a2d468c4b2ac09a0ac65156=
3653f36a73215f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: fix buffer overflow

As reported by clang asan:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D435=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on address 0x=
7ffe036c0902 at pc 0x0000004a326d bp 0x7ffe036c02f0 sp 0x7ffe036bfaa0
WRITE of size 2048 at 0x7ffe036c0902 thread T0
    #0 0x4a326c in __asan_memcpy (/home/wcrobert/workspace/tpm2-tools/tools=
/tpm2_nvwrite+0x4a326c)
    #1 0x4e887b in nv_write /home/wcrobert/workspace/tpm2-tools/tools/tpm2_=
nvwrite.c:129:9
    #2 0x4e82c4 in tpm2_tool_onrun /home/wcrobert/workspace/tpm2-tools/tool=
s/tpm2_nvwrite.c:316:11
    #3 0x4e90d9 in main /home/wcrobert/workspace/tpm2-tools/tools/tpm2_tool=
.c:150:11
    #4 0x7fdfc968d82f in __libc_start_main /build/glibc-bfm8X4/glibc-2.23/c=
su/../csu/libc-start.c:291
    #5 0x4195c8 in _start (/home/wcrobert/workspace/tpm2-tools/tools/tpm2_n=
vwrite+0x4195c8)

Address 0x7ffe036c0902 is located in stack of thread T0 at offset 1538 in f=
rame
    #0 0x4e846f in nv_write /home/wcrobert/workspace/tpm2-tools/tools/tpm2_=
nvwrite.c:76

  This frame has 8 object(s):
    [32, 172) 'session_data_out'
    [240, 256) 'sessions_data'
    [272, 288) 'sessions_data_out'
    [304, 312) 'session_data_array'
    [336, 344) 'session_data_out_array'
    [368, 452) 'nv_public'
    [496, 500) 'max_data_size'
    [512, 1538) 'nv_write_data' <=3D=3D Memory access at offset 1538 overfl=
ows this variable
HINT: this may be a false positive if your program uses some custom stack u=
nwind mechanism or swapcontext
      (longjmp and C++ exceptions *are* supported)
SUMMARY: AddressSanitizer: stack-buffer-overflow (/home/wcrobert/workspace/=
tpm2-tools/tools/tpm2_nvwrite+0x4a326c) in __asan_memcpy
Shadow bytes around the buggy address:
  0x1000406d00d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x1000406d00e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x1000406d00f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x1000406d0100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x1000406d0110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=3D>0x1000406d0120:[02]f3 f3 f3 f3 f3 f3 f3 f3 f3 f3 f3 f3 f3 f3 f3
  0x1000406d0130: f3 f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
  0x1000406d0140: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
  0x1000406d0150: 00 00 00 00 00 00 00 00 02 f2 f2 f2 f2 f2 00 f3
  0x1000406d0160: f3 f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
  0x1000406d0170: 00 00 00 00 f1 f1 f1 f1 00 f2 f2 f2 01 f2 00 f3
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Container overflow:      fc
  Array cookie:            ac
  Intra object redzone:    bb
  ASan internal:           fe
  Left alloca redzone:     ca
  Right alloca redzone:    cb
=3D=3D435=3D=3DABORTING

Fix by using the max buffer's size field, not the loaded from
file buffers size field.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/b713ec836104...ab1a2d4=
68c4b

--===============8332894782687943723==--

