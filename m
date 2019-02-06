Content-Type: multipart/mixed; boundary="===============6499364879120052755=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: Re: [tpm2] tpm2-abrmd in a container
Date: Wed, 06 Feb 2019 07:50:25 +0000
Message-ID: <CAKrSGQQ_vx3VbpSMoWbUTttJxV1n6gxzc8JHPnQi0FY8dPRVpQ@mail.gmail.com>
In-Reply-To: 82fd3a60-780f-ceaf-8ced-cd2b01f55b9e@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6499364879120052755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Feb 2019, 00:43 Javier Martinez Canillas <javierm(a)redhat.com
wrote:

> Hello Luke,
>
> On 2/5/19 4:40 PM, Luke Hinds wrote:
>
> [snip]
>
> > Almost have this working now or perhaps getting warmer. I am now looking
> > for some advice on what values and arguments I should be using to make
> sure
> > connectivity goes from tpm2-tools > tpm2-abrmd > tpm2 mssim
> >
> > Within my container I run:
> >
> > mkdir -p /var/run/dbus/
> > dbus-daemon --fork --system
> >
> > start the simulator:
> >
> > tpm_server &
> > [1] 24
> > [root(a)a2d41fb37bb3 src]# TPM command server listening on port 2321
> > Platform server listening on port 2322
> >
> > If I now run:
> >
> > [root(a)a2d41fb37bb3 src]# /usr/local/sbin/tpm2-abrmd --allow-root
> > --tcti=3Dmssim &
> >
> > I can see an active bus:
> >
> > [root(a)a2d41fb37bb3 src]# dbus-send --system --dest=3Dorg.freedesktop.=
DBus
> > --type=3Dmethod_call --print-reply /org/freedesktop/DBus
> > org.freedesktop.DBus.ListNames
> > method return time=3D1549380992.829764 sender=3Dorg.freedesktop.DBus ->
> > destination=3D:1.7 serial=3D3 reply_serial=3D2
> >    array [
> >       string "org.freedesktop.DBus"
> >       string ":1.7"
> >       string "com.intel.tss2.Tabrmd"
> >       string ":1.6"
> >    ]
> >
> >
> > [root(a)a2d41fb37bb3 src]# dbus-send --system --dest=3Dcom.intel.tss2.T=
abrmd
> > --type=3Dmethod_call --print-reply /com/intel/tss2/Tabrmd/Tcti
> > org.freedesktop.DBus.Introspectable.Introspect
> > method return time=3D1549381010.989948 sender=3D:1.6 -> destination=3D:=
1.8
> > serial=3D7 reply_serial=3D2
> >    string "<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object
> > Introspection 1.0//EN"
> >                       "
> > http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
> > <!-- GDBus 2.58.3 -->
> > <node>
> >   <interface name=3D"org.freedesktop.DBus.Properties">
> >     <method name=3D"Get">
> >       <arg type=3D"s" name=3D"interface_name" direction=3D"in"/>
> >       <arg type=3D"s" name=3D"property_name" direction=3D"in"/>
> >       <arg type=3D"v" name=3D"value" direction=3D"out"/>
> >     </method>
> >     <method name=3D"GetAll">
> >       <arg type=3D"s" name=3D"interface_name" direction=3D"in"/>
> >       <arg type=3D"a{sv}" name=3D"properties" direction=3D"out"/>
> >     </method>
> >     <method name=3D"Set">
> >       <arg type=3D"s" name=3D"interface_name" direction=3D"in"/>
> >       <arg type=3D"s" name=3D"property_name" direction=3D"in"/>
> >       <arg type=3D"v" name=3D"value" direction=3D"in"/>
> >     </method>
> >     <signal name=3D"PropertiesChanged">
> >       <arg type=3D"s" name=3D"interface_name"/>
> >       <arg type=3D"a{sv}" name=3D"changed_properties"/>
> >       <arg type=3D"as" name=3D"invalidated_properties"/>
> >     </signal>
> >   </interface>
> >   <interface name=3D"org.freedesktop.DBus.Introspectable">
> >     <method name=3D"Introspect">
> >       <arg type=3D"s" name=3D"xml_data" direction=3D"out"/>
> >     </method>
> >   </interface>
> >   <interface name=3D"org.freedesktop.DBus.Peer">
> >     <method name=3D"Ping"/>
> >     <method name=3D"GetMachineId">
> >       <arg type=3D"s" name=3D"machine_uuid" direction=3D"out"/>
> >     </method>
> >   </interface>
> >   <interface name=3D"com.intel.tss2.TctiTabrmd">
> >     <method name=3D"CreateConnection">
> >       <arg type=3D"ah" name=3D"fds" direction=3D"out"/>
> >       <arg type=3D"t" name=3D"id" direction=3D"out"/>
> >     </method>
> >     <method name=3D"Cancel">
> >       <arg type=3D"t" name=3D"id" direction=3D"in"/>
> >       <arg type=3D"u" name=3D"return_code" direction=3D"out"/>
> >     </method>
> >     <method name=3D"SetLocality">
> >       <arg type=3D"t" name=3D"id" direction=3D"in"/>
> >       <arg type=3D"y" name=3D"locality" direction=3D"in"/>
> >       <arg type=3D"u" name=3D"return_code" direction=3D"out"/>
> >     </method>
> >   </interface>
> > </node>
> >
>
> I believe the tpm2-abmrd + MSFT simulator part is correct.
>
> > The part I am now not sure of, is how to configure TPM2TOOLS_TCTI and
> what
> > args should be used for the RM.
> >
> > As it is, its expected with TPM2TOOLS_TCTI undeclared  :
> >
> > [root(a)a2d41fb37bb3 src]# tpm2_pcrlist
> > ERROR:tcti:src/tss2-tcti/tcti-device.c:399:Tss2_Tcti_Device_Init() Fail=
ed
> > to open device file /dev/tpm0: No such file or directory
> > ERROR: tcti init allocation routine failed for library: "device" option=
s:
> > "(null)"
> > ERROR: Could not load tcti, got: "device"
> >
> > I have then tried different variations:
> >
> > export TPM2TOOLS_TCTI=3D"mssim:host=3Dlocalhost,port=3D2321"
> > export TPM2TOOLS_TCTI=3D"mssim:port=3D2321"
> > export TPM2TOOLS_TCTI=3D"mssim:tcp://127.0.0.1:2321"
> >
> > I am guessing this would be wrong though? I don't want the tools
> connecting
> > to the mssim, I want them connecting to the resource manager.
> >
>
> That's correct. You have to use the abrmd TCTI since the tools don't care
> that
> the abrmd is talking to the simulator instead of a TPM device.
>
> > I should also mention, none of the above work - running `tpm2_pcrlist`
> just
> > results in the command hanging and needing a ctrl c to break out.
> >
> > [root(a)a2d41fb37bb3 src]# export
> >
> TPM2TOOLS_TCTI=3D"tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd,tabrmd:bus_type=
=3Dsession"
> > [root(a)a2d41fb37bb3 src]# tpm2_pcrlist
> > ERROR: Could not dlopen library: "tabrmd"
> > ERROR: Could not load tcti, got: "tabrmd"
> >
> > So I then tried try this:
> >
> > [root(a)a2d41fb37bb3 src]# /usr/local/sbin/tpm2-abrmd --allow-root
> > --tcti=3Dlibtss2-tcti-mssim.so &
> > [root(a)a2d41fb37bb3 src]# export TPM2TOOLS_TCTI=3D"mssim:port=3D2321"
> > [root(a)a2d41fb37bb3 src]# tpm2_pcrlist
> >
> > Unfortunately the command just hangs, needing a ctrl-c to break the
> session.
> >
> > I am aware I may be "making a pigs ear" of this, if so excuse my
> > green'ness.
> >
> > If anyone can point me towards what args I should be using for the
> > connectivity flow I outlined towards the start of this email, that would
> be
> > great!
> >
>
> What's your exact version of the tpm2-abrmd, tpm2-tss and tpm2-tools? Can
> you
> do "export =3Dall+TRACE" before executing tpm2_pcrlist to see where the
> libraries are hanging?
>

I am thinking it might have something to do with dbus now. I ran a systemd
based container with the same steps / versions. pcrlist was then returned
with no issues.

I will definitely check with TSS2_LOG set though, so we know what's
happening. I can run a privileged container for my needs (CI Tests) so
there is no security concerns, but I am sure others will in the future want
to run a limited instance.

Thanks Luke!


> > Thanks,
> >
> > Luke
> >
>
> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement
> Red Hat
>

--===============6499364879120052755==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPjxkaXY+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRp
diBkaXI9Imx0ciI+T24gV2VkLCA2IEZlYiAyMDE5LCAwMDo0MyBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgJmx0OzxhIGhyZWY9Im1haWx0bzpqYXZpZXJtQHJlZGhhdC5jb20iPmphdmllcm1AcmVk
aGF0LmNvbTwvYT4gd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3Bh
ZGRpbmctbGVmdDoxZXgiPkhlbGxvIEx1a2UsPGJyPgo8YnI+Ck9uIDIvNS8xOSA0OjQwIFBNLCBM
dWtlIEhpbmRzIHdyb3RlOjxicj4KPGJyPgpbc25pcF08YnI+Cjxicj4KJmd0OyBBbG1vc3QgaGF2
ZSB0aGlzIHdvcmtpbmcgbm93IG9yIHBlcmhhcHMgZ2V0dGluZyB3YXJtZXIuIEkgYW0gbm93IGxv
b2tpbmc8YnI+CiZndDsgZm9yIHNvbWUgYWR2aWNlIG9uIHdoYXQgdmFsdWVzIGFuZCBhcmd1bWVu
dHMgSSBzaG91bGQgYmUgdXNpbmcgdG8gbWFrZSBzdXJlPGJyPgomZ3Q7IGNvbm5lY3Rpdml0eSBn
b2VzIGZyb20gdHBtMi10b29scyAmZ3Q7IHRwbTItYWJybWQgJmd0OyB0cG0yIG1zc2ltPGJyPgom
Z3Q7IDxicj4KJmd0OyBXaXRoaW4gbXkgY29udGFpbmVyIEkgcnVuOjxicj4KJmd0OyA8YnI+CiZn
dDsgbWtkaXIgLXAgL3Zhci9ydW4vZGJ1cy88YnI+CiZndDsgZGJ1cy1kYWVtb24gLS1mb3JrIC0t
c3lzdGVtPGJyPgomZ3Q7IDxicj4KJmd0OyBzdGFydCB0aGUgc2ltdWxhdG9yOjxicj4KJmd0OyA8
YnI+CiZndDsgdHBtX3NlcnZlciAmYW1wOzxicj4KJmd0OyBbMV0gMjQ8YnI+CiZndDsgW3Jvb3RA
YTJkNDFmYjM3YmIzIHNyY10jIFRQTSBjb21tYW5kIHNlcnZlciBsaXN0ZW5pbmcgb24gcG9ydCAy
MzIxPGJyPgomZ3Q7IFBsYXRmb3JtIHNlcnZlciBsaXN0ZW5pbmcgb24gcG9ydCAyMzIyPGJyPgom
Z3Q7IDxicj4KJmd0OyBJZiBJIG5vdyBydW46PGJyPgomZ3Q7IDxicj4KJmd0OyBbcm9vdEBhMmQ0
MWZiMzdiYjMgc3JjXSMgL3Vzci9sb2NhbC9zYmluL3RwbTItYWJybWQgLS1hbGxvdy1yb290PGJy
PgomZ3Q7IC0tdGN0aT1tc3NpbSAmYW1wOzxicj4KJmd0OyA8YnI+CiZndDsgSSBjYW4gc2VlIGFu
IGFjdGl2ZSBidXM6PGJyPgomZ3Q7IDxicj4KJmd0OyBbcm9vdEBhMmQ0MWZiMzdiYjMgc3JjXSMg
ZGJ1cy1zZW5kIC0tc3lzdGVtIC0tZGVzdD1vcmcuZnJlZWRlc2t0b3AuREJ1czxicj4KJmd0OyAt
LXR5cGU9bWV0aG9kX2NhbGwgLS1wcmludC1yZXBseSAvb3JnL2ZyZWVkZXNrdG9wL0RCdXM8YnI+
CiZndDsgb3JnLmZyZWVkZXNrdG9wLkRCdXMuTGlzdE5hbWVzPGJyPgomZ3Q7IG1ldGhvZCByZXR1
cm4gdGltZT0xNTQ5MzgwOTkyLjgyOTc2NCBzZW5kZXI9b3JnLmZyZWVkZXNrdG9wLkRCdXMgLSZn
dDs8YnI+CiZndDsgZGVzdGluYXRpb249OjEuNyBzZXJpYWw9MyByZXBseV9zZXJpYWw9Mjxicj4K
Jmd0O8KgIMKgIGFycmF5IFs8YnI+CiZndDvCoCDCoCDCoCDCoHN0cmluZyAmcXVvdDtvcmcuZnJl
ZWRlc2t0b3AuREJ1cyZxdW90Ozxicj4KJmd0O8KgIMKgIMKgIMKgc3RyaW5nICZxdW90OzoxLjcm
cXVvdDs8YnI+CiZndDvCoCDCoCDCoCDCoHN0cmluZyAmcXVvdDtjb20uaW50ZWwudHNzMi5UYWJy
bWQmcXVvdDs8YnI+CiZndDvCoCDCoCDCoCDCoHN0cmluZyAmcXVvdDs6MS42JnF1b3Q7PGJyPgom
Z3Q7wqAgwqAgXTxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IFtyb290QGEyZDQxZmIzN2Ji
MyBzcmNdIyBkYnVzLXNlbmQgLS1zeXN0ZW0gLS1kZXN0PWNvbS5pbnRlbC50c3MyLlRhYnJtZDxi
cj4KJmd0OyAtLXR5cGU9bWV0aG9kX2NhbGwgLS1wcmludC1yZXBseSAvY29tL2ludGVsL3RzczIv
VGFicm1kL1RjdGk8YnI+CiZndDsgb3JnLmZyZWVkZXNrdG9wLkRCdXMuSW50cm9zcGVjdGFibGUu
SW50cm9zcGVjdDxicj4KJmd0OyBtZXRob2QgcmV0dXJuIHRpbWU9MTU0OTM4MTAxMC45ODk5NDgg
c2VuZGVyPToxLjYgLSZndDsgZGVzdGluYXRpb249OjEuODxicj4KJmd0OyBzZXJpYWw9NyByZXBs
eV9zZXJpYWw9Mjxicj4KJmd0O8KgIMKgIHN0cmluZyAmcXVvdDsmbHQ7IURPQ1RZUEUgbm9kZSBQ
VUJMSUMgJnF1b3Q7LS8vZnJlZWRlc2t0b3AvL0RURCBELUJVUyBPYmplY3Q8YnI+CiZndDsgSW50
cm9zcGVjdGlvbiAxLjAvL0VOJnF1b3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmcXVvdDs8YnI+CiZndDsgPGEgaHJlZj0iaHR0cDovL3d3dy5mcmVlZGVza3Rv
cC5vcmcvc3RhbmRhcmRzL2RidXMvMS4wL2ludHJvc3BlY3QuZHRkIiByZWw9Im5vcmVmZXJyZXIg
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3N0
YW5kYXJkcy9kYnVzLzEuMC9pbnRyb3NwZWN0LmR0ZDwvYT4mcXVvdDsmZ3Q7PGJyPgomZ3Q7ICZs
dDshLS0gR0RCdXMgMi41OC4zIC0tJmd0Ozxicj4KJmd0OyAmbHQ7bm9kZSZndDs8YnI+CiZndDvC
oCDCoCZsdDtpbnRlcmZhY2UgbmFtZT0mcXVvdDtvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0
aWVzJnF1b3Q7Jmd0Ozxicj4KJmd0O8KgIMKgIMKgJmx0O21ldGhvZCBuYW1lPSZxdW90O0dldCZx
dW90OyZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZsdDthcmcgdHlwZT0mcXVvdDtzJnF1b3Q7IG5h
bWU9JnF1b3Q7aW50ZXJmYWNlX25hbWUmcXVvdDsgZGlyZWN0aW9uPSZxdW90O2luJnF1b3Q7LyZn
dDs8YnI+CiZndDvCoCDCoCDCoCDCoCZsdDthcmcgdHlwZT0mcXVvdDtzJnF1b3Q7IG5hbWU9JnF1
b3Q7cHJvcGVydHlfbmFtZSZxdW90OyBkaXJlY3Rpb249JnF1b3Q7aW4mcXVvdDsvJmd0Ozxicj4K
Jmd0O8KgIMKgIMKgIMKgJmx0O2FyZyB0eXBlPSZxdW90O3YmcXVvdDsgbmFtZT0mcXVvdDt2YWx1
ZSZxdW90OyBkaXJlY3Rpb249JnF1b3Q7b3V0JnF1b3Q7LyZndDs8YnI+CiZndDvCoCDCoCDCoCZs
dDsvbWV0aG9kJmd0Ozxicj4KJmd0O8KgIMKgIMKgJmx0O21ldGhvZCBuYW1lPSZxdW90O0dldEFs
bCZxdW90OyZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZsdDthcmcgdHlwZT0mcXVvdDtzJnF1b3Q7
IG5hbWU9JnF1b3Q7aW50ZXJmYWNlX25hbWUmcXVvdDsgZGlyZWN0aW9uPSZxdW90O2luJnF1b3Q7
LyZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZsdDthcmcgdHlwZT0mcXVvdDthe3N2fSZxdW90OyBu
YW1lPSZxdW90O3Byb3BlcnRpZXMmcXVvdDsgZGlyZWN0aW9uPSZxdW90O291dCZxdW90Oy8mZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAmbHQ7L21ldGhvZCZndDs8YnI+CiZndDvCoCDCoCDCoCZsdDttZXRo
b2QgbmFtZT0mcXVvdDtTZXQmcXVvdDsmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmbHQ7YXJnIHR5
cGU9JnF1b3Q7cyZxdW90OyBuYW1lPSZxdW90O2ludGVyZmFjZV9uYW1lJnF1b3Q7IGRpcmVjdGlv
bj0mcXVvdDtpbiZxdW90Oy8mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmbHQ7YXJnIHR5cGU9JnF1
b3Q7cyZxdW90OyBuYW1lPSZxdW90O3Byb3BlcnR5X25hbWUmcXVvdDsgZGlyZWN0aW9uPSZxdW90
O2luJnF1b3Q7LyZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZsdDthcmcgdHlwZT0mcXVvdDt2JnF1
b3Q7IG5hbWU9JnF1b3Q7dmFsdWUmcXVvdDsgZGlyZWN0aW9uPSZxdW90O2luJnF1b3Q7LyZndDs8
YnI+CiZndDvCoCDCoCDCoCZsdDsvbWV0aG9kJmd0Ozxicj4KJmd0O8KgIMKgIMKgJmx0O3NpZ25h
bCBuYW1lPSZxdW90O1Byb3BlcnRpZXNDaGFuZ2VkJnF1b3Q7Jmd0Ozxicj4KJmd0O8KgIMKgIMKg
IMKgJmx0O2FyZyB0eXBlPSZxdW90O3MmcXVvdDsgbmFtZT0mcXVvdDtpbnRlcmZhY2VfbmFtZSZx
dW90Oy8mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmbHQ7YXJnIHR5cGU9JnF1b3Q7YXtzdn0mcXVv
dDsgbmFtZT0mcXVvdDtjaGFuZ2VkX3Byb3BlcnRpZXMmcXVvdDsvJmd0Ozxicj4KJmd0O8KgIMKg
IMKgIMKgJmx0O2FyZyB0eXBlPSZxdW90O2FzJnF1b3Q7IG5hbWU9JnF1b3Q7aW52YWxpZGF0ZWRf
cHJvcGVydGllcyZxdW90Oy8mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAmbHQ7L3NpZ25hbCZndDs8YnI+
CiZndDvCoCDCoCZsdDsvaW50ZXJmYWNlJmd0Ozxicj4KJmd0O8KgIMKgJmx0O2ludGVyZmFjZSBu
YW1lPSZxdW90O29yZy5mcmVlZGVza3RvcC5EQnVzLkludHJvc3BlY3RhYmxlJnF1b3Q7Jmd0Ozxi
cj4KJmd0O8KgIMKgIMKgJmx0O21ldGhvZCBuYW1lPSZxdW90O0ludHJvc3BlY3QmcXVvdDsmZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAmbHQ7YXJnIHR5cGU9JnF1b3Q7cyZxdW90OyBuYW1lPSZxdW90
O3htbF9kYXRhJnF1b3Q7IGRpcmVjdGlvbj0mcXVvdDtvdXQmcXVvdDsvJmd0Ozxicj4KJmd0O8Kg
IMKgIMKgJmx0Oy9tZXRob2QmZ3Q7PGJyPgomZ3Q7wqAgwqAmbHQ7L2ludGVyZmFjZSZndDs8YnI+
CiZndDvCoCDCoCZsdDtpbnRlcmZhY2UgbmFtZT0mcXVvdDtvcmcuZnJlZWRlc2t0b3AuREJ1cy5Q
ZWVyJnF1b3Q7Jmd0Ozxicj4KJmd0O8KgIMKgIMKgJmx0O21ldGhvZCBuYW1lPSZxdW90O1Bpbmcm
cXVvdDsvJmd0Ozxicj4KJmd0O8KgIMKgIMKgJmx0O21ldGhvZCBuYW1lPSZxdW90O0dldE1hY2hp
bmVJZCZxdW90OyZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCZsdDthcmcgdHlwZT0mcXVvdDtzJnF1
b3Q7IG5hbWU9JnF1b3Q7bWFjaGluZV91dWlkJnF1b3Q7IGRpcmVjdGlvbj0mcXVvdDtvdXQmcXVv
dDsvJmd0Ozxicj4KJmd0O8KgIMKgIMKgJmx0Oy9tZXRob2QmZ3Q7PGJyPgomZ3Q7wqAgwqAmbHQ7
L2ludGVyZmFjZSZndDs8YnI+CiZndDvCoCDCoCZsdDtpbnRlcmZhY2UgbmFtZT0mcXVvdDtjb20u
aW50ZWwudHNzMi5UY3RpVGFicm1kJnF1b3Q7Jmd0Ozxicj4KJmd0O8KgIMKgIMKgJmx0O21ldGhv
ZCBuYW1lPSZxdW90O0NyZWF0ZUNvbm5lY3Rpb24mcXVvdDsmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAmbHQ7YXJnIHR5cGU9JnF1b3Q7YWgmcXVvdDsgbmFtZT0mcXVvdDtmZHMmcXVvdDsgZGlyZWN0
aW9uPSZxdW90O291dCZxdW90Oy8mZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgwqAmbHQ7YXJnIHR5cGU9
JnF1b3Q7dCZxdW90OyBuYW1lPSZxdW90O2lkJnF1b3Q7IGRpcmVjdGlvbj0mcXVvdDtvdXQmcXVv
dDsvJmd0Ozxicj4KJmd0O8KgIMKgIMKgJmx0Oy9tZXRob2QmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAm
bHQ7bWV0aG9kIG5hbWU9JnF1b3Q7Q2FuY2VsJnF1b3Q7Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKg
Jmx0O2FyZyB0eXBlPSZxdW90O3QmcXVvdDsgbmFtZT0mcXVvdDtpZCZxdW90OyBkaXJlY3Rpb249
JnF1b3Q7aW4mcXVvdDsvJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmx0O2FyZyB0eXBlPSZxdW90
O3UmcXVvdDsgbmFtZT0mcXVvdDtyZXR1cm5fY29kZSZxdW90OyBkaXJlY3Rpb249JnF1b3Q7b3V0
JnF1b3Q7LyZndDs8YnI+CiZndDvCoCDCoCDCoCZsdDsvbWV0aG9kJmd0Ozxicj4KJmd0O8KgIMKg
IMKgJmx0O21ldGhvZCBuYW1lPSZxdW90O1NldExvY2FsaXR5JnF1b3Q7Jmd0Ozxicj4KJmd0O8Kg
IMKgIMKgIMKgJmx0O2FyZyB0eXBlPSZxdW90O3QmcXVvdDsgbmFtZT0mcXVvdDtpZCZxdW90OyBk
aXJlY3Rpb249JnF1b3Q7aW4mcXVvdDsvJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmx0O2FyZyB0
eXBlPSZxdW90O3kmcXVvdDsgbmFtZT0mcXVvdDtsb2NhbGl0eSZxdW90OyBkaXJlY3Rpb249JnF1
b3Q7aW4mcXVvdDsvJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgJmx0O2FyZyB0eXBlPSZxdW90O3Um
cXVvdDsgbmFtZT0mcXVvdDtyZXR1cm5fY29kZSZxdW90OyBkaXJlY3Rpb249JnF1b3Q7b3V0JnF1
b3Q7LyZndDs8YnI+CiZndDvCoCDCoCDCoCZsdDsvbWV0aG9kJmd0Ozxicj4KJmd0O8KgIMKgJmx0
Oy9pbnRlcmZhY2UmZ3Q7PGJyPgomZ3Q7ICZsdDsvbm9kZSZndDs8YnI+CiZndDs8YnI+Cjxicj4K
SSBiZWxpZXZlIHRoZSB0cG0yLWFibXJkICsgTVNGVCBzaW11bGF0b3IgcGFydCBpcyBjb3JyZWN0
Ljxicj4KPGJyPgomZ3Q7IFRoZSBwYXJ0IEkgYW0gbm93IG5vdCBzdXJlIG9mLCBpcyBob3cgdG8g
Y29uZmlndXJlIFRQTTJUT09MU19UQ1RJIGFuZCB3aGF0PGJyPgomZ3Q7IGFyZ3Mgc2hvdWxkIGJl
IHVzZWQgZm9yIHRoZSBSTS48YnI+CiZndDsgPGJyPgomZ3Q7IEFzIGl0IGlzLCBpdHMgZXhwZWN0
ZWQgd2l0aCBUUE0yVE9PTFNfVENUSSB1bmRlY2xhcmVkwqAgOjxicj4KJmd0OyA8YnI+CiZndDsg
W3Jvb3RAYTJkNDFmYjM3YmIzIHNyY10jIHRwbTJfcGNybGlzdDxicj4KJmd0OyBFUlJPUjp0Y3Rp
OnNyYy90c3MyLXRjdGkvdGN0aS1kZXZpY2UuYzozOTk6VHNzMl9UY3RpX0RldmljZV9Jbml0KCkg
RmFpbGVkPGJyPgomZ3Q7IHRvIG9wZW4gZGV2aWNlIGZpbGUgL2Rldi90cG0wOiBObyBzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5PGJyPgomZ3Q7IEVSUk9SOiB0Y3RpIGluaXQgYWxsb2NhdGlvbiByb3V0
aW5lIGZhaWxlZCBmb3IgbGlicmFyeTogJnF1b3Q7ZGV2aWNlJnF1b3Q7IG9wdGlvbnM6PGJyPgom
Z3Q7ICZxdW90OyhudWxsKSZxdW90Ozxicj4KJmd0OyBFUlJPUjogQ291bGQgbm90IGxvYWQgdGN0
aSwgZ290OiAmcXVvdDtkZXZpY2UmcXVvdDs8YnI+CiZndDsgPGJyPgomZ3Q7IEkgaGF2ZSB0aGVu
IHRyaWVkIGRpZmZlcmVudCB2YXJpYXRpb25zOjxicj4KJmd0OyA8YnI+CiZndDsgZXhwb3J0IFRQ
TTJUT09MU19UQ1RJPSZxdW90O21zc2ltOmhvc3Q9bG9jYWxob3N0LHBvcnQ9MjMyMSZxdW90Ozxi
cj4KJmd0OyBleHBvcnQgVFBNMlRPT0xTX1RDVEk9JnF1b3Q7bXNzaW06cG9ydD0yMzIxJnF1b3Q7
PGJyPgomZ3Q7IGV4cG9ydCBUUE0yVE9PTFNfVENUST0mcXVvdDttc3NpbTp0Y3A6Ly88YSBocmVm
PSJodHRwOi8vMTI3LjAuMC4xOjIzMjEiIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+MTI3LjAuMC4xOjIzMjE8L2E+JnF1b3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7IEkg
YW0gZ3Vlc3NpbmcgdGhpcyB3b3VsZCBiZSB3cm9uZyB0aG91Z2g/IEkgZG9uJiMzOTt0IHdhbnQg
dGhlIHRvb2xzIGNvbm5lY3Rpbmc8YnI+CiZndDsgdG8gdGhlIG1zc2ltLCBJIHdhbnQgdGhlbSBj
b25uZWN0aW5nIHRvIHRoZSByZXNvdXJjZSBtYW5hZ2VyLjxicj4KJmd0Ozxicj4KPGJyPgpUaGF0
JiMzOTtzIGNvcnJlY3QuIFlvdSBoYXZlIHRvIHVzZSB0aGUgYWJybWQgVENUSSBzaW5jZSB0aGUg
dG9vbHMgZG9uJiMzOTt0IGNhcmUgdGhhdDxicj4KdGhlIGFicm1kIGlzIHRhbGtpbmcgdG8gdGhl
IHNpbXVsYXRvciBpbnN0ZWFkIG9mIGEgVFBNIGRldmljZS48YnI+Cjxicj4KJmd0OyBJIHNob3Vs
ZCBhbHNvIG1lbnRpb24sIG5vbmUgb2YgdGhlIGFib3ZlIHdvcmsgLSBydW5uaW5nIGB0cG0yX3Bj
cmxpc3RgIGp1c3Q8YnI+CiZndDsgcmVzdWx0cyBpbiB0aGUgY29tbWFuZCBoYW5naW5nIGFuZCBu
ZWVkaW5nIGEgY3RybCBjIHRvIGJyZWFrIG91dC48YnI+CiZndDsgPGJyPgomZ3Q7IFtyb290QGEy
ZDQxZmIzN2JiMyBzcmNdIyBleHBvcnQ8YnI+CiZndDsgVFBNMlRPT0xTX1RDVEk9JnF1b3Q7dGFi
cm1kOmJ1c19uYW1lPWNvbS5pbnRlbC50c3MyLlRhYnJtZCx0YWJybWQ6YnVzX3R5cGU9c2Vzc2lv
biZxdW90Ozxicj4KJmd0OyBbcm9vdEBhMmQ0MWZiMzdiYjMgc3JjXSMgdHBtMl9wY3JsaXN0PGJy
PgomZ3Q7IEVSUk9SOiBDb3VsZCBub3QgZGxvcGVuIGxpYnJhcnk6ICZxdW90O3RhYnJtZCZxdW90
Ozxicj4KJmd0OyBFUlJPUjogQ291bGQgbm90IGxvYWQgdGN0aSwgZ290OiAmcXVvdDt0YWJybWQm
cXVvdDs8YnI+CiZndDsgPGJyPgomZ3Q7IFNvIEkgdGhlbiB0cmllZCB0cnkgdGhpczo8YnI+CiZn
dDsgPGJyPgomZ3Q7IFtyb290QGEyZDQxZmIzN2JiMyBzcmNdIyAvdXNyL2xvY2FsL3NiaW4vdHBt
Mi1hYnJtZCAtLWFsbG93LXJvb3Q8YnI+CiZndDsgLS10Y3RpPWxpYnRzczItdGN0aS1tc3NpbS5z
byAmYW1wOzxicj4KJmd0OyBbcm9vdEBhMmQ0MWZiMzdiYjMgc3JjXSMgZXhwb3J0IFRQTTJUT09M
U19UQ1RJPSZxdW90O21zc2ltOnBvcnQ9MjMyMSZxdW90Ozxicj4KJmd0OyBbcm9vdEBhMmQ0MWZi
MzdiYjMgc3JjXSMgdHBtMl9wY3JsaXN0PGJyPgomZ3Q7IDxicj4KJmd0OyBVbmZvcnR1bmF0ZWx5
IHRoZSBjb21tYW5kIGp1c3QgaGFuZ3MsIG5lZWRpbmcgYSBjdHJsLWMgdG8gYnJlYWsgdGhlIHNl
c3Npb24uPGJyPgomZ3Q7IDxicj4KJmd0OyBJIGFtIGF3YXJlIEkgbWF5IGJlICZxdW90O21ha2lu
ZyBhIHBpZ3MgZWFyJnF1b3Q7IG9mIHRoaXMsIGlmIHNvIGV4Y3VzZSBteTxicj4KJmd0OyBncmVl
biYjMzk7bmVzcy48YnI+CiZndDsgPGJyPgomZ3Q7IElmIGFueW9uZSBjYW4gcG9pbnQgbWUgdG93
YXJkcyB3aGF0IGFyZ3MgSSBzaG91bGQgYmUgdXNpbmcgZm9yIHRoZTxicj4KJmd0OyBjb25uZWN0
aXZpdHkgZmxvdyBJIG91dGxpbmVkIHRvd2FyZHMgdGhlIHN0YXJ0IG9mIHRoaXMgZW1haWwsIHRo
YXQgd291bGQgYmU8YnI+CiZndDsgZ3JlYXQhPGJyPgomZ3Q7PGJyPgo8YnI+CldoYXQmIzM5O3Mg
eW91ciBleGFjdCB2ZXJzaW9uIG9mIHRoZSB0cG0yLWFicm1kLCB0cG0yLXRzcyBhbmQgdHBtMi10
b29scz8gQ2FuIHlvdTxicj4KZG8gJnF1b3Q7ZXhwb3J0ID1hbGwrVFJBQ0UmcXVvdDsgYmVmb3Jl
IGV4ZWN1dGluZyB0cG0yX3Bjcmxpc3QgdG8gc2VlIHdoZXJlIHRoZTxicj4KbGlicmFyaWVzIGFy
ZSBoYW5naW5nPzxicj48L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxi
cj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SSBhbSB0aGlua2luZyBpdCBtaWdodCBoYXZlIHNvbWV0
aGluZyB0byBkbyB3aXRoIGRidXMgbm93LiBJIHJhbiBhIHN5c3RlbWQgYmFzZWQgY29udGFpbmVy
IHdpdGggdGhlIHNhbWUgc3RlcHMgLyB2ZXJzaW9ucy4gcGNybGlzdCB3YXMgdGhlbiByZXR1cm5l
ZCB3aXRoIG5vIGlzc3Vlcy48L2Rpdj48ZGl2IGRpcj0iYXV0byI+wqA8L2Rpdj48ZGl2IGRpcj0i
YXV0byI+SSB3aWxsIGRlZmluaXRlbHkgY2hlY2sgd2l0aMKgPHNwYW4gc3R5bGU9ImZvbnQtZmFt
aWx5OnNhbnMtc2VyaWYiPlRTUzJfTE9HIHNldCB0aG91Z2gsIHNvIHdlIGtub3cgd2hhdCYjMzk7
cyBoYXBwZW5pbmcuIEkgY2FuIHJ1biBhIHByaXZpbGVnZWQgY29udGFpbmVyIGZvciBteSBuZWVk
cyAoQ0kgVGVzdHMpIHNvIHRoZXJlIGlzIG5vIHNlY3VyaXR5IGNvbmNlcm5zLCBidXQgSSBhbSBz
dXJlIG90aGVycyB3aWxsIGluIHRoZSBmdXR1cmUgd2FudCB0byBydW4gYSBsaW1pdGVkIGluc3Rh
bmNlLjwvc3Bhbj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
OnNhbnMtc2VyaWYiPjxicj48L3NwYW4+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxzcGFuIHN0eWxl
PSJmb250LWZhbWlseTpzYW5zLXNlcmlmIj5UaGFua3MgTHVrZSE8L3NwYW4+PC9kaXY+PGRpdiBk
aXI9ImF1dG8iPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpzYW5zLXNlcmlmIj48YnI+PC9zcGFu
PjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVv
dGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGJyPgomZ3Q7IFRoYW5rcyw8YnI+
CiZndDsgPGJyPgomZ3Q7IEx1a2U8YnI+CiZndDsgPGJyPgo8YnI+CkJlc3QgcmVnYXJkcyw8YnI+
Ci0tIDxicj4KSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzPGJyPgpTb2Z0d2FyZSBFbmdpbmVlciAt
IERlc2t0b3AgSGFyZHdhcmUgRW5hYmxlbWVudDxicj4KUmVkIEhhdDxicj4KPC9ibG9ja3F1b3Rl
PjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============6499364879120052755==--

