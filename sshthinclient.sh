#!/bin/bash
clear
trap 'exit 1' 2 20
echo "Hello, and welcome to the SSH ThinClient."
echo "(script written by @ColtonDRG for @dvdmuckle's project)"
echo
echo "For your own security and safety, please log out of your session when you're done"
echo "If you don't know how to log out, you shouldn't be using this computer."
echo
echo "If you screw up during the login process, you can start over with Ctrl+C"
echo
echo
echo "What's the hostname, IP, or domain you want to connect to?"
# Comment the following line to hide the alternate port instruction
echo "(you can add a port like example.com:2222, port 22 is used if none is specified)"
# Comment the following line to hide the local administration menu access instruction
echo "(use 127.0.0.1 to access a local administration shell)"
read -e -p "Connect to: " read_ssh_sshd
if [ "$read_ssh_sshd" = "" ]; then
  echo "You must enter a hostname!"
  exit 1
fi
if [ "$read_ssh_sshd" = "127.0.0.1" ]; then
  echo
  echo "Enter admin password to access local administration shell."
  su - sshadmin
  exit 0
fi
SSH_HOSTNAME=$(echo "$read_ssh_sshd" | sed 's/:.*//')
SSH_PORT=$(echo "$read_ssh_sshd" | sed 's/.*://')
if [ "$SSH_PORT" = "$SSH_HOSTNAME" ]; then
  SSH_PORT="22"
fi
echo "What's your username on the remote machine?"
read -e -p "Username: " read_ssh_user
if [ "$read_ssh_user" = "" ]; then
  echo "You must enter a username!"
  exit 1
fi
SSH_USER="$read_ssh_user"
echo "That's all we need! You'll be prompted for your password by the remote host."
echo
echo "To recap..."
echo "The server is $SSH_HOSTNAME."
echo "The port is $SSH_PORT."
echo "Your username is $SSH_USER."
echo
echo "Connecting..."
ssh -l $SSH_USER -p $SSH_PORT $SSH_HOSTNAME
exit 0
