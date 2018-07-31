Content-Type: multipart/mixed; boundary="===============4912776517505578377=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] tpm2-tss and buildroot compilation error
Date: Tue, 31 Jul 2018 13:23:10 -0700
Message-ID: <61ea56be-35d9-a33b-e606-5bfec8782069@intel.com>
In-Reply-To: 1d52f25f-7417-637d-4302-59e042e45ba0@mikronika.pl
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4912776517505578377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/26/2018 02:50 AM, Tomasz Przybysz wrote:
> When I disable buildroot option:
> make menuconfig
> Build options ---> Advanced
> [ ] paranoid check of library/header paths
> =

> compilation finishes correct, but default option for buildroot is paranoi=
d check of library/header paths enabled.
> In my opinion it's not good idea to disable it.

Are you building TSS as a br2-external module? I was able to build it as a =
project-specific package
under package/tpm2-tss and it built fine for me using one of the default co=
nfigs for raspberryPi3.
It was with the paranoid check of library/header paths enabled.Nothing spec=
ial in my .mk file. Here is the build log:
-----
tpm2-tss-2.0.0.tar.gz: OK (sha1: 761801d46ed538949a418844a33603500e637433)
tpm2-tss-2.0.0.tar.gz: OK (md5: 048ea77be36f881b7b6ecefbc1cf7dbd)
>>> tpm2-tss 2.0.0 Extracting
gzip -d -c /home/tstruk/buildroot/buildroot-2018.02.4/dl/tpm2-tss-2.0.0.tar=
.gz | /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/tar --stri=
p-components=3D1 -C /home/tstruk/buildroot/buildroot-2018.02.4/output/build=
/tpm2-tss-2.0.0   -xf -
gzip: warning: GZIP environment variable is deprecated; use an alias or scr=
ipt
>>> tpm2-tss 2.0.0 Patching
>>> tpm2-tss 2.0.0 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find /home/tstruk/buildr=
oot/buildroot-2018.02.4/output/build/tpm2-tss-2.0.0 -name $file); do cp sup=
port/gnuconfig/$file $i; done; done
>>> tpm2-tss 2.0.0 Patching libtool
patching file /home/tstruk/buildroot/buildroot-2018.02.4/output/build/tpm2-=
tss-2.0.0/ltmain.sh
Hunk #1 succeeded at 2694 (offset 7 lines).
Hunk #2 succeeded at 4284 (offset 7 lines).
Hunk #3 succeeded at 6579 (offset 25 lines).
Hunk #4 succeeded at 6589 (offset 25 lines).
Hunk #5 succeeded at 6882 (offset 25 lines).
Hunk #6 succeeded at 7174 (offset 25 lines).
Hunk #7 succeeded at 8146 (offset 34 lines).
Hunk #8 succeeded at 10778 (offset 68 lines).
>>> tpm2-tss 2.0.0 Configuring
(cd /home/tstruk/buildroot/buildroot-2018.02.4/output/build/tpm2-tss-2.0.0/=
 && rm -rf config.cache && PATH=3D"/home/tstruk/buildroot/buildroot-2018.02=
.4/output/host/bin:/home/tstruk/buildroot/buildroot-2018.02.4/output/host/s=
bin:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/u=
sr/local/sbin:/usr/sbin:/home/tstruk/.local/bin:/home/tstruk/bin" AR=3D"/ho=
me/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux=
-uclibcgnueabihf-ar" AS=3D"/home/tstruk/buildroot/buildroot-2018.02.4/outpu=
t/host/bin/arm-buildroot-linux-uclibcgnueabihf-as" LD=3D"/home/tstruk/build=
root/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabih=
f-ld" NM=3D"/home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm-=
buildroot-linux-uclibcgnueabihf-nm" CC=3D"/home/tstruk/buildroot/buildroot-=
2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc" GCC=3D"/=
home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm-buildroot-lin=
ux-uclibcgnueabihf-gcc" CPP=3D"/home/tstruk/buildroot/buildroot-2018.02.4/o=
utput/host/bin/arm-buildroot-linux-uclibcgnueabihf-cpp" CXX=3D"/home/tstruk=
/buildroot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgn=
ueabihf-g++" FC=3D"/home/tstruk/buildroot/buildroot-2018.02.4/output/host/b=
in/arm-buildroot-linux-uclibcgnueabihf-gfortran" F77=3D"/home/tstruk/buildr=
oot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabihf=
-gfortran" RANLIB=3D"/home/tstruk/buildroot/buildroot-2018.02.4/output/host=
/bin/arm-buildroot-linux-uclibcgnueabihf-ranlib" READELF=3D"/home/tstruk/bu=
ildroot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnuea=
bihf-readelf" STRIP=3D"/home/tstruk/buildroot/buildroot-2018.02.4/output/ho=
st/bin/arm-buildroot-linux-uclibcgnueabihf-strip" OBJCOPY=3D"/home/tstruk/b=
uildroot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnue=
abihf-objcopy" OBJDUMP=3D"/home/tstruk/buildroot/buildroot-2018.02.4/output=
/host/bin/arm-buildroot-linux-uclibcgnueabihf-objdump" AR_FOR_BUILD=3D"/usr=
/bin/ar" AS_FOR_BUILD=3D"/usr/bin/as" CC_FOR_BUILD=3D"/usr/lib64/ccache/gcc=
" GCC_FOR_BUILD=3D"/usr/lib64/ccache/gcc" CXX_FOR_BUILD=3D"/usr/lib64/ccach=
e/g++" LD_FOR_BUILD=3D"/usr/bin/ld" CPPFLAGS_FOR_BUILD=3D"-I/home/tstruk/bu=
ildroot/buildroot-2018.02.4/output/host/include" CFLAGS_FOR_BUILD=3D"-O2 -I=
/home/tstruk/buildroot/buildroot-2018.02.4/output/host/include" CXXFLAGS_FO=
R_BUILD=3D"-O2 -I/home/tstruk/buildroot/buildroot-2018.02.4/output/host/inc=
lude" LDFLAGS_FOR_BUILD=3D"-L/home/tstruk/buildroot/buildroot-2018.02.4/out=
put/host/lib -Wl,-rpath,/home/tstruk/buildroot/buildroot-2018.02.4/output/h=
ost/lib" FCFLAGS_FOR_BUILD=3D"" DEFAULT_ASSEMBLER=3D"/home/tstruk/buildroot=
/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-as=
" DEFAULT_LINKER=3D"/home/tstruk/buildroot/buildroot-2018.02.4/output/host/=
bin/arm-buildroot-linux-uclibcgnueabihf-ld" CPPFLAGS=3D"-D_LARGEFILE_SOURCE=
 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64" CFLAGS=3D"-D_LARGEFILE_SOU=
RCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -Os " CXXFLAGS=3D"-D_LA=
RGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -Os " LDFLAG=
S=3D"" FCFLAGS=3D" -Os " FFLAGS=3D" -Os " PKG_CONFIG=3D"/home/tstruk/buildr=
oot/buildroot-2018.02.4/output/host/bin/pkg-config" STAGING_DIR=3D"/home/ts=
truk/buildroot/buildroot-2018.02.4/output/host/arm-buildroot-linux-uclibcgn=
ueabihf/sysroot" INTLTOOL_PERL=3D/usr/bin/perl ac_cv_lbl_unaligned_fail=3Dy=
es ac_cv_func_mmap_fixed_mapped=3Dyes ac_cv_func_memcmp_working=3Dyes ac_cv=
_have_decl_malloc=3Dyes gl_cv_func_malloc_0_nonnull=3Dyes ac_cv_func_malloc=
_0_nonnull=3Dyes ac_cv_func_calloc_0_nonnull=3Dyes ac_cv_func_realloc_0_non=
null=3Dyes lt_cv_sys_lib_search_path_spec=3D"" ac_cv_c_bigendian=3Dno   CON=
FIG_SITE=3D/dev/null ./configure --target=3Darm-buildroot-linux-uclibcgnuea=
bihf --host=3Darm-buildroot-linux-uclibcgnueabihf --build=3Dx86_64-pc-linux=
-gnu --prefix=3D/usr --exec-prefix=3D/usr --sysconfdir=3D/etc --localstated=
ir=3D/var --program-prefix=3D"" --disable-gtk-doc --disable-gtk-doc-html --=
disable-doc --disable-docs --disable-documentation --with-xmlto=3Dno --with=
-fop=3Dno --disable-dependency-tracking --enable-ipv6 --disable-nls --disab=
le-static --enable-shared  --enable-esapi=3Dno  --with-crypto=3Dossl --disa=
ble-doxygen-doc --disable-doxygen-man --disable-doxygen-html --enable-stati=
c=3Dno )
checking for arm-buildroot-linux-uclibcgnueabihf-gcc... /home/tstruk/buildr=
oot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabihf=
-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... =

checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin=
/arm-buildroot-linux-uclibcgnueabihf-gcc accepts -g... yes
checking for /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm=
-buildroot-linux-uclibcgnueabihf-gcc option to accept ISO C89... none needed
checking whether /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin=
/arm-buildroot-linux-uclibcgnueabihf-gcc understands -c and -o together... =
yes
checking build system type... x86_64-pc-linux-gnu
checking host system type... arm-buildroot-linux-uclibcgnueabihf
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for fgrep... /usr/bin/grep -F
checking for ld used by /home/tstruk/buildroot/buildroot-2018.02.4/output/h=
ost/bin/arm-buildroot-linux-uclibcgnueabihf-gcc... /home/tstruk/buildroot/b=
uildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld
checking if the linker (/home/tstruk/buildroot/buildroot-2018.02.4/output/h=
ost/bin/arm-buildroot-linux-uclibcgnueabihf-ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /home/tstruk/buildro=
ot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-=
nm
checking the name lister (/home/tstruk/buildroot/buildroot-2018.02.4/output=
/host/bin/arm-buildroot-linux-uclibcgnueabihf-nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to arm-buildroot-lin=
ux-uclibcgnueabihf format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format.=
.. func_convert_file_noop
checking for /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm=
-buildroot-linux-uclibcgnueabihf-ld option to reload object files... -r
checking for arm-buildroot-linux-uclibcgnueabihf-objdump... /home/tstruk/bu=
ildroot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnuea=
bihf-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-buildroot-linux-uclibcgnueabihf-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for arm-buildroot-linux-uclibcgnueabihf-ar... /home/tstruk/buildro=
ot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-=
ar
checking for archiver @FILE support... @
checking for arm-buildroot-linux-uclibcgnueabihf-strip... /home/tstruk/buil=
droot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabi=
hf-strip
checking for arm-buildroot-linux-uclibcgnueabihf-ranlib... /home/tstruk/bui=
ldroot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueab=
ihf-ranlib
checking for gawk... gawk
checking command to parse /home/tstruk/buildroot/buildroot-2018.02.4/output=
/host/bin/arm-buildroot-linux-uclibcgnueabihf-nm output from /home/tstruk/b=
uildroot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnue=
abihf-gcc object... ok
checking for sysroot... no
checking for a working dd... /usr/bin/dd
checking how to truncate binary pipes... /usr/bin/dd bs=3D4096 count=3D1
checking for arm-buildroot-linux-uclibcgnueabihf-mt... no
checking for mt... no
checking if : is a manifest tool... no
checking how to run the C preprocessor... /home/tstruk/buildroot/buildroot-=
2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-cpp
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm-=
buildroot-linux-uclibcgnueabihf-gcc supports -fno-rtti -fno-exceptions... no
checking for /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm=
-buildroot-linux-uclibcgnueabihf-gcc option to produce PIC... -fPIC -DPIC
checking if /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm-=
buildroot-linux-uclibcgnueabihf-gcc PIC flag -fPIC -DPIC works... yes
checking if /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm-=
buildroot-linux-uclibcgnueabihf-gcc static flag -static works... yes
checking if /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm-=
buildroot-linux-uclibcgnueabihf-gcc supports -c -o file.o... yes
checking if /home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/arm-=
buildroot-linux-uclibcgnueabihf-gcc supports -c -o file.o... (cached) yes
checking whether the /home/tstruk/buildroot/buildroot-2018.02.4/output/host=
/bin/arm-buildroot-linux-uclibcgnueabihf-gcc linker (/home/tstruk/buildroot=
/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld=
) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-buildroot-linux-uclibcgnueabihf-strip... (cached) /home/ts=
truk/buildroot/buildroot-2018.02.4/output/host/bin/arm-buildroot-linux-ucli=
bcgnueabihf-strip
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking whether make sets $(MAKE)... yes
checking for style of include used by make... GNU
checking whether make supports nested variables... yes
checking dependency style of /home/tstruk/buildroot/buildroot-2018.02.4/out=
put/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc... none
checking whether make supports nested variables... (cached) yes
checking pkg-config is at least version 0.9.0... ./configure: line 12287: /=
home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin/pkg-config: No su=
ch file or directory
no
checking if LD -Wl,--version-script works... yes
checking whether C compiler accepts -std=3Dc99... yes
checking whether C compiler accepts -Wall... yes
checking whether C compiler accepts -Wextra... yes
checking whether C compiler accepts -Wformat-security... yes
checking whether C compiler accepts -Werror... yes
checking whether C compiler accepts -fstack-protector-all... yes
checking whether C compiler accepts -fpic... yes
checking whether C compiler accepts -fPIC... yes
checking whether C preprocessor accepts -D_DEFAULT_SOURCE... yes
checking whether C preprocessor accepts -D_BSD_SOURCE... yes
checking whether C preprocessor accepts -D_POSIX_SOURCE... yes
checking whether C preprocessor accepts -U_FORTIFY_SOURCE... yes
checking whether C preprocessor accepts -D_FORTIFY_SOURCE=3D2... yes
checking whether C compiler accepts -g -O2... yes
checking whether the linker accepts -Wl,--no-undefined... yes
checking whether the linker accepts -Wl,-z,noexecstack... yes
checking whether the linker accepts -Wl,-z,now... yes
checking whether the linker accepts -Wl,-z,relro... yes
checking whether C compiler accepts -Wno-missing-braces... yes
checking whether to build with code coverage support... no
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating Doxyfile
config.status: executing libtool commands
config.status: executing depfiles commands
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-=
doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xm=
lto, --with-fop, --enable-ipv6, --disable-nls, --with-crypto

    tpm2-tss 2.0.0
    esapi:              no
    tctidefaultmodule:  =

    tctidefaultconfig:  =

    unit:               no
    debug:              no
    simulatorbin:       =

    maxloglevel:        trace
    doxygen:            0 no

>>> tpm2-tss 2.0.0 Building
PATH=3D"/home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin:/home/ts=
truk/buildroot/buildroot-2018.02.4/output/host/sbin:/usr/lib64/qt-3.3/bin:/=
usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/ho=
me/tstruk/.local/bin:/home/tstruk/bin"  /usr/bin/make -j8  -C /home/tstruk/=
buildroot/buildroot-2018.02.4/output/build/tpm2-tss-2.0.0/
  GEN      man/man3/Tss2_Tcti_Device_Init.3
  GEN      man/man3/Tss2_Tcti_Mssim_Init.3
  GEN      man/man7/tss2-tcti-device.7
  GEN      man/man7/tss2-tcti-mssim.7
  GEN      lib/tss2-mu.pc
  GEN      lib/tss2-tcti-device.pc
  GEN      lib/tss2-tcti-mssim.pc
  GEN      lib/tss2-sys.pc
  CC       src/tss2-mu/base-types.lo
  CC       src/tss2-mu/tpm2b-types.lo
  CC       src/tss2-mu/tpma-types.lo
  CC       src/tss2-mu/tpml-types.lo
  CC       src/tss2-mu/tpmu-types.lo
  CC       src/util/libutil_la-io.lo
  CC       src/tss2-mu/tpms-types.lo
  CC       src/tss2-mu/tpmt-types.lo
  CC       src/util/libutil_la-key-value-parse.lo
  CC       src/util/libutil_la-log.lo
  CC       src/tss2-tcti/src_tss2_tcti_libtss2_tcti_device_la-tcti-common.lo
  CC       src/tss2-tcti/src_tss2_tcti_libtss2_tcti_device_la-tcti-device.lo
  CC       src/tss2-tcti/src_tss2_tcti_libtss2_tcti_mssim_la-tcti-common.lo
  CC       src/tss2-tcti/src_tss2_tcti_libtss2_tcti_mssim_la-tcti-mssim.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_AC_GetCapa=
bility.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_AC_Send.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ActivateCr=
edential.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Certify.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_CertifyCre=
ation.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ChangeEPS.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ChangePPS.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Clear.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ClearContr=
ol.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ClockRateA=
djust.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ClockSet.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Commit.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ContextLoa=
d.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ContextSav=
e.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Create.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_CreateLoad=
ed.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_CreatePrim=
ary.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Dictionary=
AttackLockReset.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Dictionary=
AttackParameters.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Duplicate.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ECC_Parame=
ters.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ECDH_KeyGe=
n.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ECDH_ZGen.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_EC_Ephemer=
al.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_EncryptDec=
rypt.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_EncryptDec=
rypt2.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_EventSeque=
nceComplete.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_EvictContr=
ol.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Execute.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_FieldUpgra=
deData.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_FieldUpgra=
deStart.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Finalize.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_FirmwareRe=
ad.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_FlushConte=
xt.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetCapabil=
ity.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetCommand=
AuditDigest.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetCommand=
Code.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetContext=
Size.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetCpBuffe=
r.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetDecrypt=
Param.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetEncrypt=
Param.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetRandom.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetRpBuffe=
r.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetRspAuth=
s.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetSession=
AuditDigest.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetTctiCon=
text.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetTestRes=
ult.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_GetTime.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_HMAC.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_HMAC_Start=
.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Hash.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_HashSequen=
ceStart.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_HierarchyC=
hangeAuth.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_HierarchyC=
ontrol.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Import.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Incrementa=
lSelfTest.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Initialize=
.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Load.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_LoadExtern=
al.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_MakeCreden=
tial.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_Certify=
.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_ChangeA=
uth.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_DefineS=
pace.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_Extend.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_GlobalW=
riteLock.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_Increme=
nt.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_Read.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_ReadLoc=
k.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_ReadPub=
lic.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_SetBits=
.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_Undefin=
eSpace.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_Undefin=
eSpaceSpecial.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_Write.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_NV_WriteLo=
ck.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ObjectChan=
geAuth.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PCR_Alloca=
te.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PCR_Event.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PCR_Extend=
.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PCR_Read.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PCR_Reset.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PCR_SetAut=
hPolicy.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PCR_SetAut=
hValue.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PP_Command=
s.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyAuth=
Value.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyAuth=
orize.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyAuth=
orizeNV.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyComm=
andCode.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyCoun=
terTimer.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyCpHa=
sh.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyDupl=
icationSelect.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyGetD=
igest.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyLoca=
lity.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyNV.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyNvWr=
itten.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyName=
Hash.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyOR.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyPCR.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyPass=
word.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyPhys=
icalPresence.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyRest=
art.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicySecr=
et.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicySign=
ed.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyTemp=
late.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_PolicyTick=
et.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Policy_AC_=
SendSelect.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Quote.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_RSA_Decryp=
t.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_RSA_Encryp=
t.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ReadClock.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ReadPublic=
.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Rewrap.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_SelfTest.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_SequenceCo=
mplete.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_SequenceUp=
date.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_SetAlgorit=
hmSet.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_SetCmdAuth=
s.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_SetCommand=
CodeAuditStatus.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_SetDecrypt=
Param.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_SetEncrypt=
Param.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_SetPrimary=
Policy.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Shutdown.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Sign.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_StartAuthS=
ession.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Startup.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_StirRandom=
.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_TestParms.=
lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Unseal.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_Vendor_TCG=
_Test.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_VerifySign=
ature.lo
  CC       src/tss2-sys/api/src_tss2_sys_libtss2_sys_la-Tss2_Sys_ZGen_2Phas=
e.lo
  CC       src/tss2-sys/src_tss2_sys_libtss2_sys_la-sysapi_util.lo
  CCLD     libutil.la
  CCLD     src/tss2-mu/libtss2-mu.la
  CCLD     src/tss2-tcti/libtss2-tcti-device.la
  CCLD     src/tss2-tcti/libtss2-tcti-mssim.la
  CCLD     src/tss2-sys/libtss2-sys.la
>>> tpm2-tss 2.0.0 Installing to target
PATH=3D"/home/tstruk/buildroot/buildroot-2018.02.4/output/host/bin:/home/ts=
truk/buildroot/buildroot-2018.02.4/output/host/sbin:/usr/lib64/qt-3.3/bin:/=
usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/ho=
me/tstruk/.local/bin:/home/tstruk/bin"  /usr/bin/make -j8 DESTDIR=3D/home/t=
struk/buildroot/buildroot-2018.02.4/output/target install -C /home/tstruk/b=
uildroot/buildroot-2018.02.4/output/build/tpm2-tss-2.0.0/
 /usr/bin/mkdir -p '/home/tstruk/buildroot/buildroot-2018.02.4/output/targe=
t/usr/lib'
 /usr/bin/mkdir -p '/home/tstruk/buildroot/buildroot-2018.02.4/output/targe=
t/usr/share/man/man3'
 /bin/sh ./libtool   --mode=3Dinstall /usr/bin/install -c   src/tss2-mu/lib=
tss2-mu.la src/tss2-tcti/libtss2-tcti-device.la src/tss2-tcti/libtss2-tcti-=
mssim.la src/tss2-sys/libtss2-sys.la '/home/tstruk/buildroot/buildroot-2018=
.02.4/output/target/usr/lib'
 /usr/bin/mkdir -p '/home/tstruk/buildroot/buildroot-2018.02.4/output/targe=
t/usr/lib/pkgconfig'
 /usr/bin/mkdir -p '/home/tstruk/buildroot/buildroot-2018.02.4/output/targe=
t/usr/include/tss2'
 /usr/bin/mkdir -p '/home/tstruk/buildroot/buildroot-2018.02.4/output/targe=
t/usr/lib/udev/rules.d'
 /usr/bin/mkdir -p '/home/tstruk/buildroot/buildroot-2018.02.4/output/targe=
t/usr/share/man/man7'
 /usr/bin/install -c -m 644 dist/tpm-udev.rules '/home/tstruk/buildroot/bui=
ldroot-2018.02.4/output/target/usr/lib/udev/rules.d'
 /usr/bin/install -c -m 644 lib/tss2-mu.pc lib/tss2-tcti-device.pc lib/tss2=
-tcti-mssim.pc lib/tss2-sys.pc '/home/tstruk/buildroot/buildroot-2018.02.4/=
output/target/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 man/man3/Tss2_Tcti_Device_Init.3 man/man3/Tss2_=
Tcti_Mssim_Init.3 '/home/tstruk/buildroot/buildroot-2018.02.4/output/target=
/usr/share/man/man3'
 /usr/bin/install -c -m 644 ./include/tss2/tss2_common.h ./include/tss2/tss=
2_tcti.h ./include/tss2/tss2_tpm2_types.h ./include/tss2/tss2_mu.h ./includ=
e/tss2/tss2_tcti_device.h ./include/tss2/tss2_tcti_mssim.h ./include/tss2/t=
ss2_sys.h '/home/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/inc=
lude/tss2'
 /usr/bin/install -c -m 644 man/man7/tss2-tcti-device.7 man/man7/tss2-tcti-=
mssim.7 '/home/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/share=
/man/man7'
/usr/bin/make  install-data-hook
make[4]: Nothing to be done for 'install-data-hook'.
libtool: install: /usr/bin/install -c src/tss2-mu/.libs/libtss2-mu.so.0.0.0=
 /home/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/lib/libtss2-m=
u.so.0.0.0
libtool: install: (cd /home/tstruk/buildroot/buildroot-2018.02.4/output/tar=
get/usr/lib && { ln -s -f libtss2-mu.so.0.0.0 libtss2-mu.so.0 || { rm -f li=
btss2-mu.so.0 && ln -s libtss2-mu.so.0.0.0 libtss2-mu.so.0; }; })
libtool: install: (cd /home/tstruk/buildroot/buildroot-2018.02.4/output/tar=
get/usr/lib && { ln -s -f libtss2-mu.so.0.0.0 libtss2-mu.so || { rm -f libt=
ss2-mu.so && ln -s libtss2-mu.so.0.0.0 libtss2-mu.so; }; })
libtool: install: /usr/bin/install -c src/tss2-mu/.libs/libtss2-mu.lai /hom=
e/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/lib/libtss2-mu.la
libtool: install: /usr/bin/install -c src/tss2-tcti/.libs/libtss2-tcti-devi=
ce.so.0.0.0 /home/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/li=
b/libtss2-tcti-device.so.0.0.0
libtool: install: (cd /home/tstruk/buildroot/buildroot-2018.02.4/output/tar=
get/usr/lib && { ln -s -f libtss2-tcti-device.so.0.0.0 libtss2-tcti-device.=
so.0 || { rm -f libtss2-tcti-device.so.0 && ln -s libtss2-tcti-device.so.0.=
0.0 libtss2-tcti-device.so.0; }; })
libtool: install: (cd /home/tstruk/buildroot/buildroot-2018.02.4/output/tar=
get/usr/lib && { ln -s -f libtss2-tcti-device.so.0.0.0 libtss2-tcti-device.=
so || { rm -f libtss2-tcti-device.so && ln -s libtss2-tcti-device.so.0.0.0 =
libtss2-tcti-device.so; }; })
libtool: install: /usr/bin/install -c src/tss2-tcti/.libs/libtss2-tcti-devi=
ce.lai /home/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/lib/lib=
tss2-tcti-device.la
libtool: install: /usr/bin/install -c src/tss2-tcti/.libs/libtss2-tcti-mssi=
m.so.0.0.0 /home/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/lib=
/libtss2-tcti-mssim.so.0.0.0
libtool: install: (cd /home/tstruk/buildroot/buildroot-2018.02.4/output/tar=
get/usr/lib && { ln -s -f libtss2-tcti-mssim.so.0.0.0 libtss2-tcti-mssim.so=
.0 || { rm -f libtss2-tcti-mssim.so.0 && ln -s libtss2-tcti-mssim.so.0.0.0 =
libtss2-tcti-mssim.so.0; }; })
libtool: install: (cd /home/tstruk/buildroot/buildroot-2018.02.4/output/tar=
get/usr/lib && { ln -s -f libtss2-tcti-mssim.so.0.0.0 libtss2-tcti-mssim.so=
 || { rm -f libtss2-tcti-mssim.so && ln -s libtss2-tcti-mssim.so.0.0.0 libt=
ss2-tcti-mssim.so; }; })
libtool: install: /usr/bin/install -c src/tss2-tcti/.libs/libtss2-tcti-mssi=
m.lai /home/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/lib/libt=
ss2-tcti-mssim.la
libtool: install: /usr/bin/install -c src/tss2-sys/.libs/libtss2-sys.so.0.0=
.0 /home/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/lib/libtss2=
-sys.so.0.0.0
libtool: install: (cd /home/tstruk/buildroot/buildroot-2018.02.4/output/tar=
get/usr/lib && { ln -s -f libtss2-sys.so.0.0.0 libtss2-sys.so.0 || { rm -f =
libtss2-sys.so.0 && ln -s libtss2-sys.so.0.0.0 libtss2-sys.so.0; }; })
libtool: install: (cd /home/tstruk/buildroot/buildroot-2018.02.4/output/tar=
get/usr/lib && { ln -s -f libtss2-sys.so.0.0.0 libtss2-sys.so || { rm -f li=
btss2-sys.so && ln -s libtss2-sys.so.0.0.0 libtss2-sys.so; }; })
libtool: install: /usr/bin/install -c src/tss2-sys/.libs/libtss2-sys.lai /h=
ome/tstruk/buildroot/buildroot-2018.02.4/output/target/usr/lib/libtss2-sys.=
la
libtool: warning: remember to run 'libtool --finish /usr/lib'
[buildroot-2018.02.4]$

--===============4912776517505578377==--

