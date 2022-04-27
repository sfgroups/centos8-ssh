#!/bin/bash

test -f /etc/ssh/ssh_host_ecdsa_key || /usr/bin/ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -C '' -N ''
test -f /etc/ssh/ssh_host_rsa_key || /usr/bin/ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
test -f /etc/ssh/ssh_host_ed25519_key || /usr/bin/ssh-keygen -q -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -C '' -N ''

[ -f ~/.ssh/id_ed25519 ] || ssh-keygen -N ''  -t ed25519 -f ~/.ssh/id_ed25519 -C "Secure Key"

# Show the private key.
echo "Save the private key for keylogin"
echo ""
/usr/bin/cat /root/.ssh/id_ed25519
/usr/bin/echo ""
echo ""
/usr/bin/echo "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@${IP:-localhost} -p 2222"
echo ""

sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
#sed -i 's/#LogLevel INFO/LogLevel DEBUG/' /etc/ssh/sshd_config
D=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-6};echo;)
echo "root:$D" |chpasswd
echo "Root Password: $D"
# Now start ssh.
#/usr/sbin/sshd -D -ddd
/usr/sbin/sshd -D
