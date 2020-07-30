pragma solidity ^0.7.0;
// SPDX-License-Identifier: UNLICENSED

contract JointSavingsAccount { 
    
    address payable accountSpouce1;
    address payable accountSpouce2;
    
    address public lastToWithdraw;
    uint public lastWithdrawBlock;
    uint public lastWithdrawAmount;
    
    address public lastToDeposit;
    uint public lastDepositBlock;
    uint public lastDepositAmount;
    
    uint unlockTime = 0;
    
    //constructor
    constructor(address payable AccountForSpouse1, address payable AccountForSpouse2) {
        accountSpouce1 = AccountForSpouse1;
        accountSpouce2 = AccountForSpouse2;
    }
    
    //withdraw
    function withdraw(uint amount) public {
        require(unlockTime < block.timestamp, "Account is locked.");
        require (msg.sender == accountSpouce1 || msg.sender == accountSpouce2,
            "Shoo fly don't bother me. You can't do this!"); 
         
         if (lastToWithdraw != msg.sender) {
             lastToWithdraw = msg.sender;
         }
        
        lastWithdrawBlock = block.number;
        lastWithdrawAmount = amount;
        
        if (amount > address(this).balance / 4) {
        unlockTime = block.timestamp + 24 hours;
        }
        
        msg.sender.transfer(amount);
    }
        
    //deposit
    function deposit() public payable {
    
        if (lastToDeposit != msg.sender) {
            lastToDeposit = msg.sender;
        }
        lastDepositBlock = block.number;
        lastDepositAmount = msg.value;
    }
    
    //receive
    receive() external payable {}
    
    //fallback function
    fallback() external payable {} 
    
}