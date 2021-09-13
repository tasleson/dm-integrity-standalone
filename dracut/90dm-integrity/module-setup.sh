#/bin/bash


# called by dracut
check() {
    require_binaries integritysetup || return 1
    [ -e /etc/integritytab ] && return 0
    return 255
}

# called by dracut
depends() {
    echo dm
    return 0
}

# called by dracut
installkernel() {
    instmods dm-integrity
}

# called by dracut
install() {

    inst_multiple integritysetup integritysetup_udev
    inst /etc/integritytab
    inst_rules 69-dm-integrity.rules

}
