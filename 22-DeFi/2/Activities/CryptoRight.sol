pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

import "./ICryptoRight.sol";

contract CryptoRight is ICryptoRight {
    
    using Counters for Counters.Counter;
    
    Counters.Counter copyright_ids;
    
    struct Work {
        address owner;
        string uri;
    }
    
    event Copyright(uint copyright_id, address owner, string reference_uri);
    event OpenSource(uint copyright_id, string reference_uri);
    event Transfer(uint copyright_id, address new_owner);
    
    modifier onlyCopryightOwner(uint copyright_id) {
    require(copyrights[copyright_id].owner == msg.sender, 
    "You do not have permission to alter this copyright!");
    _;
        
    }
    
    mapping(uint => Work) public copyrights;
    function copyrightWork(string memory reference_uri) public {
        
        //generate new copyright_id of type uint and maps to given struct
        copyright_ids.increment();
        uint copyright_id = copyright_ids.current();
        
        copyrights[copyright_id] = Work(msg.sender, reference_uri);
        
        // fire Copyright event
        emit Copyright(copyright_id, msg.sender, reference_uri);
        
    }
    
    function openSourceWork(string memory reference_uri) public {
        
        copyright_ids.increment();
        uint copyright_id = copyright_ids.current();
        
        copyrights[copyright_id] = Work(address(0), reference_uri);
        emit OpenSource(copyright_id, reference_uri);
        
    }
    
    function transferCopyrightOwnership(uint copyright_id, address new_owner) 
        public onlyCopryightOwner(copyright_id) {
        
        copyrights[copyright_id].owner = new_owner;
        
        emit Transfer(copyright_id, new_owner);
        
    }

    function renounceCopyrightOwnership(uint copyright_id) 
        public onlyCopryightOwner(copyright_id) {
        
        transferCopyrightOwnership(copyright_id, address(0));
        
        emit OpenSource(copyright_id, copyrights[copyright_id].uri);
        
    }
    
}