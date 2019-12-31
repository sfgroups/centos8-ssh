A CentOS 8 container that runs openssh server.

connect to the server

ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@${IP} -p 2222

