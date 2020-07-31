pragma solidity ^0.6.0;
// SPDX-License-Identifier: UNLICENSED

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/math/SafeMath.sol";

contract ArcadeTokens { 
    
    using SafeMath for uint;
    
    address payable owner = msg.sender;
    string public symbol = "ARCD";
    uint public exchange_rate = 10;
    uint public fee_rate = 10;
    uint public token_reward_rate = 1;
    
    
    mapping(address => uint) balances;
    
    function tokenBalance() public view returns(uint) {
        return balances[msg.sender];
    }
    
    function transferToken(address recipient, uint tokenvalue) public {
        balances[msg.sender] = balances[msg.sender].sub(tokenvalue);
        balances[recipient] = balances[recipient].add(tokenvalue);
    }
    
    function purchaseToken() public payable {
        uint tokenvalue = msg.value.mul(exchange_rate);
        balances[msg.sender] = balances[msg.sender].add(tokenvalue);
        owner.transfer(msg.value);
    }
    
    function mintToken(address recipient, uint tokenvalue) public {
        require(msg.sender == owner, "You can't mint tokens, silly.");
        balances[recipient] = balances[recipient].add(tokenvalue);
    }
    
    function sendEther(address payable recipient) public payable {
        uint fee = msg.value.mul(fee_rate).div(10000);
        uint token_reward = msg.value.mul(token_reward_rate);
        balances[msg.sender] = balances[msg.sender].add(token_reward);
        recipient.transfer(msg.value.sub(fee));
        owner.transfer(fee);
    }
    
}