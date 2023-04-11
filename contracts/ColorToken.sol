// SPDX-License-Identifier: MITIT

pragma solidity ^0.8.11;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ColorToken is ERC721{
    address public owner;
    uint256 tokenId = 1;

    struct Color{
        uint tokenId;
        string tokenName;
        address owner;
    }

    Color[] public allTokens;

    mapping (address => Color[]) public tokenAdress; 
    mapping(string => bool) public tokenExists;

    constructor() ERC721("ColorToken","CLR"){
        owner = msg.sender;
        
    }

    function  getAllTokens() public view returns (Color[] memory) {
        return allTokens;
    }

    function mintToken(string calldata _tokenName) public payable {
        require(!tokenExists[_tokenName],"Token already exists" );
        _safeMint(msg.sender, tokenId);
        allTokens.push(Color(tokenId,_tokenName,msg.sender));
        tokenAdress[msg.sender].push(Color(tokenId,_tokenName,msg.sender));

        tokenExists[_tokenName] = true;
        tokenId++;

    }

}
