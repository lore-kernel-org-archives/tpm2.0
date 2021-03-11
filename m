Content-Type: multipart/mixed; boundary="===============1574997829680845633=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: abrmd crashing - how to debug?
Date: Thu, 11 Mar 2021 12:05:49 -0500
Message-ID: <OFCDB9C1B3.108EDCC9-ON00258695.005D4705-85258695.005DEAEA@notes.na.collabserv.com>
In-Reply-To: SN6PR11MB34370249B77688306C648A67B8929@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1574997829680845633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: "Roberts, William C" <william.c.roberts(a)intel.com>
>
> Since you're just running it as a process from a shell and not a
> system service, all the logs will be to stderr/stdout.
> Can you enable env variable G_MESSAGES_DEBUG=3Dall when you run tpm2-
> abrmd and send us the output?


With that set, it runs about 5x longer, 554 loops.  I also noticed that it
fails
less often if I put a sleep between commands.  I'd like to run
a command that takes a long time to respond, like create, but
I don't know how.

Here is the end of the trace:

** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: flushsave_context for 0 entries
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: response_sink_process_response:
writing 0x3e bytes
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: tpm2_command_finalize
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297:     80 01 00 00 00 3e 00 00 00
00 00 00 00 14 00 00
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: message_queue_dequeue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297:     00 01 00 0b 03 01 00 00 00
00 00 01 00 20 00 00
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297:     00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297:     00 00 00 00 00 00 00 00 00
00 00 00 00 00
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: write_all: writing 62 bytes to
ostream
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: write_all: wrote 62 bytes to
ostream
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: returning 62
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: tpm2_response_finalize
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: response_sink_thread: blocking
on input queue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.297: message_queue_dequeue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: command_source_on_input_ready
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: read_data: reading 10 bytes
from istream
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: read produced EOF
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: read_tpm_buffer_alloc: err_out
freeing buffer
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: command_source_on_input_ready:
removing connection from connection_manager
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: connection_manager_remove:
removing Connection
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: sink_enqueue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: resource_manager_enqueue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: message_queue_enqueue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: on_name_lost:
com.intel.tss2.Tabrmd
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: command_source_on_input_ready:
removing GCancellable
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298: resource_manager_thread:
message_queue_dequeue got obj
** INFO: 12:01:25.298: main_loop_quit
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298:
resource_manager_process_control
** (tpm2-abrmd:32533): DEBUG: 12:01:25.298:
resource_manager_process_control: received CONNECTION_REMOVED message for
connection
** INFO: 12:01:25.298: g_main_loop_run done, cleaning up
** INFO: 12:01:25.298: resource_manager_remove_connection: flushing session
contexts
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: gmain_data_cleanup
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299:
resource_manager_remove_connection: done
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: sink_enqueue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: response_sink_enqueue:
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: command_attrs_finalize
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: message_queue_enqueue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: resource_manager_unblock:
enqueuing ControlMessage
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: message_queue_dequeue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: response_sink_process_control
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: message_queue_enqueue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: response_sink_process_control:
Received CONNECTION_REMOVED message, nothing to do.
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: resource_manager_thread:
message_queue_dequeue got obj
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: handle_map_finalize
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299:
resource_manager_process_control
** (tpm2-abrmd:32533): DEBUG: 12:01:25.299: response_sink_thread: blocking
on input queue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.300: sink_enqueue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.300: message_queue_dequeue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.300: response_sink_enqueue:
** (tpm2-abrmd:32533): DEBUG: 12:01:25.300: message_queue_enqueue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.300: response_sink_process_control
** (tpm2-abrmd:32533): DEBUG: 12:01:25.300: resource_manager_dispose
** (tpm2-abrmd:32533): DEBUG: 12:01:25.300: response_sink_process_control:
Received CHECK_CANCEL control code, terminating.
** (tpm2-abrmd:32533): DEBUG: 12:01:25.300: session_list_dispose:
SessionList with 0 entries
** (tpm2-abrmd:32533): DEBUG: 12:01:25.301: session_list_finalize:
SessionList with 0 entries
** (tpm2-abrmd:32533): DEBUG: 12:01:25.301: message_queue_enqueue
** (tpm2-abrmd:32533): DEBUG: 12:01:25.301: ipc_frontend_disconnect
** (tpm2-abrmd:32533): DEBUG: 12:01:25.301: random_finalize
** INFO: 12:01:25.301: main_loop_quit

and then a command prompt.

--===============1574997829680845633==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PHR0Pjxmb250IHNpemU9IjIiPiZndDsgRnJvbTogJnF1b3Q7Um9iZXJ0
cywgV2lsbGlhbSBDJnF1b3Q7ICZsdDt3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20mZ3Q7PC9m
b250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4mZ3Q7IDxicj4mZ3Q7IFNpbmNlIHlvdSdy
ZSBqdXN0IHJ1bm5pbmcgaXQgYXMgYSBwcm9jZXNzIGZyb20gYSBzaGVsbCBhbmQgbm90IGEgPGJy
PiZndDsgc3lzdGVtIHNlcnZpY2UsIGFsbCB0aGUgbG9ncyB3aWxsIGJlIHRvIHN0ZGVyci9zdGRv
dXQuPGJyPiZndDsgQ2FuIHlvdSBlbmFibGUgZW52IHZhcmlhYmxlIEdfTUVTU0FHRVNfREVCVUc9
YWxsIHdoZW4geW91IHJ1biB0cG0yLTxicj4mZ3Q7IGFicm1kIGFuZCBzZW5kIHVzIHRoZSBvdXRw
dXQ/PGJyPjwvZm9udD48L3R0Pjxicj48YnI+PHR0Pjxmb250IHNpemU9IjIiPldpdGggdGhhdCBz
ZXQsIGl0IHJ1bnMgYWJvdXQgNXggbG9uZ2VyLCA1NTQgbG9vcHMuICZuYnNwO0kgYWxzbyBub3Rp
Y2VkIHRoYXQgaXQgZmFpbHM8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPmxlc3Mg
b2Z0ZW4gaWYgSSBwdXQgYSBzbGVlcCBiZXR3ZWVuIGNvbW1hbmRzLiAmbmJzcDtJJ2QgbGlrZSB0
byBydW48L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPmEgY29tbWFuZCB0aGF0IHRh
a2VzIGEgbG9uZyB0aW1lIHRvIHJlc3BvbmQsIGxpa2UgY3JlYXRlLCBidXQ8L2ZvbnQ+PC90dD48
YnI+PHR0Pjxmb250IHNpemU9IjIiPkkgZG9uJ3Qga25vdyBob3cuPC9mb250PjwvdHQ+PGJyPjxi
cj48dHQ+PGZvbnQgc2l6ZT0iMiI+SGVyZSBpcyB0aGUgZW5kIG9mIHRoZSB0cmFjZTo8L2ZvbnQ+
PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERF
QlVHOiAxMjowMToyNS4yOTc6IGZsdXNoc2F2ZV9jb250ZXh0IGZvciAwIGVudHJpZXM8L2ZvbnQ+
PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6
IDEyOjAxOjI1LjI5NzogcmVzcG9uc2Vfc2lua19wcm9jZXNzX3Jlc3BvbnNlOiB3cml0aW5nIDB4
M2UgYnl0ZXM8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1k
OjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5NzogdHBtMl9jb21tYW5kX2ZpbmFsaXplPC9mb250
PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERFQlVH
OiAxMjowMToyNS4yOTc6ICZuYnNwOyAmbmJzcDsgODAgMDEgMDAgMDAgMDAgM2UgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMTQgMDAgMDA8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioq
ICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5NzogbWVzc2FnZV9xdWV1ZV9k
ZXF1ZXVlPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDoz
MjUzMyk6IERFQlVHOiAxMjowMToyNS4yOTc6ICZuYnNwOyAmbmJzcDsgMDAgMDEgMDAgMGIgMDMg
MDEgMDAgMDAgMDAgMDAgMDAgMDEgMDAgMjAgMDAgMDA8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250
IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5NzogJm5i
c3A7ICZuYnNwOyAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MDwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6MzI1MzMp
OiBERUJVRzogMTI6MDE6MjUuMjk3OiAmbmJzcDsgJm5ic3A7IDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4q
KiAodHBtMi1hYnJtZDozMjUzMyk6IERFQlVHOiAxMjowMToyNS4yOTc6IHdyaXRlX2FsbDogd3Jp
dGluZyA2MiBieXRlcyB0byBvc3RyZWFtPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIy
Ij4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERFQlVHOiAxMjowMToyNS4yOTc6IHdyaXRlX2FsbDog
d3JvdGUgNjIgYnl0ZXMgdG8gb3N0cmVhbTwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0i
MiI+KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUuMjk3OiByZXR1cm5pbmcg
NjI8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMz
KTogREVCVUc6IDEyOjAxOjI1LjI5NzogdHBtMl9yZXNwb25zZV9maW5hbGl6ZTwvZm9udD48L3R0
Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJVRzogMTI6
MDE6MjUuMjk3OiByZXNwb25zZV9zaW5rX3RocmVhZDogYmxvY2tpbmcgb24gaW5wdXQgcXVldWU8
L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTog
REVCVUc6IDEyOjAxOjI1LjI5NzogbWVzc2FnZV9xdWV1ZV9kZXF1ZXVlPC9mb250PjwvdHQ+PGJy
Pjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERFQlVHOiAxMjowMToy
NS4yOTg6IGNvbW1hbmRfc291cmNlX29uX2lucHV0X3JlYWR5PC9mb250PjwvdHQ+PGJyPjx0dD48
Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERFQlVHOiAxMjowMToyNS4yOTg6
IHJlYWRfZGF0YTogcmVhZGluZyAxMCBieXRlcyBmcm9tIGlzdHJlYW08L2ZvbnQ+PC90dD48YnI+
PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1
LjI5ODogcmVhZCBwcm9kdWNlZCBFT0Y8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIi
PioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5ODogcmVhZF90cG1fYnVm
ZmVyX2FsbG9jOiBlcnJfb3V0IGZyZWVpbmcgYnVmZmVyPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9u
dCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERFQlVHOiAxMjowMToyNS4yOTg6IGNv
bW1hbmRfc291cmNlX29uX2lucHV0X3JlYWR5OiByZW1vdmluZyBjb25uZWN0aW9uIGZyb20gY29u
bmVjdGlvbl9tYW5hZ2VyPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBt
Mi1hYnJtZDozMjUzMyk6IERFQlVHOiAxMjowMToyNS4yOTg6IGNvbm5lY3Rpb25fbWFuYWdlcl9y
ZW1vdmU6IHJlbW92aW5nIENvbm5lY3Rpb248L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9
IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5ODogc2lua19lbnF1
ZXVlPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUz
Myk6IERFQlVHOiAxMjowMToyNS4yOTg6IHJlc291cmNlX21hbmFnZXJfZW5xdWV1ZTwvZm9udD48
L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJVRzog
MTI6MDE6MjUuMjk4OiBtZXNzYWdlX3F1ZXVlX2VucXVldWU8L2ZvbnQ+PC90dD48YnI+PHR0Pjxm
b250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5ODog
b25fbmFtZV9sb3N0OiBjb20uaW50ZWwudHNzMi5UYWJybWQ8L2ZvbnQ+PC90dD48YnI+PHR0Pjxm
b250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5ODog
Y29tbWFuZF9zb3VyY2Vfb25faW5wdXRfcmVhZHk6IHJlbW92aW5nIEdDYW5jZWxsYWJsZTwvZm9u
dD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJV
RzogMTI6MDE6MjUuMjk4OiByZXNvdXJjZV9tYW5hZ2VyX3RocmVhZDogbWVzc2FnZV9xdWV1ZV9k
ZXF1ZXVlIGdvdCBvYmo8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioqIElORk86
IDEyOjAxOjI1LjI5ODogbWFpbl9sb29wX3F1aXQ8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNp
emU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5ODogcmVzb3Vy
Y2VfbWFuYWdlcl9wcm9jZXNzX2NvbnRyb2w8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9
IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5ODogcmVzb3VyY2Vf
bWFuYWdlcl9wcm9jZXNzX2NvbnRyb2w6IHJlY2VpdmVkIENPTk5FQ1RJT05fUkVNT1ZFRCBtZXNz
YWdlIGZvciBjb25uZWN0aW9uPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiBJ
TkZPOiAxMjowMToyNS4yOTg6IGdfbWFpbl9sb29wX3J1biBkb25lLCBjbGVhbmluZyB1cDwvZm9u
dD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogSU5GTzogMTI6MDE6MjUuMjk4OiByZXNv
dXJjZV9tYW5hZ2VyX3JlbW92ZV9jb25uZWN0aW9uOiBmbHVzaGluZyBzZXNzaW9uIGNvbnRleHRz
PC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6
IERFQlVHOiAxMjowMToyNS4yOTk6IGdtYWluX2RhdGFfY2xlYW51cDwvZm9udD48L3R0Pjxicj48
dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUu
Mjk5OiByZXNvdXJjZV9tYW5hZ2VyX3JlbW92ZV9jb25uZWN0aW9uOiBkb25lPC9mb250PjwvdHQ+
PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERFQlVHOiAxMjow
MToyNS4yOTk6IHNpbmtfZW5xdWV1ZTwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+
KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUuMjk5OiByZXNwb25zZV9zaW5r
X2VucXVldWU6PC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJt
ZDozMjUzMyk6IERFQlVHOiAxMjowMToyNS4yOTk6IGNvbW1hbmRfYXR0cnNfZmluYWxpemU8L2Zv
bnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVC
VUc6IDEyOjAxOjI1LjI5OTogbWVzc2FnZV9xdWV1ZV9lbnF1ZXVlPC9mb250PjwvdHQ+PGJyPjx0
dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERFQlVHOiAxMjowMToyNS4y
OTk6IHJlc291cmNlX21hbmFnZXJfdW5ibG9jazogZW5xdWV1aW5nIENvbnRyb2xNZXNzYWdlPC9m
b250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERF
QlVHOiAxMjowMToyNS4yOTk6IG1lc3NhZ2VfcXVldWVfZGVxdWV1ZTwvZm9udD48L3R0Pjxicj48
dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUu
Mjk5OiByZXNwb25zZV9zaW5rX3Byb2Nlc3NfY29udHJvbDwvZm9udD48L3R0Pjxicj48dHQ+PGZv
bnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUuMjk5OiBt
ZXNzYWdlX3F1ZXVlX2VucXVldWU8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioq
ICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5OTogcmVzcG9uc2Vfc2lua19w
cm9jZXNzX2NvbnRyb2w6IFJlY2VpdmVkIENPTk5FQ1RJT05fUkVNT1ZFRCBtZXNzYWdlLCBub3Ro
aW5nIHRvIGRvLjwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJy
bWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUuMjk5OiByZXNvdXJjZV9tYW5hZ2VyX3RocmVhZDog
bWVzc2FnZV9xdWV1ZV9kZXF1ZXVlIGdvdCBvYmo8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNp
emU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjI5OTogaGFuZGxl
X21hcF9maW5hbGl6ZTwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTIt
YWJybWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUuMjk5OiByZXNvdXJjZV9tYW5hZ2VyX3Byb2Nl
c3NfY29udHJvbDwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJy
bWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUuMjk5OiByZXNwb25zZV9zaW5rX3RocmVhZDogYmxv
Y2tpbmcgb24gaW5wdXQgcXVldWU8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioq
ICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1LjMwMDogc2lua19lbnF1ZXVlPC9m
b250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERF
QlVHOiAxMjowMToyNS4zMDA6IG1lc3NhZ2VfcXVldWVfZGVxdWV1ZTwvZm9udD48L3R0Pjxicj48
dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUu
MzAwOiByZXNwb25zZV9zaW5rX2VucXVldWU6PC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXpl
PSIyIj4qKiAodHBtMi1hYnJtZDozMjUzMyk6IERFQlVHOiAxMjowMToyNS4zMDA6IG1lc3NhZ2Vf
cXVldWVfZW5xdWV1ZTwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTIt
YWJybWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUuMzAwOiByZXNwb25zZV9zaW5rX3Byb2Nlc3Nf
Y29udHJvbDwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6
MzI1MzMpOiBERUJVRzogMTI6MDE6MjUuMzAwOiByZXNvdXJjZV9tYW5hZ2VyX2Rpc3Bvc2U8L2Zv
bnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVC
VUc6IDEyOjAxOjI1LjMwMDogcmVzcG9uc2Vfc2lua19wcm9jZXNzX2NvbnRyb2w6IFJlY2VpdmVk
IENIRUNLX0NBTkNFTCBjb250cm9sIGNvZGUsIHRlcm1pbmF0aW5nLjwvZm9udD48L3R0Pjxicj48
dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJybWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUu
MzAwOiBzZXNzaW9uX2xpc3RfZGlzcG9zZTogU2Vzc2lvbkxpc3Qgd2l0aCAwIGVudHJpZXM8L2Zv
bnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVC
VUc6IDEyOjAxOjI1LjMwMTogc2Vzc2lvbl9saXN0X2ZpbmFsaXplOiBTZXNzaW9uTGlzdCB3aXRo
IDAgZW50cmllczwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+KiogKHRwbTItYWJy
bWQ6MzI1MzMpOiBERUJVRzogMTI6MDE6MjUuMzAxOiBtZXNzYWdlX3F1ZXVlX2VucXVldWU8L2Zv
bnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVC
VUc6IDEyOjAxOjI1LjMwMTogaXBjX2Zyb250ZW5kX2Rpc2Nvbm5lY3Q8L2ZvbnQ+PC90dD48YnI+
PHR0Pjxmb250IHNpemU9IjIiPioqICh0cG0yLWFicm1kOjMyNTMzKTogREVCVUc6IDEyOjAxOjI1
LjMwMTogcmFuZG9tX2ZpbmFsaXplPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4q
KiBJTkZPOiAxMjowMToyNS4zMDE6IG1haW5fbG9vcF9xdWl0PC9mb250PjwvdHQ+PGJyPjxicj48
dHQ+PGZvbnQgc2l6ZT0iMiI+YW5kIHRoZW4gYSBjb21tYW5kIHByb21wdC48L2ZvbnQ+PC90dD48
QlI+CjwvYm9keT48L2h0bWw+Cg==

--===============1574997829680845633==--

