pragma solidity ^0.5.0;
// SPDX-License-Identifier: UNLICENSED

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract TieredProfitSplitter {
    
    using SafeMath for uint;
    
    address payable employee_one; // CEO
    address payable employee_two; // CTO
    address payable employee_three; // Bob

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value.div(100);
        uint ceo_total;
        uint ceo_amount;
        uint cto_total;
        uint cto_amount;
        uint bob_total;
        uint bob_amount;
        
        ceo_amount = points.mul(60);
        ceo_total = ceo_total.add(ceo_amount);
        employee_one.transfer(ceo_amount);
        
        cto_amount = points.mul(25);
        cto_total = cto_total.add(cto_amount);
        employee_two.transfer(cto_amount);
        
        bob_amount = points.mul(15);
        bob_total = bob_total.add(bob_amount);
        employee_three.transfer(bob_amount);
        

        employee_one.transfer(msg.value.sub(cto_total)); // CEO gets remainder
        employee_one.transfer(msg.value.sub(bob_total));
    }

    function() external payable {
        deposit();
    }
}