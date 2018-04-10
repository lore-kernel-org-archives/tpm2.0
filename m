Content-Type: multipart/mixed; boundary="===============4473576105956225174=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.us>
Subject: Re: [tpm2] Failed to create connection with service: Timeout was
 reached
Date: Tue, 10 Apr 2018 08:35:32 -0700
Message-ID: <1d97e031-3a7f-d8f8-9215-5c8189beefc3@twobit.us>
In-Reply-To: CANtcRX7+2W-0mnizq3yh7Dd1MJ0rDvnbuZwaybPDefdZ77_VDA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4473576105956225174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 04/10/2018 12:53 AM, Peter Magnusson wrote:
> Hi,
> =

> Error when running e.g. tpm2_pcrlist
> ** (process:8120): WARNING **: Failed to create connection with
> service: Timeout was reached
> ERROR: tcti init allocation routine failed for library: "tabrmd"
> options: "(null)"
> ERROR: Could not load tcti, got: "tabrmd"
> =

> Target system is Ubuntu Linux latest stable (4.13.0-38-generic
> #43~16.04.1-Ubuntu) running under VMWare Fusion (very old version of
> tpm2-tools from ubuntu apt install tested OK previously.) Source code
> revision is head of tpm2-tss, tpm2-abrmd, tpm2-tools as of now.
> =

> Problem occurs both if tpm2-armbd is running from systemd or is
> executed from command line.
> =

> When running from command line with debug, tpm2-abrmd emits the following:
> sudo -u tss G_MESSAGES_DEBUG=3Dall tpm2-abrmd
> ** INFO: tabrmd startup
> ** INFO: logging to stdout
> ** (tpm2-abrmd:2060): DEBUG: tcti_conf_parse
> ** (tpm2-abrmd:2060): DEBUG: tcti_conf_parse: combined conf is null
> ** (tpm2-abrmd:2060): DEBUG: tcti_dynamic_set_property: TctiDynamic
> 0xc8d800 set filename: libtss2-tcti-device.so
> ** (tpm2-abrmd:2060): DEBUG: tcti_dynamic_set_property: TctiDynamic
> 0xc8d800 PROP_CONF_STR set to: (null)
> ** INFO: entering g_main_loop
> ** INFO: init_thread_func start
> ** (tpm2-abrmd:2060): DEBUG: random_class_init
> ** (tpm2-abrmd:2060): DEBUG: opening entropy source: /dev/urandom
> ** (tpm2-abrmd:2060): DEBUG: reading from entropy source: /dev/urandom
> ** (tpm2-abrmd:2060): DEBUG: seeding rand with -2303404397750689299
> ** (tpm2-abrmd:2060): DEBUG: connection_manager_set_property: 0xc80700
> ** (tpm2-abrmd:2060): DEBUG:   max_connections: 0x1b
> ** (tpm2-abrmd:2060): DEBUG: ConnectionManager: 0xc80700
> ** (tpm2-abrmd:2060): DEBUG: IpcFrontendDbus set bus_name: com.intel.tss2=
.Tabrmd
> ** (tpm2-abrmd:2060): DEBUG: ipc_frontend_connect: 0x7f8744002060
> ** (tpm2-abrmd:2060): DEBUG: tcti_initialize: 0xc8d800
> ** (tpm2-abrmd:2060): DEBUG: tcti_dynamic_initialize: TctiDynamic 0xc8d800
> ** (tpm2-abrmd:2060): DEBUG: tcti_util_discover_info
> ** (tpm2-abrmd:2060): DEBUG: tcti_util_dynamic_init
> ** (tpm2-abrmd:2060): DEBUG: sapi_context_init w/ Tcti: 0xc8d800
> ** (tpm2-abrmd:2060): DEBUG: tcti_peek_context: 0xc8d800
> ** (tpm2-abrmd:2060): DEBUG: Allocating 0x1048 bytes for SAPI context
> ** (tpm2-abrmd:2060): DEBUG: access_broker_set_property: 0x7f874400f030
> ** (tpm2-abrmd:2060): DEBUG:   sapi_context: 0x7f874400dec0
> ** (tpm2-abrmd:2060): DEBUG: access_broker_set_property: 0x7f874400f030
> ** (tpm2-abrmd:2060): DEBUG:   tcti: 0xc8d800
> ** (tpm2-abrmd:2060): DEBUG: created AccessBroker: 0x7f874400f030
> ** (tpm2-abrmd:2060): DEBUG: access_broker_init_tpm: 0x7f874400f030
> ** (tpm2-abrmd:2060): DEBUG: access_broker_get_tpm_properties_fixed
> ** INFO: on_bus_acquired: com.intel.tss2.Tabrmd
> ** INFO: on_name_acquired: com.intel.tss2.Tabrmd
> ** (tpm2-abrmd:2060): DEBUG: Got proxy object for DBus daemon.

This behavior is indicative of a bug we squashed in the core tpm2-tss
libraries (really the device TCTI library) the other day:
https://github.com/tpm2-software/tpm2-tss/pull/949

What's happening above is the tpm2-abrmd is trying to make a call to the
TPM2 device to query for some capabilities and it's getting stuck. So
when you try to execute one of the tools the tpm2-abrmd isn't responding.

Try pulling down the latest from tpm2-tss master branch and run the
tpm2-abrmd again. You shouldn't need to recompile the daemon, just the
tpm2-tss libraries.

Philip

> The following build, install and post-install steps has been executed,
> =

> cd tpm2-abrmd
> sudo useradd --system --user-group tss
> ./bootstrap
> ./configure --with-dbuspolicydir=3D/etc/dbus-1/system.d
> --with-udevrulesdir=3D/etc/udev/rules.d/
> --with-systemdsystemunitdir=3D/lib/systemd/system/
> --with-systemdpresetdir=3D/lib/systemd/system-preset/
> make
> sudo make install
> sudo mv /usr/local/share/dbus-1/system-services/com.intel.tss2.Tabrmd.ser=
vice
> /usr/share/dbus-1/system-services/
> cd dist
> sudo udevadm control --reload-rules && sudo udevadm trigger
> sudo mkdir -p /var/lib/tpm
> sudo userdel tss
> sudo groupadd tss && sudo useradd -M -d /var/lib/tpm -s /bin/false -g tss=
 tss
> sudo pkill -HUP dbus-daemon
> sudo chown tss:tss /dev/tpm0
> cd ../..
> =

> Also filed under https://github.com/tpm2-software/tpm2-abrmd/issues/422
> =

> Best Regards
> //Peter
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
> =



--===============4473576105956225174==--

