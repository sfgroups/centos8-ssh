A CentOS  Stream 8 container that runs openssh server.


<<<<<<< HEAD
* To buld the image
   docker-compose build
* To start container
   docker-compose up

* connect to the server

ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@localhost -p 2222

=======
ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@localhost -p 2222
>>>>>>> 5c33ca3add30b01d2429bfa6bbde215a8c1b51da

