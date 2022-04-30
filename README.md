# A CentOS  Stream 8 container that runs openssh server.


- Install Docker compose
   https://github.com/docker/compose/releases

- To buld the image
  
   `docker-compose build`

   or

   `docker build -t sfgroups/centos8-ssh .`

- To start container
- 
   `docker-compose up`

   or

   `docker run --name centos8-ssh -h centos8-ssh -p 2222:22 sfgroups/centos8-ssh`

- connect to the server

`ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@localhost -p 2222`


--
java command
`
javac -d . MemoryLeaksDemo.java 
java -cp . MemoryLeaksDemo
`
