# dm-integrity-standalone
Prototype for standalone dm integrity udev setup


To try it out
* Format a partition or full block device (requires ID_WWN)
    - `integritysetup format /dev/sdk1`
    - `udevadm info /dev/sdk1`, grab ID_PART_ENTRY_UUID, eg. `beefbeef-beed-1234-5678-000ddeadbeef`
* Copy `69-dm-integrity.rules` to `/usr/lib/udev/rules.d/`
* Copy `integritysetup_udev` to `/usr/sbin/`
* Copy `integritytab` to `/etc/` and edit, eg.
    - `testing beefbeef-beed-1234-5678-000ddeadbeef`
* `# udevadm trigger /dev/sdk1`
* Verify `/dev/mapper/testing` exists
