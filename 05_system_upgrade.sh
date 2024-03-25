#!/bin/bash

# Run just once
CRON_UPDATE=false


if $CRON_UPDATE; then
    # Install cron
    apt update && apt install -y cron

    # Enable cron
    systemctl enable cron

    # Create script in cron daily directory
    touch /etc/cron.daily/update_packages

    # Set execution permission for script
    chmod +x /etc/cron.daily/update_packages

    # Copy script content
    cat <<EOF >/etc/cron.daily/update_packages
    #!/bin/bash
    # Update the package index
    apt update

    # Upgrade packages to newer version
    apt upgrade -y

    # Remove packages no longer needed
    apt autoremove

    # Clean package cache
    apt autoclean
EOF


else
    # Update the package index
    apt update

    # Upgrade packages to newer version
    apt upgrade -y

    # Remove packages no longer needed
    apt autoremove

    # Clean package cache
    apt autoclean

fi