pragma solidity ^0.5.0;
// SPDX-License-Identifier: UNLICENSED

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";

contract ArcadeTokens is ERC20, ERC20Detailed {
    
    address payable owner;
    
    modifier OnlyOwner {
        require(msg.sender == owner, "You do not have permission to do this.");
        _;
    }
    
    constructor(uint initital_supply) ERC20Detailed("ArcadeToken", "ARCD3", 18) public {
        owner = msg.sender;
        _mint(owner, initital_supply);
    }

    function mint(address recipient, uint amount) public OnlyOwner {
        _mint(recipient, amount);
        
    }
    
}