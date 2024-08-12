# Routing - Route Tables

- *default* route table
- you can create, assign different route tables to different subnets
- all VPC addresses are private addresses

*how to connect to internet?*

#### VM to internet - internet to VM

- create a public subnet in the VPC -- means any instance created in that subnet will also get a public ip address along with private ip address
- create a igw internet gateway -- means subnet is connected to the internet using this IGW
- create a route in the RT to connect to IGW for the outbound traffic.
- Public Subnet <> Internet Gateway <> Internet

#### VM to internet - but not the reverse

- private subnet with all the private addresses -- by default in the VPC
- create a NAT gateway -- it is like a one-way valve, allows traffic outbound to internet and not inbound from the internet
- Private Subnet > NAT Gateway > Internet Gateway <> Internet



