pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract ArtToken is ERC721Full {
    
    using Counters for Counters.Counter;
    Counters.Counter token_ids;
    
    constructor() ERC721Full("ArtToken", "ART") public {
    }
    
    struct Artwork {
        string name;
        string artist;
        uint appraisal_value;
    }
    
    mapping(uint => Artwork) public art_collection;
    
    function registerArtwork(address owner, string memory name, string memory artist,
        uint initial_value, string memory token_uri) public returns(uint) {
            
         token_ids.increment();
         uint token_id = token_ids.current();
         
         _mint(owner, token_id);
         _setTokenURI(token_id, token_uri);
         
         art_collection[token_id] = Artwork(name, artist, initial_value);
         return token_id;
            
    }
    
    event Appraisal(uint token_id, uint appraisal_value, string report_uri);
    
    function newAppraisal(uint token_id, uint new_value, string memory report_uri)
        public returns (uint) {
        
        art_collection[token_id].appraisal_value = new_value;
        emit Appraisal(token_id, new_value, report_uri);
        return art_collection[token_id].appraisal_value;
        
    }
    
}