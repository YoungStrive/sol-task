// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//导包
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import  "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


import "@openzeppelin/contracts/access/Ownable.sol";


contract MyNftToken  is ERC721, ERC721URIStorage, Ownable{

    uint256 private _tokenId;
    
    constructor() ERC721("MyNFT", "YLNFT")   Ownable(msg.sender){
        _tokenId = 0;
    }
     

     // 铸造 NFT 函数
    function mintNFT(address recipient, string memory _tokenUri) public onlyOwner  returns (uint256) {
        uint256 tokenId = _tokenId ;
        _safeMint(recipient, tokenId);
        _setTokenURI(tokenId, _tokenUri);
        _tokenId++;
        return tokenId;
    }


     function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory){
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool){
        return super.supportsInterface(interfaceId);
    }


}

