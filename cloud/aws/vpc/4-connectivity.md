# Connectivity among VPC

#### VPC Peering
- peering is a One to One relation.
- Two VPC share a peering that is created beforehand.
- Peering Connection -- PCX

#### Transit Gateway
- This a central point to communicate between the VPCs
- Allows any to any communication
- TGW has its own routing table -- TGW
- TGW and the VPCs have to be in the same region

## connecting to On-Prem Network to VPC
#### AWS VPN
- VPN connection is made between -- Customer gateway on-prem <> Virtual Private Gateway
- two IPSec tunnels are created -- two separate endpoints for HA in different AZ

#### AWS Direct Connect



