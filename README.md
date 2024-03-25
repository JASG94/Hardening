# Ubuntu Server Security Hardening Scripts

## About The Project
In the digital age, the security of servers, especially those exposed to the internet, is paramount. This project focuses on hardening a Linux Ubuntu server, primarily through the implementation of various security measures aimed at mitigating potential vulnerabilities and unauthorized access.

Securing a Ubuntu server is crucial for several reasons:

* **Protection Against Unauthorized Access:** Servers exposed to the internet are constant targets for malicious actors seeking unauthorized access. By implementing proper security measures, such as SSH hardening and disabling root login, the server's vulnerability to unauthorized access is significantly reduced.
* **Prevention of Data Breaches:** A compromised server can lead to data breaches, resulting in the loss or exposure of sensitive information. Hardening measures help prevent such breaches by limiting access and fortifying the server against common attack vectors.
* **Mitigation of Malware and Exploits:** Insecure packages and configurations can leave servers susceptible to malware infections and exploitation. By removing insecure packages and implementing security-focused configurations, the server's resilience to malware and exploits is enhanced.
* **Maintenance of Service Availability:** A secure server is less likely to be disrupted by cyberattacks, ensuring continuous service availability for legitimate users. By proactively addressing security concerns, the server can maintain its functionality without interruptions caused by security incidents.
* **Compliance with Regulatory Standards:** Many industries and jurisdictions have regulatory requirements mandating the implementation of specific security measures to protect sensitive data. By securing the Ubuntu server, organizations can ensure compliance with relevant standards and regulations, avoiding potential penalties and legal consequences.


## Getting Started

Clone this repo:
```bash
git clone https://github.com/JASG94/Hardening.git && cd Hardening
```
---

**SSH Hardening**

Use the script 01_ssh_hardening.sh just customize (if neede) the variables at the top of the script:

```bash
# Configuration variables
ALLOWED_SSH_SESSIONS="2"
ALLOWED_SSH_MAXTRIES="2"
ALLOWED_SSH_CLIENTALIVE="1"
ALLOWED_SSH_USER=$(logname)
```
```bash
sudo ./01_ssh_hardening.sh
```

**Disable root login to all devices**

Use the script 02_disable_root_login.sh 
```bash
sudo ./02_disable_root_login.sh
```

**Remove root password**

Use the script 03_remove_root_pass.sh
```bash
sudo ./03_remove_root_pass.sh
```

**Disable ctrl+alt+del on server**

Use the script 04_disable_ctrl_alt_del.sh
```bash
sudo ./04_disable_ctrl_alt_del.sh
```

**Perform a package upgrade on server**

Use the script 05_system_upgrade.sh, but before set the variable CRON_UPDATE to true or false:
* True: It will create a cron task to daily upgrade packages on server.
* False: It will only run once.
```bash
# Run just once
CRON_UPDATE=false
```
If have CRON_UPDATE on true we shoul use the mark-hold option for the packages that we dont want to be upgraded.

```bash
sudo ./05_system_upgrade.sh
```

**Force strong passwords**
Use the script 06_force_strong_passwords.sh, but first, set the variables to meet your needs:
```bash
# Variables definition
MIN_PASS_LEN="14"
MIN_PASS_CLASS="4"
```

```bash
sudo ./06_force_strong_passwords.sh
```

**FULL HARDENING**

To perform a full hardening just run the full_hardening.sh script.
```bash
./full_hardening.sh
```

## Roadmap

- [x] SSH Hardening
- [x] Disable root login to all devices
- [x] Remove root password
- [x] Remove ctrl+alt+del
- [x] Performe recurrent (or not) packages upgrade
- [x] Force strong passwords
- [ ] Future security improvements

## Contact

Javier Salvador García - [javiersalgar](https://www.linkedin.com/in/javiersalgar/) - javiersalvadorgarcia94@gmail.com


