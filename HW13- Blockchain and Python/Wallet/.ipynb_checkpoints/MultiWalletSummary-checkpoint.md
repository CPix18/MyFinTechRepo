# Multiple Currency Wallet

## How to operate
* Open command line (bash)
* "conda activate ethereum"
* cd to Wallet folder
* "python wallet1.py"

## What does the Wallet do??
* This wallet sends transactions from the a BTC-test address (0) and Ethereum Ganache local host network address (0) to other respective chain addresses. There is a create transaction and send transaction function for each chain and a function that defines each of the HD-wallet-derive addresses in a pandas dataframe. 
![df.png](df.png)
## BTC-test transaction on blockcypher
* Sent .001 BTC-test to 2 different addresses
![BTC-test.png](BTC-test.png)
## ETH-test transaction on Ganache
* Sent 1 ETH to a different address
![ETH.png](ETH.png)

## What Else??
* Take a look at requirements.txt for pip install and hd-wallet-derive details

* constants.py has global variables defined

* Practice wallet version in jupyter lab under wallet.ipynb