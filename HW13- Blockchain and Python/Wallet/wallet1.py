# Import lib and dependencies
from web3 import Web3
from bit import wif_to_key
from constants import *
import subprocess 
import json
import pandas as pd
from web3.middleware import geth_poa_middleware
from eth_account import Account
w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))

# define variables
php = 'php ./hd-wallet-derive/hd-wallet-derive.php'
coin = 'BTC-test'
format1 = 'json'
recipientAddress = "0x3a03c422841e56b19aDBF09228729358AD7FBd52"
addresses = ["mrGHsRUZadVpZzWo99bQtjqLytzuhCn2QV", "moSuz6znXGLS5GfQ5YqRd94yPC2vtzuksy"]

# get private key function
def getKeys(cmd): 
    p = subprocess.Popen(cmd, 
        stdout=subprocess.PIPE, shell=True) 
    (output, err) = p.communicate()
    p_status = p.wait()
    keys = json.loads(output)
    return keys

# creating results list of dictionaries 
results = []
coins = ['BTC-test', 'ETH']
for coin in coins:
    cmd = f'{php} -g --mnemonic="{mnem}" --cols=path,address,privkey,pubkey --coin={coin} --format={format1}'
    keys = getKeys(cmd)
    for key in keys:
        results.append({"Coin": coin, "Address": key["address"], "PrivKey": key["privkey"], "PubKey": key["pubkey"]})

# BTC-test and ETH private keys
Ethereum0PK = results[10]['PrivKey']
Bitcoin0PK = results[0]['PrivKey']

# initalize btc-test key
key = wif_to_key(Bitcoin0PK)

# initialize eth key
account_one = Account.from_key(Ethereum0PK)

# create a dataframe of results 
coinInfo = pd.DataFrame(results)

# function to create clean dataframe
def getbal(row):
    privKey = row["PrivKey"]
    address = row["Address"]
    coin = row["Coin"]
    # print(coin, address)
    if coin == 'BTC-test':
        key = wif_to_key(privKey)
        Balance = key.get_balance('btc')
    else:
        Balance = w3.eth.getBalance(address)
    return Balance
    
coinInfo["Balance"] = coinInfo.apply(getbal, axis=1)

# final dataframe with cleaned results
finalDf = coinInfo[['Coin', 'Address', 'Balance']]
print(finalDf)

# Bitcoin transaction
outputs = []
for address in addresses:
    outputs.append((address, 0.0001, "btc"))   
key.send(outputs)

# Ethereum transaction creation
def create_tx(account, recipient, amount):
    gasEstimate = w3.eth.estimateGas(
    {"from": account.address, "to": recipient, "value": amount}
    )
    tx = {
        "from": account.address,
        "to": recipient, 
        "value": amount, 
        "gasPrice": w3.eth.gasPrice, 
        "gas": gasEstimate, 
        "nonce": w3.eth.getTransactionCount(account.address)
    }
    return tx 

# Ethereum send transaction
def send_tx(account, recipient, amount):
    tx = create_tx(account, recipient, amount)
    signed_tx = account.sign_transaction(tx)
    result = w3.eth.sendRawTransaction(signed_tx.rawTransaction)
    return result.hex()

ETH_txn = send_tx(account_one, recipientAddress, 1000000000000000000)