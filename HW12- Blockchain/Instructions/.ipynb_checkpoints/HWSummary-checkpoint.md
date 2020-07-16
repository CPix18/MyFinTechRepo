# Proof of Authority Blockchain

## Environment Setup and Dependencies
* Geth and Tools from https://geth.ethereum.org/downloads/
* brew tap ethereum/ethereum
* brew install ethereum
* brew install ethereum --devel

## MyCrypto Wallet Setup
* Create new wallet
* Store as Keystore File within folder
* Create Password
* Use address for node1

## Genesis Creation
Name: blockchainhw
Set using: --network=blockchainhw

What would you like to do?
2: Configure new genesis

What would you like to do? (default = create)
1. Create new genesis from scratch

Which consensus engine to use? (default = clique)
2. Clique - proof-of-authority

How many seconds should blocks take? (default = 15)
> 15

Which accounts should be pre-funded? (advisable at least one)
> 0x6d9F8e59E742E7e2D3E95297f75d423620889034

Should the precompile-addresses (0x1 .. 0xff) be pre-funded with 1 wei? (advisable yes)
> no

Specify your chain/network ID if you want an explicit one (default = random)
> 112233

What would you like to do? (default = stats)
2. Manage existing genesis

2. Export genesis configurations

Delete harmony file (not needed)

## Nodes
./geth account new --datadir node1
PW: blockchain1

./geth account new --datadir node2
PW: blockchain2

./geth --datadir node2 --port 30304 --rpc --bootnodes "enode://f986d4ab0b3c7ad74960630e4ce2d5473f971178897a288a3aab4920b3f9a9321c4b9081e847f98751eec5dc9982f1784659b68bbd9e5a5c40ebc3c89800a77d@127.0.0.1:30303”


## 