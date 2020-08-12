pragma solidity ^0.5.0;

contract MartianAuction {
    
    // Current State of the auction
    address payable public beneficiary;
    address public highestBidder;
    uint public highestBid;
    
    // Allowed withdrawals of unfilled bids
    mapping(address => uint) pendingReturns;
    
    bool public ended;
    
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);
    
    constructor (address payable _beneficiary) public {
        beneficiary = _beneficiary;
    }
    
    function bid() public payable {
        require(msg.value>highestBid, "There is already higher bid");
        require(!ended, "Auction has ended. Have a nice day.");
        if (highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncreased(highestBidder, highestBid);
    }
    
    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            pendingReturns[msg.sender] = 0;
            if(!msg.sender.send(amount)) {
                pendingReturns[msg.sender] = amount;
            }
        }
        return true;
    }
    
    function pendingReturn() public view returns (uint) {
        return pendingReturns[msg.sender];
    }
    
    function auctionEnd() public {
        require(!ended, "This acution has already ended.");
        require(msg.sender == beneficiary, "You are not able to end this auction.");
        
        ended = true;
        emit AuctionEnded(highestBidder, highestBid);
        
        beneficiary.transfer(highestBid);
    }
    
}