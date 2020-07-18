# Proof of Authority Blockchain

## Environment Setup and Dependencies
* Geth and Tools from https://geth.ethereum.org/downloads/
* Download MyCrypto Desktop App from https://download.mycrypto.com/

## MyCrypto Wallet Transaction
* Access wallet from Keystore File- Found in node1 and node2 folder
* Use password created for each
* Send transaction using node2 public key from node1 address
* Set gas limit
* Send transaction

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
> 0x90993f890668866060CEC5bC02df51779F47d6A7
> 0x07c1d704D6258B689197781b5809E064eCCC3746

Should the precompile-addresses (0x1 .. 0xff) be pre-funded with 1 wei? (advisable yes)
> no

Specify your chain/network ID if you want an explicit one (default = random)
> 112233

What would you like to do? (default = stats)
2. Manage existing genesis

2. Export genesis configurations

Delete harmony file (not needed)

## Nodes 

### Create node1 and node2
./geth account new --datadir node1
PW: blockchain1

./geth account new --datadir node2
PW: blockchain2

### Initialize node1 and node2
./geth init blockchainhw.json --datadir node1

./geth init blockchainhw.json --datadir node2

### Generate boot.key and get node1 enode address
./bootnode -genkey boot.key

./bootnode -nodekey boot.key -verbosity 9 -addr :30303

### Start node1 and node2
./geth --datadir node1/ --syncmode 'full' --port 30303 --rpc --bootnodes enode://db5aeb07a55c084fb5bffc0f7cb121d5f51834907835a1a863ed17adbdc621e828a86a7d348ec058993591b2d9e4fa2a81f17029f70af11e8bfeb07586751a35@127.0.0.1:30303

./geth --datadir node2/ --syncmode 'full' --port 30304 --rpc --bootnodes enode://993048cd0743c94a911dd7069ff60ccd492acf44dedc9a8b639bd14984f890763cf6a73e6959d5bca3b872b6a2def7093f41d0b268d6c509c062db4296d28f8d@127.0.0.1:30303

