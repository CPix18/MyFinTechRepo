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
Name: blockchainhw1
Set using: --network=blockchainhw1

What would you like to do?
2: Configure new genesis

What would you like to do? (default = create)
 1. Create new genesis from scratch

Which consensus engine to use? (default = clique)
 2. Clique - proof-of-authority

How many seconds should blocks take? (default = 15)
> 15

Which accounts are allowed to seal? (mandatory at least one)
> 0x4ca2448fD7C7745BE7B5f89fb9692c4A8253AFb5
> 0x6eA91a0133b8B232c59EA2ec1A0401D225eAA0a7

Which accounts should be pre-funded? (advisable at least one)
> 0xca2448fD7C7745BE7B5f89fb9692c4A8253AFb5
> 0x6eA91a0133b8B232c59EA2ec1A0401D225eAA0a7

Should the precompile-addresses (0x1 .. 0xff) be pre-funded with 1 wei? (advisable yes)
> no

Specify your chain/network ID if you want an explicit one (default = random)
> 112233

What would you like to do? (default = stats)
 2. Manage existing genesis

 2. Export genesis configurations

Delete harmony file (not needed)

Control + c to exit puppeth

## Nodes 

### Create node1 and node2
./geth account new --datadir poanode1
PW: blockchain1

./geth account new --datadir poanode2
PW: blockchain2

### Initialize node1 and node2
./geth init blockchainhw1.json --datadir poanode1

./geth init blockchainhw1.json --datadir poanode2

### Start node1 and node2
./geth --datadir poanode1 --mine --miner.threads 1 --unlock 4ca2448fD7C7745BE7B5f89fb9692c4A8253AFb5

./geth --datadir poanode2 --port 30304 --mine --miner.threads 1 --rpc --unlock 6eA91a0133b8B232c59EA2ec1A0401D225eAA0a7 --allow-insecure-unlock --bootnodes enode://b597146c435e9ff736519a7c11b2f8f4f915b112d83fa96cd901fe5edd7a3f1842d7a7bb9c90e4ef9aa65a7dc174017baa85fba4723470fa9f44ee8b8e2b4b1a@127.0.0.1:30303

