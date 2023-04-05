#!/usr/bin/bash

[ -z "${application_ready}" ] && { echo "[FATAL] You need to source 'utilities/application.sh' before sourcing this script."; return 1; }
source "${WKDEV_SDK}/utilities/prerequisites.sh"

verify_executables_exist sudo sysctl

# Helper function to read from /proc/sys/ via 'sysctl'.
read_kernel_parameter() {

    local parameter_name="${1}"
    sysctl --values "kernel.${parameter_name}" 2>/dev/null
}

# Helper function to write to /proc/sys/ via 'sysctl'.
write_kernel_parameter() {

    local parameter_name="${1}"
    local value="${2}"
    sudo sh -c "sysctl --quiet --write 'kernel.${parameter_name}=${value}' 2>/dev/null"
}
