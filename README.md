# SSH Thin Client #
A simple script to create a thin client / dumb terminal based on SSH.

### Installation ###
This is theoretically compatible with any Linux system that uses `bash` and `ssh`, though it has been tested on Arch.

Set one TTY to autologin to some unprivileged user, such as `sshuser`. Set the user's `.profile` to start this script, and logout once the script is done. Ideally, this will create a login loop, so once the user is finished with their ssh session, the TTY is immediately auto-logged back in.

All other TTYs should be disabled, save possibly one for maintenance / rescue situations.

### Additional Security ###
If at all possible, the BIOS / bootorder should be locked, so users cannot gain access to the machine. SSH can also be configured to record UserKnownHostsFile to `/dev/null`.

### Future Features
* SSH keys readable from USB drive mounted read only.