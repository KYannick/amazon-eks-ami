#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

################################################################################
# Script to ensure compliancy with the selinux related 
# topics of the CIS benchmark for amazon linux 2
################################################################################

# 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
# OK, compliant by default

# 1.6.1.2 Ensure the SELinux state is enforcing (Scored)
if grep -q 'SELINUX=disabled' /etc/selinux/config ; then
  sudo sed -i 's/^SELINUX=disabled/SELINUX=enforcing/' /etc/selinux/config
  sudo touch /.autorelabel
fi

# 1.6.1.3 Ensure SELinux policy is configured (Scored)
# OK, compliant by default

# 1.6.1.4 Ensure SETroubleshoot is not installed (Scored)
# OK, compliant by default

# 1.6.1.5 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
# OK, compliant by default

# 1.6.1.6 Ensure no unconfined daemons exist (Scored)
# OK, compliant by default

# 1.6.2 Ensure SELinux is installed (Scored)
# OK, compliant by default

# we will reboot the machine to trigger the relabel.
sudo shutdown -r now