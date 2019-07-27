Content-Type: multipart/mixed; boundary="===============0615613704955365224=="
MIME-Version: 1.0
From: Garrett Fields <ghfields at gmail.com>
Subject: [tpm2] PCR Policy enforcement when using nvram
Date: Sat, 27 Jul 2019 15:31:35 -0400
Message-ID: <CA++-fmtsWkysO=BKPmB8kCUw7aAu8YXeyBpC4kZS_9pEzOYJbw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0615613704955365224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey all.  I'm new here.  I've been browsing several guides and the wikis to
learn tpm2-tools and I have had some successes.

I work with the ZFS on Linux project, which has recently incorporated
encryption.  The system, so far, allows a single passphrase or keyfile,
which can be piped into the unlock command.  Manual passprhase entry during
initramfs works, but I wanted to store that passphrase in the tpm and have
the system autounlock with successful pcr system checks.  I started with
tpm 1.2 and now trying with 2.0.

What I implemented via 1.2:
Create a nvram index that unlocks with after pcr values are verified and
correct index passphrase (which is the GUID of the drive) is supplied.
Then I block later reads of that index until reboot by doing a 0-byte read
of the index (just to block nosy individuals).

With the expanded TPM2.0 toolset, is nvram the preferred way to do this?
Should I be using TPM objects instead?  Something else?

I am developing this using Ubuntu 18.04.2 LTS (tpm2-tools 2.1.0-1build1).
I've noticed that the options shift significantly with the version of
tpm2-tools.

Here's what I have working so far (nvram index secured with password only
and lockable):
------
export TPM2TOOLS_TCTI=3D"device:/dev/tpm0"
tpm2_takeownership -o ownerpass -e endorsepass
tpm2_nvdefine -x 0x1000000 -a o -P ownerpass -p indexsecret -b
"authread|authwrite|read_stclear" -s 11
echo "hdpassword" | tpm2_nvwrite  -x 0x1000000 -a 0x1000000 -P indexsecret
tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret
tpm2_nvreadlock  -x 0x1000000 -a 0x1000000 -P indexsecret
# when needed:  tpm2_nvrelease -x 0x1000000 -a 0 -P ownerpass
------

I would really like to incorporate the pcr system check also (kinda the
whole point).  I tried:
-----------
tpm2_listpcrs --tcti=3Ddevice    #To see current values
tpm2_createpolicy -L sha1:0,1,2,3,4,5,6,7 -o ./0-7policy.pol --policy-pcr
tpm2_nvdefine -x 0x1000000 -a o -P ownerpass -p indexsecret -L
./0-7policy.pol -b "authread|authwrite|read_stclear" -s 11
echo "hdpassword" | tpm2_nvwrite  -x 0x1000000 -a 0x1000000 -P indexsecret
tpm2_nvlist   # Verfiied that 0x1000000 has a "authorization policy"
tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret   #Expected to work
since PCRs are the same as policy creation
tpm2_pcrextend 4:sha1=3Df1d2d2f924e986ac86fdf7b36c94bcdf32beec15
tpm2_listpcrs    #Verify pcr4 is different
tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret   #Expected to fail
-----------
The last line I would expect to fail, because of the PCR4 change, but it
still produces the password.  Am I missing something on the nvdefine to
enable policy enforcement?

I'd be eager to receive comments on my entire usage.  I know there is a lot
of TPM2 that I haven't started wrapping my head around.  Suggestions or
pointers would be appreciated.

--===============0615613704955365224==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZXkgYWxsLsKgIEkmIzM5O20gbmV3IGhlcmUuwqAgSSYjMzk7
dmUgYmVlbiBicm93c2luZyBzZXZlcmFsIGd1aWRlcyBhbmQgdGhlIHdpa2lzIHRvIGxlYXJuIHRw
bTItdG9vbHMgYW5kIEkgaGF2ZSBoYWQgc29tZSBzdWNjZXNzZXMuPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5JIHdvcmsgd2l0aCB0aGUgWkZTIG9uIExpbnV4IHByb2plY3QsIHdoaWNoIGhhcyBy
ZWNlbnRseSBpbmNvcnBvcmF0ZWQgZW5jcnlwdGlvbi7CoCBUaGUgc3lzdGVtLCBzbyBmYXIsIGFs
bG93cyBhIHNpbmdsZSBwYXNzcGhyYXNlIG9yIGtleWZpbGUsIHdoaWNoIGNhbiBiZSBwaXBlZCBp
bnRvIHRoZSB1bmxvY2sgY29tbWFuZC7CoCBNYW51YWwgcGFzc3ByaGFzZSBlbnRyeSBkdXJpbmcg
aW5pdHJhbWZzIHdvcmtzLCBidXQgSSB3YW50ZWQgdG8gc3RvcmUgdGhhdCBwYXNzcGhyYXNlIGlu
IHRoZSB0cG0gYW5kIGhhdmUgdGhlIHN5c3RlbSBhdXRvdW5sb2NrIHdpdGggc3VjY2Vzc2Z1bCBw
Y3Igc3lzdGVtIGNoZWNrcy7CoCBJIHN0YXJ0ZWQgd2l0aCB0cG0gMS4yIGFuZCBub3cgdHJ5aW5n
IHdpdGggMi4wLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+V2hhdCBJIGltcGxlbWVudGVkIHZp
YSAxLjI6PC9kaXY+PGRpdj5DcmVhdGUgYSBudnJhbSBpbmRleCB0aGF0IHVubG9ja3Mgd2l0aCBh
ZnRlciBwY3IgdmFsdWVzIGFyZSB2ZXJpZmllZCBhbmQgY29ycmVjdCBpbmRleCBwYXNzcGhyYXNl
ICh3aGljaCBpcyB0aGUgR1VJRCBvZiB0aGUgZHJpdmUpIGlzIHN1cHBsaWVkLjxicj48L2Rpdj48
ZGl2PlRoZW4gSSBibG9jayBsYXRlciByZWFkcyBvZiB0aGF0IGluZGV4IHVudGlsIHJlYm9vdCBi
eSBkb2luZyBhIDAtYnl0ZSByZWFkIG9mIHRoZSBpbmRleCAoanVzdCB0byBibG9jayBub3N5IGlu
ZGl2aWR1YWxzKS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldpdGggdGhlIGV4cGFuZGVkIFRQ
TTIuMCB0b29sc2V0LCBpcyBudnJhbSB0aGUgcHJlZmVycmVkIHdheSB0byBkbyB0aGlzP8KgIFNo
b3VsZCBJIGJlIHVzaW5nIFRQTSBvYmplY3RzIGluc3RlYWQ/wqAgU29tZXRoaW5nIGVsc2U/PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGFtIGRldmVsb3BpbmcgdGhpcyB1c2luZyBVYnVudHUg
MTguMDQuMiBMVFMgKHRwbTItdG9vbHMgMi4xLjAtMWJ1aWxkMSkuwqAgSSYjMzk7dmUgbm90aWNl
ZCB0aGF0IHRoZSBvcHRpb25zIHNoaWZ0IHNpZ25pZmljYW50bHkgd2l0aCB0aGUgdmVyc2lvbiBv
ZiB0cG0yLXRvb2xzLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SGVyZSYjMzk7cyB3aGF0IEkg
aGF2ZSB3b3JraW5nIHNvIGZhciAobnZyYW0gaW5kZXggc2VjdXJlZCB3aXRoIHBhc3N3b3JkIG9u
bHkgYW5kIGxvY2thYmxlKTo8L2Rpdj48ZGl2Pi0tLS0tLTwvZGl2PjxkaXY+ZXhwb3J0IFRQTTJU
T09MU19UQ1RJPSZxdW90O2RldmljZTovZGV2L3RwbTAmcXVvdDs8L2Rpdj48ZGl2PnRwbTJfdGFr
ZW93bmVyc2hpcCAtbyBvd25lcnBhc3MgLWUgZW5kb3JzZXBhc3M8L2Rpdj48ZGl2PnRwbTJfbnZk
ZWZpbmUgLXggMHgxMDAwMDAwIC1hIG8gLVAgb3duZXJwYXNzIC1wIGluZGV4c2VjcmV0IC1iICZx
dW90O2F1dGhyZWFkfGF1dGh3cml0ZXxyZWFkX3N0Y2xlYXImcXVvdDsgLXMgMTE8YnI+ZWNobyAm
cXVvdDtoZHBhc3N3b3JkJnF1b3Q7IHwgdHBtMl9udndyaXRlIMKgLXggMHgxMDAwMDAwIC1hIDB4
MTAwMDAwMCAtUCBpbmRleHNlY3JldDxicj50cG0yX252cmVhZCAteCAweDEwMDAwMDAgLWEgMHgx
MDAwMDAwIC1QIGluZGV4c2VjcmV0PGJyPnRwbTJfbnZyZWFkbG9jayDCoC14IDB4MTAwMDAwMCAt
YSAweDEwMDAwMDAgLVAgaW5kZXhzZWNyZXQ8YnI+IyB3aGVuIG5lZWRlZDrCoCB0cG0yX252cmVs
ZWFzZSAteCAweDEwMDAwMDAgLWEgMCAtUCBvd25lcnBhc3M8YnI+PC9kaXY+PGRpdj4tLS0tLS08
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkkgd291bGQgcmVhbGx5IGxpa2UgdG8gaW5jb3Jwb3Jh
dGUgdGhlCiBwY3Igc3lzdGVtIGNoZWNrIGFsc28gKGtpbmRhIHRoZSB3aG9sZSBwb2ludCkuwqAg
SSB0cmllZDo8L2Rpdj48ZGl2Pi0tLS0tLS0tLS0tPC9kaXY+PGRpdj50cG0yX2xpc3RwY3JzIC0t
dGN0aT1kZXZpY2XCoMKgwqAgI1RvIHNlZSBjdXJyZW50IHZhbHVlczwvZGl2PjxkaXY+dHBtMl9j
cmVhdGVwb2xpY3kgLUwgc2hhMTowLDEsMiwzLDQsNSw2LDcgLW8gLi8wLTdwb2xpY3kucG9sIC0t
cG9saWN5LXBjcjxicj48L2Rpdj48ZGl2PnRwbTJfbnZkZWZpbmUgLXggMHgxMDAwMDAwIC1hIG8g
LVAgb3duZXJwYXNzIC1wIGluZGV4c2VjcmV0IC1MIC4vMC03cG9saWN5LnBvbCAtYiAmcXVvdDth
dXRocmVhZHxhdXRod3JpdGV8cmVhZF9zdGNsZWFyJnF1b3Q7IC1zIDExPGJyPjwvZGl2PjxkaXY+
ZWNobyAmcXVvdDtoZHBhc3N3b3JkJnF1b3Q7IHwgdHBtMl9udndyaXRlIMKgLXggMHgxMDAwMDAw
IC1hIDB4MTAwMDAwMCAtUCBpbmRleHNlY3JldDxicj48L2Rpdj48ZGl2PnRwbTJfbnZsaXN0wqDC
oCAjIFZlcmZpaWVkIHRoYXQgMHgxMDAwMDAwIGhhcyBhICZxdW90O2F1dGhvcml6YXRpb24gcG9s
aWN5JnF1b3Q7PC9kaXY+PGRpdj50cG0yX252cmVhZCAteCAweDEwMDAwMDAgLWEgMHgxMDAwMDAw
IC1QIGluZGV4c2VjcmV0wqDCoCAjRXhwZWN0ZWQgdG8gd29yayBzaW5jZSBQQ1JzIGFyZSB0aGUg
c2FtZSBhcyBwb2xpY3kgY3JlYXRpb248YnI+dHBtMl9wY3JleHRlbmQgNDpzaGExPWYxZDJkMmY5
MjRlOTg2YWM4NmZkZjdiMzZjOTRiY2RmMzJiZWVjMTU8YnI+PC9kaXY+PGRpdj50cG0yX2xpc3Rw
Y3JzwqDCoMKgICNWZXJpZnkgcGNyNCBpcyBkaWZmZXJlbnQ8YnI+dHBtMl9udnJlYWQgLXggMHgx
MDAwMDAwIC1hIDB4MTAwMDAwMCAtUCBpbmRleHNlY3JldMKgwqAgI0V4cGVjdGVkIHRvIGZhaWw8
L2Rpdj48ZGl2Pi0tLS0tLS0tLS0tPC9kaXY+PGRpdj5UaGUgbGFzdCBsaW5lIEkgd291bGQgZXhw
ZWN0IHRvIGZhaWwsIGJlY2F1c2Ugb2YgdGhlIFBDUjQgY2hhbmdlLCBidXQgaXQgc3RpbGwgcHJv
ZHVjZXMgdGhlIHBhc3N3b3JkLsKgIEFtIEkgbWlzc2luZyBzb21ldGhpbmcgb24gdGhlIG52ZGVm
aW5lIHRvIGVuYWJsZSBwb2xpY3kgZW5mb3JjZW1lbnQ/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JJiMzOTtkIGJlIGVhZ2VyIHRvIHJlY2VpdmUgY29tbWVudHMgb24gbXkgZW50aXJlIHVzYWdl
LsKgIEkga25vdyB0aGVyZSBpcyBhIGxvdCBvZiBUUE0yIHRoYXQgSSBoYXZlbiYjMzk7dCBzdGFy
dGVkIHdyYXBwaW5nIG15IGhlYWQgYXJvdW5kLsKgIFN1Z2dlc3Rpb25zIG9yIHBvaW50ZXJzIHdv
dWxkIGJlIGFwcHJlY2lhdGVkLjxicj48L2Rpdj48L2Rpdj4K

--===============0615613704955365224==--

